#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NVM_RESERVATION_CAPABILITIES.ahk
#Include .\NVME_LBA_FORMAT.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_identify_namespace_data
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_IDENTIFY_NAMESPACE_DATA extends Win32Struct
{
    static sizeof => 4360

    static packingSize => 8

    class _NSFEAT extends Win32Struct {
        static sizeof => 4360
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - ThinProvisioning
         * - NameSpaceAtomicWriteUnit
         * - DeallocatedOrUnwrittenError
         * - SkipReuseUI
         * - NameSpaceIoOptimization
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        ThinProvisioning {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    
        /**
         * @type {Integer}
         */
        NameSpaceAtomicWriteUnit {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }
    
        /**
         * @type {Integer}
         */
        DeallocatedOrUnwrittenError {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }
    
        /**
         * @type {Integer}
         */
        SkipReuseUI {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }
    
        /**
         * @type {Integer}
         */
        NameSpaceIoOptimization {
            get => (this._bitfield >> 4) & 0x1
            set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
        }
    
    }

    class _FLBAS extends Win32Struct {
        static sizeof => 4360
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - LbaFormatIndex
         * - MetadataInExtendedDataLBA
         * - LbaFormatIndexMS
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        LbaFormatIndex {
            get => (this._bitfield >> 0) & 0xF
            set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
        }
    
        /**
         * @type {Integer}
         */
        MetadataInExtendedDataLBA {
            get => (this._bitfield >> 4) & 0x1
            set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
        }
    
        /**
         * @type {Integer}
         */
        LbaFormatIndexMS {
            get => (this._bitfield >> 5) & 0x3
            set => this._bitfield := ((value & 0x3) << 5) | (this._bitfield & ~(0x3 << 5))
        }
    
    }

    class _MC extends Win32Struct {
        static sizeof => 4360
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - MetadataInExtendedDataLBA
         * - MetadataInSeparateBuffer
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        MetadataInExtendedDataLBA {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    
        /**
         * @type {Integer}
         */
        MetadataInSeparateBuffer {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }
    
    }

    class _DPC extends Win32Struct {
        static sizeof => 4360
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - ProtectionInfoType1
         * - ProtectionInfoType2
         * - ProtectionInfoType3
         * - InfoAtBeginningOfMetadata
         * - InfoAtEndOfMetadata
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        ProtectionInfoType1 {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    
        /**
         * @type {Integer}
         */
        ProtectionInfoType2 {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }
    
        /**
         * @type {Integer}
         */
        ProtectionInfoType3 {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }
    
        /**
         * @type {Integer}
         */
        InfoAtBeginningOfMetadata {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }
    
        /**
         * @type {Integer}
         */
        InfoAtEndOfMetadata {
            get => (this._bitfield >> 4) & 0x1
            set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
        }
    
    }

    class _DPS extends Win32Struct {
        static sizeof => 4360
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - ProtectionInfoTypeEnabled
         * - InfoAtBeginningOfMetadata
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        ProtectionInfoTypeEnabled {
            get => (this._bitfield >> 0) & 0x7
            set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
        }
    
        /**
         * @type {Integer}
         */
        InfoAtBeginningOfMetadata {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }
    
    }

    class _NMIC extends Win32Struct {
        static sizeof => 4360
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - SharedNameSpace
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        SharedNameSpace {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    
    }

    class _FPI extends Win32Struct {
        static sizeof => 4360
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - PercentageRemained
         * - Supported
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        PercentageRemained {
            get => (this._bitfield >> 0) & 0x7F
            set => this._bitfield := ((value & 0x7F) << 0) | (this._bitfield & ~(0x7F << 0))
        }
    
        /**
         * @type {Integer}
         */
        Supported {
            get => (this._bitfield >> 7) & 0x1
            set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
        }
    
    }

    class _DLFEAT extends Win32Struct {
        static sizeof => 4360
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - ReadBehavior
         * - WriteZeroes
         * - GuardFieldWithCRC
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        ReadBehavior {
            get => (this._bitfield >> 0) & 0x7
            set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
        }
    
        /**
         * @type {Integer}
         */
        WriteZeroes {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }
    
        /**
         * @type {Integer}
         */
        GuardFieldWithCRC {
            get => (this._bitfield >> 4) & 0x1
            set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
        }
    
    }

    class _NSATTR extends Win32Struct {
        static sizeof => 4360
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - WriteProtected
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        WriteProtected {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    
    }

    /**
     * @type {Integer}
     */
    NSZE {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    NCAP {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    NUSE {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {_NSFEAT}
     */
    NSFEAT{
        get {
            if(!this.HasProp("__NSFEAT"))
                this.__NSFEAT := %this.__Class%._NSFEAT(24, this)
            return this.__NSFEAT
        }
    }

    /**
     * @type {Integer}
     */
    NLBAF {
        get => NumGet(this, 25, "char")
        set => NumPut("char", value, this, 25)
    }

    /**
     * @type {_FLBAS}
     */
    FLBAS{
        get {
            if(!this.HasProp("__FLBAS"))
                this.__FLBAS := %this.__Class%._FLBAS(26, this)
            return this.__FLBAS
        }
    }

    /**
     * @type {_MC}
     */
    MC{
        get {
            if(!this.HasProp("__MC"))
                this.__MC := %this.__Class%._MC(27, this)
            return this.__MC
        }
    }

    /**
     * @type {_DPC}
     */
    DPC{
        get {
            if(!this.HasProp("__DPC"))
                this.__DPC := %this.__Class%._DPC(28, this)
            return this.__DPC
        }
    }

    /**
     * @type {_DPS}
     */
    DPS{
        get {
            if(!this.HasProp("__DPS"))
                this.__DPS := %this.__Class%._DPS(29, this)
            return this.__DPS
        }
    }

    /**
     * @type {_NMIC}
     */
    NMIC{
        get {
            if(!this.HasProp("__NMIC"))
                this.__NMIC := %this.__Class%._NMIC(30, this)
            return this.__NMIC
        }
    }

    /**
     * @type {NVM_RESERVATION_CAPABILITIES}
     */
    RESCAP{
        get {
            if(!this.HasProp("__RESCAP"))
                this.__RESCAP := NVM_RESERVATION_CAPABILITIES(32, this)
            return this.__RESCAP
        }
    }

    /**
     * @type {_FPI}
     */
    FPI{
        get {
            if(!this.HasProp("__FPI"))
                this.__FPI := %this.__Class%._FPI(34, this)
            return this.__FPI
        }
    }

    /**
     * @type {_DLFEAT}
     */
    DLFEAT{
        get {
            if(!this.HasProp("__DLFEAT"))
                this.__DLFEAT := %this.__Class%._DLFEAT(35, this)
            return this.__DLFEAT
        }
    }

    /**
     * @type {Integer}
     */
    NAWUN {
        get => NumGet(this, 36, "ushort")
        set => NumPut("ushort", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    NAWUPF {
        get => NumGet(this, 38, "ushort")
        set => NumPut("ushort", value, this, 38)
    }

    /**
     * @type {Integer}
     */
    NACWU {
        get => NumGet(this, 40, "ushort")
        set => NumPut("ushort", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    NABSN {
        get => NumGet(this, 42, "ushort")
        set => NumPut("ushort", value, this, 42)
    }

    /**
     * @type {Integer}
     */
    NABO {
        get => NumGet(this, 44, "ushort")
        set => NumPut("ushort", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    NABSPF {
        get => NumGet(this, 46, "ushort")
        set => NumPut("ushort", value, this, 46)
    }

    /**
     * @type {Integer}
     */
    NOIOB {
        get => NumGet(this, 48, "ushort")
        set => NumPut("ushort", value, this, 48)
    }

    /**
     * @type {Array<Byte>}
     */
    NVMCAP{
        get {
            if(!this.HasProp("__NVMCAPProxyArray"))
                this.__NVMCAPProxyArray := Win32FixedArray(this.ptr + 50, 16, Primitive, "char")
            return this.__NVMCAPProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    NPWG {
        get => NumGet(this, 66, "ushort")
        set => NumPut("ushort", value, this, 66)
    }

    /**
     * @type {Integer}
     */
    NPWA {
        get => NumGet(this, 68, "ushort")
        set => NumPut("ushort", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    NPDG {
        get => NumGet(this, 70, "ushort")
        set => NumPut("ushort", value, this, 70)
    }

    /**
     * @type {Integer}
     */
    NPDA {
        get => NumGet(this, 72, "ushort")
        set => NumPut("ushort", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    NOWS {
        get => NumGet(this, 74, "ushort")
        set => NumPut("ushort", value, this, 74)
    }

    /**
     * @type {Integer}
     */
    MSSRL {
        get => NumGet(this, 76, "ushort")
        set => NumPut("ushort", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    MCL {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    MSRC {
        get => NumGet(this, 84, "char")
        set => NumPut("char", value, this, 84)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved2{
        get {
            if(!this.HasProp("__Reserved2ProxyArray"))
                this.__Reserved2ProxyArray := Win32FixedArray(this.ptr + 85, 11, Primitive, "char")
            return this.__Reserved2ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    ANAGRPID {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved3{
        get {
            if(!this.HasProp("__Reserved3ProxyArray"))
                this.__Reserved3ProxyArray := Win32FixedArray(this.ptr + 100, 3, Primitive, "char")
            return this.__Reserved3ProxyArray
        }
    }

    /**
     * @type {_NSATTR}
     */
    NSATTR{
        get {
            if(!this.HasProp("__NSATTR"))
                this.__NSATTR := %this.__Class%._NSATTR(103, this)
            return this.__NSATTR
        }
    }

    /**
     * @type {Integer}
     */
    NVMSETID {
        get => NumGet(this, 104, "ushort")
        set => NumPut("ushort", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    ENDGID {
        get => NumGet(this, 106, "ushort")
        set => NumPut("ushort", value, this, 106)
    }

    /**
     * @type {Array<Byte>}
     */
    NGUID{
        get {
            if(!this.HasProp("__NGUIDProxyArray"))
                this.__NGUIDProxyArray := Win32FixedArray(this.ptr + 108, 16, Primitive, "char")
            return this.__NGUIDProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    EUI64{
        get {
            if(!this.HasProp("__EUI64ProxyArray"))
                this.__EUI64ProxyArray := Win32FixedArray(this.ptr + 124, 8, Primitive, "char")
            return this.__EUI64ProxyArray
        }
    }

    /**
     * @type {Array<NVME_LBA_FORMAT>}
     */
    LBAF{
        get {
            if(!this.HasProp("__LBAFProxyArray"))
                this.__LBAFProxyArray := Win32FixedArray(this.ptr + 136, 64, NVME_LBA_FORMAT, "")
            return this.__LBAFProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    VS{
        get {
            if(!this.HasProp("__VSProxyArray"))
                this.__VSProxyArray := Win32FixedArray(this.ptr + 648, 3712, Primitive, "char")
            return this.__VSProxyArray
        }
    }
}
