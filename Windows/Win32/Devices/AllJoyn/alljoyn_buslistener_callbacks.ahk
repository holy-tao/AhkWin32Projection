#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 * @version v4.0.30319
 */
class alljoyn_buslistener_callbacks extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {Pointer<alljoyn_buslistener_listener_registered_ptr>}
     */
    listener_registered {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<alljoyn_buslistener_listener_unregistered_ptr>}
     */
    listener_unregistered {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<alljoyn_buslistener_found_advertised_name_ptr>}
     */
    found_advertised_name {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<alljoyn_buslistener_lost_advertised_name_ptr>}
     */
    lost_advertised_name {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<alljoyn_buslistener_name_owner_changed_ptr>}
     */
    name_owner_changed {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<alljoyn_buslistener_bus_stopping_ptr>}
     */
    bus_stopping {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<alljoyn_buslistener_bus_disconnected_ptr>}
     */
    bus_disconnected {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<alljoyn_buslistener_bus_prop_changed_ptr>}
     */
    property_changed {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
