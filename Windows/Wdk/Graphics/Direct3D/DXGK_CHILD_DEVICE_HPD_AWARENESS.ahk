#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class DXGK_CHILD_DEVICE_HPD_AWARENESS extends Win32Enum {

    /**
     * Native name: HpdAwarenessUninitialized
     * @type {Integer (Int32)}
     */
    static Uninitialized => 0

    /**
     * Native name: HpdAwarenessAlwaysConnected
     * @type {Integer (Int32)}
     */
    static AlwaysConnected => 1

    /**
     * Native name: HpdAwarenessNone
     * @type {Integer (Int32)}
     */
    static None => 2

    /**
     * Native name: HpdAwarenessPolled
     * @type {Integer (Int32)}
     */
    static Polled => 3

    /**
     * Native name: HpdAwarenessInterruptible
     * @type {Integer (Int32)}
     */
    static Interruptible => 4
}
