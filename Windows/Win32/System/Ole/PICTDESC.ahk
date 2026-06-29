#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Gdi\HENHMETAFILE.ahk" { HENHMETAFILE }
#Import "..\..\UI\WindowsAndMessaging\HICON.ahk" { HICON }
#Import "..\..\Graphics\Gdi\HMETAFILE.ahk" { HMETAFILE }
#Import "..\..\Graphics\Gdi\HPALETTE.ahk" { HPALETTE }
#Import "..\..\Graphics\Gdi\HBITMAP.ahk" { HBITMAP }

/**
 * Contains parameters to create a picture object through the OleCreatePictureIndirect function.
 * @see https://learn.microsoft.com/windows/win32/api/olectl/ns-olectl-pictdesc
 * @namespace Windows.Win32.System.Ole
 */
export default struct PICTDESC {
    #StructPack 8


    struct _bmp {
        hbitmap : HBITMAP

        hpal : HPALETTE

    }

    struct _wmf {
        hmeta : HMETAFILE

        xExt : Int32

        yExt : Int32

    }

    struct _icon {
        hicon : HICON

    }

    struct _emf {
        hemf : HENHMETAFILE

    }

    /**
     * The size of the structure, in bytes.
     */
    cbSizeofstruct : UInt32

    /**
     * Type of picture described by this structure, which can be any value from the <a href="https://docs.microsoft.com/windows/desktop/com/pictype-constants">PICTYPE</a> enumeration. This selects the arm of the union that corresponds to one of the picture type structures below.
     */
    picType : UInt32

    bmp : PICTDESC._bmp

    static __New() {
        DefineProp(this.Prototype, 'wmf', { type: PICTDESC._wmf, offset: 8 })
        DefineProp(this.Prototype, 'icon', { type: PICTDESC._icon, offset: 8 })
        DefineProp(this.Prototype, 'emf', { type: PICTDESC._emf, offset: 8 })
        this.DeleteProp("__New")
    }
}
