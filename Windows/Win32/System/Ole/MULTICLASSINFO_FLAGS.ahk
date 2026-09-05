#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 */
class MULTICLASSINFO_FLAGS extends Win32Enum {

    /**
     * Native name: MULTICLASSINFO_GETTYPEINFO
     * @type {Integer (UInt32)}
     */
    static GETTYPEINFO => 1

    /**
     * Native name: MULTICLASSINFO_GETNUMRESERVEDDISPIDS
     * @type {Integer (UInt32)}
     */
    static GETNUMRESERVEDDISPIDS => 2

    /**
     * Native name: MULTICLASSINFO_GETIIDPRIMARY
     * @type {Integer (UInt32)}
     */
    static GETIIDPRIMARY => 4

    /**
     * Native name: MULTICLASSINFO_GETIIDSOURCE
     * @type {Integer (UInt32)}
     */
    static GETIIDSOURCE => 8
}
