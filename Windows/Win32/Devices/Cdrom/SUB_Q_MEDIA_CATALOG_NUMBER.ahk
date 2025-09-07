#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SUB_Q_HEADER.ahk

/**
 * @namespace Windows.Win32.Devices.Cdrom
 * @version v4.0.30319
 */
class SUB_Q_MEDIA_CATALOG_NUMBER extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * @type {SUB_Q_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := SUB_Q_HEADER(this.ptr + 0)
            return this.__Header
        }
    }

    /**
     * @type {Integer}
     */
    FormatCode {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 5, 1, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {Array<Byte>}
     */
    MediaCatalog{
        get {
            if(!this.HasProp("__MediaCatalogProxyArray"))
                this.__MediaCatalogProxyArray := Win32FixedArray(this.ptr + 9, 1, Primitive, "char")
            return this.__MediaCatalogProxyArray
        }
    }
}
