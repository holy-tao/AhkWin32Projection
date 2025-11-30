#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMDT_MONITOR_ORIENTATION_AWARENESS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MOA_UNINITIALIZED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MOA_NONE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MOA_POLLED => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MOA_INTERRUPTIBLE => 3
}
