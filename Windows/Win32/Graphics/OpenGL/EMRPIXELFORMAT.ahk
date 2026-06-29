#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PFD_FLAGS.ahk" { PFD_FLAGS }
#Import "..\Gdi\EMR.ahk" { EMR }
#Import ".\PFD_PIXEL_TYPE.ahk" { PFD_PIXEL_TYPE }
#Import "..\Gdi\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }
#Import ".\PIXELFORMATDESCRIPTOR.ahk" { PIXELFORMATDESCRIPTOR }

/**
 * The EMRPIXELFORMAT structure contains the members for the SetPixelFormat enhanced metafile record. The pixel format information in ENHMETAHEADER refers to this structure.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrpixelformat
 * @namespace Windows.Win32.Graphics.OpenGL
 */
export default struct EMRPIXELFORMAT {
    #StructPack 8

    /**
     * The base structure for all record types.
     */
    emr : EMR

    /**
     * A 
     *             <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-pixelformatdescriptor">PIXELFORMATDESCRIPTOR</a> structure, which describes the pixel format.
     */
    pfd : PIXELFORMATDESCRIPTOR

}
