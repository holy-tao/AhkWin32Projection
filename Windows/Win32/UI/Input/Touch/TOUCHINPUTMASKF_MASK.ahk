#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.Touch
 */
class TOUCHINPUTMASKF_MASK extends Win32BitflagEnum {

    /**
     * Native name: TOUCHINPUTMASKF_TIMEFROMSYSTEM
     * @type {Integer (UInt32)}
     */
    static TIMEFROMSYSTEM => 1

    /**
     * Native name: TOUCHINPUTMASKF_EXTRAINFO
     * @type {Integer (UInt32)}
     */
    static EXTRAINFO => 2

    /**
     * Native name: TOUCHINPUTMASKF_CONTACTAREA
     * @type {Integer (UInt32)}
     */
    static CONTACTAREA => 4
}
