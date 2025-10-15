#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
/**
 * @namespace Windows.Win32.System.ParentalControls
 * @version v4.0.30319
 */
class ParentalControls {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static ARRAY_SEP_CHAR => 9

    /**
     * @type {Integer (UInt32)}
     */
    static WPCCHANNEL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WPC_SETTINGS_LOCATE => 20

    /**
     * @type {Integer (UInt32)}
     */
    static WPC_SETTINGS_MODIFY => 21

    /**
     * @type {Integer (UInt32)}
     */
    static WPC_APP_LAUNCH => 22

    /**
     * @type {Integer (UInt32)}
     */
    static WPC_SYSTEM => 23

    /**
     * @type {Integer (UInt32)}
     */
    static WPC_WEB => 24

    /**
     * @type {Integer (UInt32)}
     */
    static WPCPROV_TASK_SettingChange => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WPCPROV_TASK_GameStart => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WPCPROV_TASK_UrlVisit => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WPCPROV_TASK_EmailReceived => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WPCPROV_TASK_EmailSent => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WPCPROV_TASK_MediaPlayback => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WPCPROV_TASK_IMInvitation => 7

    /**
     * @type {Integer (UInt32)}
     */
    static WPCPROV_TASK_IMJoin => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WPCPROV_TASK_IMLeave => 9

    /**
     * @type {Integer (UInt32)}
     */
    static WPCPROV_TASK_FileDownload => 10

    /**
     * @type {Integer (UInt32)}
     */
    static WPCPROV_TASK_IMFeature => 11

    /**
     * @type {Integer (UInt32)}
     */
    static WPCPROV_TASK_Custom => 13

    /**
     * @type {Integer (UInt32)}
     */
    static WPCPROV_TASK_EmailContact => 14

    /**
     * @type {Integer (UInt32)}
     */
    static WPCPROV_TASK_IMContact => 15

    /**
     * @type {Integer (UInt32)}
     */
    static WPCPROV_TASK_AppBlocked => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WPCPROV_TASK_AppOverride => 17

    /**
     * @type {Integer (UInt32)}
     */
    static WPCPROV_TASK_WebOverride => 18

    /**
     * @type {Integer (UInt32)}
     */
    static WPCPROV_TASK_WebsiteVisit => 19

    /**
     * @type {Integer (UInt32)}
     */
    static WPCPROV_TASK_Application => 20

    /**
     * @type {Integer (UInt32)}
     */
    static WPCPROV_TASK_ComputerUsage => 21

    /**
     * @type {Integer (UInt32)}
     */
    static WPCPROV_TASK_ContentUsage => 22

    /**
     * @type {Integer (UInt32)}
     */
    static WPCPROV_KEYWORD_WPC => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WPCPROV_KEYWORD_ThirdParty => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WPCEVENT_SYS_SETTINGCHANGE_value => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WPCEVENT_GAME_START_value => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WPCEVENT_WEB_URLVISIT_value => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WPCEVENT_EMAIL_RECEIVED_value => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WPCEVENT_EMAIL_SENT_value => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WPCEVENT_MEDIA_PLAYBACK_value => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WPCEVENT_IM_INVITATION_value => 7

    /**
     * @type {Integer (UInt32)}
     */
    static WPCEVENT_IM_JOIN_value => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WPCEVENT_IM_LEAVE_value => 9

    /**
     * @type {Integer (UInt32)}
     */
    static WPCEVENT_WEB_FILEDOWNLOAD_value => 10

    /**
     * @type {Integer (UInt32)}
     */
    static WPCEVENT_IM_FEATURE_value => 11

    /**
     * @type {Integer (UInt32)}
     */
    static WPCEVENT_CUSTOM_value => 13

    /**
     * @type {Integer (UInt32)}
     */
    static WPCEVENT_EMAIL_CONTACT_value => 14

    /**
     * @type {Integer (UInt32)}
     */
    static WPCEVENT_IM_CONTACT_value => 15

    /**
     * @type {Integer (UInt32)}
     */
    static WPCEVENT_SYSTEM_APPBLOCKED_value => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WPCEVENT_APPOVERRIDE_value => 17

    /**
     * @type {Integer (UInt32)}
     */
    static WPCEVENT_WEBOVERRIDE_value => 18

    /**
     * @type {Integer (UInt32)}
     */
    static WPCEVENT_WEB_WEBSITEVISIT_value => 19

    /**
     * @type {Integer (UInt32)}
     */
    static WPCEVENT_APPLICATION_value => 20

    /**
     * @type {Integer (UInt32)}
     */
    static WPCEVENT_COMPUTERUSAGE_value => 21

    /**
     * @type {Integer (UInt32)}
     */
    static WPCEVENT_CONTENTUSAGE_value => 22

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Keyword_WPC => 268435461

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Keyword_ThirdParty => 268435462

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Opcode_Locate => 805306388

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Opcode_Modify => 805306389

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Opcode_Launch => 805306390

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Opcode_System => 805306391

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Opcode_Web => 805306392

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Task_SettingChange => 1879048193

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Task_GameStart => 1879048194

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Task_UrlVisit => 1879048195

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Task_EmailReceived => 1879048196

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Task_EmailSent => 1879048197

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Task_MediaPlayback => 1879048198

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Task_IMInvitation => 1879048199

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Task_IMJoin => 1879048200

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Task_IMLeave => 1879048201

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Task_FileDownload => 1879048202

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Task_IMFeature => 1879048203

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Task_Custom => 1879048205

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Task_EmailContact => 1879048206

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Task_IMContact => 1879048207

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Task_AppBlocked => 1879048208

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Task_AppOverride => 1879048209

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Task_WebOverride => 1879048210

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Task_WebsiteVisit => 1879048211

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Task_Application => 1879048212

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Task_ComputerUsage => 1879048213

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Task_ContentUsage => 1879048214

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Publisher_Name => -1879048191

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Event_SettingChange => -1342177279

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Event_GameStart => -1342177278

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Event_UrlVisit => -1342177277

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Event_EmailReceived => -1342177276

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Event_EmailSent => -1342177275

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Event_MediaPlayback => -1342177274

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Event_IMInvitation => -1342177273

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Event_IMJoin => -1342177272

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Event_IMLeave => -1342177271

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Event_FileDownload => -1342177270

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Event_IMFeature => -1342177269

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Event_Custom => -1342177267

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Event_EmailContact => -1342177266

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Event_IMContact => -1342177265

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Event_AppBlocked => -1342177264

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Event_AppOverride => -1342177263

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Event_WebOverride => -1342177262

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Event_WebsiteVisit => -1342177261

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Event_Application => -1342177260

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Event_ComputerUsage => -1342177259

    /**
     * @type {Integer (Int32)}
     */
    static MSG_Event_ContentUsage => -1342177258

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_WPC => 2457

    /**
     * @type {String}
     */
    static WPCPROV => "{01090065-b467-4503-9b28-533766761087}"
;@endregion Constants

;@region Methods
;@endregion Methods
}
