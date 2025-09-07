#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 * @charset ANSI
 */
class RASEAPUSERIDENTITYA extends Win32Struct
{
    static sizeof => 268

    static packingSize => 4

    /**
     * @type {String}
     */
    szUserName {
        get => StrGet(this.ptr + 0, 256, "UTF-8")
        set => StrPut(value, this.ptr + 0, 256, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    dwSizeofEapInfo {
        get => NumGet(this, 260, "uint")
        set => NumPut("uint", value, this, 260)
    }

    /**
     * @type {Array<Byte>}
     */
    pbEapInfo{
        get {
            if(!this.HasProp("__pbEapInfoProxyArray"))
                this.__pbEapInfoProxyArray := Win32FixedArray(this.ptr + 264, 1, Primitive, "char")
            return this.__pbEapInfoProxyArray
        }
    }
}
