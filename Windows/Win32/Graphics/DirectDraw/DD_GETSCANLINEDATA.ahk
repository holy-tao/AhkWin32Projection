#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DD_DIRECTDRAW_GLOBAL.ahk" { DD_DIRECTDRAW_GLOBAL }

/**
 * The DD_GETSCANLINEDATA structure contains the members required to query and return the number of the current scan line.
 * @remarks
 * The returned scan line value in <b>dwScanLine</b> must be greater than or equal to 0 and less than N, where N is the sum of the number of visible scan lines and the number of scan lines that occur during vertical blank. For example, with a display operating at a resolution of 640x480, that has 12 scan lines during vertical blank, the value returned to <b>GetScanLine</b> could range from 0 to 491.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_getscanlinedata
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_GETSCANLINEDATA {
    #StructPack 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_global">DD_DIRECTDRAW_GLOBAL</a> structure that describes the driver's device.
     */
    lpDD : DD_DIRECTDRAW_GLOBAL.Ptr

    /**
     * Specifies the location in which the driver returns the number of the current scan line. See the Remarks section for more information.
     */
    dwScanLine : UInt32

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_getscanline">DdGetScanLine</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     */
    ddRVal : HRESULT

    /**
     * Used by the Microsoft DirectDraw API and should not be filled in by the driver.
     */
    GetScanLine : IntPtr

}
