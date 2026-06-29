#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ENHMETAHEADER3.ahk" { ENHMETAHEADER3 }
#Import "..\Gdi\METAHEADER.ahk" { METAHEADER }
#Import "..\..\Foundation\RECTL.ahk" { RECTL }
#Import ".\MetafileType.ahk" { MetafileType }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct MetafileHeader {
    #StructPack 4

    Type : MetafileType

    Size : UInt32

    Version : UInt32

    EmfPlusFlags : UInt32

    DpiX : Float32

    DpiY : Float32

    X : Int32

    Y : Int32

    Width : Int32

    Height : Int32

    WmfHeader : METAHEADER

    EmfPlusHeaderSize : Int32

    LogicalDpiX : Int32

    LogicalDpiY : Int32

    static __New() {
        DefineProp(this.Prototype, 'EmfHeader', { type: ENHMETAHEADER3, offset: 40 })
        this.DeleteProp("__New")
    }
}
