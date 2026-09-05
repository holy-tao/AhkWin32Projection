#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMDT_MONITOR_ORIENTATION_AWARENESS extends Win32Enum {

    /**
     * Native name: D3DKMDT_MOA_UNINITIALIZED
     * @type {Integer (Int32)}
     */
    static MOA_UNINITIALIZED => 0

    /**
     * Native name: D3DKMDT_MOA_NONE
     * @type {Integer (Int32)}
     */
    static MOA_NONE => 1

    /**
     * Native name: D3DKMDT_MOA_POLLED
     * @type {Integer (Int32)}
     */
    static MOA_POLLED => 2

    /**
     * Native name: D3DKMDT_MOA_INTERRUPTIBLE
     * @type {Integer (Int32)}
     */
    static MOA_INTERRUPTIBLE => 3
}
