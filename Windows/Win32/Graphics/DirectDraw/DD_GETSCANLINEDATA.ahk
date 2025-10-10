#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DD_GETSCANLINEDATA structure contains the members required to query and return the number of the current scan line.
 * @remarks
 * 
  * The returned scan line value in <b>dwScanLine</b> must be greater than or equal to 0 and less than N, where N is the sum of the number of visible scan lines and the number of scan lines that occur during vertical blank. For example, with a display operating at a resolution of 640x480, that has 12 scan lines during vertical blank, the value returned to <b>GetScanLine</b> could range from 0 to 491.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ddrawint/ns-ddrawint-dd_getscanlinedata
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_GETSCANLINEDATA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_global">DD_DIRECTDRAW_GLOBAL</a> structure that describes the driver's device.
     * @type {Pointer<DD_DIRECTDRAW_GLOBAL>}
     */
    lpDD {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Specifies the location in which the driver returns the number of the current scan line. See the Remarks section for more information.
     * @type {Integer}
     */
    dwScanLine {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_getscanline">DdGetScanLine</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     * @type {HRESULT}
     */
    ddRVal {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Used by the Microsoft DirectDraw API and should not be filled in by the driver.
     * @type {Pointer<Void>}
     */
    GetScanLine {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
