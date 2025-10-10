#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NVM_RESERVATION_CAPABILITIES.ahk
#Include .\NVME_LBA_FORMAT.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_IDENTIFY_NAMESPACE_DATA extends Win32Struct
{
    static sizeof => 4360

    static packingSize => 8

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
     * @type {Integer}
     */
    NSFEAT {
        get => NumGet(this, 24, "char")
        set => NumPut("char", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    NLBAF {
        get => NumGet(this, 25, "char")
        set => NumPut("char", value, this, 25)
    }

    /**
     * @type {Integer}
     */
    FLBAS {
        get => NumGet(this, 26, "char")
        set => NumPut("char", value, this, 26)
    }

    /**
     * @type {Integer}
     */
    MC {
        get => NumGet(this, 27, "char")
        set => NumPut("char", value, this, 27)
    }

    /**
     * @type {Integer}
     */
    DPC {
        get => NumGet(this, 28, "char")
        set => NumPut("char", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    DPS {
        get => NumGet(this, 29, "char")
        set => NumPut("char", value, this, 29)
    }

    /**
     * @type {Integer}
     */
    NMIC {
        get => NumGet(this, 30, "char")
        set => NumPut("char", value, this, 30)
    }

    /**
     * @type {NVM_RESERVATION_CAPABILITIES}
     */
    RESCAP{
        get {
            if(!this.HasProp("__RESCAP"))
                this.__RESCAP := NVM_RESERVATION_CAPABILITIES(this.ptr + 32)
            return this.__RESCAP
        }
    }

    /**
     * @type {Integer}
     */
    FPI {
        get => NumGet(this, 34, "char")
        set => NumPut("char", value, this, 34)
    }

    /**
     * @type {Integer}
     */
    DLFEAT {
        get => NumGet(this, 35, "char")
        set => NumPut("char", value, this, 35)
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
     * @type {Integer}
     */
    NSATTR {
        get => NumGet(this, 103, "char")
        set => NumPut("char", value, this, 103)
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
