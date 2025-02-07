local Enumerate = require("@Utils/Enumerate")
local Construct = require("@Utils/Construct")

local Resolvable = require("@Network/Resolvable")

local ResolvableType = require("@Enums/ResolvableType")

--[=[
	@class Builders.Interface.SelectionBuilder

	SelectionBuilder is used to construct a selection (dropdown) component for a Discord message.
]=]
local SelectionBuilder = {}

SelectionBuilder.Interface = {}
SelectionBuilder.Prototype = {}

SelectionBuilder.Prototype.type = "SelectionBuilder"

--[=[
	@prop Type table
	@within Builders.Interface.SelectionBuilder

	An enumeration of selection types.

	- TextSelection: 3
	- UserSelection: 5
	- RoleSelection: 6
	- MentionableSelection: 7
	- ChannelSelection: 8
]=]
SelectionBuilder.Interface.Type = Enumerate.new({
	TextSelection = 3,
	UserSelection = 5,
	RoleSelection = 6,
	MentionableSelection = 7,
	ChannelSelection = 8,
})

--[=[
	@prop ChannelType table
	@within Builders.Interface.SelectionBuilder

	An enumeration of channel types.

	- GuildText: 0
	- DirectMessage: 1
	- GuildVoice: 2
	- GroupDirectMessage: 3
	- GuildCategory: 4
	- GuildAnnouncement: 5
	- AnnouncementThread: 10
	- PublicThread: 11
	- PrivateThread: 12
	- GuildStageVoice: 13
	- GuildDirectory: 14
	- GuildForum: 15
]=]
SelectionBuilder.Interface.ChannelType = Enumerate.new({
	GuildText = 0,
	DirectMessage = 1,
	GuildVoice = 2,
	GroupDirectMessage = 3,
	GuildCategory = 4,
	GuildAnnouncement = 5,
	AnnouncementThread = 10,
	PublicThread = 11,
	PrivateThread = 12,
	GuildStageVoice = 13,
	GuildDirectory = 14,
	GuildForum = 15,
})

--[=[
	Sets the type of the selection.
	
	@method setType
	@param selectionType number -- The type of the selection.
	@within Builders.Interface.SelectionBuilder
	@return Builders.Interface.SelectionBuilder -- Returns the SelectionBuilder instance for method chaining.
]=]
function SelectionBuilder.Prototype.setType(self: SelectionBuilder, selectionType: number): SelectionBuilder
	self.selectionType = selectionType

	return self
end

--[=[
	Sets the channel types for the selection.
	
	@method setChannelTypes
	@param ... number -- The channel types to set.
	@within Builders.Interface.SelectionBuilder
	@return Builders.Interface.SelectionBuilder -- Returns the SelectionBuilder instance for method chaining.
]=]
function SelectionBuilder.Prototype.setChannelTypes(self: SelectionBuilder, ...): SelectionBuilder
	self.selectionChannelTypes = { ... }

	return self
end

--[=[
	Sets the placeholder text for the selection.
	
	@method setPlaceholder
	@param placeholderText string -- The placeholder text.
	@within Builders.Interface.SelectionBuilder
	@return Builders.Interface.SelectionBuilder -- Returns the SelectionBuilder instance for method chaining.
]=]
function SelectionBuilder.Prototype.setPlaceholder(self: SelectionBuilder, placeholderText: string): SelectionBuilder
	self.selectionPlaceholder = placeholderText

	return self
end

--[=[
	Sets whether the selection is disabled.
	
	@method setDisabled
	@param isDisabled boolean -- Whether the selection is disabled.
	@within Builders.Interface.SelectionBuilder
	@return Builders.Interface.SelectionBuilder -- Returns the SelectionBuilder instance for method chaining.
]=]
function SelectionBuilder.Prototype.setDisabled(self: SelectionBuilder, isDisabled: boolean): SelectionBuilder
	self.selectionDisabled = isDisabled

	return self
end

--[=[
	Sets the minimum number of values that must be selected.
	
	@method setMinValues
	@param minValue number -- The minimum number of values.
	@within Builders.Interface.SelectionBuilder
	@return Builders.Interface.SelectionBuilder -- Returns the SelectionBuilder instance for method chaining.
]=]
function SelectionBuilder.Prototype.setMinValues(self: SelectionBuilder, minValue: number): SelectionBuilder
	self.selectionMinValue = minValue

	return self
end

--[=[
	Sets the maximum number of values that can be selected.
	
	@method setMaxValues
	@param maxValue number -- The maximum number of values.
	@within Builders.Interface.SelectionBuilder
	@return Builders.Interface.SelectionBuilder -- Returns the SelectionBuilder instance for method chaining.
]=]
function SelectionBuilder.Prototype.setMaxValues(self: SelectionBuilder, maxValue: number): SelectionBuilder
	self.selectionMaxValue = maxValue

	return self
end

--[=[
	Adds a choice to the selection.
	
	@method addChoice
	@param choiceName string -- The name of the choice.
	@param choiceValue string -- The value of the choice.
	@param choiceDescription string -- The description of the choice.
	@param isDefault boolean -- Whether the choice is the default selection.
	@param emojiId string? -- The ID of the emoji.
	@param emojiName string? -- The name of the emoji.
	@within Builders.Interface.SelectionBuilder
	@return Builders.Interface.SelectionBuilder -- Returns the SelectionBuilder instance for method chaining.
]=]
function SelectionBuilder.Prototype.addChoice(
	self: SelectionBuilder,
	choiceName: string,
	choiceValue: string,
	choiceDescription: string,
	isDefault: boolean,
	emojiId: string?,
	emojiName: string?
): SelectionBuilder
	self.choices[choiceName] = {
		value = choiceValue,
		description = choiceDescription,
		default = isDefault,
	}

	if emojiId and emojiName then
		self.choices[choiceName].emoji = {
			id = emojiId,
			name = emojiName,
		}
	end

	return self
end

--[=[
	Removes a choice from the selection.
	
	@method destroyChoice
	@param choiceName string -- The name of the choice to remove.
	@within Builders.Interface.SelectionBuilder
	@return Builders.Interface.SelectionBuilder -- Returns the SelectionBuilder instance for method chaining.
]=]
function SelectionBuilder.Prototype.destroyChoice(self: SelectionBuilder, choiceName: string): SelectionBuilder
	self.choices[choiceName] = nil

	return self
end

--[=[
	Converts the selection to a JSON object that can be sent to the Discord API.
	
	@method toPayloadObject
	@within Builders.Interface.SelectionBuilder
	@return Network.Resolvable
]=]
function SelectionBuilder.Prototype.toPayloadObject(self: SelectionBuilder)
	local selectionOptions = {}

	for optionName, optionData in self.choices do
		table.insert(selectionOptions, {
			label = optionName,

			value = optionData.value,
			description = optionData.description,
			emoji = (optionData.emoji and {
				id = optionData.emoji.id,
				name = optionData.emoji.name,
			}) or nil,
			default = optionData.default,
		})
	end

	return Resolvable.new(ResolvableType.JSON, {
		type = self.selectionType,
		custom_id = self.selectionId,

		channel_types = self.selectionChannelTypes,
		placeholder = self.selectionPlaceholder,

		min_value = self.selectionMinValue,
		max_value = self.selectionMaxValue,

		disabled = self.selectionDisabled,

		options = selectionOptions,
	})
end

--[=[
	
	Creates a new instance of SelectionBuilder.
	
	@function new
	@param selectionId string -- The ID of the selection.
	@within Builders.Interface.SelectionBuilder
	@return Builders.Interface.SelectionBuilder -- A new instance of SelectionBuilder.
]=]
function SelectionBuilder.Interface.new(selectionId: string): SelectionBuilder
	return Construct({
		selectionId = selectionId,
		choices = {},
	}, SelectionBuilder.Prototype) :: any
end

export type SelectionBuilder = typeof(SelectionBuilder.Prototype) & {
	selectionType: number?,
	selectionId: string?,
	selectionChannelTypes: { number }?,
	selectionPlaceholder: string?,
	selectionMinValue: number?,
	selectionMaxValue: number?,
	selectionDisabled: boolean?,

	choices: {
		[string]: {
			value: any?,
			default: boolean?,
			description: string?,
			emoji: {
				id: string,
				name: string,
			}?,
		},
	},
}

return SelectionBuilder.Interface
