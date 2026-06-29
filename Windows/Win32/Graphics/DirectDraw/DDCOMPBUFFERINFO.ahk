#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDSCAPS2.ahk" { DDSCAPS2 }
#Import ".\DDPIXELFORMAT.ahk" { DDPIXELFORMAT }

/**
 * The DDCOMPBUFFERINFO structure contains driver-supplied information regarding compression buffers.
 * @remarks
 * This structure passes this information to the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_getmocompcompbuffdata">DD_GETMOCOMPCOMPBUFFDATA</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-ddcompbufferinfo
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDCOMPBUFFERINFO {
    #StructPack 4

    /**
     * Specifies the size in bytes of this DDCOMPBUFFERINFO structure.
     */
    dwSize : UInt32

    /**
     * Indicates the number of surfaces of this type required for decompression.
     */
    dwNumCompBuffers : UInt32

    /**
     * Indicates the width in pixels of the surface of this type to create.
     */
    dwWidthToCreate : UInt32

    /**
     * Indicates the height in pixels of the surface of this type to create.
     */
    dwHeightToCreate : UInt32

    /**
     * Indicates the total number of bytes used by each surface.
     */
    dwBytesToAllocate : UInt32

    /**
     * Points to a <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff550292(v=vs.85)">DDSCAPS2</a> structure that contains the capabilities to use when creating surfaces of this type. This allows the driver to specify the type of memory to use when creating these surfaces.
     */
    ddCompCaps : DDSCAPS2

    /**
     * Points to a <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ksmedia/ns-ksmedia-_ddpixelformat">DDPIXELFORMAT</a> structure that contains the pixel formats to use when creating surfaces of this type.
     */
    ddPixelFormat : DDPIXELFORMAT

}
