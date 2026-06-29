#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\COLORINFO.ahk" { COLORINFO }
#Import ".\CIECHROMA.ahk" { CIECHROMA }

/**
 * The DEVHTINFO structure is used as input to the HTUI_DeviceColorAdjustment function.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-devhtinfo
 * @namespace Windows.Win32.Devices.Display
 */
export default struct DEVHTINFO {
    #StructPack 4

    /**
     * Is a set of caller-supplied flags indicating halftone attributes. See the <b>flHTFlags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-gdiinfo">GDIINFO</a> structure for a complete list of possible values.
     */
    HTFlags : UInt32

    /**
     * Is a caller-supplied value that must be one of the HTPAT_SIZE-prefixed constants defined in <i>winddi.h</i>.
     */
    HTPatternSize : UInt32

    /**
     * For printers, specifies the number of dots per inch. See the description of the <b>ulDevicePelsDPI</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-gdiinfo">GDIINFO</a> structure for more information.
     * 
     * For displays, this member should be set to zero.
     */
    DevPelsDPI : UInt32

    /**
     * Is a caller-supplied pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-colorinfo">COLORINFO</a> structure containing halftoning color information.
     */
    ColorInfo : COLORINFO

}
