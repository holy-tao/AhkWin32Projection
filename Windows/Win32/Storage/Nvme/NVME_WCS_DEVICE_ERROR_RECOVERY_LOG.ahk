#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NVME_WCS_DEVICE_RESET_ACTION.ahk
#Include .\NVME_WCS_DEVICE_CAPABILITIES.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_WCS_DEVICE_ERROR_RECOVERY_LOG extends Win32Struct
{
    static sizeof => 504

    static packingSize => 1

    /**
     * @type {Integer}
     */
    PanicResetWaitTime {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {NVME_WCS_DEVICE_RESET_ACTION}
     */
    PanicResetAction{
        get {
            if(!this.HasProp("__PanicResetAction"))
                this.__PanicResetAction := NVME_WCS_DEVICE_RESET_ACTION(this.ptr + 2)
            return this.__PanicResetAction
        }
    }

    /**
     * @type {Integer}
     */
    DriveRecoveryAction {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Integer}
     */
    PanicId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {NVME_WCS_DEVICE_CAPABILITIES}
     */
    DeviceCapabilitiesA{
        get {
            if(!this.HasProp("__DeviceCapabilitiesA"))
                this.__DeviceCapabilitiesA := NVME_WCS_DEVICE_CAPABILITIES(this.ptr + 12)
            return this.__DeviceCapabilitiesA
        }
    }

    /**
     * @type {Integer}
     */
    VendorSpecificRecoveryCode {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved0{
        get {
            if(!this.HasProp("__Reserved0ProxyArray"))
                this.__Reserved0ProxyArray := Win32FixedArray(this.ptr + 17, 3, Primitive, "char")
            return this.__Reserved0ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    VendorSpecificCommandCDW12 {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    VendorSpecificCommandCDW13 {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 28, 466, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    LogPageVersionNumber {
        get => NumGet(this, 494, "ushort")
        set => NumPut("ushort", value, this, 494)
    }

    /**
     * @type {Pointer<Guid>}
     */
    LogPageGUID {
        get => NumGet(this, 496, "ptr")
        set => NumPut("ptr", value, this, 496)
    }
}
