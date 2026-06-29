#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.ErrorReporting
 */
export default struct WER_REPORT_INFORMATION_V3 {
    #StructPack 8

    dwSize : UInt32

    hProcess : HANDLE

    wzConsentKey : WCHAR[64]

    wzFriendlyEventName : WCHAR[128]

    wzApplicationName : WCHAR[128]

    wzApplicationPath : WCHAR[260]

    wzDescription : WCHAR[512]

    hwndParent : HWND

    wzNamespacePartner : WCHAR[64]

    wzNamespaceGroup : WCHAR[64]

}
