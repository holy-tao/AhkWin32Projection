#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PO_FX_COMPONENT_V2.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PO_FX_DEVICE_V2 extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer<PPO_FX_COMPONENT_ACTIVE_CONDITION_CALLBACK>}
     */
    ComponentActiveConditionCallback {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<PPO_FX_COMPONENT_IDLE_CONDITION_CALLBACK>}
     */
    ComponentIdleConditionCallback {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<PPO_FX_COMPONENT_IDLE_STATE_CALLBACK>}
     */
    ComponentIdleStateCallback {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<PPO_FX_DEVICE_POWER_REQUIRED_CALLBACK>}
     */
    DevicePowerRequiredCallback {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<PPO_FX_DEVICE_POWER_NOT_REQUIRED_CALLBACK>}
     */
    DevicePowerNotRequiredCallback {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<PPO_FX_POWER_CONTROL_CALLBACK>}
     */
    PowerControlCallback {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<Void>}
     */
    DeviceContext {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    ComponentCount {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Array<PO_FX_COMPONENT_V2>}
     */
    Components{
        get {
            if(!this.HasProp("__ComponentsProxyArray"))
                this.__ComponentsProxyArray := Win32FixedArray(this.ptr + 80, 1, Primitive, "ptr")
            return this.__ComponentsProxyArray
        }
    }
}
