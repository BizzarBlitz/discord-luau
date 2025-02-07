--[[
	Maps a key to a API path, allowing us to map out the Discord REST API

	These API Paths adhere sto the luau string formatting, where '%s' is replaced with a different value.
]]

return {
	BotGateway = "gateway/bot",

	BotGetGuild = "guilds/%s",
	BotCreateGuild = "guilds",
	BotGetGuildPreview = "guilds/%s/preview",
	BotCreateGuildChannel = "guilds/%s/channels",
	BotGetAllActiveGuildThreads = "guilds/%s/threads/active",
	BotAddGuildMember = "guilds/%s/members/%s",
	BotModifyGuildRolePositions = "guilds/%s/roles",
	BotDeleteGuildRole = "guilds/%s/roles/%s",
	BotModifyGuildRole = "guilds/%s/roles/%s",
	BotGetGuildBans = "guilds/%s/bans?before=%s&after=%s&limit=%s",
	BotBulkGuildBan = "guilds/%s/bulk-ban",
	BotCreateGuildRole = "guilds/%s/roles",
	BotModifyGuildMFALevel = "guilds/%s/mfa",
	BotBeginGuildPrune = "guilds/%s/prune",
	BotGetGuildVoiceRegions = "guilds/%s/regions",
	BotGetGuildInvites = "guilds/%s/invites",
	BotGetGuildIntegrations = "guilds/%s/integrations",
	BotGetGuildWidgetSettings = "guilds/%s/widget",
	BotModifyGuildOnboarding = "guilds/%s/onboarding",
	BotModifyGuildWelcomeScreen = "guilds/%s/welcome-screen",
	BotGetWidgetImage = "guilds/%s/widget.png?style=%s",
	BotGetGuildWelcomeScreen = "guilds/%s/welcome-screen",
	BotGetGuildWidget = "guilds/%s/widget.json",
	BotGetGuildVanityURL = "guilds/%s/vanity-url",
	BotGetGuildOnboarding = "guilds/%s/onboarding",
	BotModifyGuildWidgetSettings = "guilds/%s/widget",
	BotGetGuildPruneCount = "guilds/%s/prune?days=%s&include_roles=%s",
	BotGetGuildBan = "guilds/%s/bans/%s",
	BotGetGuildRoles = "guilds/%s/roles",

	GetGuildAuditLogs = "guilds/%s/audit-logs",
	BotModifyGuild = "guilds/%s",
	BotDeleteGuild = "guilds/%s",
	BotGetGuildChannels = "guilds/%s/channels",
	BotGetGuildMember = "guilds/%s/members/%s",
	BotModifyCurrentMemberGuild = "guilds/%s/members/@me",
	BotGetGuildMembers = "guilds/%s/members?limit=%s&after=%s",
	BotBanGuildMember = "guilds/%s/members/%s",
	BotRemoveGuildMember = "guilds/%s/members/%s",
	BotRemoveGuildMemberBan = "guilds/%s/bans/%s",
	BotAddGuildMemberRole = "guilds/%s/members/%s/roles/%s",
	BotRemoveGuildMemberRole = "guilds/%s/members/%s/roles/%s",
	BotModifyGuildMember = "guilds/%s/members/%s",
	BotSearchGuildMembers = "guilds/%s/members/search?query=%s&limit=%s",
	BotDeleteGuildIntegration = "guilds/%s/integrations/%s",

	BotListAutomoderationRules = "guilds/%s/auto-moderation/rules",
	BotGetAutomoderationRule = "guilds/%s/auto-moderation/rules/%s",
	BotCreateAutomoderationRule = "guilds/%s/auto-moderation/rules",
	BotModifyAutomoderationRule = "guilds/%s/auto-moderation/rules/%s",
	BotDeleteAutomoderationRule = "guilds/%s/auto-moderation/rules/%s",

	BotGetChannel = "channels/%s",
	BotModifyGuildChannelPosition = "channels/%s/channels",
	BotCreateMessage = "channels/%s/messages",
	BotGetChannelMessages = "channels/%s/messages",
	BotGetChannelMessage = "channels/%s/messages/%s",
	BotDeleteMessage = "channels/%s/messages/%s",
	BotEditMessage = "channels/%s/messages/%s",
	BotCrosspostMessage = "channels/%s/messages/%s/crosspost",
	BotCreateThreadFromMessage = "channels/%s/messages/%s/threads",
	BotCreateThread = "channels/%s/threads",
	BotCreateForumOrMediaThread = "channels/%s/threads",

	BotGetInvites = "channels/%s/invites",

	BotCreateReaction = "channels/%s/messages/%s/reactions/%s/@me",
	BotDeleteReaction = "channels/%s/messages/%s/reactions/%s/@me",
	BotDeleteUserReaction = "channels/%s/messages/%s/reactions/%s/%s",
	BotGetReactions = "channels/%s/messages/%s/reactions/%s",
	BotDeleteAllReactions = "channels/%s/messages/%s/reactions",
	BotDeleteAllReactionsForEmoji = "channels/%s/messages/%s/reactions/%s",

	BotDeleteChannel = "channels/%s",
	BotModifyChannel = "channels/%s",
	BotPinMessage = "channels/%s/pins/%s",
	BotUnpinMessage = "channels/%s/pins/%s",
	BotTriggerTypingChannel = "channels/%s/typing",
	BotEditChannelPermissions = "channels/%s/permissions/%s",
	BotDeleteChannelPermission = "channels/%s/permissions/%s",
	BotGetPinnedMessages = "channels/%s/pins",
	BotFollowAnnouncementChannel = "channels/%s/followers",

	BotGetThreadMembers = "channels/%s/thread-members",
	BotGetThreadMember = "channels/%s/thread-members/%s",
	BotJoinThreadChannel = "channels/%s/thread-members/@me",
	BotAddMemberToThreadChannel = "channels/%s/thread-members/%s",
	BotLeaveThreadChannel = "channels/%s/thread-members/@me",
	BotRemoveMemberFromThreadChannel = "channels/%s/thread-members/%s",
	BotListPublicArchivedThreads = "/channels/%s/threads/archived/public?before=%s&limit=%s",
	BotListPrivateArchivedThreads = "/channels/%s/threads/archived/private?before=%s&limit=%s",
	BotListJoinedPrivateArchivedThreads = "/channels/%s/users/@me/threads/archived/private?before=%s&limit=%s",

	BotBulkDeleteMessages = "channels/%s/messages/bulk-delete",

	CreateGlobalApplicationCommand = "applications/%s/commands",
	EditGlobalApplicationCommand = "applications/%s/commands/%s",
	OverwriteGlobalApplicationCommand = "applications/%s/commands",
	GetGlobalApplicationCommands = "applications/%s/commands",
	GetGlobalApplicationCommand = "applications/%s/commands/%s",
	DeleteGlobalApplicationCommand = "applications/%s/commands/%s",

	CreateGuildApplicationCommand = "applications/%s/guilds/%s/commands",
	EditGuildApplicationCommand = "applications/%s/guilds/%s/commands/%s",
	GetGuildApplicationCommands = "applications/%s/guilds/%s/commands",
	OverwriteGuildApplicationCommands = "applications/%s/guilds/%s/commands",
	GetGuildApplicationCommand = "applications/%s/guilds/%s/commands/%s",
	DeleteGuildApplicationCommand = "applications/%s/guilds/%s/commands/%s",

	BotDeleteInvite = "invites/%s",
	CreateInteractionResponse = "interactions/%s/%s/callback",
	EditOriginalInteractionResponse = "webhooks/%s/%s/messages/@original",
}
