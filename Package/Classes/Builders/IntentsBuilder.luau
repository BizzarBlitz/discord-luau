local Construct = require("@Utils/Construct")
local FetchKeys = require("@Utils/Dictionary/FetchKeys")

local Intents = require("@Enums/Intents")

--[=[
	@class Builders.IntentsBuilder

	IntentsBuilder is used to construct intents for a Discord bot, specifying which events the bot will receive.

	Usage:
	```lua
	local DiscordLuau = require("../Submodules/DiscordLuau")

	local IntentsBuilder = DiscordLuau.IntentsBuilder.fromAll()
	local DiscordSettings = DiscordLuau.DiscordSettings.new("BOT TOKEN", IntentsBuilder)
	```
]=]
local IntentsBuilder = {}

IntentsBuilder.Interface = {}
IntentsBuilder.Prototype = {}

IntentsBuilder.Prototype.type = "IntentsBuilder"

IntentsBuilder.DispositionMap = {
	[Intents.GuildMembers] = 1,
	[Intents.GuildModeration] = 2,
	[Intents.GuildEmojisAndStickers] = 3,
	[Intents.GuildIntegrations] = 4,
	[Intents.GuildWebhooks] = 5,
	[Intents.GuildInvites] = 6,
	[Intents.GuildVoiceState] = 7,
	[Intents.GuildPresences] = 8,
	[Intents.GuildMessage] = 9,
	[Intents.GuildMessageReactions] = 10,
	[Intents.GuildMessageTyping] = 11,
	[Intents.DirectMessage] = 12,
	[Intents.DirectMessageReactions] = 13,
	[Intents.DirectMessageTyping] = 14,
	[Intents.GuildMessageContent] = 15,
	[Intents.GuildScheduledEvents] = 16,
	[Intents.GuildModerationConfiguration] = 20,
	[Intents.GuildModerationExecution] = 21,
}

--[=[
	
	Creates a new instance of IntentsBuilder with the specified intents.
	
	@function new
	@param intentList { string } -- A list of intents to include.
	@within Builders.IntentsBuilder
	@return Builders.IntentsBuilder -- A new instance of IntentsBuilder.
]=]
function IntentsBuilder.Interface.new(intentList: { string })
	local intentsValue = 0

	for _, intentEnum in intentList do
		local intentDisposition = IntentsBuilder.DispositionMap[intentEnum]

		assert(intentDisposition, `Unexpected intent '{intentEnum}'`)

		intentsValue += bit32.lshift(1, intentDisposition)
	end

	return Construct({
		intents = intentsValue,
	}, IntentsBuilder.Prototype)
end

--[=[
	Creates a new instance of IntentsBuilder with the default intents.
	
	@function fromDefault
	@within Builders.IntentsBuilder
	@return Builders.IntentsBuilder -- A new instance of IntentsBuilder.
]=]
function IntentsBuilder.Interface.fromDefault()
	local defaultIntents = table.clone(Intents) :: { [string]: any }

	defaultIntents.GuildPresences = nil
	defaultIntents.GuildMembers = nil
	defaultIntents.GuildMessageContent = nil

	return IntentsBuilder.Interface.new(FetchKeys(defaultIntents))
end

--[=[
	Creates a new instance of IntentsBuilder with all available intents.
	
	@function fromAll
	@within Builders.IntentsBuilder
	@return Builders.IntentsBuilder -- A new instance of IntentsBuilder.
]=]
function IntentsBuilder.Interface.fromAll()
	local allIntents = table.clone(Intents)

	return IntentsBuilder.Interface.new(FetchKeys(allIntents))
end

export type IntentsBuilder = typeof(IntentsBuilder.Prototype) & {}

return IntentsBuilder.Interface
