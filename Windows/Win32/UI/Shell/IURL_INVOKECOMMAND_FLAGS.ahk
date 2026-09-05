#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class IURL_INVOKECOMMAND_FLAGS extends Win32Enum {

    /**
     * Native name: IURL_INVOKECOMMAND_FL_ALLOW_UI
     * @type {Integer (Int32)}
     */
    static FL_ALLOW_UI => 1

    /**
     * Native name: IURL_INVOKECOMMAND_FL_USE_DEFAULT_VERB
     * @type {Integer (Int32)}
     */
    static FL_USE_DEFAULT_VERB => 2

    /**
     * Native name: IURL_INVOKECOMMAND_FL_DDEWAIT
     * @type {Integer (Int32)}
     */
    static FL_DDEWAIT => 4

    /**
     * Native name: IURL_INVOKECOMMAND_FL_ASYNCOK
     * @type {Integer (Int32)}
     */
    static FL_ASYNCOK => 8

    /**
     * Native name: IURL_INVOKECOMMAND_FL_LOG_USAGE
     * @type {Integer (Int32)}
     */
    static FL_LOG_USAGE => 16
}
