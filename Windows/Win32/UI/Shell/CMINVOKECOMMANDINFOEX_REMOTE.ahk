#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct CMINVOKECOMMANDINFOEX_REMOTE {
    #StructPack 8

    cbSize : UInt32 := this.Size

    fMask : UInt32

    hwnd : HWND

    lpVerbString : PSTR

    lpParameters : PSTR

    lpDirectory : PSTR

    nShow : Int32

    dwHotKey : UInt32

    lpTitle : PSTR

    lpVerbWString : PWSTR

    lpParametersW : PWSTR

    lpDirectoryW : PWSTR

    lpTitleW : PWSTR

    ptInvoke : POINT

    lpVerbInt : UInt32

    lpVerbWInt : UInt32

}
