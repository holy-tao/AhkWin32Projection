#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\WER_SUBMIT_RESULT.ahk" { WER_SUBMIT_RESULT }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.ErrorReporting
 */
export default struct WER_REPORT_INFORMATION_V5 {
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

    rgbApplicationIdentity : Int8[16]

    hSnapshot : HANDLE

    hDeleteFilesImpersonationToken : HANDLE

    submitResultMax : WER_SUBMIT_RESULT

}
