#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DSSD_POWER_STATE_DESCRIPTOR.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_OCP_DEVICE_CAPABILITIES_LOG extends Win32Struct
{
    static sizeof => 4984

    static packingSize => 8

    /**
     * @type {Integer}
     */
    PciePorts {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * This bitfield backs the following members:
     * - MctpOverSMBusSupported
     * - MctpOverPcieVDMSupported
     * - BasicMgmtCommandSupported
     * - Reserved
     * - CompliesWithSpec
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    MctpOverSMBusSupported {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    MctpOverPcieVDMSupported {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    BasicMgmtCommandSupported {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    CompliesWithSpec {
        get => (this._bitfield >> 15) & 0x1
        set => this._bitfield := ((value & 0x1) << 15) | (this._bitfield & ~(0x1 << 15))
    }

    /**
     * @type {Integer}
     */
    AsUshort {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * This bitfield backs the following members:
     * - Supported
     * - DEACBitSupported
     * - FUABitSupported
     * - NvmeIo5Met
     * - NvmeIo6Met
     * - Reserved
     * - CompliesWithSpec
     * @type {Integer}
     */
    _bitfield1 {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Supported {
        get => (this._bitfield1 >> 0) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 0) | (this._bitfield1 & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    DEACBitSupported {
        get => (this._bitfield1 >> 1) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 1) | (this._bitfield1 & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    FUABitSupported {
        get => (this._bitfield1 >> 2) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 2) | (this._bitfield1 & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    NvmeIo5Met {
        get => (this._bitfield1 >> 3) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 3) | (this._bitfield1 & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    NvmeIo6Met {
        get => (this._bitfield1 >> 4) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 4) | (this._bitfield1 & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    CompliesWithSpec {
        get => (this._bitfield1 >> 15) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 15) | (this._bitfield1 & ~(0x1 << 15))
    }

    /**
     * This bitfield backs the following members:
     * - Supported
     * - CryptoEraseSupported
     * - BlockEraseSupported
     * - OverwriteSupported
     * - DeallocateLbaSupported
     * - Reserved
     * - CompliesWithSpec
     * @type {Integer}
     */
    _bitfield12 {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    Supported {
        get => (this._bitfield12 >> 0) & 0x1
        set => this._bitfield12 := ((value & 0x1) << 0) | (this._bitfield12 & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    CryptoEraseSupported {
        get => (this._bitfield12 >> 1) & 0x1
        set => this._bitfield12 := ((value & 0x1) << 1) | (this._bitfield12 & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    BlockEraseSupported {
        get => (this._bitfield12 >> 2) & 0x1
        set => this._bitfield12 := ((value & 0x1) << 2) | (this._bitfield12 & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    OverwriteSupported {
        get => (this._bitfield12 >> 3) & 0x1
        set => this._bitfield12 := ((value & 0x1) << 3) | (this._bitfield12 & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    DeallocateLbaSupported {
        get => (this._bitfield12 >> 4) & 0x1
        set => this._bitfield12 := ((value & 0x1) << 4) | (this._bitfield12 & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    CompliesWithSpec {
        get => (this._bitfield12 >> 15) & 0x1
        set => this._bitfield12 := ((value & 0x1) << 15) | (this._bitfield12 & ~(0x1 << 15))
    }

    /**
     * This bitfield backs the following members:
     * - Supported
     * - AttribDeallocateSupported
     * - Reserved
     * - CompliesWithSpec
     * @type {Integer}
     */
    _bitfield123 {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Supported {
        get => (this._bitfield123 >> 0) & 0x1
        set => this._bitfield123 := ((value & 0x1) << 0) | (this._bitfield123 & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    AttribDeallocateSupported {
        get => (this._bitfield123 >> 1) & 0x1
        set => this._bitfield123 := ((value & 0x1) << 1) | (this._bitfield123 & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    CompliesWithSpec {
        get => (this._bitfield123 >> 15) & 0x1
        set => this._bitfield123 := ((value & 0x1) << 15) | (this._bitfield123 & ~(0x1 << 15))
    }

    /**
     * This bitfield backs the following members:
     * - Supported
     * - SingleLBASupported
     * - MaxLBASupported
     * - NvmeIo14Met
     * - Reserved
     * - CompliesWithSpec
     * @type {Integer}
     */
    _bitfield1234 {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * @type {Integer}
     */
    Supported {
        get => (this._bitfield1234 >> 0) & 0x1
        set => this._bitfield1234 := ((value & 0x1) << 0) | (this._bitfield1234 & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    SingleLBASupported {
        get => (this._bitfield1234 >> 1) & 0x1
        set => this._bitfield1234 := ((value & 0x1) << 1) | (this._bitfield1234 & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    MaxLBASupported {
        get => (this._bitfield1234 >> 2) & 0x1
        set => this._bitfield1234 := ((value & 0x1) << 2) | (this._bitfield1234 & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    NvmeIo14Met {
        get => (this._bitfield1234 >> 3) & 0x1
        set => this._bitfield1234 := ((value & 0x1) << 3) | (this._bitfield1234 & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    CompliesWithSpec {
        get => (this._bitfield1234 >> 15) & 0x1
        set => this._bitfield1234 := ((value & 0x1) << 15) | (this._bitfield1234 & ~(0x1 << 15))
    }

    /**
     * This bitfield backs the following members:
     * - CWFusedSupported
     * - Reserved
     * - CompliesWithSpec
     * @type {Integer}
     */
    _bitfield12345 {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    CWFusedSupported {
        get => (this._bitfield12345 >> 0) & 0x1
        set => this._bitfield12345 := ((value & 0x1) << 0) | (this._bitfield12345 & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    CompliesWithSpec {
        get => (this._bitfield12345 >> 15) & 0x1
        set => this._bitfield12345 := ((value & 0x1) << 15) | (this._bitfield12345 & ~(0x1 << 15))
    }

    /**
     * @type {Integer}
     */
    MinimumValidDSSDPowerState {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * @type {Array<DSSD_POWER_STATE_DESCRIPTOR>}
     */
    DssdDescriptors{
        get {
            if(!this.HasProp("__DssdDescriptorsProxyArray"))
                this.__DssdDescriptorsProxyArray := Win32FixedArray(this.ptr + 24, 127, DSSD_POWER_STATE_DESCRIPTOR, "")
            return this.__DssdDescriptorsProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 1040, 3934, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    LogPageVersionNumber {
        get => NumGet(this, 4974, "ushort")
        set => NumPut("ushort", value, this, 4974)
    }

    /**
     * @type {Pointer<Guid>}
     */
    LogPageGUID {
        get => NumGet(this, 4976, "ptr")
        set => NumPut("ptr", value, this, 4976)
    }
}
