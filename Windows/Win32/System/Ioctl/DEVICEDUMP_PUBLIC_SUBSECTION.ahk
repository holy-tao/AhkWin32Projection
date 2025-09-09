#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\GP_LOG_PAGE_DESCRIPTOR.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DEVICEDUMP_PUBLIC_SUBSECTION extends Win32Struct
{
    static sizeof => 165

    static packingSize => 1

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<GP_LOG_PAGE_DESCRIPTOR>}
     */
    GPLogTable{
        get {
            if(!this.HasProp("__GPLogTableProxyArray"))
                this.__GPLogTableProxyArray := Win32FixedArray(this.ptr + 4, 16, GP_LOG_PAGE_DESCRIPTOR, "")
            return this.__GPLogTableProxyArray
        }
    }

    /**
     * @type {String}
     */
    szDescription {
        get => StrGet(this.ptr + 132, 15, "UTF-16")
        set => StrPut(value, this.ptr + 132, 15, "UTF-16")
    }

    /**
     * @type {Array<Byte>}
     */
    bData{
        get {
            if(!this.HasProp("__bDataProxyArray"))
                this.__bDataProxyArray := Win32FixedArray(this.ptr + 164, 1, Primitive, "char")
            return this.__bDataProxyArray
        }
    }
}
