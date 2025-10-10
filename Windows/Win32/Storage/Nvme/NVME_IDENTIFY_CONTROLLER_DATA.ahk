#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NVME_POWER_STATE_DESC.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_IDENTIFY_CONTROLLER_DATA extends Win32Struct
{
    static sizeof => 3328

    static packingSize => 8

    /**
     * @type {Integer}
     */
    VID {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    SSVID {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Array<Byte>}
     */
    SN{
        get {
            if(!this.HasProp("__SNProxyArray"))
                this.__SNProxyArray := Win32FixedArray(this.ptr + 4, 20, Primitive, "char")
            return this.__SNProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    MN{
        get {
            if(!this.HasProp("__MNProxyArray"))
                this.__MNProxyArray := Win32FixedArray(this.ptr + 24, 40, Primitive, "char")
            return this.__MNProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    FR{
        get {
            if(!this.HasProp("__FRProxyArray"))
                this.__FRProxyArray := Win32FixedArray(this.ptr + 64, 8, Primitive, "char")
            return this.__FRProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    RAB {
        get => NumGet(this, 72, "char")
        set => NumPut("char", value, this, 72)
    }

    /**
     * @type {Array<Byte>}
     */
    IEEE{
        get {
            if(!this.HasProp("__IEEEProxyArray"))
                this.__IEEEProxyArray := Win32FixedArray(this.ptr + 73, 3, Primitive, "char")
            return this.__IEEEProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    CMIC {
        get => NumGet(this, 76, "char")
        set => NumPut("char", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    MDTS {
        get => NumGet(this, 77, "char")
        set => NumPut("char", value, this, 77)
    }

    /**
     * @type {Integer}
     */
    CNTLID {
        get => NumGet(this, 78, "ushort")
        set => NumPut("ushort", value, this, 78)
    }

    /**
     * @type {Integer}
     */
    VER {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    RTD3R {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * @type {Integer}
     */
    RTD3E {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    OAES {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * @type {Integer}
     */
    CTRATT {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    RRLS {
        get => NumGet(this, 100, "ushort")
        set => NumPut("ushort", value, this, 100)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved0{
        get {
            if(!this.HasProp("__Reserved0ProxyArray"))
                this.__Reserved0ProxyArray := Win32FixedArray(this.ptr + 102, 9, Primitive, "char")
            return this.__Reserved0ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    CNTRLTYPE {
        get => NumGet(this, 111, "char")
        set => NumPut("char", value, this, 111)
    }

    /**
     * @type {Array<Byte>}
     */
    FGUID{
        get {
            if(!this.HasProp("__FGUIDProxyArray"))
                this.__FGUIDProxyArray := Win32FixedArray(this.ptr + 112, 16, Primitive, "char")
            return this.__FGUIDProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    CRDT1 {
        get => NumGet(this, 128, "ushort")
        set => NumPut("ushort", value, this, 128)
    }

    /**
     * @type {Integer}
     */
    CRDT2 {
        get => NumGet(this, 130, "ushort")
        set => NumPut("ushort", value, this, 130)
    }

    /**
     * @type {Integer}
     */
    CRDT3 {
        get => NumGet(this, 132, "ushort")
        set => NumPut("ushort", value, this, 132)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 134, 106, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    ReservedForManagement{
        get {
            if(!this.HasProp("__ReservedForManagementProxyArray"))
                this.__ReservedForManagementProxyArray := Win32FixedArray(this.ptr + 240, 13, Primitive, "char")
            return this.__ReservedForManagementProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    NVMSR {
        get => NumGet(this, 253, "char")
        set => NumPut("char", value, this, 253)
    }

    /**
     * @type {Integer}
     */
    VWCI {
        get => NumGet(this, 254, "char")
        set => NumPut("char", value, this, 254)
    }

    /**
     * @type {Integer}
     */
    MEC {
        get => NumGet(this, 255, "char")
        set => NumPut("char", value, this, 255)
    }

    /**
     * @type {Integer}
     */
    OACS {
        get => NumGet(this, 256, "ushort")
        set => NumPut("ushort", value, this, 256)
    }

    /**
     * @type {Integer}
     */
    ACL {
        get => NumGet(this, 258, "char")
        set => NumPut("char", value, this, 258)
    }

    /**
     * @type {Integer}
     */
    AERL {
        get => NumGet(this, 259, "char")
        set => NumPut("char", value, this, 259)
    }

    /**
     * @type {Integer}
     */
    FRMW {
        get => NumGet(this, 260, "char")
        set => NumPut("char", value, this, 260)
    }

    /**
     * @type {Integer}
     */
    LPA {
        get => NumGet(this, 261, "char")
        set => NumPut("char", value, this, 261)
    }

    /**
     * @type {Integer}
     */
    ELPE {
        get => NumGet(this, 262, "char")
        set => NumPut("char", value, this, 262)
    }

    /**
     * @type {Integer}
     */
    NPSS {
        get => NumGet(this, 263, "char")
        set => NumPut("char", value, this, 263)
    }

    /**
     * @type {Integer}
     */
    AVSCC {
        get => NumGet(this, 264, "char")
        set => NumPut("char", value, this, 264)
    }

    /**
     * @type {Integer}
     */
    APSTA {
        get => NumGet(this, 265, "char")
        set => NumPut("char", value, this, 265)
    }

    /**
     * @type {Integer}
     */
    WCTEMP {
        get => NumGet(this, 266, "ushort")
        set => NumPut("ushort", value, this, 266)
    }

    /**
     * @type {Integer}
     */
    CCTEMP {
        get => NumGet(this, 268, "ushort")
        set => NumPut("ushort", value, this, 268)
    }

    /**
     * @type {Integer}
     */
    MTFA {
        get => NumGet(this, 270, "ushort")
        set => NumPut("ushort", value, this, 270)
    }

    /**
     * @type {Integer}
     */
    HMPRE {
        get => NumGet(this, 272, "uint")
        set => NumPut("uint", value, this, 272)
    }

    /**
     * @type {Integer}
     */
    HMMIN {
        get => NumGet(this, 276, "uint")
        set => NumPut("uint", value, this, 276)
    }

    /**
     * @type {Array<Byte>}
     */
    TNVMCAP{
        get {
            if(!this.HasProp("__TNVMCAPProxyArray"))
                this.__TNVMCAPProxyArray := Win32FixedArray(this.ptr + 280, 16, Primitive, "char")
            return this.__TNVMCAPProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    UNVMCAP{
        get {
            if(!this.HasProp("__UNVMCAPProxyArray"))
                this.__UNVMCAPProxyArray := Win32FixedArray(this.ptr + 296, 16, Primitive, "char")
            return this.__UNVMCAPProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    RPMBS {
        get => NumGet(this, 312, "uint")
        set => NumPut("uint", value, this, 312)
    }

    /**
     * @type {Integer}
     */
    EDSTT {
        get => NumGet(this, 316, "ushort")
        set => NumPut("ushort", value, this, 316)
    }

    /**
     * @type {Integer}
     */
    DSTO {
        get => NumGet(this, 318, "char")
        set => NumPut("char", value, this, 318)
    }

    /**
     * @type {Integer}
     */
    FWUG {
        get => NumGet(this, 319, "char")
        set => NumPut("char", value, this, 319)
    }

    /**
     * @type {Integer}
     */
    KAS {
        get => NumGet(this, 320, "ushort")
        set => NumPut("ushort", value, this, 320)
    }

    /**
     * @type {Integer}
     */
    HCTMA {
        get => NumGet(this, 322, "ushort")
        set => NumPut("ushort", value, this, 322)
    }

    /**
     * @type {Integer}
     */
    MNTMT {
        get => NumGet(this, 324, "ushort")
        set => NumPut("ushort", value, this, 324)
    }

    /**
     * @type {Integer}
     */
    MXTMT {
        get => NumGet(this, 326, "ushort")
        set => NumPut("ushort", value, this, 326)
    }

    /**
     * @type {Integer}
     */
    SANICAP {
        get => NumGet(this, 328, "uint")
        set => NumPut("uint", value, this, 328)
    }

    /**
     * @type {Integer}
     */
    HMMINDS {
        get => NumGet(this, 332, "uint")
        set => NumPut("uint", value, this, 332)
    }

    /**
     * @type {Integer}
     */
    HMMAXD {
        get => NumGet(this, 336, "ushort")
        set => NumPut("ushort", value, this, 336)
    }

    /**
     * @type {Integer}
     */
    NSETIDMAX {
        get => NumGet(this, 338, "ushort")
        set => NumPut("ushort", value, this, 338)
    }

    /**
     * @type {Integer}
     */
    ENDGIDMAX {
        get => NumGet(this, 340, "ushort")
        set => NumPut("ushort", value, this, 340)
    }

    /**
     * @type {Integer}
     */
    ANATT {
        get => NumGet(this, 342, "char")
        set => NumPut("char", value, this, 342)
    }

    /**
     * @type {Integer}
     */
    ANACAP {
        get => NumGet(this, 343, "char")
        set => NumPut("char", value, this, 343)
    }

    /**
     * @type {Integer}
     */
    ANAGRPMAX {
        get => NumGet(this, 344, "uint")
        set => NumPut("uint", value, this, 344)
    }

    /**
     * @type {Integer}
     */
    NANAGRPID {
        get => NumGet(this, 348, "uint")
        set => NumPut("uint", value, this, 348)
    }

    /**
     * @type {Integer}
     */
    PELS {
        get => NumGet(this, 352, "uint")
        set => NumPut("uint", value, this, 352)
    }

    /**
     * @type {Integer}
     */
    DomainId {
        get => NumGet(this, 356, "ushort")
        set => NumPut("ushort", value, this, 356)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved2{
        get {
            if(!this.HasProp("__Reserved2ProxyArray"))
                this.__Reserved2ProxyArray := Win32FixedArray(this.ptr + 358, 10, Primitive, "char")
            return this.__Reserved2ProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    MEGCAP{
        get {
            if(!this.HasProp("__MEGCAPProxyArray"))
                this.__MEGCAPProxyArray := Win32FixedArray(this.ptr + 368, 16, Primitive, "char")
            return this.__MEGCAPProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved3{
        get {
            if(!this.HasProp("__Reserved3ProxyArray"))
                this.__Reserved3ProxyArray := Win32FixedArray(this.ptr + 384, 128, Primitive, "char")
            return this.__Reserved3ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    SQES {
        get => NumGet(this, 512, "char")
        set => NumPut("char", value, this, 512)
    }

    /**
     * @type {Integer}
     */
    CQES {
        get => NumGet(this, 513, "char")
        set => NumPut("char", value, this, 513)
    }

    /**
     * @type {Integer}
     */
    MAXCMD {
        get => NumGet(this, 514, "ushort")
        set => NumPut("ushort", value, this, 514)
    }

    /**
     * @type {Integer}
     */
    NN {
        get => NumGet(this, 516, "uint")
        set => NumPut("uint", value, this, 516)
    }

    /**
     * @type {Integer}
     */
    ONCS {
        get => NumGet(this, 520, "ushort")
        set => NumPut("ushort", value, this, 520)
    }

    /**
     * @type {Integer}
     */
    FUSES {
        get => NumGet(this, 522, "ushort")
        set => NumPut("ushort", value, this, 522)
    }

    /**
     * @type {Integer}
     */
    FNA {
        get => NumGet(this, 524, "char")
        set => NumPut("char", value, this, 524)
    }

    /**
     * @type {Integer}
     */
    VWC {
        get => NumGet(this, 525, "char")
        set => NumPut("char", value, this, 525)
    }

    /**
     * @type {Integer}
     */
    AWUN {
        get => NumGet(this, 526, "ushort")
        set => NumPut("ushort", value, this, 526)
    }

    /**
     * @type {Integer}
     */
    AWUPF {
        get => NumGet(this, 528, "ushort")
        set => NumPut("ushort", value, this, 528)
    }

    /**
     * @type {Integer}
     */
    NVSCC {
        get => NumGet(this, 530, "char")
        set => NumPut("char", value, this, 530)
    }

    /**
     * @type {Integer}
     */
    NWPC {
        get => NumGet(this, 531, "char")
        set => NumPut("char", value, this, 531)
    }

    /**
     * @type {Integer}
     */
    ACWU {
        get => NumGet(this, 532, "ushort")
        set => NumPut("ushort", value, this, 532)
    }

    /**
     * @type {Integer}
     */
    CopyDescFormats {
        get => NumGet(this, 534, "ushort")
        set => NumPut("ushort", value, this, 534)
    }

    /**
     * @type {Integer}
     */
    SGLS {
        get => NumGet(this, 536, "uint")
        set => NumPut("uint", value, this, 536)
    }

    /**
     * @type {Integer}
     */
    MNAN {
        get => NumGet(this, 540, "uint")
        set => NumPut("uint", value, this, 540)
    }

    /**
     * @type {Array<Byte>}
     */
    MAXDNA{
        get {
            if(!this.HasProp("__MAXDNAProxyArray"))
                this.__MAXDNAProxyArray := Win32FixedArray(this.ptr + 544, 16, Primitive, "char")
            return this.__MAXDNAProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    MAXCNA {
        get => NumGet(this, 560, "uint")
        set => NumPut("uint", value, this, 560)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved6{
        get {
            if(!this.HasProp("__Reserved6ProxyArray"))
                this.__Reserved6ProxyArray := Win32FixedArray(this.ptr + 564, 204, Primitive, "char")
            return this.__Reserved6ProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    SUBNQN{
        get {
            if(!this.HasProp("__SUBNQNProxyArray"))
                this.__SUBNQNProxyArray := Win32FixedArray(this.ptr + 768, 256, Primitive, "char")
            return this.__SUBNQNProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved7{
        get {
            if(!this.HasProp("__Reserved7ProxyArray"))
                this.__Reserved7ProxyArray := Win32FixedArray(this.ptr + 1024, 768, Primitive, "char")
            return this.__Reserved7ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    IOCCSZ {
        get => NumGet(this, 1792, "uint")
        set => NumPut("uint", value, this, 1792)
    }

    /**
     * @type {Integer}
     */
    IORCSZ {
        get => NumGet(this, 1796, "uint")
        set => NumPut("uint", value, this, 1796)
    }

    /**
     * @type {Integer}
     */
    ICDOFF {
        get => NumGet(this, 1800, "ushort")
        set => NumPut("ushort", value, this, 1800)
    }

    /**
     * @type {Integer}
     */
    FCATT {
        get => NumGet(this, 1802, "char")
        set => NumPut("char", value, this, 1802)
    }

    /**
     * @type {Integer}
     */
    MSDBD {
        get => NumGet(this, 1803, "char")
        set => NumPut("char", value, this, 1803)
    }

    /**
     * @type {Integer}
     */
    OFCS {
        get => NumGet(this, 1804, "ushort")
        set => NumPut("ushort", value, this, 1804)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved8{
        get {
            if(!this.HasProp("__Reserved8ProxyArray"))
                this.__Reserved8ProxyArray := Win32FixedArray(this.ptr + 1806, 242, Primitive, "char")
            return this.__Reserved8ProxyArray
        }
    }

    /**
     * @type {Array<NVME_POWER_STATE_DESC>}
     */
    PDS{
        get {
            if(!this.HasProp("__PDSProxyArray"))
                this.__PDSProxyArray := Win32FixedArray(this.ptr + 2048, 32, NVME_POWER_STATE_DESC, "")
            return this.__PDSProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    VS{
        get {
            if(!this.HasProp("__VSProxyArray"))
                this.__VSProxyArray := Win32FixedArray(this.ptr + 2304, 1024, Primitive, "char")
            return this.__VSProxyArray
        }
    }
}
