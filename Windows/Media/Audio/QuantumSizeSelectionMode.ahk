#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines values used for quantum size selection.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.quantumsizeselectionmode
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class QuantumSizeSelectionMode extends Win32Enum{

    /**
     * Use the system default value.
     * @type {Integer (Int32)}
     */
    static SystemDefault => 0

    /**
     * Use the value with the lowest latency.
     * @type {Integer (Int32)}
     */
    static LowestLatency => 1

    /**
     * Use the value closest to the one desired.
     * @type {Integer (Int32)}
     */
    static ClosestToDesired => 2
}
