#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\OEMUIPROCS.ahk" { OEMUIPROCS }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct OEMUIOBJ {
    #StructPack 8

    cbSize : UInt32 := this.Size

    pOemUIProcs : OEMUIPROCS.Ptr

}
