#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_TELEMETRY_CONTROLLER_INITIATED_LOG extends Win32Struct
{
    static sizeof => 512

    static packingSize => 4

    /**
     * @type {Integer}
     */
    LogIdentifier {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved0{
        get {
            if(!this.HasProp("__Reserved0ProxyArray"))
                this.__Reserved0ProxyArray := Win32FixedArray(this.ptr + 1, 1, Primitive, "char")
            return this.__Reserved0ProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    OrganizationID{
        get {
            if(!this.HasProp("__OrganizationIDProxyArray"))
                this.__OrganizationIDProxyArray := Win32FixedArray(this.ptr + 5, 1, Primitive, "char")
            return this.__OrganizationIDProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    Area1LastBlock {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Area2LastBlock {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * @type {Integer}
     */
    Area3LastBlock {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 14, 1, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    Area4LastBlock {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved2{
        get {
            if(!this.HasProp("__Reserved2ProxyArray"))
                this.__Reserved2ProxyArray := Win32FixedArray(this.ptr + 20, 1, Primitive, "char")
            return this.__Reserved2ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    ControllerInitiatedDataAvailable {
        get => NumGet(this, 382, "char")
        set => NumPut("char", value, this, 382)
    }

    /**
     * @type {Integer}
     */
    ControllerInitiatedDataGenerationNumber {
        get => NumGet(this, 383, "char")
        set => NumPut("char", value, this, 383)
    }

    /**
     * @type {Array<Byte>}
     */
    ReasonIdentifier{
        get {
            if(!this.HasProp("__ReasonIdentifierProxyArray"))
                this.__ReasonIdentifierProxyArray := Win32FixedArray(this.ptr + 384, 1, Primitive, "char")
            return this.__ReasonIdentifierProxyArray
        }
    }
}
