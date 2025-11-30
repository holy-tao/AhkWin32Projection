#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class KSMETHOD_BDA_USERACTIVITY_SERVICE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSMETHOD_BDA_USERACTIVITY_USEREASON => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSMETHOD_BDA_USERACTIVITY_INTERVAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSMETHOD_BDA_USERACTIVITY_DETECTED => 2
}
