#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }
#Import ".\WAVEFORMATEX.ahk" { WAVEFORMATEX }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Media.Audio
 * @charset Unicode
 */
export default struct ACMFORMATCHOOSEW {
    #StructPack 8

    cbStruct : UInt32

    fdwStyle : UInt32

    hwndOwner : HWND

    pwfx : WAVEFORMATEX.Ptr

    cbwfx : UInt32

    pszTitle : PWSTR

    szFormatTag : WCHAR[48]

    szFormat : WCHAR[128]

    pszName : PWSTR

    cchName : UInt32

    fdwEnum : UInt32

    pwfxEnum : WAVEFORMATEX.Ptr

    hInstance : HINSTANCE

    pszTemplateName : PWSTR

    lCustData : LPARAM

    pfnHook : IntPtr

}
