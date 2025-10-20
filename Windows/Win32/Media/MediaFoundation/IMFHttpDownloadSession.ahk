#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Applications implement this interface to override the default implementation of the HTTP and HTTPS protocols used by Microsoft Media Foundation.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfhttpdownloadsession
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFHttpDownloadSession extends IUnknown{
    /**
     * The interface identifier for IMFHttpDownloadSession
     * @type {Guid}
     */
    static IID => Guid("{71fa9a2c-53ce-4662-a132-1a7e8cbf62db}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} szServerName 
     * @param {Integer} nPort 
     * @returns {HRESULT} 
     */
    SetServer(szServerName, nPort) {
        szServerName := szServerName is String ? StrPtr(szServerName) : szServerName

        result := ComCall(3, this, "ptr", szServerName, "uint", nPort, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} szObjectName 
     * @param {BOOL} fBypassProxyCache 
     * @param {BOOL} fSecure 
     * @param {PWSTR} szVerb 
     * @param {PWSTR} szReferrer 
     * @param {Pointer<IMFHttpDownloadRequest>} ppRequest 
     * @returns {HRESULT} 
     */
    CreateRequest(szObjectName, fBypassProxyCache, fSecure, szVerb, szReferrer, ppRequest) {
        szObjectName := szObjectName is String ? StrPtr(szObjectName) : szObjectName
        szVerb := szVerb is String ? StrPtr(szVerb) : szVerb
        szReferrer := szReferrer is String ? StrPtr(szReferrer) : szReferrer

        result := ComCall(4, this, "ptr", szObjectName, "int", fBypassProxyCache, "int", fSecure, "ptr", szVerb, "ptr", szReferrer, "ptr", ppRequest, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
