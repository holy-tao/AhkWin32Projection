#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DDLOCKOUTINFO structure contains the surface information output from the DxLock function.
 * @see https://learn.microsoft.com/windows/win32/api/dxmini/ns-dxmini-ddlockoutinfo
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDLOCKOUTINFO {
    #StructPack 8

    /**
     * Points to the surface in the frame buffer.
     */
    dwSurfacePtr : IntPtr

}
