#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\GP_LOG_PAGE_DESCRIPTOR.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DEVICEDUMP_PRIVATE_SUBSECTION extends Win32Struct
{
    static sizeof => 12

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
    GPLogId{
        get {
            if(!this.HasProp("__GPLogId"))
                this.__GPLogId := GP_LOG_PAGE_DESCRIPTOR(this.ptr + 4)
            return this.__GPLogId
        }
    }

    /**
     * @type {Array<Byte>}
     */
    bData{
        get {
            if(!this.HasProp("__bDataProxyArray"))
                this.__bDataProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__bDataProxyArray
        }
    }
}
