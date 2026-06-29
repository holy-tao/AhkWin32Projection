#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDSCAPS.ahk" { DDSCAPS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DD_DIRECTDRAW_GLOBAL.ahk" { DD_DIRECTDRAW_GLOBAL }

/**
 * The DD_GETAVAILDRIVERMEMORYDATA structure contains the information needed by the driver to query and return the amount of free memory.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_getavaildrivermemorydata
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_GETAVAILDRIVERMEMORYDATA {
    #StructPack 8

    /**
     * Points to the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_global">DD_DIRECTDRAW_GLOBAL</a> structure that describes the driver's device.
     */
    lpDD : DD_DIRECTDRAW_GLOBAL.Ptr

    /**
     * Points to a <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff550286(v=vs.85)">DDSCAPS</a> structure that describes the type of surface for which memory availability is being queried.
     */
    DDSCaps : DDSCAPS

    /**
     * Specifies the location in which the driver returns the number of bytes of driver-managed memory that can be used for surfaces of the type described by <b>DDSCaps</b>.
     */
    dwTotal : UInt32

    /**
     * Specifies the location in which the driver returns the amount of free memory in bytes for the surface type described by <b>DDSCaps</b>.
     */
    dwFree : UInt32

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_getavaildrivermemory">DdGetAvailDriverMemory</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     */
    ddRVal : HRESULT

    /**
     * Used by the Microsoft DirectDraw API and should not be filled in by the driver.
     */
    GetAvailDriverMemory : IntPtr

}
