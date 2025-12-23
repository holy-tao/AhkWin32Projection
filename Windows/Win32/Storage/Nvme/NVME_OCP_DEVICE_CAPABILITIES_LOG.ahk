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

    class _OobMgmtSupport_e__Union extends Win32Struct {
        static sizeof => 2
        static packingSize => 1

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
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
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
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
    }

    class _WriteZeroesCommand_e__Union extends Win32Struct {
        static sizeof => 2
        static packingSize => 1

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
        _bitfield {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Supported {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    
        /**
         * @type {Integer}
         */
        DEACBitSupported {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }
    
        /**
         * @type {Integer}
         */
        FUABitSupported {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }
    
        /**
         * @type {Integer}
         */
        NvmeIo5Met {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }
    
        /**
         * @type {Integer}
         */
        NvmeIo6Met {
            get => (this._bitfield >> 4) & 0x1
            set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
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
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
    }

    class _SanitizeCommand_e__Union extends Win32Struct {
        static sizeof => 2
        static packingSize => 1

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
        _bitfield {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Supported {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    
        /**
         * @type {Integer}
         */
        CryptoEraseSupported {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }
    
        /**
         * @type {Integer}
         */
        BlockEraseSupported {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }
    
        /**
         * @type {Integer}
         */
        OverwriteSupported {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }
    
        /**
         * @type {Integer}
         */
        DeallocateLbaSupported {
            get => (this._bitfield >> 4) & 0x1
            set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
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
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
    }

    class _DatasetMgmtCommand_e__Union extends Win32Struct {
        static sizeof => 2
        static packingSize => 1

        /**
         * This bitfield backs the following members:
         * - Supported
         * - AttribDeallocateSupported
         * - Reserved
         * - CompliesWithSpec
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Supported {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    
        /**
         * @type {Integer}
         */
        AttribDeallocateSupported {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
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
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
    }

    class _WriteUncorrectableCommand_e__Union extends Win32Struct {
        static sizeof => 2
        static packingSize => 1

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
        _bitfield {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Supported {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    
        /**
         * @type {Integer}
         */
        SingleLBASupported {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }
    
        /**
         * @type {Integer}
         */
        MaxLBASupported {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }
    
        /**
         * @type {Integer}
         */
        NvmeIo14Met {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
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
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
    }

    class _FusedCommand_e__Union extends Win32Struct {
        static sizeof => 2
        static packingSize => 1

        /**
         * This bitfield backs the following members:
         * - CWFusedSupported
         * - Reserved
         * - CompliesWithSpec
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        CWFusedSupported {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
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
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
    }

    /**
     * @type {Integer}
     */
    PciePorts {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {_OobMgmtSupport_e__Union}
     */
    OobMgmtSupport{
        get {
            if(!this.HasProp("__OobMgmtSupport"))
                this.__OobMgmtSupport := %this.__Class%._OobMgmtSupport_e__Union(2, this)
            return this.__OobMgmtSupport
        }
    }

    /**
     * @type {_WriteZeroesCommand_e__Union}
     */
    WriteZeroesCommand{
        get {
            if(!this.HasProp("__WriteZeroesCommand"))
                this.__WriteZeroesCommand := %this.__Class%._WriteZeroesCommand_e__Union(4, this)
            return this.__WriteZeroesCommand
        }
    }

    /**
     * @type {_SanitizeCommand_e__Union}
     */
    SanitizeCommand{
        get {
            if(!this.HasProp("__SanitizeCommand"))
                this.__SanitizeCommand := %this.__Class%._SanitizeCommand_e__Union(6, this)
            return this.__SanitizeCommand
        }
    }

    /**
     * @type {_DatasetMgmtCommand_e__Union}
     */
    DatasetMgmtCommand{
        get {
            if(!this.HasProp("__DatasetMgmtCommand"))
                this.__DatasetMgmtCommand := %this.__Class%._DatasetMgmtCommand_e__Union(8, this)
            return this.__DatasetMgmtCommand
        }
    }

    /**
     * @type {_WriteUncorrectableCommand_e__Union}
     */
    WriteUncorrectableCommand{
        get {
            if(!this.HasProp("__WriteUncorrectableCommand"))
                this.__WriteUncorrectableCommand := %this.__Class%._WriteUncorrectableCommand_e__Union(10, this)
            return this.__WriteUncorrectableCommand
        }
    }

    /**
     * @type {_FusedCommand_e__Union}
     */
    FusedCommand{
        get {
            if(!this.HasProp("__FusedCommand"))
                this.__FusedCommand := %this.__Class%._FusedCommand_e__Union(12, this)
            return this.__FusedCommand
        }
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
