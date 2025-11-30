#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IURL_INVOKECOMMAND_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static IURL_INVOKECOMMAND_FL_ALLOW_UI => 1

    /**
     * @type {Integer (Int32)}
     */
    static IURL_INVOKECOMMAND_FL_USE_DEFAULT_VERB => 2

    /**
     * @type {Integer (Int32)}
     */
    static IURL_INVOKECOMMAND_FL_DDEWAIT => 4

    /**
     * @type {Integer (Int32)}
     */
    static IURL_INVOKECOMMAND_FL_ASYNCOK => 8

    /**
     * @type {Integer (Int32)}
     */
    static IURL_INVOKECOMMAND_FL_LOG_USAGE => 16
}
