#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct CODEBASEHOLD {
    #StructPack 8

    cbSize : UInt32 := this.Size

    szDistUnit : PWSTR

    szCodeBase : PWSTR

    dwVersionMS : UInt32

    dwVersionLS : UInt32

    dwStyle : UInt32

}
