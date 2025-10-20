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
     * 
     * @param {PWSTR} pszUrl 
     * @param {Pointer<VARIANT_BOOL>} pvbCancel 
     * @returns {HRESULT} 
     */
    OnRedirect(pszUrl, pvbCancel) {
        pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl

        result := ComCall(3, this, "ptr", pszUrl, "ptr", pvbCancel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszUrl 
     * @returns {HRESULT} 
     */
    OnSendingRequest(pszUrl) {
        pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl

        result := ComCall(4, this, "ptr", pszUrl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
