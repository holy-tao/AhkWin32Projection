#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\LRESULT.ahk" { LRESULT }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct SETRESULT_INFO {
    #StructPack 8

    cbSize : UInt16 := this.Size

    wReserved : UInt16

    hSetResult : HANDLE

    Result : LRESULT

}
