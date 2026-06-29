#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_SURFACE_LOCAL.ahk" { DD_SURFACE_LOCAL }

/**
 * The DDMOCOMPBUFFERINFO structure contains the macro block information required to render a frame and passes this information to the DD_RENDERMOCOMPDATA structure.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-ddmocompbufferinfo
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDMOCOMPBUFFERINFO {
    #StructPack 8

    /**
     * Specifies the size in bytes of this DDMOCOMPBUFFERINFO structure.
     */
    dwSize : UInt32

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_local">DD_SURFACE_LOCAL</a> structure that contains the compressed data.
     */
    lpCompSurface : DD_SURFACE_LOCAL.Ptr

    /**
     * Indicates the offset to the relevant data, in bytes, from the beginning of the buffer. This value does not allow for pitch.
     */
    dwDataOffset : UInt32

    /**
     * Indicates the size of the relevant data in bytes. This value does not allow for pitch.
     */
    dwDataSize : UInt32

    /**
     * Used by Microsoft DirectDraw and should be ignored by the driver.
     */
    lpPrivate : IntPtr

}
