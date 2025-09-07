#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class OPEN_AS_INFO_FLAGS{

    /**
     * @type {Integer (Int32)}
     */
    static OAIF_ALLOW_REGISTRATION => 1

    /**
     * @type {Integer (Int32)}
     */
    static OAIF_REGISTER_EXT => 2

    /**
     * @type {Integer (Int32)}
     */
    static OAIF_EXEC => 4

    /**
     * @type {Integer (Int32)}
     */
    static OAIF_FORCE_REGISTRATION => 8

    /**
     * @type {Integer (Int32)}
     */
    static OAIF_HIDE_REGISTRATION => 32

    /**
     * @type {Integer (Int32)}
     */
    static OAIF_URL_PROTOCOL => 64

    /**
     * @type {Integer (Int32)}
     */
    static OAIF_FILE_IS_URI => 128
}
