#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
class SCRIPTTRACEINFO extends Win32Enum {

    /**
     * Native name: SCRIPTTRACEINFO_SCRIPTSTART
     * @type {Integer (Int32)}
     */
    static SCRIPTSTART => 0

    /**
     * Native name: SCRIPTTRACEINFO_SCRIPTEND
     * @type {Integer (Int32)}
     */
    static SCRIPTEND => 1

    /**
     * Native name: SCRIPTTRACEINFO_COMCALLSTART
     * @type {Integer (Int32)}
     */
    static COMCALLSTART => 2

    /**
     * Native name: SCRIPTTRACEINFO_COMCALLEND
     * @type {Integer (Int32)}
     */
    static COMCALLEND => 3

    /**
     * Native name: SCRIPTTRACEINFO_CREATEOBJSTART
     * @type {Integer (Int32)}
     */
    static CREATEOBJSTART => 4

    /**
     * Native name: SCRIPTTRACEINFO_CREATEOBJEND
     * @type {Integer (Int32)}
     */
    static CREATEOBJEND => 5

    /**
     * Native name: SCRIPTTRACEINFO_GETOBJSTART
     * @type {Integer (Int32)}
     */
    static GETOBJSTART => 6

    /**
     * Native name: SCRIPTTRACEINFO_GETOBJEND
     * @type {Integer (Int32)}
     */
    static GETOBJEND => 7
}
