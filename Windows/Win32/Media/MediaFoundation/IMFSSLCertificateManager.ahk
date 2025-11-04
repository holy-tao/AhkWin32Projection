#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implemented by a client and called by Microsoft Media Foundation to get the client Secure Sockets Layer (SSL) certificate requested by the server.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfsslcertificatemanager
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSSLCertificateManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFSSLCertificateManager
     * @type {Guid}
     */
    static IID => Guid("{61f7d887-1230-4a8b-aeba-8ad434d1a64d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetClientCertificate", "BeginGetClientCertificate", "EndGetClientCertificate", "GetCertificatePolicy", "OnServerCertificate"]

    /**
     * 
     * @param {PWSTR} pszURL 
     * @param {Pointer<Pointer<Integer>>} ppbData 
     * @param {Pointer<Integer>} pcbData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsslcertificatemanager-getclientcertificate
     */
    GetClientCertificate(pszURL, ppbData, pcbData) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        ppbDataMarshal := ppbData is VarRef ? "ptr*" : "ptr"
        pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pszURL, ppbDataMarshal, ppbData, pcbDataMarshal, pcbData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszURL 
     * @param {IMFAsyncCallback} pCallback 
     * @param {IUnknown} pState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsslcertificatemanager-begingetclientcertificate
     */
    BeginGetClientCertificate(pszURL, pCallback, pState) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(4, this, "ptr", pszURL, "ptr", pCallback, "ptr", pState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFAsyncResult} pResult 
     * @param {Pointer<Pointer<Integer>>} ppbData 
     * @param {Pointer<Integer>} pcbData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsslcertificatemanager-endgetclientcertificate
     */
    EndGetClientCertificate(pResult, ppbData, pcbData) {
        ppbDataMarshal := ppbData is VarRef ? "ptr*" : "ptr"
        pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pResult, ppbDataMarshal, ppbData, pcbDataMarshal, pcbData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszURL 
     * @param {Pointer<BOOL>} pfOverrideAutomaticCheck 
     * @param {Pointer<BOOL>} pfClientCertificateAvailable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsslcertificatemanager-getcertificatepolicy
     */
    GetCertificatePolicy(pszURL, pfOverrideAutomaticCheck, pfClientCertificateAvailable) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(6, this, "ptr", pszURL, "ptr", pfOverrideAutomaticCheck, "ptr", pfClientCertificateAvailable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszURL 
     * @param {Pointer} pbData 
     * @param {Integer} cbData 
     * @param {Pointer<BOOL>} pfIsGood 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsslcertificatemanager-onservercertificate
     */
    OnServerCertificate(pszURL, pbData, cbData, pfIsGood) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(7, this, "ptr", pszURL, "ptr", pbData, "uint", cbData, "ptr", pfIsGood, "HRESULT")
        return result
    }
}
