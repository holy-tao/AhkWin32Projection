#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PRINTER_NOTIFY_INFO_DATA.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class PRINTER_NOTIFY_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<PRINTER_NOTIFY_INFO_DATA>}
     */
    aData{
        get {
            if(!this.HasProp("__aDataProxyArray"))
                this.__aDataProxyArray := Win32FixedArray(this.ptr + 16, 1, PRINTER_NOTIFY_INFO_DATA, "")
            return this.__aDataProxyArray
        }
    }
}
