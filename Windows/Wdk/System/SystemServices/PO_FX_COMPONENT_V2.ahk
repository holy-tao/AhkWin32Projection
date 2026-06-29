#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\PO_FX_COMPONENT_IDLE_STATE.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class PO_FX_COMPONENT_V2 extends Win32Struct {
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Guid}
     */
    Id {
        get {
            if(!this.HasProp("__Id"))
                this.__Id := Guid(0, this)
            return this.__Id
        }
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    DeepestWakeableIdleState {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    IdleStateCount {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Pointer<PO_FX_COMPONENT_IDLE_STATE>}
     */
    IdleStates {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    ProviderCount {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Pointer<Integer>}
     */
    Providers {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
