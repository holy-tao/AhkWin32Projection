#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class INTERNETFEATURELIST extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static FEATURE_OBJECT_CACHING => 0

    /**
     * @type {Integer (Int32)}
     */
    static FEATURE_ZONE_ELEVATION => 1

    /**
     * @type {Integer (Int32)}
     */
    static FEATURE_MIME_HANDLING => 2

    /**
     * @type {Integer (Int32)}
     */
    static FEATURE_MIME_SNIFFING => 3

    /**
     * @type {Integer (Int32)}
     */
    static FEATURE_WINDOW_RESTRICTIONS => 4

    /**
     * @type {Integer (Int32)}
     */
    static FEATURE_WEBOC_POPUPMANAGEMENT => 5

    /**
     * @type {Integer (Int32)}
     */
    static FEATURE_BEHAVIORS => 6

    /**
     * @type {Integer (Int32)}
     */
    static FEATURE_DISABLE_MK_PROTOCOL => 7

    /**
     * @type {Integer (Int32)}
     */
    static FEATURE_LOCALMACHINE_LOCKDOWN => 8

    /**
     * @type {Integer (Int32)}
     */
    static FEATURE_SECURITYBAND => 9

    /**
     * @type {Integer (Int32)}
     */
    static FEATURE_RESTRICT_ACTIVEXINSTALL => 10

    /**
     * @type {Integer (Int32)}
     */
    static FEATURE_VALIDATE_NAVIGATE_URL => 11

    /**
     * @type {Integer (Int32)}
     */
    static FEATURE_RESTRICT_FILEDOWNLOAD => 12

    /**
     * @type {Integer (Int32)}
     */
    static FEATURE_ADDON_MANAGEMENT => 13

    /**
     * @type {Integer (Int32)}
     */
    static FEATURE_PROTOCOL_LOCKDOWN => 14

    /**
     * @type {Integer (Int32)}
     */
    static FEATURE_HTTP_USERNAME_PASSWORD_DISABLE => 15

    /**
     * @type {Integer (Int32)}
     */
    static FEATURE_SAFE_BINDTOOBJECT => 16

    /**
     * @type {Integer (Int32)}
     */
    static FEATURE_UNC_SAVEDFILECHECK => 17

    /**
     * @type {Integer (Int32)}
     */
    static FEATURE_GET_URL_DOM_FILEPATH_UNENCODED => 18

    /**
     * @type {Integer (Int32)}
     */
    static FEATURE_TABBED_BROWSING => 19

    /**
     * @type {Integer (Int32)}
     */
    static FEATURE_SSLUX => 20

    /**
     * @type {Integer (Int32)}
     */
    static FEATURE_DISABLE_NAVIGATION_SOUNDS => 21

    /**
     * @type {Integer (Int32)}
     */
    static FEATURE_DISABLE_LEGACY_COMPRESSION => 22

    /**
     * @type {Integer (Int32)}
     */
    static FEATURE_FORCE_ADDR_AND_STATUS => 23

    /**
     * @type {Integer (Int32)}
     */
    static FEATURE_XMLHTTP => 24

    /**
     * @type {Integer (Int32)}
     */
    static FEATURE_DISABLE_TELNET_PROTOCOL => 25

    /**
     * @type {Integer (Int32)}
     */
    static FEATURE_FEEDS => 26

    /**
     * @type {Integer (Int32)}
     */
    static FEATURE_BLOCK_INPUT_PROMPTS => 27

    /**
     * @type {Integer (Int32)}
     */
    static FEATURE_ENTRY_COUNT => 28
}
