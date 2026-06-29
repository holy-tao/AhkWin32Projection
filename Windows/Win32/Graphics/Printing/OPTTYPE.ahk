#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\OPTPARAM.ahk" { OPTPARAM }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct OPTTYPE {
    #StructPack 8

    cbSize : UInt16 := this.Size

    Type : Int8

    Flags : Int8

    Count : UInt16

    BegCtrlID : UInt16

    pOptParam : OPTPARAM.Ptr

    Style : UInt16

    wReserved : UInt16[3]

    dwReserved : IntPtr[3]

}
