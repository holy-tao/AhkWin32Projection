#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class ROT_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static ROTFLAGS_REGISTRATIONKEEPSALIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ROTFLAGS_ALLOWANYCLIENT => 2
}
