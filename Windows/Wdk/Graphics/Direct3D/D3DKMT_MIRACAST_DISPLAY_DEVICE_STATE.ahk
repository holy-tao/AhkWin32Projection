#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_MIRACAST_DISPLAY_DEVICE_STATE extends Win32Enum {

    /**
     * Native name: MiracastStopped
     * @type {Integer (Int32)}
     */
    static Stopped => 0

    /**
     * Native name: MiracastStartPending
     * @type {Integer (Int32)}
     */
    static StartPending => 1

    /**
     * Native name: MiracastStarted
     * @type {Integer (Int32)}
     */
    static Started => 2

    /**
     * Native name: MiracastStopPending
     * @type {Integer (Int32)}
     */
    static StopPending => 3
}
