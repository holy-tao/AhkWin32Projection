#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.Security.EnterpriseData
 * @version v4.0.30319
 */
class EnterpriseData {

;@region Constants
;@endregion Constants

;@region Methods
    /**
     * Sets the enterprise ID as the data context of the current thread. This is allowed only if the process already has the same enterprise ID present in its process context. It optionally returns the existing thread token.
     * @param {PWSTR} enterpriseId The enterprise ID to set in the current thread's token.
     * @param {Pointer<HTHREAD_NETWORK_CONTEXT>} threadNetworkContext On success, holds the existing thread token.
     * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/srpapi/nf-srpapi-srpcreatethreadnetworkcontext
     * @since windows10.0.10240
     */
    static SrpCreateThreadNetworkContext(enterpriseId, threadNetworkContext) {
        enterpriseId := enterpriseId is String ? StrPtr(enterpriseId) : enterpriseId

        result := DllCall("srpapi.dll\SrpCreateThreadNetworkContext", "ptr", enterpriseId, "ptr", threadNetworkContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Restores a thread back to the original context, which may have been optionally returned from SrpCreateThreadNetworkContext.
     * @param {Pointer<HTHREAD_NETWORK_CONTEXT>} threadNetworkContext A handle to the original context’s token.
     * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/srpapi/nf-srpapi-srpclosethreadnetworkcontext
     * @since windows10.0.10240
     */
    static SrpCloseThreadNetworkContext(threadNetworkContext) {
        result := DllCall("srpapi.dll\SrpCloseThreadNetworkContext", "ptr", threadNetworkContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets a data intent on a token. The caller process should be enterprise allowed for the provided enterprise ID.
     * @param {HANDLE} tokenHandle The token handle on which the intent is to be set.
     * @param {PWSTR} enterpriseId The enterprise ID to set as intent.
     * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/srpapi/nf-srpapi-srpsettokenenterpriseid
     * @since windows10.0.10240
     */
    static SrpSetTokenEnterpriseId(tokenHandle, enterpriseId) {
        tokenHandle := tokenHandle is Win32Handle ? NumGet(tokenHandle, "ptr") : tokenHandle
        enterpriseId := enterpriseId is String ? StrPtr(enterpriseId) : enterpriseId

        result := DllCall("srpapi.dll\SrpSetTokenEnterpriseId", "ptr", tokenHandle, "ptr", enterpriseId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the list of enterprise identifiers for the given token.
     * @param {HANDLE} tokenHandle Token Handle to be checked.
     * @param {Pointer<Integer>} numberOfBytes If <i>enterpriseIds</i> is provided, then this supplies the size of the <i>enterpriseIds</i> buffer. If you provide a buffer size, and it's too small, the output will contain the required size of the <i>enterpriseIds</i> buffer.
     * @param {Pointer} enterpriseIds An array of enterprise ID string pointers.
     * @returns {Integer} The enterprise ID count on the token. Zero if the token is not explicitly enterprise allowed.
     * @see https://learn.microsoft.com/windows/win32/api/srpapi/nf-srpapi-srpgetenterpriseids
     * @since windows10.0.10240
     */
    static SrpGetEnterpriseIds(tokenHandle, numberOfBytes, enterpriseIds) {
        tokenHandle := tokenHandle is Win32Handle ? NumGet(tokenHandle, "ptr") : tokenHandle

        numberOfBytesMarshal := numberOfBytes is VarRef ? "uint*" : "ptr"

        result := DllCall("srpapi.dll\SrpGetEnterpriseIds", "ptr", tokenHandle, numberOfBytesMarshal, numberOfBytes, "ptr", enterpriseIds, "uint*", &enterpriseIdCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return enterpriseIdCount
    }

    /**
     * Enables permissive mode for file encryption on the current thread and all threads this thread will create or post work to.
     * @param {PWSTR} enterpriseId Contains enterprise ID string. In TH2 this is not used.
     * @returns {HRESULT} If this function succeeds, it returns S_OK. 
     * 
     * HRESULT_FROM_WIN32 (ERROR_INVALID_STATE) indicates that thread tagging cannot be performed due to either process or thread context.
     * @see https://learn.microsoft.com/windows/win32/api/srpapi/nf-srpapi-srpenablepermissivemodefileencryption
     * @since windows10.0.10240
     */
    static SrpEnablePermissiveModeFileEncryption(enterpriseId) {
        enterpriseId := enterpriseId is String ? StrPtr(enterpriseId) : enterpriseId

        result := DllCall("srpapi.dll\SrpEnablePermissiveModeFileEncryption", "ptr", enterpriseId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Disables permissive mode for file encryption on the current thread.
     * @returns {HRESULT} If this function succeeds, it returns S_OK. 
     * 
     * HRESULT_FROM_WIN32 (ERROR_INVALID_STATE) indicates that thread tagging cannot be performed due to either process or thread context.
     * @see https://learn.microsoft.com/windows/win32/api/srpapi/nf-srpapi-srpdisablepermissivemodefileencryption
     * @since windows10.0.10240
     */
    static SrpDisablePermissiveModeFileEncryption() {
        result := DllCall("srpapi.dll\SrpDisablePermissiveModeFileEncryption", "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Policy can be applied on Windows 10, version 1607.Gets information about the enterprise policy of an app.
     * @param {HANDLE} tokenHandle Token Handle to be checked.
     * @returns {Integer} A collection of flags that indicate among other things whether the host app is allowed by the managing enterprise policy, and has been enlightened for Windows Information Protection.
     * @see https://learn.microsoft.com/windows/win32/api/srpapi/nf-srpapi-srpgetenterprisepolicy
     * @since windows10.0.10240
     */
    static SrpGetEnterprisePolicy(tokenHandle) {
        tokenHandle := tokenHandle is Win32Handle ? NumGet(tokenHandle, "ptr") : tokenHandle

        result := DllCall("srpapi.dll\SrpGetEnterprisePolicy", "ptr", tokenHandle, "int*", &policyFlags := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return policyFlags
    }

    /**
     * Identifies whether a service is a token service.
     * @param {HANDLE} TokenHandle Token Handle to be checked.
     * @param {Pointer<Integer>} IsTokenService A boolean value that indicates whether the service is a token service.
     * @returns {NTSTATUS} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/srpapi/nf-srpapi-srpistokenservice
     * @since windows10.0.10240
     */
    static SrpIsTokenService(TokenHandle, IsTokenService) {
        TokenHandle := TokenHandle is Win32Handle ? NumGet(TokenHandle, "ptr") : TokenHandle

        IsTokenServiceMarshal := IsTokenService is VarRef ? "char*" : "ptr"

        result := DllCall("srpapi.dll\SrpIsTokenService", "ptr", TokenHandle, IsTokenServiceMarshal, IsTokenService, "int")
        return result
    }

    /**
     * Evaluates whether a packaged app will be allowed to execute based on software restriction policies.
     * @param {Pointer<PACKAGE_ID>} packageId Provides package name, publisher name, and version of the packaged app.
     * @returns {BOOL} A boolean value that indicates whether the app is allowed to execute.
     * @see https://learn.microsoft.com/windows/win32/api/srpapi/nf-srpapi-srpdoespolicyallowappexecution
     * @since windows10.0.10240
     */
    static SrpDoesPolicyAllowAppExecution(packageId) {
        result := DllCall("srpapi.dll\SrpDoesPolicyAllowAppExecution", "ptr", packageId, "int*", &isAllowed := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return isAllowed
    }

    /**
     * 
     * @param {Pointer<_SRP_REQUEST>} FileInfo 
     * @returns {NTSTATUS} 
     */
    static SrpIsAllowed(FileInfo) {
        FileInfoMarshal := FileInfo is VarRef ? "ptr*" : "ptr"

        result := DllCall("srpapi.dll\SrpIsAllowed", FileInfoMarshal, FileInfo, "int")
        return result
    }

    /**
     * 
     * @param {Integer} Version 
     * @param {Integer} Type 
     * @param {Pointer<Void>} pvData 
     * @param {Integer} cbData 
     * @returns {HRESULT} 
     */
    static SrpHostingInitialize(Version, Type, pvData, cbData) {
        pvDataMarshal := pvData is VarRef ? "ptr" : "ptr"

        result := DllCall("srpapi.dll\SrpHostingInitialize", "int", Version, "int", Type, pvDataMarshal, pvData, "uint", cbData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @returns {String} Nothing - always returns an empty string
     */
    static SrpHostingTerminate(Type) {
        DllCall("srpapi.dll\SrpHostingTerminate", "int", Type)
    }

    /**
     * Protects the data in a file to an enterprise identity, so that only users who are associated with that enterprise identity can access the data. The application can then use standard APIs to read or write from the file.
     * @param {PWSTR} fileOrFolderPath The path for the file or folder that you want to protect.
     * @param {PWSTR} identity The enterprise identity for which the data is protected. This identity is an email address or domain that is managed.
     * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/edpwin32/nf-edpwin32-protectfiletoenterpriseidentity
     * @since windows10.0.10240
     */
    static ProtectFileToEnterpriseIdentity(fileOrFolderPath, identity) {
        fileOrFolderPath := fileOrFolderPath is String ? StrPtr(fileOrFolderPath) : fileOrFolderPath
        identity := identity is String ? StrPtr(identity) : identity

        result := DllCall("efswrt.dll\ProtectFileToEnterpriseIdentity", "ptr", fileOrFolderPath, "ptr", identity, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} fileOrFolderPath 
     * @param {Pointer<FILE_UNPROTECT_OPTIONS>} options 
     * @returns {HRESULT} 
     */
    static UnprotectFile(fileOrFolderPath, options) {
        fileOrFolderPath := fileOrFolderPath is String ? StrPtr(fileOrFolderPath) : fileOrFolderPath

        result := DllCall("efswrt.dll\UnprotectFile", "ptr", fileOrFolderPath, "ptr", options, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

;@endregion Methods
}
