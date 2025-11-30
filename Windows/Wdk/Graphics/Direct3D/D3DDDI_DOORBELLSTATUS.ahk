#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DDDI_DOORBELLSTATUS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_DOORBELLSTATUS_CONNECTED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_DOORBELLSTATUS_CONNECTED_NOTIFY_KMD => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_DOORBELLSTATUS_DISCONNECTED_RETRY => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_DOORBELLSTATUS_DISCONNECTED_ABORT => 3
}
