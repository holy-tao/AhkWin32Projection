#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\IEnumPrivacyRecords.ahk" { IEnumPrivacyRecords }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */

;@region Functions
/**
 * 
 * @param {HWND} hwndOwner 
 * @param {PWSTR} pszUrl 
 * @param {IEnumPrivacyRecords} pPrivacyEnum 
 * @param {BOOL} fReportAllSites 
 * @returns {HRESULT} 
 */
export DoPrivacyDlg(hwndOwner, pszUrl, pPrivacyEnum, fReportAllSites) {
    pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl

    result := DllCall("SHDOCVW.dll\DoPrivacyDlg", HWND, hwndOwner, "ptr", pszUrl, "ptr", pPrivacyEnum, BOOL, fReportAllSites, "HRESULT")
    return result
}

;@endregion Functions
