#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IMAGEHLP_CBA_EVENT_SEVERITY extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static sevInfo => 0

    /**
     * @type {Integer (UInt32)}
     */
    static sevProblem => 1

    /**
     * @type {Integer (UInt32)}
     */
    static sevAttn => 2

    /**
     * @type {Integer (UInt32)}
     */
    static sevFatal => 3
}
