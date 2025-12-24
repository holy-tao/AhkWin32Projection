#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class D3COLD_LAST_TRANSITION_STATUS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static LastDStateTransitionStatusUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static LastDStateTransitionD3hot => 1

    /**
     * @type {Integer (Int32)}
     */
    static LastDStateTransitionD3cold => 2
}
