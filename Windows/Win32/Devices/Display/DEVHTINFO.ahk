#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CIECHROMA.ahk
#Include .\COLORINFO.ahk

/**
 * The DEVHTINFO structure is used as input to the HTUI_DeviceColorAdjustment function.
 * @see https://docs.microsoft.com/windows/win32/api//winddi/ns-winddi-devhtinfo
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class DEVHTINFO extends Win32Struct
{
    static sizeof => 160

    static packingSize => 8

    /**
     * Is a set of caller-supplied flags indicating halftone attributes. See the <b>flHTFlags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-gdiinfo">GDIINFO</a> structure for a complete list of possible values.
     * @type {Integer}
     */
    HTFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Is a caller-supplied value that must be one of the HTPAT_SIZE-prefixed constants defined in <i>winddi.h</i>.
     * @type {Integer}
     */
    HTPatternSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * For printers, specifies the number of dots per inch. See the description of the <b>ulDevicePelsDPI</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-gdiinfo">GDIINFO</a> structure for more information.
     * 
     * For displays, this member should be set to zero.
     * @type {Integer}
     */
    DevPelsDPI {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Is a caller-supplied pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-colorinfo">COLORINFO</a> structure containing halftoning color information.
     * @type {COLORINFO}
     */
    ColorInfo{
        get {
            if(!this.HasProp("__ColorInfo"))
                this.__ColorInfo := COLORINFO(this.ptr + 16)
            return this.__ColorInfo
        }
    }
}
