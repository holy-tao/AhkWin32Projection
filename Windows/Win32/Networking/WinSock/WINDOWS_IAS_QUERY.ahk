#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class WINDOWS_IAS_QUERY extends Win32Struct
{
    static sizeof => 652

    static packingSize => 4

    /**
     * @type {Array<Byte>}
     */
    irdaDeviceID{
        get {
            if(!this.HasProp("__irdaDeviceIDProxyArray"))
                this.__irdaDeviceIDProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__irdaDeviceIDProxyArray
        }
    }

    /**
     * @type {String}
     */
    irdaClassName {
        get => StrGet(this.ptr + 4, 63, "UTF-16")
        set => StrPut(value, this.ptr + 4, 63, "UTF-16")
    }

    /**
     * @type {String}
     */
    irdaAttribName {
        get => StrGet(this.ptr + 132, 255, "UTF-16")
        set => StrPut(value, this.ptr + 132, 255, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    irdaAttribType {
        get => NumGet(this, 644, "uint")
        set => NumPut("uint", value, this, 644)
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
        get => NumGet(this, 648, "uint")
        set => NumPut("uint", value, this, 648)
    }

    /**
     * @type {Array<Byte>}
     */
    OctetSeq{
        get {
            if(!this.HasProp("__OctetSeqProxyArray"))
                this.__OctetSeqProxyArray := Win32FixedArray(this.ptr + 652, 1, Primitive, "char")
            return this.__OctetSeqProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    CharSet {
        get => NumGet(this, 652, "uint")
        set => NumPut("uint", value, this, 652)
    }

    /**
     * @type {Array<Byte>}
     */
    UsrStr{
        get {
            if(!this.HasProp("__UsrStrProxyArray"))
                this.__UsrStrProxyArray := Win32FixedArray(this.ptr + 656, 1, Primitive, "char")
            return this.__UsrStrProxyArray
        }
    }
}
