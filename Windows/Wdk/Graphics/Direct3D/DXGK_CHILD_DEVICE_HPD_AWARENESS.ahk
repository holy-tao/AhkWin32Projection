#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class DXGK_CHILD_DEVICE_HPD_AWARENESS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static HpdAwarenessUninitialized => 0

    /**
     * @type {Integer (Int32)}
     */
    static HpdAwarenessAlwaysConnected => 1

    /**
     * @type {Integer (Int32)}
     */
    static HpdAwarenessNone => 2

    /**
     * @type {Integer (Int32)}
     */
    static HpdAwarenessPolled => 3

    /**
     * @type {Integer (Int32)}
     */
    static HpdAwarenessInterruptible => 4
}
