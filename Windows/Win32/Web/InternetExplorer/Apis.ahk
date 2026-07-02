#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\System\Threading\PROCESS_INFORMATION.ahk" { PROCESS_INFORMATION }
#Import "..\..\Graphics\Gdi\RGBQUAD.ahk" { RGBQUAD }
#Import "..\..\Storage\FileSystem\GET_FILEEX_INFO_LEVELS.ahk" { GET_FILEEX_INFO_LEVELS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\Graphics\DirectDraw\IDirectDrawSurface.ahk" { IDirectDrawSurface }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Security\SECURITY_ATTRIBUTES.ahk" { SECURITY_ATTRIBUTES }
#Import ".\IMapMIMEToCLSID.ahk" { IMapMIMEToCLSID }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Graphics\Gdi\HBITMAP.ahk" { HBITMAP }
#Import "..\..\Storage\FileSystem\WIN32_FIND_DATAA.ahk" { WIN32_FIND_DATAA }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */

;@region Functions
/**
 * 
 * @param {Integer} dwTabThreadID 
 * @param {Integer} dwAssociatedThreadID 
 * @returns {HRESULT} 
 */
export IEAssociateThreadWithTab(dwTabThreadID, dwAssociatedThreadID) {
    result := DllCall("Ieframe.dll\IEAssociateThreadWithTab", UInt32, dwTabThreadID, UInt32, dwAssociatedThreadID, "HRESULT")
    return result
}

/**
 * 
 * @param {Integer} dwTabThreadID 
 * @param {Integer} dwAssociatedThreadID 
 * @returns {HRESULT} 
 */
export IEDisassociateThreadWithTab(dwTabThreadID, dwAssociatedThreadID) {
    result := DllCall("Ieframe.dll\IEDisassociateThreadWithTab", UInt32, dwTabThreadID, UInt32, dwAssociatedThreadID, "HRESULT")
    return result
}

/**
 * 
 * @returns {BOOL} 
 */
export IEIsInPrivateBrowsing() {
    result := DllCall("Ieframe.dll\IEIsInPrivateBrowsing", BOOL)
    return result
}

/**
 * 
 * @returns {BOOL} 
 */
export IEInPrivateFilteringEnabled() {
    result := DllCall("Ieframe.dll\IEInPrivateFilteringEnabled", BOOL)
    return result
}

/**
 * 
 * @returns {BOOL} 
 */
export IETrackingProtectionEnabled() {
    result := DllCall("Ieframe.dll\IETrackingProtectionEnabled", BOOL)
    return result
}

/**
 * 
 * @param {HANDLE} hState 
 * @param {PWSTR} lpwstrSourceFile 
 * @returns {HRESULT} 
 */
export IESaveFile(hState, lpwstrSourceFile) {
    lpwstrSourceFile := lpwstrSourceFile is String ? StrPtr(lpwstrSourceFile) : lpwstrSourceFile

    result := DllCall("Ieframe.dll\IESaveFile", HANDLE, hState, "ptr", lpwstrSourceFile, "HRESULT")
    return result
}

/**
 * 
 * @param {HANDLE} hState 
 * @returns {HRESULT} 
 */
export IECancelSaveFile(hState) {
    result := DllCall("Ieframe.dll\IECancelSaveFile", HANDLE, hState, "HRESULT")
    return result
}

/**
 * 
 * @param {HWND} _hwnd 
 * @param {PWSTR} lpwstrInitialFileName 
 * @param {PWSTR} lpwstrInitialDir 
 * @param {PWSTR} lpwstrFilter 
 * @param {PWSTR} lpwstrDefExt 
 * @param {Integer} dwFilterIndex 
 * @param {Integer} dwFlags 
 * @param {Pointer<PWSTR>} lppwstrDestinationFilePath 
 * @param {Pointer<HANDLE>} phState 
 * @returns {HRESULT} 
 */
export IEShowSaveFileDialog(_hwnd, lpwstrInitialFileName, lpwstrInitialDir, lpwstrFilter, lpwstrDefExt, dwFilterIndex, dwFlags, lppwstrDestinationFilePath, phState) {
    lpwstrInitialFileName := lpwstrInitialFileName is String ? StrPtr(lpwstrInitialFileName) : lpwstrInitialFileName
    lpwstrInitialDir := lpwstrInitialDir is String ? StrPtr(lpwstrInitialDir) : lpwstrInitialDir
    lpwstrFilter := lpwstrFilter is String ? StrPtr(lpwstrFilter) : lpwstrFilter
    lpwstrDefExt := lpwstrDefExt is String ? StrPtr(lpwstrDefExt) : lpwstrDefExt

    lppwstrDestinationFilePathMarshal := lppwstrDestinationFilePath is VarRef ? "ptr*" : "ptr"

    result := DllCall("Ieframe.dll\IEShowSaveFileDialog", HWND, _hwnd, "ptr", lpwstrInitialFileName, "ptr", lpwstrInitialDir, "ptr", lpwstrFilter, "ptr", lpwstrDefExt, UInt32, dwFilterIndex, UInt32, dwFlags, lppwstrDestinationFilePathMarshal, lppwstrDestinationFilePath, HANDLE.Ptr, phState, "HRESULT")
    return result
}

/**
 * 
 * @param {HWND} _hwnd 
 * @param {PWSTR} lpwstrFileName 
 * @param {Integer} cchMaxFileName 
 * @param {PWSTR} lpwstrInitialDir 
 * @param {PWSTR} lpwstrFilter 
 * @param {PWSTR} lpwstrDefExt 
 * @param {Integer} dwFilterIndex 
 * @param {Integer} dwFlags 
 * @returns {HANDLE} 
 */
export IEShowOpenFileDialog(_hwnd, lpwstrFileName, cchMaxFileName, lpwstrInitialDir, lpwstrFilter, lpwstrDefExt, dwFilterIndex, dwFlags) {
    lpwstrFileName := lpwstrFileName is String ? StrPtr(lpwstrFileName) : lpwstrFileName
    lpwstrInitialDir := lpwstrInitialDir is String ? StrPtr(lpwstrInitialDir) : lpwstrInitialDir
    lpwstrFilter := lpwstrFilter is String ? StrPtr(lpwstrFilter) : lpwstrFilter
    lpwstrDefExt := lpwstrDefExt is String ? StrPtr(lpwstrDefExt) : lpwstrDefExt

    phFile := HANDLE.Owned()
    result := DllCall("Ieframe.dll\IEShowOpenFileDialog", HWND, _hwnd, "ptr", lpwstrFileName, UInt32, cchMaxFileName, "ptr", lpwstrInitialDir, "ptr", lpwstrFilter, "ptr", lpwstrDefExt, UInt32, dwFilterIndex, UInt32, dwFlags, HANDLE.Ptr, phFile, "HRESULT")
    return phFile
}

/**
 * 
 * @returns {HKEY} 
 */
export IEGetWriteableLowHKCU() {
    pHKey := HKEY.Owned()
    result := DllCall("Ieframe.dll\IEGetWriteableLowHKCU", HKEY.Ptr, pHKey, "HRESULT")
    return pHKey
}

/**
 * 
 * @param {Pointer<Guid>} clsidFolderID 
 * @returns {PWSTR} 
 */
export IEGetWriteableFolderPath(clsidFolderID) {
    result := DllCall("Ieframe.dll\IEGetWriteableFolderPath", Guid.Ptr, clsidFolderID, PWSTR.Ptr, &lppwstrPath := 0, "HRESULT")
    return lppwstrPath
}

/**
 * 
 * @returns {BOOL} 
 */
export IEIsProtectedModeProcess() {
    result := DllCall("Ieframe.dll\IEIsProtectedModeProcess", BOOL.Ptr, &pbResult := 0, "HRESULT")
    return pbResult
}

/**
 * 
 * @param {PWSTR} lpwstrUrl 
 * @returns {HRESULT} 
 */
export IEIsProtectedModeURL(lpwstrUrl) {
    lpwstrUrl := lpwstrUrl is String ? StrPtr(lpwstrUrl) : lpwstrUrl

    result := DllCall("Ieframe.dll\IEIsProtectedModeURL", "ptr", lpwstrUrl, "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} lpwstrUrl 
 * @param {Pointer<PROCESS_INFORMATION>} lpProcInfo 
 * @param {Pointer<Void>} lpInfo 
 * @returns {HRESULT} 
 */
export IELaunchURL(lpwstrUrl, lpProcInfo, lpInfo) {
    lpwstrUrl := lpwstrUrl is String ? StrPtr(lpwstrUrl) : lpwstrUrl

    lpInfoMarshal := lpInfo is VarRef ? "ptr" : "ptr"

    result := DllCall("Ieframe.dll\IELaunchURL", "ptr", lpwstrUrl, PROCESS_INFORMATION.Ptr, lpProcInfo, lpInfoMarshal, lpInfo, "HRESULT")
    return result
}

/**
 * 
 * @returns {HRESULT} 
 */
export IERefreshElevationPolicy() {
    result := DllCall("Ieframe.dll\IERefreshElevationPolicy", "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} lpszURL 
 * @param {PWSTR} lpszCookieName 
 * @param {PWSTR} lpszCookieData 
 * @param {Pointer<Integer>} pcchCookieData 
 * @param {Integer} dwFlags 
 * @returns {HRESULT} 
 */
export IEGetProtectedModeCookie(lpszURL, lpszCookieName, lpszCookieData, pcchCookieData, dwFlags) {
    lpszURL := lpszURL is String ? StrPtr(lpszURL) : lpszURL
    lpszCookieName := lpszCookieName is String ? StrPtr(lpszCookieName) : lpszCookieName
    lpszCookieData := lpszCookieData is String ? StrPtr(lpszCookieData) : lpszCookieData

    pcchCookieDataMarshal := pcchCookieData is VarRef ? "uint*" : "ptr"

    result := DllCall("Ieframe.dll\IEGetProtectedModeCookie", "ptr", lpszURL, "ptr", lpszCookieName, "ptr", lpszCookieData, pcchCookieDataMarshal, pcchCookieData, UInt32, dwFlags, "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} lpszURL 
 * @param {PWSTR} lpszCookieName 
 * @param {PWSTR} lpszCookieData 
 * @param {Integer} dwFlags 
 * @returns {HRESULT} 
 */
export IESetProtectedModeCookie(lpszURL, lpszCookieName, lpszCookieData, dwFlags) {
    lpszURL := lpszURL is String ? StrPtr(lpszURL) : lpszURL
    lpszCookieName := lpszCookieName is String ? StrPtr(lpszCookieName) : lpszCookieName
    lpszCookieData := lpszCookieData is String ? StrPtr(lpszCookieData) : lpszCookieData

    result := DllCall("Ieframe.dll\IESetProtectedModeCookie", "ptr", lpszURL, "ptr", lpszCookieName, "ptr", lpszCookieData, UInt32, dwFlags, "HRESULT")
    return result
}

/**
 * 
 * @param {Guid} guid 
 * @param {PWSTR} lpSubkey 
 * @param {BOOL} fSubkeyAllowed 
 * @returns {HRESULT} 
 */
export IERegisterWritableRegistryKey(guid, lpSubkey, fSubkeyAllowed) {
    lpSubkey := lpSubkey is String ? StrPtr(lpSubkey) : lpSubkey

    result := DllCall("Ieframe.dll\IERegisterWritableRegistryKey", Guid, guid, "ptr", lpSubkey, BOOL, fSubkeyAllowed, "HRESULT")
    return result
}

/**
 * 
 * @param {Guid} guid 
 * @param {PWSTR} lpPath 
 * @param {PWSTR} lpValueName 
 * @param {Integer} dwType 
 * @param {Integer} lpData 
 * @param {Integer} cbMaxData 
 * @returns {HRESULT} 
 */
export IERegisterWritableRegistryValue(guid, lpPath, lpValueName, dwType, lpData, cbMaxData) {
    lpPath := lpPath is String ? StrPtr(lpPath) : lpPath
    lpValueName := lpValueName is String ? StrPtr(lpValueName) : lpValueName

    result := DllCall("Ieframe.dll\IERegisterWritableRegistryValue", Guid, guid, "ptr", lpPath, "ptr", lpValueName, UInt32, dwType, IntPtr, lpData, UInt32, cbMaxData, "HRESULT")
    return result
}

/**
 * 
 * @param {Guid} guid 
 * @returns {HRESULT} 
 */
export IEUnregisterWritableRegistry(guid) {
    result := DllCall("Ieframe.dll\IEUnregisterWritableRegistry", Guid, guid, "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} lpSubKey 
 * @param {Integer} Reserved 
 * @param {PWSTR} lpClass 
 * @param {Integer} dwOptions 
 * @param {Integer} samDesired 
 * @param {Pointer<SECURITY_ATTRIBUTES>} lpSecurityAttributes 
 * @param {Pointer<HKEY>} phkResult 
 * @param {Pointer<Integer>} lpdwDisposition 
 * @returns {HRESULT} 
 */
export IERegCreateKeyEx(lpSubKey, Reserved, lpClass, dwOptions, samDesired, lpSecurityAttributes, phkResult, lpdwDisposition) {
    lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey
    lpClass := lpClass is String ? StrPtr(lpClass) : lpClass

    lpdwDispositionMarshal := lpdwDisposition is VarRef ? "uint*" : "ptr"

    result := DllCall("Ieframe.dll\IERegCreateKeyEx", "ptr", lpSubKey, UInt32, Reserved, "ptr", lpClass, UInt32, dwOptions, UInt32, samDesired, SECURITY_ATTRIBUTES.Ptr, lpSecurityAttributes, HKEY.Ptr, phkResult, lpdwDispositionMarshal, lpdwDisposition, "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} lpSubKey 
 * @param {PWSTR} lpValueName 
 * @param {Integer} Reserved 
 * @param {Integer} dwType 
 * @param {Integer} lpData 
 * @param {Integer} cbData 
 * @returns {HRESULT} 
 */
export IERegSetValueEx(lpSubKey, lpValueName, Reserved, dwType, lpData, cbData) {
    lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey
    lpValueName := lpValueName is String ? StrPtr(lpValueName) : lpValueName

    result := DllCall("Ieframe.dll\IERegSetValueEx", "ptr", lpSubKey, "ptr", lpValueName, UInt32, Reserved, UInt32, dwType, IntPtr, lpData, UInt32, cbData, "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} lpFileName 
 * @param {Integer} dwDesiredAccess 
 * @param {Integer} dwShareMode 
 * @param {Pointer<SECURITY_ATTRIBUTES>} lpSecurityAttributes 
 * @param {Integer} dwCreationDisposition 
 * @param {Integer} dwFlagsAndAttributes 
 * @param {HANDLE} hTemplateFile 
 * @returns {HANDLE} 
 */
export IECreateFile(lpFileName, dwDesiredAccess, dwShareMode, lpSecurityAttributes, dwCreationDisposition, dwFlagsAndAttributes, hTemplateFile) {
    lpFileName := lpFileName is String ? StrPtr(lpFileName) : lpFileName

    result := DllCall("Ieframe.dll\IECreateFile", "ptr", lpFileName, UInt32, dwDesiredAccess, UInt32, dwShareMode, SECURITY_ATTRIBUTES.Ptr, lpSecurityAttributes, UInt32, dwCreationDisposition, UInt32, dwFlagsAndAttributes, HANDLE, hTemplateFile, HANDLE.Owned)
    return result
}

/**
 * 
 * @param {PWSTR} lpFileName 
 * @returns {BOOL} 
 */
export IEDeleteFile(lpFileName) {
    lpFileName := lpFileName is String ? StrPtr(lpFileName) : lpFileName

    result := DllCall("Ieframe.dll\IEDeleteFile", "ptr", lpFileName, BOOL)
    return result
}

/**
 * 
 * @param {PWSTR} lpPathName 
 * @returns {BOOL} 
 */
export IERemoveDirectory(lpPathName) {
    lpPathName := lpPathName is String ? StrPtr(lpPathName) : lpPathName

    result := DllCall("Ieframe.dll\IERemoveDirectory", "ptr", lpPathName, BOOL)
    return result
}

/**
 * 
 * @param {PWSTR} lpExistingFileName 
 * @param {PWSTR} lpNewFileName 
 * @param {Integer} dwFlags 
 * @returns {BOOL} 
 */
export IEMoveFileEx(lpExistingFileName, lpNewFileName, dwFlags) {
    lpExistingFileName := lpExistingFileName is String ? StrPtr(lpExistingFileName) : lpExistingFileName
    lpNewFileName := lpNewFileName is String ? StrPtr(lpNewFileName) : lpNewFileName

    result := DllCall("Ieframe.dll\IEMoveFileEx", "ptr", lpExistingFileName, "ptr", lpNewFileName, UInt32, dwFlags, BOOL)
    return result
}

/**
 * 
 * @param {PWSTR} lpPathName 
 * @param {Pointer<SECURITY_ATTRIBUTES>} lpSecurityAttributes 
 * @returns {BOOL} 
 */
export IECreateDirectory(lpPathName, lpSecurityAttributes) {
    lpPathName := lpPathName is String ? StrPtr(lpPathName) : lpPathName

    result := DllCall("Ieframe.dll\IECreateDirectory", "ptr", lpPathName, SECURITY_ATTRIBUTES.Ptr, lpSecurityAttributes, BOOL)
    return result
}

/**
 * 
 * @param {PWSTR} lpFileName 
 * @param {GET_FILEEX_INFO_LEVELS} fInfoLevelId 
 * @param {Pointer<Void>} lpFileInformation 
 * @returns {BOOL} 
 */
export IEGetFileAttributesEx(lpFileName, fInfoLevelId, lpFileInformation) {
    lpFileName := lpFileName is String ? StrPtr(lpFileName) : lpFileName

    lpFileInformationMarshal := lpFileInformation is VarRef ? "ptr" : "ptr"

    result := DllCall("Ieframe.dll\IEGetFileAttributesEx", "ptr", lpFileName, GET_FILEEX_INFO_LEVELS, fInfoLevelId, lpFileInformationMarshal, lpFileInformation, BOOL)
    return result
}

/**
 * 
 * @param {PWSTR} lpFileName 
 * @param {Pointer<WIN32_FIND_DATAA>} lpFindFileData 
 * @returns {HANDLE} 
 */
export IEFindFirstFile(lpFileName, lpFindFileData) {
    lpFileName := lpFileName is String ? StrPtr(lpFileName) : lpFileName

    result := DllCall("Ieframe.dll\IEFindFirstFile", "ptr", lpFileName, WIN32_FIND_DATAA.Ptr, lpFindFileData, HANDLE.Owned)
    return result
}

/**
 * 
 * @param {HWND} hwndParent 
 * @param {PSTR} pszUsername 
 * @param {BOOL} fEnable 
 * @returns {HRESULT} 
 */
export RatingEnable(hwndParent, pszUsername, fEnable) {
    pszUsername := pszUsername is String ? StrPtr(pszUsername) : pszUsername

    result := DllCall("MSRATING.dll\RatingEnable", HWND, hwndParent, "ptr", pszUsername, BOOL, fEnable, "HRESULT")
    return result
}

/**
 * 
 * @param {HWND} hwndParent 
 * @param {PWSTR} pszUsername 
 * @param {BOOL} fEnable 
 * @returns {HRESULT} 
 */
export RatingEnableW(hwndParent, pszUsername, fEnable) {
    pszUsername := pszUsername is String ? StrPtr(pszUsername) : pszUsername

    result := DllCall("MSRATING.dll\RatingEnableW", HWND, hwndParent, "ptr", pszUsername, BOOL, fEnable, "HRESULT")
    return result
}

/**
 * 
 * @param {PSTR} pszUsername 
 * @param {PSTR} pszURL 
 * @param {PSTR} pszRatingInfo 
 * @param {Integer} pData 
 * @param {Integer} cbData 
 * @returns {Pointer<Void>} 
 */
export RatingCheckUserAccess(pszUsername, pszURL, pszRatingInfo, pData, cbData) {
    pszUsername := pszUsername is String ? StrPtr(pszUsername) : pszUsername
    pszURL := pszURL is String ? StrPtr(pszURL) : pszURL
    pszRatingInfo := pszRatingInfo is String ? StrPtr(pszRatingInfo) : pszRatingInfo

    result := DllCall("MSRATING.dll\RatingCheckUserAccess", "ptr", pszUsername, "ptr", pszURL, "ptr", pszRatingInfo, IntPtr, pData, UInt32, cbData, "ptr*", &ppRatingDetails := 0, "HRESULT")
    return ppRatingDetails
}

/**
 * 
 * @param {PWSTR} pszUsername 
 * @param {PWSTR} pszURL 
 * @param {PWSTR} pszRatingInfo 
 * @param {Integer} pData 
 * @param {Integer} cbData 
 * @returns {Pointer<Void>} 
 */
export RatingCheckUserAccessW(pszUsername, pszURL, pszRatingInfo, pData, cbData) {
    pszUsername := pszUsername is String ? StrPtr(pszUsername) : pszUsername
    pszURL := pszURL is String ? StrPtr(pszURL) : pszURL
    pszRatingInfo := pszRatingInfo is String ? StrPtr(pszRatingInfo) : pszRatingInfo

    result := DllCall("MSRATING.dll\RatingCheckUserAccessW", "ptr", pszUsername, "ptr", pszURL, "ptr", pszRatingInfo, IntPtr, pData, UInt32, cbData, "ptr*", &ppRatingDetails := 0, "HRESULT")
    return ppRatingDetails
}

/**
 * 
 * @param {HWND} hDlg 
 * @param {PSTR} pszUsername 
 * @param {PSTR} pszContentDescription 
 * @returns {Void} 
 */
export RatingAccessDeniedDialog(hDlg, pszUsername, pszContentDescription) {
    pszUsername := pszUsername is String ? StrPtr(pszUsername) : pszUsername
    pszContentDescription := pszContentDescription is String ? StrPtr(pszContentDescription) : pszContentDescription

    result := DllCall("MSRATING.dll\RatingAccessDeniedDialog", HWND, hDlg, "ptr", pszUsername, "ptr", pszContentDescription, "ptr", &pRatingDetails := 0, "HRESULT")
    return pRatingDetails
}

/**
 * 
 * @param {HWND} hDlg 
 * @param {PWSTR} pszUsername 
 * @param {PWSTR} pszContentDescription 
 * @returns {Void} 
 */
export RatingAccessDeniedDialogW(hDlg, pszUsername, pszContentDescription) {
    pszUsername := pszUsername is String ? StrPtr(pszUsername) : pszUsername
    pszContentDescription := pszContentDescription is String ? StrPtr(pszContentDescription) : pszContentDescription

    result := DllCall("MSRATING.dll\RatingAccessDeniedDialogW", HWND, hDlg, "ptr", pszUsername, "ptr", pszContentDescription, "ptr", &pRatingDetails := 0, "HRESULT")
    return pRatingDetails
}

/**
 * 
 * @param {HWND} hDlg 
 * @param {PSTR} pszUsername 
 * @returns {Void} 
 */
export RatingAccessDeniedDialog2(hDlg, pszUsername) {
    pszUsername := pszUsername is String ? StrPtr(pszUsername) : pszUsername

    result := DllCall("MSRATING.dll\RatingAccessDeniedDialog2", HWND, hDlg, "ptr", pszUsername, "ptr", &pRatingDetails := 0, "HRESULT")
    return pRatingDetails
}

/**
 * 
 * @param {HWND} hDlg 
 * @param {PWSTR} pszUsername 
 * @returns {Void} 
 */
export RatingAccessDeniedDialog2W(hDlg, pszUsername) {
    pszUsername := pszUsername is String ? StrPtr(pszUsername) : pszUsername

    result := DllCall("MSRATING.dll\RatingAccessDeniedDialog2W", HWND, hDlg, "ptr", pszUsername, "ptr", &pRatingDetails := 0, "HRESULT")
    return pRatingDetails
}

/**
 * 
 * @param {Pointer<Void>} pRatingDetails 
 * @returns {HRESULT} 
 */
export RatingFreeDetails(pRatingDetails) {
    pRatingDetailsMarshal := pRatingDetails is VarRef ? "ptr" : "ptr"

    result := DllCall("MSRATING.dll\RatingFreeDetails", pRatingDetailsMarshal, pRatingDetails, "HRESULT")
    return result
}

/**
 * 
 * @param {HANDLE} hRatingObtainQuery 
 * @returns {HRESULT} 
 */
export RatingObtainCancel(hRatingObtainQuery) {
    result := DllCall("MSRATING.dll\RatingObtainCancel", HANDLE, hRatingObtainQuery, "HRESULT")
    return result
}

/**
 * 
 * @param {PSTR} pszTargetUrl 
 * @param {Integer} dwUserData 
 * @param {Pointer} fCallback 
 * @returns {HANDLE} 
 */
export RatingObtainQuery(pszTargetUrl, dwUserData, fCallback) {
    pszTargetUrl := pszTargetUrl is String ? StrPtr(pszTargetUrl) : pszTargetUrl

    phRatingObtainQuery := HANDLE.Owned()
    result := DllCall("MSRATING.dll\RatingObtainQuery", "ptr", pszTargetUrl, UInt32, dwUserData, IntPtr, fCallback, HANDLE.Ptr, phRatingObtainQuery, "HRESULT")
    return phRatingObtainQuery
}

/**
 * 
 * @param {PWSTR} pszTargetUrl 
 * @param {Integer} dwUserData 
 * @param {Pointer} fCallback 
 * @returns {HANDLE} 
 */
export RatingObtainQueryW(pszTargetUrl, dwUserData, fCallback) {
    pszTargetUrl := pszTargetUrl is String ? StrPtr(pszTargetUrl) : pszTargetUrl

    phRatingObtainQuery := HANDLE.Owned()
    result := DllCall("MSRATING.dll\RatingObtainQueryW", "ptr", pszTargetUrl, UInt32, dwUserData, IntPtr, fCallback, HANDLE.Ptr, phRatingObtainQuery, "HRESULT")
    return phRatingObtainQuery
}

/**
 * 
 * @param {HWND} hDlg 
 * @param {PSTR} pszUsername 
 * @returns {HRESULT} 
 */
export RatingSetupUI(hDlg, pszUsername) {
    pszUsername := pszUsername is String ? StrPtr(pszUsername) : pszUsername

    result := DllCall("MSRATING.dll\RatingSetupUI", HWND, hDlg, "ptr", pszUsername, "HRESULT")
    return result
}

/**
 * 
 * @param {HWND} hDlg 
 * @param {PWSTR} pszUsername 
 * @returns {HRESULT} 
 */
export RatingSetupUIW(hDlg, pszUsername) {
    pszUsername := pszUsername is String ? StrPtr(pszUsername) : pszUsername

    result := DllCall("MSRATING.dll\RatingSetupUIW", HWND, hDlg, "ptr", pszUsername, "HRESULT")
    return result
}

/**
 * 
 * @param {HWND} hDlg 
 * @param {Integer} cbPasswordBlob 
 * @param {Integer} pbPasswordBlob 
 * @param {PWSTR} lpszUrl 
 * @param {BOOL} fAlwaysNever 
 * @param {BOOL} fSitePage 
 * @param {BOOL} fApprovedSitesEnforced 
 * @returns {HRESULT} 
 */
export RatingAddToApprovedSites(hDlg, cbPasswordBlob, pbPasswordBlob, lpszUrl, fAlwaysNever, fSitePage, fApprovedSitesEnforced) {
    lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl

    result := DllCall("MSRATING.dll\RatingAddToApprovedSites", HWND, hDlg, UInt32, cbPasswordBlob, IntPtr, pbPasswordBlob, "ptr", lpszUrl, BOOL, fAlwaysNever, BOOL, fSitePage, BOOL, fApprovedSitesEnforced, "HRESULT")
    return result
}

/**
 * 
 * @param {HWND} hWndOwner 
 * @param {HINSTANCE} param1 
 * @param {PSTR} lpszFileName 
 * @param {Integer} nShow 
 * @returns {HRESULT} 
 */
export RatingClickedOnPRFInternal(hWndOwner, param1, lpszFileName, nShow) {
    lpszFileName := lpszFileName is String ? StrPtr(lpszFileName) : lpszFileName

    result := DllCall("MSRATING.dll\RatingClickedOnPRFInternal", HWND, hWndOwner, HINSTANCE, param1, "ptr", lpszFileName, Int32, nShow, "HRESULT")
    return result
}

/**
 * 
 * @param {HWND} hWndOwner 
 * @param {HINSTANCE} param1 
 * @param {PSTR} lpszFileName 
 * @param {Integer} nShow 
 * @returns {HRESULT} 
 */
export RatingClickedOnRATInternal(hWndOwner, param1, lpszFileName, nShow) {
    lpszFileName := lpszFileName is String ? StrPtr(lpszFileName) : lpszFileName

    result := DllCall("MSRATING.dll\RatingClickedOnRATInternal", HWND, hWndOwner, HINSTANCE, param1, "ptr", lpszFileName, Int32, nShow, "HRESULT")
    return result
}

/**
 * 
 * @returns {HRESULT} 
 */
export RatingEnabledQuery() {
    result := DllCall("MSRATING.dll\RatingEnabledQuery", "HRESULT")
    return result
}

/**
 * 
 * @returns {HRESULT} 
 */
export RatingInit() {
    result := DllCall("MSRATING.dll\RatingInit", "HRESULT")
    return result
}

/**
 * 
 * @returns {IMapMIMEToCLSID} 
 */
export CreateMIMEMap() {
    result := DllCall("ImgUtil.dll\CreateMIMEMap", "ptr*", &ppMap := 0, "HRESULT")
    return IMapMIMEToCLSID(ppMap)
}

/**
 * 
 * @param {IStream} pStream 
 * @param {IMapMIMEToCLSID} pMap 
 * @param {IUnknown} pEventSink 
 * @returns {HRESULT} 
 */
export DecodeImage(pStream, pMap, pEventSink) {
    result := DllCall("ImgUtil.dll\DecodeImage", "ptr", pStream, "ptr", pMap, "ptr", pEventSink, "HRESULT")
    return result
}

/**
 * 
 * @param {IStream} pInStream 
 * @param {Pointer<Integer>} pnFormat 
 * @returns {IStream} 
 */
export SniffStream(pInStream, pnFormat) {
    pnFormatMarshal := pnFormat is VarRef ? "uint*" : "ptr"

    result := DllCall("ImgUtil.dll\SniffStream", "ptr", pInStream, pnFormatMarshal, pnFormat, "ptr*", &ppOutStream := 0, "HRESULT")
    return IStream(ppOutStream)
}

/**
 * 
 * @param {Pointer<Integer>} pnMaxBytes 
 * @returns {HRESULT} 
 */
export GetMaxMIMEIDBytes(pnMaxBytes) {
    pnMaxBytesMarshal := pnMaxBytes is VarRef ? "uint*" : "ptr"

    result := DllCall("ImgUtil.dll\GetMaxMIMEIDBytes", pnMaxBytesMarshal, pnMaxBytes, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<Integer>} pbBytes 
 * @param {Integer} nBytes 
 * @param {Pointer<Integer>} pnFormat 
 * @returns {HRESULT} 
 */
export IdentifyMIMEType(pbBytes, nBytes, pnFormat) {
    pbBytesMarshal := pbBytes is VarRef ? "char*" : "ptr"
    pnFormatMarshal := pnFormat is VarRef ? "uint*" : "ptr"

    result := DllCall("ImgUtil.dll\IdentifyMIMEType", pbBytesMarshal, pbBytes, UInt32, nBytes, pnFormatMarshal, pnFormat, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<RGBQUAD>} pRGBColors 
 * @param {Integer} nColors 
 * @param {Pointer<Integer>} pInvTable 
 * @param {Integer} cbTable 
 * @returns {HRESULT} 
 */
export ComputeInvCMAP(pRGBColors, nColors, pInvTable, cbTable) {
    pInvTableMarshal := pInvTable is VarRef ? "char*" : "ptr"

    result := DllCall("ImgUtil.dll\ComputeInvCMAP", RGBQUAD.Ptr, pRGBColors, UInt32, nColors, pInvTableMarshal, pInvTable, UInt32, cbTable, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<Integer>} pDestBits 
 * @param {Integer} nDestPitch 
 * @param {Pointer<Integer>} pSrcBits 
 * @param {Integer} nSrcPitch 
 * @param {Pointer<Guid>} bfidSrc 
 * @param {Pointer<RGBQUAD>} prgbDestColors 
 * @param {Pointer<RGBQUAD>} prgbSrcColors 
 * @param {Pointer<Integer>} pbDestInvMap 
 * @param {Integer} x 
 * @param {Integer} y 
 * @param {Integer} cx 
 * @param {Integer} _cy 
 * @param {Integer} lDestTrans 
 * @param {Integer} lSrcTrans 
 * @returns {HRESULT} 
 */
export DitherTo8(pDestBits, nDestPitch, pSrcBits, nSrcPitch, bfidSrc, prgbDestColors, prgbSrcColors, pbDestInvMap, x, y, cx, _cy, lDestTrans, lSrcTrans) {
    pDestBitsMarshal := pDestBits is VarRef ? "char*" : "ptr"
    pSrcBitsMarshal := pSrcBits is VarRef ? "char*" : "ptr"
    pbDestInvMapMarshal := pbDestInvMap is VarRef ? "char*" : "ptr"

    result := DllCall("ImgUtil.dll\DitherTo8", pDestBitsMarshal, pDestBits, Int32, nDestPitch, pSrcBitsMarshal, pSrcBits, Int32, nSrcPitch, Guid.Ptr, bfidSrc, RGBQUAD.Ptr, prgbDestColors, RGBQUAD.Ptr, prgbSrcColors, pbDestInvMapMarshal, pbDestInvMap, Int32, x, Int32, y, Int32, cx, Int32, _cy, Int32, lDestTrans, Int32, lSrcTrans, "HRESULT")
    return result
}

/**
 * 
 * @param {HBITMAP} hbmDib 
 * @returns {IDirectDrawSurface} 
 */
export CreateDDrawSurfaceOnDIB(hbmDib) {
    result := DllCall("ImgUtil.dll\CreateDDrawSurfaceOnDIB", HBITMAP, hbmDib, "ptr*", &ppSurface := 0, "HRESULT")
    return IDirectDrawSurface(ppSurface)
}

/**
 * 
 * @param {IStream} pStream 
 * @param {IMapMIMEToCLSID} pMap 
 * @param {IUnknown} pEventSink 
 * @param {PWSTR} pszMIMETypeParam 
 * @returns {HRESULT} 
 */
export DecodeImageEx(pStream, pMap, pEventSink, pszMIMETypeParam) {
    pszMIMETypeParam := pszMIMETypeParam is String ? StrPtr(pszMIMETypeParam) : pszMIMETypeParam

    result := DllCall("ImgUtil.dll\DecodeImageEx", "ptr", pStream, "ptr", pMap, "ptr", pEventSink, "ptr", pszMIMETypeParam, "HRESULT")
    return result
}

;@endregion Functions
