#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DDDI_DOORBELLSTATUS extends Win32Enum {

    /**
     * Native name: D3DDDI_DOORBELLSTATUS_CONNECTED
     * @type {Integer (Int32)}
     */
    static CONNECTED => 0

    /**
     * Native name: D3DDDI_DOORBELLSTATUS_CONNECTED_NOTIFY_KMD
     * @type {Integer (Int32)}
     */
    static CONNECTED_NOTIFY_KMD => 1

    /**
     * Native name: D3DDDI_DOORBELLSTATUS_DISCONNECTED_RETRY
     * @type {Integer (Int32)}
     */
    static DISCONNECTED_RETRY => 2

    /**
     * Native name: D3DDDI_DOORBELLSTATUS_DISCONNECTED_ABORT
     * @type {Integer (Int32)}
     */
    static DISCONNECTED_ABORT => 3
}
