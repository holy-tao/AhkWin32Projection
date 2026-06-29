#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }
#Import ".\WAVEFORMATEX.ahk" { WAVEFORMATEX }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Media.Audio
 * @charset ANSI
 */
export default struct ACMFORMATCHOOSEA {
    #StructPack 8

    cbStruct : UInt32

    fdwStyle : UInt32

    hwndOwner : HWND

    pwfx : WAVEFORMATEX.Ptr

    cbwfx : UInt32

    pszTitle : PSTR

    szFormatTag : CHAR[48]

    szFormat : CHAR[128]

    pszName : PSTR

    cchName : UInt32

    fdwEnum : UInt32

    pwfxEnum : WAVEFORMATEX.Ptr

    hInstance : HINSTANCE

    pszTemplateName : PSTR

    lCustData : LPARAM

    pfnHook : IntPtr

}
