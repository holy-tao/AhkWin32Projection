#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PFD_FLAGS.ahk
#Include ..\Gdi\EMR.ahk
#Include ..\Gdi\ENHANCED_METAFILE_RECORD_TYPE.ahk
#Include .\PFD_PIXEL_TYPE.ahk
#Include .\PIXELFORMATDESCRIPTOR.ahk

/**
 * The EMRPIXELFORMAT structure contains the members for the SetPixelFormat enhanced metafile record. The pixel format information in ENHMETAHEADER refers to this structure.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrpixelformat
 * @namespace Windows.Win32.Graphics.OpenGL
 */
class EMRPIXELFORMAT extends Win32Struct {
    static sizeof => 48

    static packingSize => 4

    /**
     * The base structure for all record types.
     * @type {EMR}
     */
    emr {
        get {
            if(!this.HasProp("__emr"))
                this.__emr := EMR(0, this)
            return this.__emr
        }
    }

    /**
     * A 
     *             <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-pixelformatdescriptor">PIXELFORMATDESCRIPTOR</a> structure, which describes the pixel format.
     * @type {PIXELFORMATDESCRIPTOR}
     */
    pfd {
        get {
            if(!this.HasProp("__pfd"))
                this.__pfd := PIXELFORMATDESCRIPTOR(8, this)
            return this.__pfd
        }
    }
}
