#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\OPTPARAM.ahk" { OPTPARAM }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct OPTCOMBO {
    #StructPack 8

    cbSize : UInt16 := this.Size

    Flags : Int8

    cListItem : UInt16

    pListItem : OPTPARAM.Ptr

    Sel : Int32

    dwReserved : UInt32[3]

}
