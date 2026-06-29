#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DDGETCURRENTAUTOFLIPOUTINFO structure provides the surface information.
 * @see https://learn.microsoft.com/windows/win32/api/dxmini/ns-dxmini-ddgetcurrentautoflipoutinfo
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDGETCURRENTAUTOFLIPOUTINFO {
    #StructPack 4

    /**
     * Specifies the current zero-based index in the autoflip chain of the current surface.
     */
    dwSurfaceIndex : UInt32

    /**
     * Specifies the current zero-based index in the autoflip chain of the current <a href="https://docs.microsoft.com/windows-hardware/drivers/">vertical blanking interval (VBI)</a> surface.
     */
    dwVBISurfaceIndex : UInt32

}
