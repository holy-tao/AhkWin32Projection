#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECTL.ahk" { RECTL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DD_DIRECTDRAW_GLOBAL.ahk" { DD_DIRECTDRAW_GLOBAL }
#Import ".\DD_SURFACE_LOCAL.ahk" { DD_SURFACE_LOCAL }

/**
 * The DD_LOCKDATA structure contains information necessary to do a lock as defined by the Microsoft DirectDraw parameter structures.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_lockdata
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_LOCKDATA {
    #StructPack 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_global">DD_DIRECTDRAW_GLOBAL</a> structure that describes the driver's device.
     */
    lpDD : DD_DIRECTDRAW_GLOBAL.Ptr

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_local">DD_SURFACE_LOCAL</a> structure that describes the surface--in the case of <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff568216(v=vs.85)">LockD3DBuffer</a>, a buffer--associated with the memory region to be locked down.
     */
    lpDDSurface : DD_SURFACE_LOCAL.Ptr

    /**
     * Specifies whether the area in <b>rArea</b> is valid. A value of 0x00000001 indicates a valid area, 0x00000000 indicates an invalid area.
     */
    bHasRect : UInt32

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rectl">RECTL</a> structure that defines the area on the surface to lock down.
     */
    rArea : RECTL

    /**
     * Specifies the location in which the driver can return a pointer to the memory region that it locked down.
     */
    lpSurfData : IntPtr

    /**
     * Specifies the location in which the driver writes the return value of either the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_lock">DdLock</a> or <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff568216(v=vs.85)">LockD3DBuffer</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     */
    ddRVal : HRESULT

    /**
     * Used by the DirectDraw API and should not be filled in by the driver.
     */
    Lock : IntPtr

    dwFlags : UInt32

    /**
     * Specifies a pointer to a user-mode mapping of the driver's memory. The driver performs this mapping in <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mapmemory">DdMapMemory</a>. Windows 2000 and later only.
     */
    fpProcess : IntPtr

}
