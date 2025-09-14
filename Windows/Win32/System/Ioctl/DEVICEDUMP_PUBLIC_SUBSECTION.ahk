#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\GP_LOG_PAGE_DESCRIPTOR.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DEVICEDUMP_PUBLIC_SUBSECTION extends Win32Struct
{
    static sizeof => 149

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
     * @type {Array<SByte>}
     */
    szDescription{
        get {
            if(!this.HasProp("__szDescriptionProxyArray"))
                this.__szDescriptionProxyArray := Win32FixedArray(this.ptr + 132, 16, Primitive, "char")
            return this.__szDescriptionProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    bData{
        get {
            if(!this.HasProp("__bDataProxyArray"))
                this.__bDataProxyArray := Win32FixedArray(this.ptr + 148, 1, Primitive, "char")
            return this.__bDataProxyArray
        }
    }
}
