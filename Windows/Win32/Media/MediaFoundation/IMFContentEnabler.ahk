#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implements one step that must be performed for the user to access media content.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfcontentenabler
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
     * @remarks
     * The following GUIDs are defined for the <i>pType</i> parameter.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>MFENABLETYPE_MF_RebootRequired</td>
     * <td>The user must reboot his or her computer.</td>
     * </tr>
     * <tr>
     * <td>MFENABLETYPE_MF_UpdateRevocationInformation</td>
     * <td>Update revocation information.</td>
     * </tr>
     * <tr>
     * <td>MFENABLETYPE_MF_UpdateUntrustedComponent</td>
     * <td>Update untrusted components.</td>
     * </tr>
     * <tr>
     * <td>MFENABLETYPE_WMDRMV1_LicenseAcquisition</td>
     * <td>License acquisition for Windows Media Digital Rights Management (DRM) version 1.</td>
     * </tr>
     * <tr>
     * <td>MFENABLETYPE_WMDRMV7_Individualization</td>
     * <td>Individualization.</td>
     * </tr>
     * <tr>
     * <td>MFENABLETYPE_WMDRMV7_LicenseAcquisition</td>
     * <td>License acquisition for Windows Media DRM version 7 or later.</td>
     * </tr>
     * </table>
     * @returns {Guid} Receives a GUID that identifies the type of operation. An application can tailor its user interface (UI) strings for known operation types. See Remarks.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcontentenabler-getenabletype
     */
    GetEnableType() {
        pType := Guid()
        result := ComCall(3, this, "ptr", pType, "HRESULT")
        return pType
    }

    /**
     * Retrieves a URL for performing a manual content enabling action.
     * @remarks
     * If the enabling action can be performed by navigating to a URL, this method returns the URL. If no such URL exists, the method returns a failure code.
     * 
     * The purpose of the URL depends on the content enabler type, which is obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfcontentenabler-getenabletype">IMFContentEnabler::GetEnableType</a>.
     * 
     * <table>
     * <tr>
     * <th>Enable type</th>
     * <th>Purpose of URL</th>
     * </tr>
     * <tr>
     * <td>Individualization</td>
     * <td>Not applicable.</td>
     * </tr>
     * <tr>
     * <td>License acquisition</td>
     * <td>URL to obtain the license. Call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfcontentenabler-getenabledata">IMFContentEnabler::GetEnableData</a> and submit the data to the URL as an HTTP POST request. To receive notification when the license is acquired, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfcontentenabler-monitorenable">IMFContentEnabler::MonitorEnable</a>.</td>
     * </tr>
     * <tr>
     * <td>Revocation</td>
     * <td>URL to a webpage where the user can download and install an updated component.</td>
     * </tr>
     * </table>
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcontentenabler-getenableurl
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
     * @remarks
     * The purpose of the data depends on the content enabler type, which is obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfcontentenabler-getenabletype">IMFContentEnabler::GetEnableType</a>.
     * 
     * <table>
     * <tr>
     * <th>Enable type</th>
     * <th>Purpose of data</th>
     * </tr>
     * <tr>
     * <td>Individualization</td>
     * <td>Not applicable.</td>
     * </tr>
     * <tr>
     * <td>License acquisition</td>
     * <td>HTTP POST data.</td>
     * </tr>
     * <tr>
     * <td>Revocation</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ns-mfidl-mfrr_components">MFRR_COMPONENTS</a> structure.</td>
     * </tr>
     * </table>
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcontentenabler-getenabledata
     */
    GetEnableData(ppbData, pcbData) {
        ppbDataMarshal := ppbData is VarRef ? "ptr*" : "ptr"
        pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, ppbDataMarshal, ppbData, pcbDataMarshal, pcbData, "HRESULT")
        return result
    }

    /**
     * Queries whether the content enabler can perform all of its actions automatically.
     * @remarks
     * If this method returns <b>TRUE</b> in the <i>pfAutomatic</i> parameter, call the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfcontentenabler-automaticenable">IMFContentEnabler::AutomaticEnable</a> method to perform the enabling action.
     * 
     * If this method returns <b>FALSE</b> in the <i>pfAutomatic</i> parameter, the application must use manual enabling. To do so, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfcontentenabler-getenableurl">IMFContentEnabler::GetEnableURL</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfcontentenabler-getenabledata">IMFContentEnabler::GetEnableData</a> to get the URL and data needed for manual enabling.
     * @returns {BOOL} Receives a Boolean value. If <b>TRUE</b>, the content enabler can perform the enabling action automatically.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcontentenabler-isautomaticsupported
     */
    IsAutomaticSupported() {
        result := ComCall(6, this, "int*", &pfAutomatic := 0, "HRESULT")
        return pfAutomatic
    }

    /**
     * Performs a content enabling action without any user interaction.
     * @remarks
     * This method is asynchronous. When the operation is complete, the content enabler sends an <a href="https://docs.microsoft.com/windows/desktop/medfound/meenablercompleted">MEEnablerCompleted</a> event. While the operation is in progress, the content enabler might send <a href="https://docs.microsoft.com/windows/desktop/medfound/meenablerprogress">MEEnablerProgress</a> events.
     * 
     * To find out whether the content enabler supports this method, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfcontentenabler-isautomaticsupported">IMFContentEnabler::IsAutomaticSupported</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcontentenabler-automaticenable
     */
    AutomaticEnable() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Requests notification when the enabling action is completed.
     * @remarks
     * If you use a manual enabling action, call this method to be notified when the operation completes. If this method returns S_OK, the content enabler will send an <a href="https://docs.microsoft.com/windows/desktop/medfound/meenablercompleted">MEEnablerCompleted</a> event when the operation is completed. If the application cancels the operation before completing it, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfcontentenabler-cancel">IMFContentEnabler::Cancel</a>.
     * 
     * You do not have to call <b>MonitorEnable</b> when you use automatic enabling by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfcontentenabler-automaticenable">IMFContentEnabler::AutomaticEnable</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcontentenabler-monitorenable
     */
    MonitorEnable() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Cancels a pending content enabling action.
     * @remarks
     * The content enabler sends an <a href="https://docs.microsoft.com/windows/desktop/medfound/meenablercompleted">MEEnablerCompleted</a> event with a status code of E_CANCEL.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcontentenabler-cancel
     */
    Cancel() {
        result := ComCall(9, this, "HRESULT")
        return result
    }
}
