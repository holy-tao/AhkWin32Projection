#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class WHEA_PCIEXPRESS_ERROR_SECTION extends Win32Struct
{
    static sizeof => 224

    static packingSize => 8

    /**
     * @type {Pointer<WHEA_PCIEXPRESS_ERROR_SECTION_VALIDBITS>}
     */
    ValidBits {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    PortType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Pointer<WHEA_PCIEXPRESS_VERSION>}
     */
    Version {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<WHEA_PCIEXPRESS_COMMAND_STATUS>}
     */
    CommandStatus {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Pointer<WHEA_PCIEXPRESS_DEVICE_ID>}
     */
    DeviceId {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    DeviceSerialNumber {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Pointer<WHEA_PCIEXPRESS_BRIDGE_CONTROL_STATUS>}
     */
    BridgeControlStatus {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Array<Byte>}
     */
    ExpressCapability{
        get {
            if(!this.HasProp("__ExpressCapabilityProxyArray"))
                this.__ExpressCapabilityProxyArray := Win32FixedArray(this.ptr + 64, 60, Primitive, "char")
            return this.__ExpressCapabilityProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    AerInfo{
        get {
            if(!this.HasProp("__AerInfoProxyArray"))
                this.__AerInfoProxyArray := Win32FixedArray(this.ptr + 124, 96, Primitive, "char")
            return this.__AerInfoProxyArray
        }
    }
}
