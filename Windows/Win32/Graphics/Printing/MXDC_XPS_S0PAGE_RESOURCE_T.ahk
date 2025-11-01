#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/printdocs/mxdcxpss0pageresource
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class MXDC_XPS_S0PAGE_RESOURCE_T extends Win32Struct
{
    static sizeof => 276

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwResourceType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<Byte>}
     */
    szUri{
        get {
            if(!this.HasProp("__szUriProxyArray"))
                this.__szUriProxyArray := Win32FixedArray(this.ptr + 8, 260, Primitive, "char")
            return this.__szUriProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    dwDataSize {
        get => NumGet(this, 268, "uint")
        set => NumPut("uint", value, this, 268)
    }

    /**
     * @type {Array<Byte>}
     */
    bData{
        get {
            if(!this.HasProp("__bDataProxyArray"))
                this.__bDataProxyArray := Win32FixedArray(this.ptr + 272, 1, Primitive, "char")
            return this.__bDataProxyArray
        }
    }
}
