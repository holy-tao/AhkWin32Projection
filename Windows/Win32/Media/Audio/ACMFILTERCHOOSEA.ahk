#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }
#Import ".\WAVEFILTER.ahk" { WAVEFILTER }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Media.Audio
 * @charset ANSI
 */
export default struct ACMFILTERCHOOSEA {
    #StructPack 8

    cbStruct : UInt32

    fdwStyle : UInt32

    hwndOwner : HWND

    pwfltr : WAVEFILTER.Ptr

    cbwfltr : UInt32

    pszTitle : PSTR

    szFilterTag : CHAR[48]

    szFilter : CHAR[128]

    pszName : PSTR

    cchName : UInt32

    fdwEnum : UInt32

    pwfltrEnum : WAVEFILTER.Ptr

    hInstance : HINSTANCE

    pszTemplateName : PSTR

    lCustData : LPARAM

    pfnHook : IntPtr

}
