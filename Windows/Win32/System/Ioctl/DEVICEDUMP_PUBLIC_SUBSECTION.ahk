#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\GP_LOG_PAGE_DESCRIPTOR.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class DEVICEDUMP_PUBLIC_SUBSECTION extends Win32Struct {
    static sizeof => 88

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {GP_LOG_PAGE_DESCRIPTOR}
     */
    GPLogTable {
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
        get => StrGet(this.ptr + 68, 15, "UTF-8")
        set => StrPut(value, this.ptr + 68, 15, "UTF-8")
    }

    /**
     * @type {Array<Integer>}
     */
    bData {
        get {
            if(!this.HasProp("__bDataProxyArray"))
                this.__bDataProxyArray := Win32FixedArray(this.ptr + 84, 1, Primitive, "char")
            return this.__bDataProxyArray
        }
    }
}
