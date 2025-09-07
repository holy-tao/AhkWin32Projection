#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DD_NTPRIVATEDRIVERCAPS structure enables the driver to change the behavior of Microsoft DirectDraw when DirectDraw is creating surfaces.
 * @remarks
 * The behavior of DirectDraw emulates the surface creation techniques employed by DirectDraw when creating surfaces for Microsoft Windows 98/Me.
  * 
  * When the DDHAL_PRIVATECAP_AUTOMICSURFACECREATION flag is not set, DirectDraw performs surface creation using the original method, that is, it calls the driver's <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff549263(v=vs.85)">DdCreateSurface</a> function once for each surface being created.
  * 
  * When the DDHAL_PRIVATECAP_NOTIFYPRIMARYCREATION flag is not set, DirectDraw performs primary surface creation using the original method, that is, it does not call the driver when creating a primary surface.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_ntprivatedrivercaps
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_NTPRIVATEDRIVERCAPS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Specifies the size in bytes of this DD_NTPRIVATEDRIVERCAPS structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Indicates how DirectDraw should create the surface.
     * @type {Integer}
     */
    dwPrivateCaps {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
