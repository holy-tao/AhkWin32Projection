#Requires AutoHotkey v2.1-alpha.26+ 64-bit

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
 */
export default struct DD_NTPRIVATEDRIVERCAPS {
    #StructPack 4

    /**
     * Specifies the size in bytes of this DD_NTPRIVATEDRIVERCAPS structure.
     */
    dwSize : UInt32

    /**
     * Indicates how DirectDraw should create the surface.
     */
    dwPrivateCaps : UInt32

}
