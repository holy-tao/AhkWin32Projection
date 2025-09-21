#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 * @version v4.0.30319
 */
class alljoyn_keystorelistener_with_synchronization_callbacks extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Pointer<alljoyn_keystorelistener_loadrequest_ptr>}
     */
    load_request {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<alljoyn_keystorelistener_storerequest_ptr>}
     */
    store_request {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<alljoyn_keystorelistener_acquireexclusivelock_ptr>}
     */
    acquire_exclusive_lock {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<alljoyn_keystorelistener_releaseexclusivelock_ptr>}
     */
    release_exclusive_lock {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
