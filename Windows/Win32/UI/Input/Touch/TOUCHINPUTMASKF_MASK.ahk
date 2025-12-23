#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.Touch
 * @version v4.0.30319
 */
class TOUCHINPUTMASKF_MASK extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static TOUCHINPUTMASKF_TIMEFROMSYSTEM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TOUCHINPUTMASKF_EXTRAINFO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TOUCHINPUTMASKF_CONTACTAREA => 4
}
