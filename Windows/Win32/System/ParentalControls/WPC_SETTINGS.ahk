#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ParentalControls
 */
class WPC_SETTINGS extends Win32Enum {

    /**
     * Native name: WPC_SETTINGS_WPC_EXTENSION_PATH
     * @type {Integer (Int32)}
     */
    static WPC_EXTENSION_PATH => 0

    /**
     * Native name: WPC_SETTINGS_WPC_EXTENSION_SILO
     * @type {Integer (Int32)}
     */
    static WPC_EXTENSION_SILO => 1

    /**
     * Native name: WPC_SETTINGS_WPC_EXTENSION_IMAGE_PATH
     * @type {Integer (Int32)}
     */
    static WPC_EXTENSION_IMAGE_PATH => 2

    /**
     * Native name: WPC_SETTINGS_WPC_EXTENSION_DISABLEDIMAGE_PATH
     * @type {Integer (Int32)}
     */
    static WPC_EXTENSION_DISABLEDIMAGE_PATH => 3

    /**
     * Native name: WPC_SETTINGS_WPC_EXTENSION_NAME
     * @type {Integer (Int32)}
     */
    static WPC_EXTENSION_NAME => 4

    /**
     * Native name: WPC_SETTINGS_WPC_EXTENSION_SUB_TITLE
     * @type {Integer (Int32)}
     */
    static WPC_EXTENSION_SUB_TITLE => 5

    /**
     * Native name: WPC_SETTINGS_SYSTEM_CURRENT_RATING_SYSTEM
     * @type {Integer (Int32)}
     */
    static SYSTEM_CURRENT_RATING_SYSTEM => 6

    /**
     * Native name: WPC_SETTINGS_SYSTEM_LAST_LOG_VIEW
     * @type {Integer (Int32)}
     */
    static SYSTEM_LAST_LOG_VIEW => 7

    /**
     * Native name: WPC_SETTINGS_SYSTEM_LOG_VIEW_REMINDER_INTERVAL
     * @type {Integer (Int32)}
     */
    static SYSTEM_LOG_VIEW_REMINDER_INTERVAL => 8

    /**
     * Native name: WPC_SETTINGS_SYSTEM_HTTP_EXEMPTION_LIST
     * @type {Integer (Int32)}
     */
    static SYSTEM_HTTP_EXEMPTION_LIST => 9

    /**
     * Native name: WPC_SETTINGS_SYSTEM_URL_EXEMPTION_LIST
     * @type {Integer (Int32)}
     */
    static SYSTEM_URL_EXEMPTION_LIST => 10

    /**
     * Native name: WPC_SETTINGS_SYSTEM_FILTER_ID
     * @type {Integer (Int32)}
     */
    static SYSTEM_FILTER_ID => 11

    /**
     * Native name: WPC_SETTINGS_SYSTEM_FILTER_NAME
     * @type {Integer (Int32)}
     */
    static SYSTEM_FILTER_NAME => 12

    /**
     * Native name: WPC_SETTINGS_SYSTEM_LOCALE
     * @type {Integer (Int32)}
     */
    static SYSTEM_LOCALE => 13

    /**
     * Native name: WPC_SETTINGS_ALLOW_BLOCK
     * @type {Integer (Int32)}
     */
    static ALLOW_BLOCK => 14

    /**
     * Native name: WPC_SETTINGS_GAME_BLOCKED
     * @type {Integer (Int32)}
     */
    static GAME_BLOCKED => 15

    /**
     * Native name: WPC_SETTINGS_GAME_ALLOW_UNRATED
     * @type {Integer (Int32)}
     */
    static GAME_ALLOW_UNRATED => 16

    /**
     * Native name: WPC_SETTINGS_GAME_MAX_ALLOWED
     * @type {Integer (Int32)}
     */
    static GAME_MAX_ALLOWED => 17

    /**
     * Native name: WPC_SETTINGS_GAME_DENIED_DESCRIPTORS
     * @type {Integer (Int32)}
     */
    static GAME_DENIED_DESCRIPTORS => 18

    /**
     * Native name: WPC_SETTINGS_USER_WPC_ENABLED
     * @type {Integer (Int32)}
     */
    static USER_WPC_ENABLED => 19

    /**
     * Native name: WPC_SETTINGS_USER_LOGGING_REQUIRED
     * @type {Integer (Int32)}
     */
    static USER_LOGGING_REQUIRED => 20

    /**
     * Native name: WPC_SETTINGS_USER_HOURLY_RESTRICTIONS
     * @type {Integer (Int32)}
     */
    static USER_HOURLY_RESTRICTIONS => 21

    /**
     * Native name: WPC_SETTINGS_USER_OVERRRIDE_REQUESTS
     * @type {Integer (Int32)}
     */
    static USER_OVERRRIDE_REQUESTS => 22

    /**
     * Native name: WPC_SETTINGS_USER_LOGON_HOURS
     * @type {Integer (Int32)}
     */
    static USER_LOGON_HOURS => 23

    /**
     * Native name: WPC_SETTINGS_USER_APP_RESTRICTIONS
     * @type {Integer (Int32)}
     */
    static USER_APP_RESTRICTIONS => 24

    /**
     * Native name: WPC_SETTINGS_WEB_FILTER_ON
     * @type {Integer (Int32)}
     */
    static WEB_FILTER_ON => 25

    /**
     * Native name: WPC_SETTINGS_WEB_DOWNLOAD_BLOCKED
     * @type {Integer (Int32)}
     */
    static WEB_DOWNLOAD_BLOCKED => 26

    /**
     * Native name: WPC_SETTINGS_WEB_FILTER_LEVEL
     * @type {Integer (Int32)}
     */
    static WEB_FILTER_LEVEL => 27

    /**
     * Native name: WPC_SETTINGS_WEB_BLOCKED_CATEGORY_LIST
     * @type {Integer (Int32)}
     */
    static WEB_BLOCKED_CATEGORY_LIST => 28

    /**
     * Native name: WPC_SETTINGS_WEB_BLOCK_UNRATED
     * @type {Integer (Int32)}
     */
    static WEB_BLOCK_UNRATED => 29

    /**
     * Native name: WPC_SETTINGS_WPC_ENABLED
     * @type {Integer (Int32)}
     */
    static WPC_ENABLED => 30

    /**
     * Native name: WPC_SETTINGS_WPC_LOGGING_REQUIRED
     * @type {Integer (Int32)}
     */
    static WPC_LOGGING_REQUIRED => 31

    /**
     * Native name: WPC_SETTINGS_RATING_SYSTEM_PATH
     * @type {Integer (Int32)}
     */
    static RATING_SYSTEM_PATH => 32

    /**
     * Native name: WPC_SETTINGS_WPC_PROVIDER_CURRENT
     * @type {Integer (Int32)}
     */
    static WPC_PROVIDER_CURRENT => 33

    /**
     * Native name: WPC_SETTINGS_USER_TIME_ALLOWANCE
     * @type {Integer (Int32)}
     */
    static USER_TIME_ALLOWANCE => 34

    /**
     * Native name: WPC_SETTINGS_USER_TIME_ALLOWANCE_RESTRICTIONS
     * @type {Integer (Int32)}
     */
    static USER_TIME_ALLOWANCE_RESTRICTIONS => 35

    /**
     * Native name: WPC_SETTINGS_GAME_RESTRICTED
     * @type {Integer (Int32)}
     */
    static GAME_RESTRICTED => 36

    /**
     * Native name: WPC_SETTING_COUNT
     * @type {Integer (Int32)}
     */
    static SETTING_COUNT => 37
}
