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
     * Gets the client SSL certificate synchronously.
     * @param {PWSTR} pszURL Pointer to a string that contains the URL for which a client-side SSL certificate is required. Media Foundation can resolve the scheme and send the request to the server.
     * @param {Pointer<Pointer<Integer>>} ppbData Pointer to the buffer that stores the certificate.
     * This caller must free the buffer by calling <b>CoTaskMemFree</b>.
     * @param {Pointer<Integer>} pcbData Pointer to a <b>DWORD</b> variable that receives the number of bytes required to hold the certificate data in the buffer pointed by <i>*ppbData</i>.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsslcertificatemanager-getclientcertificate
     */
    GetClientCertificate(pszURL, ppbData, pcbData) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        ppbDataMarshal := ppbData is VarRef ? "ptr*" : "ptr"
        pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pszURL, ppbDataMarshal, ppbData, pcbDataMarshal, pcbData, "HRESULT")
        return result
    }

    /**
     * Starts an asynchronous call to get the client SSL certificate.
     * @param {PWSTR} pszURL A null-terminated string that contains the URL for which a client-side SSL certificate is required. Media Foundation can  resolve the scheme and send the request to the server.
     * @param {IMFAsyncCallback} pCallback A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback">IMFAsyncCallback</a> interface of a callback object. The caller must implement this interface.
     * @param {IUnknown} pState A pointer to the <b>IUnknown</b> interface of a state object, defined by the caller. This parameter can be <b>NULL</b>. You can use this object to hold state information. The object is returned to the caller when the callback is invoked.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsslcertificatemanager-begingetclientcertificate
     */
    BeginGetClientCertificate(pszURL, pCallback, pState) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(4, this, "ptr", pszURL, "ptr", pCallback, "ptr", pState, "HRESULT")
        return result
    }

    /**
     * Completes an asynchronous request to get the client SSL certificate.
     * @param {IMFAsyncResult} pResult A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface. Pass in the same pointer that your callback object received in the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method.
     * @param {Pointer<Pointer<Integer>>} ppbData Receives a pointer to the buffer that stores the certificate.
     * The caller must free the buffer by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @param {Pointer<Integer>} pcbData Receives the size of the <i>ppbData</i> buffer, in bytes.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsslcertificatemanager-endgetclientcertificate
     */
    EndGetClientCertificate(pResult, ppbData, pcbData) {
        ppbDataMarshal := ppbData is VarRef ? "ptr*" : "ptr"
        pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pResult, ppbDataMarshal, ppbData, pcbDataMarshal, pcbData, "HRESULT")
        return result
    }

    /**
     * Indicates whether the server SSL certificate must be verified by the caller, Media Foundation, or the IMFSSLCertificateManager implementation class.
     * @param {PWSTR} pszURL Pointer to a string that contains the URL that  is sent to the server.
     * @param {Pointer<BOOL>} pfOverrideAutomaticCheck Pointer to a <b>BOOL</b> value. Set to <b>TRUE</b> if <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfsslcertificatemanager-onservercertificate">IMFSSLCertificateManager::OnServerCertificate</a> is used to verify the server certificate.
     * Set to <b>FALSE</b> if Media Foundation verifies the server certificate  by using the certificates in the Windows certificate store.
     * @param {Pointer<BOOL>} pfClientCertificateAvailable Pointer to a <b>BOOL</b> value. Set to <b>TRUE</b> if the SSL certificate for the client is available for immediate retrieval. Media Foundation  calls <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfsslcertificatemanager-begingetclientcertificate">IMFSSLCertificateManager::GetClientCertificate</a> to obtain the client certificate synchronously. If the value is set to <b>FALSE</b>, Media Foundation obtains the client SSL certificate with an asynchronous call to <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfsslcertificatemanager-begingetclientcertificate">IMFSSLCertificateManager::BeginGetClientCertificate</a>.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsslcertificatemanager-getcertificatepolicy
     */
    GetCertificatePolicy(pszURL, pfOverrideAutomaticCheck, pfClientCertificateAvailable) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        pfOverrideAutomaticCheckMarshal := pfOverrideAutomaticCheck is VarRef ? "int*" : "ptr"
        pfClientCertificateAvailableMarshal := pfClientCertificateAvailable is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, "ptr", pszURL, pfOverrideAutomaticCheckMarshal, pfOverrideAutomaticCheck, pfClientCertificateAvailableMarshal, pfClientCertificateAvailable, "HRESULT")
        return result
    }

    /**
     * Called by Media Foundation when the server SSL certificate has been received; indicates whether the server certificate is accepted.
     * @param {PWSTR} pszURL Pointer to a string that contains the URL used to send the request to the server, and for which a server-side SSL certificate has been received.
     * @param {Pointer} pbData Pointer to a buffer that contains the server SSL certificate.
     * @param {Integer} cbData Pointer to a <b>DWORD</b> variable that indicates the size of <i>pbData</i> in bytes.
     * @returns {BOOL} Pointer to a <b>BOOL</b> variable that indicates whether the certificate is accepted.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsslcertificatemanager-onservercertificate
     */
    OnServerCertificate(pszURL, pbData, cbData) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(7, this, "ptr", pszURL, "ptr", pbData, "uint", cbData, "int*", &pfIsGood := 0, "HRESULT")
        return pfIsGood
    }
}
