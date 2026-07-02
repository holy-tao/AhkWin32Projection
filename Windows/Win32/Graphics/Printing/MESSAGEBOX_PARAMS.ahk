#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct MESSAGEBOX_PARAMS {
    #StructPack 8

    cbSize : UInt32 := this.Size

    pTitle : PWSTR

    pMessage : PWSTR

    Style : UInt32

    dwTimeout : UInt32

    bWait : BOOL

}
