#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }
#Import ".\WAVEFILTER.ahk" { WAVEFILTER }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Media.Audio
 * @charset Unicode
 */
export default struct ACMFILTERCHOOSEW {
    #StructPack 8

    cbStruct : UInt32

    fdwStyle : UInt32

    hwndOwner : HWND

    pwfltr : WAVEFILTER.Ptr

    cbwfltr : UInt32

    pszTitle : PWSTR

    szFilterTag : WCHAR[48]

    szFilter : WCHAR[128]

    pszName : PWSTR

    cchName : UInt32

    fdwEnum : UInt32

    pwfltrEnum : WAVEFILTER.Ptr

    hInstance : HINSTANCE

    pszTemplateName : PWSTR

    lCustData : LPARAM

    pfnHook : IntPtr

}
