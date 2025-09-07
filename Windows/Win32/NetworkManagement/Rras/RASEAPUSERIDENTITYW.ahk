#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 * @charset Unicode
 */
class RASEAPUSERIDENTITYW extends Win32Struct
{
    static sizeof => 524

    static packingSize => 4

    /**
     * @type {String}
     */
    szUserName {
        get => StrGet(this.ptr + 0, 256, "UTF-16")
        set => StrPut(value, this.ptr + 0, 256, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwSizeofEapInfo {
        get => NumGet(this, 516, "uint")
        set => NumPut("uint", value, this, 516)
    }

    /**
     * @type {Array<Byte>}
     */
    pbEapInfo{
        get {
            if(!this.HasProp("__pbEapInfoProxyArray"))
                this.__pbEapInfoProxyArray := Win32FixedArray(this.ptr + 520, 1, Primitive, "char")
            return this.__pbEapInfoProxyArray
        }
    }
}
