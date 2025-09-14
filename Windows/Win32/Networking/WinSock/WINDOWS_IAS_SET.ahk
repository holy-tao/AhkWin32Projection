#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class WINDOWS_IAS_SET extends Win32Struct
{
    static sizeof => 344

    static packingSize => 8

    /**
     * @type {Array<SByte>}
     */
    irdaClassName{
        get {
            if(!this.HasProp("__irdaClassNameProxyArray"))
                this.__irdaClassNameProxyArray := Win32FixedArray(this.ptr + 0, 64, Primitive, "char")
            return this.__irdaClassNameProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    irdaAttribName{
        get {
            if(!this.HasProp("__irdaAttribNameProxyArray"))
                this.__irdaAttribNameProxyArray := Win32FixedArray(this.ptr + 64, 256, Primitive, "char")
            return this.__irdaAttribNameProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    irdaAttribType {
        get => NumGet(this, 320, "uint")
        set => NumPut("uint", value, this, 320)
    }

    /**
     * @type {Integer}
     */
    irdaAttribInt {
        get => NumGet(this, 328, "int")
        set => NumPut("int", value, this, 328)
    }

    /**
     * @type {Integer}
     */
    Len {
        get => NumGet(this, 328, "ushort")
        set => NumPut("ushort", value, this, 328)
    }

    /**
     * @type {Array<Byte>}
     */
    OctetSeq{
        get {
            if(!this.HasProp("__OctetSeqProxyArray"))
                this.__OctetSeqProxyArray := Win32FixedArray(this.ptr + 330, 1024, Primitive, "char")
            return this.__OctetSeqProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    CharSet {
        get => NumGet(this, 329, "char")
        set => NumPut("char", value, this, 329)
    }

    /**
     * @type {Array<Byte>}
     */
    UsrStr{
        get {
            if(!this.HasProp("__UsrStrProxyArray"))
                this.__UsrStrProxyArray := Win32FixedArray(this.ptr + 330, 256, Primitive, "char")
            return this.__UsrStrProxyArray
        }
    }
}
