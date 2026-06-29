#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HOST_TYPE.ahk" { HOST_TYPE }
#Import ".\CLSID_RESOLUTION_FLAGS.ahk" { CLSID_RESOLUTION_FLAGS }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Threading\PROCESS_INFORMATION.ahk" { PROCESS_INFORMATION }
#Import "..\..\Foundation\HMODULE.ahk" { HMODULE }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */

;@region Functions
/**
 * 
 * @param {PWSTR} pbuffer 
 * @param {Integer} cchBuffer 
 * @param {Pointer<Integer>} dwLength 
 * @returns {HRESULT} 
 */
export GetCORSystemDirectory(pbuffer, cchBuffer, dwLength) {
    pbuffer := pbuffer is String ? StrPtr(pbuffer) : pbuffer

    dwLengthMarshal := dwLength is VarRef ? "uint*" : "ptr"

    result := DllCall("MSCorEE.dll\GetCORSystemDirectory", "ptr", pbuffer, "uint", cchBuffer, dwLengthMarshal, dwLength, "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} pbBuffer 
 * @param {Integer} cchBuffer 
 * @param {Pointer<Integer>} dwLength 
 * @returns {HRESULT} 
 */
export GetCORVersion(pbBuffer, cchBuffer, dwLength) {
    pbBuffer := pbBuffer is String ? StrPtr(pbBuffer) : pbBuffer

    dwLengthMarshal := dwLength is VarRef ? "uint*" : "ptr"

    result := DllCall("MSCorEE.dll\GetCORVersion", "ptr", pbBuffer, "uint", cchBuffer, dwLengthMarshal, dwLength, "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} szFilename 
 * @param {PWSTR} szBuffer 
 * @param {Integer} cchBuffer 
 * @param {Pointer<Integer>} dwLength 
 * @returns {HRESULT} 
 */
export GetFileVersion(szFilename, szBuffer, cchBuffer, dwLength) {
    szFilename := szFilename is String ? StrPtr(szFilename) : szFilename
    szBuffer := szBuffer is String ? StrPtr(szBuffer) : szBuffer

    dwLengthMarshal := dwLength is VarRef ? "uint*" : "ptr"

    result := DllCall("MSCorEE.dll\GetFileVersion", "ptr", szFilename, "ptr", szBuffer, "uint", cchBuffer, dwLengthMarshal, dwLength, "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} pbuffer 
 * @param {Integer} cchBuffer 
 * @param {Pointer<Integer>} dwLength 
 * @returns {HRESULT} 
 */
export GetCORRequiredVersion(pbuffer, cchBuffer, dwLength) {
    pbuffer := pbuffer is String ? StrPtr(pbuffer) : pbuffer

    dwLengthMarshal := dwLength is VarRef ? "uint*" : "ptr"

    result := DllCall("MSCorEE.dll\GetCORRequiredVersion", "ptr", pbuffer, "uint", cchBuffer, dwLengthMarshal, dwLength, "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} pExe 
 * @param {PWSTR} pwszVersion 
 * @param {PWSTR} pConfigurationFile 
 * @param {Integer} startupFlags 
 * @param {Integer} runtimeInfoFlags 
 * @param {PWSTR} pDirectory 
 * @param {Integer} dwDirectory 
 * @param {Pointer<Integer>} dwDirectoryLength 
 * @param {PWSTR} pVersion 
 * @param {Integer} cchBuffer 
 * @param {Pointer<Integer>} dwlength 
 * @returns {HRESULT} 
 */
export GetRequestedRuntimeInfo(pExe, pwszVersion, pConfigurationFile, startupFlags, runtimeInfoFlags, pDirectory, dwDirectory, dwDirectoryLength, pVersion, cchBuffer, dwlength) {
    pExe := pExe is String ? StrPtr(pExe) : pExe
    pwszVersion := pwszVersion is String ? StrPtr(pwszVersion) : pwszVersion
    pConfigurationFile := pConfigurationFile is String ? StrPtr(pConfigurationFile) : pConfigurationFile
    pDirectory := pDirectory is String ? StrPtr(pDirectory) : pDirectory
    pVersion := pVersion is String ? StrPtr(pVersion) : pVersion

    dwDirectoryLengthMarshal := dwDirectoryLength is VarRef ? "uint*" : "ptr"
    dwlengthMarshal := dwlength is VarRef ? "uint*" : "ptr"

    result := DllCall("MSCorEE.dll\GetRequestedRuntimeInfo", "ptr", pExe, "ptr", pwszVersion, "ptr", pConfigurationFile, "uint", startupFlags, "uint", runtimeInfoFlags, "ptr", pDirectory, "uint", dwDirectory, dwDirectoryLengthMarshal, dwDirectoryLength, "ptr", pVersion, "uint", cchBuffer, dwlengthMarshal, dwlength, "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} pExe 
 * @param {PWSTR} pVersion 
 * @param {Integer} cchBuffer 
 * @returns {Integer} 
 */
export GetRequestedRuntimeVersion(pExe, pVersion, cchBuffer) {
    pExe := pExe is String ? StrPtr(pExe) : pExe
    pVersion := pVersion is String ? StrPtr(pVersion) : pVersion

    result := DllCall("MSCorEE.dll\GetRequestedRuntimeVersion", "ptr", pExe, "ptr", pVersion, "uint", cchBuffer, "uint*", &dwLength := 0, "HRESULT")
    return dwLength
}

/**
 * 
 * @param {PWSTR} pwszVersion 
 * @param {PWSTR} pwszBuildFlavor 
 * @param {PWSTR} pwszHostConfigFile 
 * @param {Pointer<Void>} pReserved 
 * @param {Integer} startupFlags 
 * @param {Pointer<Guid>} rclsid 
 * @param {Pointer<Guid>} riid 
 * @param {Pointer<Pointer<Void>>} ppv 
 * @returns {HRESULT} 
 */
export CorBindToRuntimeHost(pwszVersion, pwszBuildFlavor, pwszHostConfigFile, pReserved, startupFlags, rclsid, riid, ppv) {
    pwszVersion := pwszVersion is String ? StrPtr(pwszVersion) : pwszVersion
    pwszBuildFlavor := pwszBuildFlavor is String ? StrPtr(pwszBuildFlavor) : pwszBuildFlavor
    pwszHostConfigFile := pwszHostConfigFile is String ? StrPtr(pwszHostConfigFile) : pwszHostConfigFile

    pReservedMarshal := pReserved is VarRef ? "ptr" : "ptr"
    ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSCorEE.dll\CorBindToRuntimeHost", "ptr", pwszVersion, "ptr", pwszBuildFlavor, "ptr", pwszHostConfigFile, pReservedMarshal, pReserved, "uint", startupFlags, Guid.Ptr, rclsid, Guid.Ptr, riid, ppvMarshal, ppv, "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} pwszVersion 
 * @param {PWSTR} pwszBuildFlavor 
 * @param {Integer} startupFlags 
 * @param {Pointer<Guid>} rclsid 
 * @param {Pointer<Guid>} riid 
 * @param {Pointer<Pointer<Void>>} ppv 
 * @returns {HRESULT} 
 */
export CorBindToRuntimeEx(pwszVersion, pwszBuildFlavor, startupFlags, rclsid, riid, ppv) {
    pwszVersion := pwszVersion is String ? StrPtr(pwszVersion) : pwszVersion
    pwszBuildFlavor := pwszBuildFlavor is String ? StrPtr(pwszBuildFlavor) : pwszBuildFlavor

    ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSCorEE.dll\CorBindToRuntimeEx", "ptr", pwszVersion, "ptr", pwszBuildFlavor, "uint", startupFlags, Guid.Ptr, rclsid, Guid.Ptr, riid, ppvMarshal, ppv, "HRESULT")
    return result
}

/**
 * 
 * @param {IStream} pCfgStream 
 * @param {Integer} reserved 
 * @param {Integer} startupFlags 
 * @param {Pointer<Guid>} rclsid 
 * @param {Pointer<Guid>} riid 
 * @param {Pointer<Pointer<Void>>} ppv 
 * @returns {HRESULT} 
 */
export CorBindToRuntimeByCfg(pCfgStream, reserved, startupFlags, rclsid, riid, ppv) {
    ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSCorEE.dll\CorBindToRuntimeByCfg", "ptr", pCfgStream, "uint", reserved, "uint", startupFlags, Guid.Ptr, rclsid, Guid.Ptr, riid, ppvMarshal, ppv, "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} pwszVersion 
 * @param {PWSTR} pwszBuildFlavor 
 * @param {Pointer<Guid>} rclsid 
 * @param {Pointer<Guid>} riid 
 * @param {Pointer<Pointer<Void>>} ppv 
 * @returns {HRESULT} 
 */
export CorBindToRuntime(pwszVersion, pwszBuildFlavor, rclsid, riid, ppv) {
    pwszVersion := pwszVersion is String ? StrPtr(pwszVersion) : pwszVersion
    pwszBuildFlavor := pwszBuildFlavor is String ? StrPtr(pwszBuildFlavor) : pwszBuildFlavor

    ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSCorEE.dll\CorBindToRuntime", "ptr", pwszVersion, "ptr", pwszBuildFlavor, Guid.Ptr, rclsid, Guid.Ptr, riid, ppvMarshal, ppv, "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} pwszFileName 
 * @param {Pointer<Guid>} rclsid 
 * @param {Pointer<Guid>} riid 
 * @param {Pointer<Pointer<Void>>} ppv 
 * @returns {HRESULT} 
 */
export CorBindToCurrentRuntime(pwszFileName, rclsid, riid, ppv) {
    pwszFileName := pwszFileName is String ? StrPtr(pwszFileName) : pwszFileName

    ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSCorEE.dll\CorBindToCurrentRuntime", "ptr", pwszFileName, Guid.Ptr, rclsid, Guid.Ptr, riid, ppvMarshal, ppv, "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} pTypeName 
 * @param {Pointer<Guid>} riid 
 * @param {Pointer<Pointer<Void>>} ppObject 
 * @returns {HRESULT} 
 */
export ClrCreateManagedInstance(pTypeName, riid, ppObject) {
    pTypeName := pTypeName is String ? StrPtr(pTypeName) : pTypeName

    ppObjectMarshal := ppObject is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSCorEE.dll\ClrCreateManagedInstance", "ptr", pTypeName, Guid.Ptr, riid, ppObjectMarshal, ppObject, "HRESULT")
    return result
}

/**
 * 
 * @returns {String} Nothing - always returns an empty string
 */
export CorMarkThreadInThreadPool() {
    DllCall("MSCorEE.dll\CorMarkThreadInThreadPool")
}

/**
 * 
 * @param {HWND} _hwnd 
 * @param {HINSTANCE} hinst 
 * @param {PWSTR} lpszCmdLine 
 * @param {Integer} nCmdShow 
 * @returns {HRESULT} 
 */
export RunDll32ShimW(_hwnd, hinst, lpszCmdLine, nCmdShow) {
    lpszCmdLine := lpszCmdLine is String ? StrPtr(lpszCmdLine) : lpszCmdLine

    result := DllCall("MSCorEE.dll\RunDll32ShimW", HWND, _hwnd, HINSTANCE, hinst, "ptr", lpszCmdLine, "int", nCmdShow, "HRESULT")
    return result
}

/**
 * Loads a specified version of a .NET Framework library DLL.
 * @remarks
 * This function is used to load library DLLs that are included in the .NET Framework redistributable package, not user-generated DLLs.
 * 
 * This function has no associated import library or header file; you must call it using the [**LoadLibrary**](/windows/win32/api/libloaderapi/nf-libloaderapi-loadlibrarya) and [**GetProcAddress**](/windows/win32/api/libloaderapi/nf-libloaderapi-getprocaddress) functions.
 * @param {PWSTR} szDllName The name of the DLL to be loaded from the .NET Framework.
 * @param {PWSTR} szVersion The version of the DLL to be loaded. If *szVersion* is **NULL**, the latest version of the specified DLL is loaded.
 * @param {Pointer<Void>} pvReserved Reserved.
 * @param {Pointer<HMODULE>} phModDll A handle to the module.
 * @returns {HRESULT} If this function succeeds, it returns **S\_OK**. Otherwise, it returns an **HRESULT** error code.
 * @see https://learn.microsoft.com/windows/win32/DevNotes/loadlibraryshim
 */
export LoadLibraryShim(szDllName, szVersion, pvReserved, phModDll) {
    szDllName := szDllName is String ? StrPtr(szDllName) : szDllName
    szVersion := szVersion is String ? StrPtr(szVersion) : szVersion

    pvReservedMarshal := pvReserved is VarRef ? "ptr" : "ptr"

    result := DllCall("MSCorEE.dll\LoadLibraryShim", "ptr", szDllName, "ptr", szVersion, pvReservedMarshal, pvReserved, HMODULE.Ptr, phModDll, "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} szDllName 
 * @param {PSTR} szFunctionName 
 * @param {Pointer<Void>} lpvArgument1 
 * @param {Pointer<Void>} lpvArgument2 
 * @param {PWSTR} szVersion 
 * @param {Pointer<Void>} pvReserved 
 * @returns {HRESULT} 
 */
export CallFunctionShim(szDllName, szFunctionName, lpvArgument1, lpvArgument2, szVersion, pvReserved) {
    szDllName := szDllName is String ? StrPtr(szDllName) : szDllName
    szFunctionName := szFunctionName is String ? StrPtr(szFunctionName) : szFunctionName
    szVersion := szVersion is String ? StrPtr(szVersion) : szVersion

    lpvArgument1Marshal := lpvArgument1 is VarRef ? "ptr" : "ptr"
    lpvArgument2Marshal := lpvArgument2 is VarRef ? "ptr" : "ptr"
    pvReservedMarshal := pvReserved is VarRef ? "ptr" : "ptr"

    result := DllCall("MSCorEE.dll\CallFunctionShim", "ptr", szDllName, "ptr", szFunctionName, lpvArgument1Marshal, lpvArgument1, lpvArgument2Marshal, lpvArgument2, "ptr", szVersion, pvReservedMarshal, pvReserved, "HRESULT")
    return result
}

/**
 * 
 * @param {PSTR} pwszProcName 
 * @param {Pointer<Pointer<Void>>} ppv 
 * @returns {HRESULT} 
 */
export GetRealProcAddress(pwszProcName, ppv) {
    pwszProcName := pwszProcName is String ? StrPtr(pwszProcName) : pwszProcName

    ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSCorEE.dll\GetRealProcAddress", "ptr", pwszProcName, ppvMarshal, ppv, "HRESULT")
    return result
}

/**
 * 
 * @param {Integer} exitCode 
 * @returns {String} Nothing - always returns an empty string
 */
export CorExitProcess(exitCode) {
    DllCall("MSCorEE.dll\CorExitProcess", "int", exitCode)
}

/**
 * 
 * @param {Integer} iResouceID 
 * @param {PWSTR} szBuffer 
 * @param {Integer} iMax 
 * @param {Integer} bQuiet 
 * @returns {HRESULT} 
 */
export LoadStringRC(iResouceID, szBuffer, iMax, bQuiet) {
    szBuffer := szBuffer is String ? StrPtr(szBuffer) : szBuffer

    result := DllCall("MSCorEE.dll\LoadStringRC", "uint", iResouceID, "ptr", szBuffer, "int", iMax, "int", bQuiet, "HRESULT")
    return result
}

/**
 * 
 * @param {Integer} lcid 
 * @param {Integer} iResouceID 
 * @param {PWSTR} szBuffer 
 * @param {Integer} iMax 
 * @param {Integer} bQuiet 
 * @param {Pointer<Integer>} pcwchUsed 
 * @returns {HRESULT} 
 */
export LoadStringRCEx(lcid, iResouceID, szBuffer, iMax, bQuiet, pcwchUsed) {
    szBuffer := szBuffer is String ? StrPtr(szBuffer) : szBuffer

    pcwchUsedMarshal := pcwchUsed is VarRef ? "int*" : "ptr"

    result := DllCall("MSCorEE.dll\LoadStringRCEx", "uint", lcid, "uint", iResouceID, "ptr", szBuffer, "int", iMax, "int", bQuiet, pcwchUsedMarshal, pcwchUsed, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<FLockClrVersionCallback>} hostCallback 
 * @param {Pointer<Pointer<FLockClrVersionCallback>>} pBeginHostSetup 
 * @param {Pointer<Pointer<FLockClrVersionCallback>>} pEndHostSetup 
 * @returns {HRESULT} 
 */
export LockClrVersion(hostCallback, pBeginHostSetup, pEndHostSetup) {
    pBeginHostSetupMarshal := pBeginHostSetup is VarRef ? "ptr*" : "ptr"
    pEndHostSetupMarshal := pEndHostSetup is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSCorEE.dll\LockClrVersion", "ptr", hostCallback, pBeginHostSetupMarshal, pBeginHostSetup, pEndHostSetupMarshal, pEndHostSetup, "HRESULT")
    return result
}

/**
 * 
 * @param {Integer} iDebuggerVersion 
 * @param {PWSTR} szDebuggeeVersion 
 * @returns {IUnknown} 
 */
export CreateDebuggingInterfaceFromVersion(iDebuggerVersion, szDebuggeeVersion) {
    szDebuggeeVersion := szDebuggeeVersion is String ? StrPtr(szDebuggeeVersion) : szDebuggeeVersion

    result := DllCall("MSCorEE.dll\CreateDebuggingInterfaceFromVersion", "int", iDebuggerVersion, "ptr", szDebuggeeVersion, "ptr*", &ppCordb := 0, "HRESULT")
    return IUnknown(ppCordb)
}

/**
 * 
 * @param {HANDLE} hProcess 
 * @param {PWSTR} pVersion 
 * @param {Integer} cchBuffer 
 * @returns {Integer} 
 */
export GetVersionFromProcess(hProcess, pVersion, cchBuffer) {
    pVersion := pVersion is String ? StrPtr(pVersion) : pVersion

    result := DllCall("MSCorEE.dll\GetVersionFromProcess", HANDLE, hProcess, "ptr", pVersion, "uint", cchBuffer, "uint*", &dwLength := 0, "HRESULT")
    return dwLength
}

/**
 * 
 * @param {HOST_TYPE} dwClickOnceHost 
 * @param {PWSTR} pwzAppFullName 
 * @param {Integer} dwManifestPaths 
 * @param {Pointer<PWSTR>} ppwzManifestPaths 
 * @param {Integer} dwActivationData 
 * @param {Pointer<PWSTR>} ppwzActivationData 
 * @param {Pointer<PROCESS_INFORMATION>} lpProcessInformation 
 * @returns {HRESULT} 
 */
export CorLaunchApplication(dwClickOnceHost, pwzAppFullName, dwManifestPaths, ppwzManifestPaths, dwActivationData, ppwzActivationData, lpProcessInformation) {
    pwzAppFullName := pwzAppFullName is String ? StrPtr(pwzAppFullName) : pwzAppFullName

    ppwzManifestPathsMarshal := ppwzManifestPaths is VarRef ? "ptr*" : "ptr"
    ppwzActivationDataMarshal := ppwzActivationData is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSCorEE.dll\CorLaunchApplication", HOST_TYPE, dwClickOnceHost, "ptr", pwzAppFullName, "uint", dwManifestPaths, ppwzManifestPathsMarshal, ppwzManifestPaths, "uint", dwActivationData, ppwzActivationDataMarshal, ppwzActivationData, PROCESS_INFORMATION.Ptr, lpProcessInformation, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<Guid>} rclsid 
 * @param {PWSTR} pVersion 
 * @param {Integer} cchBuffer 
 * @param {CLSID_RESOLUTION_FLAGS} dwResolutionFlags 
 * @returns {Integer} 
 */
export GetRequestedRuntimeVersionForCLSID(rclsid, pVersion, cchBuffer, dwResolutionFlags) {
    pVersion := pVersion is String ? StrPtr(pVersion) : pVersion

    result := DllCall("MSCorEE.dll\GetRequestedRuntimeVersionForCLSID", Guid.Ptr, rclsid, "ptr", pVersion, "uint", cchBuffer, "uint*", &dwLength := 0, CLSID_RESOLUTION_FLAGS, dwResolutionFlags, "HRESULT")
    return dwLength
}

/**
 * 
 * @param {Pointer<Guid>} riid 
 * @returns {IUnknown} 
 */
export GetCLRIdentityManager(riid) {
    result := DllCall("MSCorEE.dll\GetCLRIdentityManager", Guid.Ptr, riid, "ptr*", &ppManager := 0, "HRESULT")
    return IUnknown(ppManager)
}

/**
 * 
 * @param {Pointer<Guid>} clsid 
 * @param {Pointer<Guid>} riid 
 * @returns {Pointer<Void>} 
 */
export CLRCreateInstance(clsid, riid) {
    result := DllCall("MSCorEE.dll\CLRCreateInstance", Guid.Ptr, clsid, Guid.Ptr, riid, "ptr*", &ppInterface := 0, "HRESULT")
    return ppInterface
}

;@endregion Functions
