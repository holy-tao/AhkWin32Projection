#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class COR_PRF_TRANSITION_REASON extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_TRANSITION_CALL => 0

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_TRANSITION_RETURN => 1
}
