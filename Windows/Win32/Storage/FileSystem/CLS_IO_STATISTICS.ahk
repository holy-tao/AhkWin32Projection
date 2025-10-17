#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CLS_IO_STATISTICS_HEADER.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class CLS_IO_STATISTICS extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {CLS_IO_STATISTICS_HEADER}
     */
    hdrIoStats{
        get {
            if(!this.HasProp("__hdrIoStats"))
                this.__hdrIoStats := CLS_IO_STATISTICS_HEADER(0, this)
            return this.__hdrIoStats
        }
    }

    /**
     * @type {Integer}
     */
    cFlush {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    cbFlush {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    cMetaFlush {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    cbMetaFlush {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
