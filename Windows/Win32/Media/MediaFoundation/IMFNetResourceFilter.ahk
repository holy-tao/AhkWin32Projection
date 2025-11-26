#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Notifies the application when a byte stream requests a URL, and enables the application to block URL redirection.
 * @remarks
 * 
 * To set the callback interface:
 * 
 * <ol>
 * <li>Query the byte stream object for the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfattributes-setunknown">IMFAttributes::SetUnknown</a> to set the <a href="https://docs.microsoft.com/windows/desktop/medfound/mfnetsource-resource-filter">MFNETSOURCE_RESOURCE_FILTER</a> attribute.</li>
 * </ol>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfnetresourcefilter
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFNetResourceFilter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFNetResourceFilter
     * @type {Guid}
     */
    static IID => Guid("{091878a3-bf11-4a5c-bc9f-33995b06ef2d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnRedirect", "OnSendingRequest"]

    /**
     * Called when the byte stream redirects to a URL.
     * @param {PWSTR} pszUrl The URL to which the connection has been redirected.
     * @returns {VARIANT_BOOL} To cancel the redirection, set this parameter to <b>VARIANT_TRUE</b>. To allow the redirection, set this parameter to <b>VARIANT_FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfnetresourcefilter-onredirect
     */
    OnRedirect(pszUrl) {
        pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl

        result := ComCall(3, this, "ptr", pszUrl, "short*", &pvbCancel := 0, "HRESULT")
        return pvbCancel
    }

    /**
     * Called when the byte stream requests a URL.
     * @param {PWSTR} pszUrl The URL that the byte stream is requesting.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfnetresourcefilter-onsendingrequest
     */
    OnSendingRequest(pszUrl) {
        pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl

        result := ComCall(4, this, "ptr", pszUrl, "HRESULT")
        return result
    }
}
