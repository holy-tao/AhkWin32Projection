#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class HSP_UPGRADE_IMAGEDATA extends Win32Struct
{
    static sizeof => 196

    static packingSize => 1

    /**
     * @type {Integer}
     */
    hashAlgID {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    digestSize {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Array<Byte>}
     */
    digest{
        get {
            if(!this.HasProp("__digestProxyArray"))
                this.__digestProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__digestProxyArray
        }
    }

    /**
     * @type {String}
     */
    fileName {
        get => StrGet(this.ptr + 68, 63, "UTF-16")
        set => StrPut(value, this.ptr + 68, 63, "UTF-16")
    }
}
