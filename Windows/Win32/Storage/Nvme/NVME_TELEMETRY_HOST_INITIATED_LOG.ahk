#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains fields that specify the information in a Telemetry Host-Initiated Log page.
 * @remarks
 * All NVMe Telemetry Data Blocks are 512 bytes in size.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_telemetry_host_initiated_log
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_TELEMETRY_HOST_INITIATED_LOG extends Win32Struct
{
    static sizeof => 512

    static packingSize => 4

    /**
     * Indicates the log identifier.
     * @type {Integer}
     */
    LogIdentifier {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Bytes 1-4 are reserved.
     * @type {Array<Byte>}
     */
    Reserved0{
        get {
            if(!this.HasProp("__Reserved0ProxyArray"))
                this.__Reserved0ProxyArray := Win32FixedArray(this.ptr + 1, 4, Primitive, "char")
            return this.__Reserved0ProxyArray
        }
    }

    /**
     * Indicates an IEEE Organizationally Unique Identifier (OUI) that is the Organization ID.
     * @type {Array<Byte>}
     */
    OrganizationID{
        get {
            if(!this.HasProp("__OrganizationIDProxyArray"))
                this.__OrganizationIDProxyArray := Win32FixedArray(this.ptr + 5, 3, Primitive, "char")
            return this.__OrganizationIDProxyArray
        }
    }

    /**
     * Bytes 8-9 indicate the last block of Area 1.
     * @type {Integer}
     */
    Area1LastBlock {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * Bytes 10-11 indicate the last block of Area 2.
     * @type {Integer}
     */
    Area2LastBlock {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * Bytes 12-13 indicate the last block of Area 3.
     * @type {Integer}
     */
    Area3LastBlock {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * Bytes 14-381 are reserved.
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 14, 2, Primitive, "char")
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
                this.__Reserved2ProxyArray := Win32FixedArray(this.ptr + 20, 361, Primitive, "char")
            return this.__Reserved2ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    HostInitiatedDataGenerationNumber {
        get => NumGet(this, 381, "char")
        set => NumPut("char", value, this, 381)
    }

    /**
     * Byte 382 indicates whether controller initiated data is available.
     * @type {Integer}
     */
    ControllerInitiatedDataAvailable {
        get => NumGet(this, 382, "char")
        set => NumPut("char", value, this, 382)
    }

    /**
     * Byte 383 indicates the generation number of controller initiated data when it is available.
     * @type {Integer}
     */
    ControllerInitiatedDataGenerationNumber {
        get => NumGet(this, 383, "char")
        set => NumPut("char", value, this, 383)
    }

    /**
     * Bytes 384-511 indicate the reason identifier.
     * @type {Array<Byte>}
     */
    ReasonIdentifier{
        get {
            if(!this.HasProp("__ReasonIdentifierProxyArray"))
                this.__ReasonIdentifierProxyArray := Win32FixedArray(this.ptr + 384, 128, Primitive, "char")
            return this.__ReasonIdentifierProxyArray
        }
    }
}
