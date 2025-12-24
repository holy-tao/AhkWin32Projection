#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implements one step that must be performed for the user to access media content.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfcontentenabler
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFContentEnabler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFContentEnabler
     * @type {Guid}
     */
    static IID => Guid("{d3c4ef59-49ce-4381-9071-d5bcd044c770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetEnableType", "GetEnableURL", "GetEnableData", "IsAutomaticSupported", "AutomaticEnable", "MonitorEnable", "Cancel"]

    /**
     * Retrieves the type of operation that this content enabler performs.
     * @returns {Guid} Receives a GUID that identifies the type of operation. An application can tailor its user interface (UI) strings for known operation types. See Remarks.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfcontentenabler-getenabletype
     */
    GetEnableType() {
        pType := Guid()
        result := ComCall(3, this, "ptr", pType, "HRESULT")
        return pType
    }

    /**
     * Retrieves a URL for performing a manual content enabling action.
     * @param {Pointer<PWSTR>} ppwszURL Receives a pointer to a buffer that contains the URL. The caller must release the memory for the buffer by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @param {Pointer<Integer>} pcchURL Receives the number of characters returned in <i>ppwszURL</i>, including the terminating NULL character.
     * @param {Pointer<Integer>} pTrustStatus Receives a member of the <a href="https://docs.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mf_url_trust_status">MF_URL_TRUST_STATUS</a> enumeration indicating whether the URL is trusted.
     * @returns {HRESULT} The method returns an HRESULT. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_NOT_AVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No URL is available.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfcontentenabler-getenableurl
     */
    GetEnableURL(ppwszURL, pcchURL, pTrustStatus) {
        ppwszURLMarshal := ppwszURL is VarRef ? "ptr*" : "ptr"
        pcchURLMarshal := pcchURL is VarRef ? "uint*" : "ptr"
        pTrustStatusMarshal := pTrustStatus is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, ppwszURLMarshal, ppwszURL, pcchURLMarshal, pcchURL, pTrustStatusMarshal, pTrustStatus, "HRESULT")
        return result
    }

    /**
     * Retrieves the data for a manual content enabling action.
     * @param {Pointer<Pointer<Integer>>} ppbData Receives a pointer to a buffer that contains the data. The caller must free the buffer by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @param {Pointer<Integer>} pcbData Receives the size of the <i>ppbData</i> buffer.
     * @returns {HRESULT} The method returns an HRESULT. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_NOT_AVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No data is available.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfcontentenabler-getenabledata
     */
    GetEnableData(ppbData, pcbData) {
        ppbDataMarshal := ppbData is VarRef ? "ptr*" : "ptr"
        pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, ppbDataMarshal, ppbData, pcbDataMarshal, pcbData, "HRESULT")
        return result
    }

    /**
     * Queries whether the content enabler can perform all of its actions automatically.
     * @returns {BOOL} Receives a Boolean value. If <b>TRUE</b>, the content enabler can perform the enabing action automatically.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfcontentenabler-isautomaticsupported
     */
    IsAutomaticSupported() {
        result := ComCall(6, this, "int*", &pfAutomatic := 0, "HRESULT")
        return pfAutomatic
    }

    /**
     * Performs a content enabling action without any user interaction.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfcontentenabler-automaticenable
     */
    AutomaticEnable() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Requests notification when the enabling action is completed.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded and no action was required.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfcontentenabler-monitorenable
     */
    MonitorEnable() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Cancels a pending content enabling action.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfcontentenabler-cancel
     */
    Cancel() {
        result := ComCall(9, this, "HRESULT")
        return result
    }
}
