#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 * @version v4.0.30319
 */
class alljoyn_permissionconfigurationlistener_callbacks extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Pointer<alljoyn_permissionconfigurationlistener_factoryreset_ptr>}
     */
    factory_reset {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<alljoyn_permissionconfigurationlistener_policychanged_ptr>}
     */
    policy_changed {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<alljoyn_permissionconfigurationlistener_startmanagement_ptr>}
     */
    start_management {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<alljoyn_permissionconfigurationlistener_endmanagement_ptr>}
     */
    end_management {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
