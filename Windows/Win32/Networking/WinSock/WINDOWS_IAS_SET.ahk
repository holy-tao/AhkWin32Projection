#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class WINDOWS_IAS_SET extends Win32Struct
{
    static sizeof => 664

    static packingSize => 8

    /**
     * @type {String}
     */
    irdaClassName {
        get => StrGet(this.ptr + 0, 63, "UTF-16")
        set => StrPut(value, this.ptr + 0, 63, "UTF-16")
    }

    /**
     * @type {String}
     */
    irdaAttribName {
        get => StrGet(this.ptr + 128, 255, "UTF-16")
        set => StrPut(value, this.ptr + 128, 255, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    irdaAttribType {
        get => NumGet(this, 640, "uint")
        set => NumPut("uint", value, this, 640)
    }

    /**
     * @type {Integer}
     */
    irdaAttribInt {
        get => NumGet(this, 648, "int")
        set => NumPut("int", value, this, 648)
    }

    /**
     * @type {Integer}
     */
    Len {
        get => NumGet(this, 648, "ushort")
        set => NumPut("ushort", value, this, 648)
    }

    /**
     * @type {Array<Byte>}
     */
    OctetSeq{
        get {
            if(!this.HasProp("__OctetSeqProxyArray"))
                this.__OctetSeqProxyArray := Win32FixedArray(this.ptr + 650, 1024, Primitive, "char")
            return this.__OctetSeqProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    CharSet {
        get => NumGet(this, 649, "char")
        set => NumPut("char", value, this, 649)
    }

    /**
     * @type {Array<Byte>}
     */
    UsrStr{
        get {
            if(!this.HasProp("__UsrStrProxyArray"))
                this.__UsrStrProxyArray := Win32FixedArray(this.ptr + 650, 256, Primitive, "char")
            return this.__UsrStrProxyArray
        }
    }
}
