#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Retrieves out-of-band guide data from a media transform device (MTD). This interface provides access to a device's Guide Data Delivery Service.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_GuideDataDeliveryService)</c>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nn-bdaiface-ibda_guidedatadeliveryservice
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBDA_GuideDataDeliveryService extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBDA_GuideDataDeliveryService
     * @type {Guid}
     */
    static IID => Guid("{c0afcb73-23e7-4bc6-bafa-fdc167b4719f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetGuideDataType", "GetGuideData", "RequestGuideDataUpdate", "GetTuneXmlFromServiceIdx", "GetServices", "GetServiceInfoFromTuneXml"]

    /**
     * Gets the format UUID for the data that is retrieved on this service.
     * @returns {Guid} Receives either a UUID that identifies the format of the guide data or the network GUID that the tuner supports for in-band guide purposes. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CLSID_PBDA_GDDS_DATA_TYPE"></a><a id="clsid_pbda_gdds_data_type"></a><dl>
     * <dt><b>CLSID_PBDA_GDDS_DATA_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Protected Broadcast Driver Architecture Service Information (PBDA-SI) format. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_guidedatadeliveryservice-getguidedatatype
     */
    GetGuideDataType() {
        pguidDataType := Guid()
        result := ComCall(3, this, "ptr", pguidDataType, "HRESULT")
        return pguidDataType
    }

    /**
     * Gets the next set of guide data that is available.
     * @param {Pointer<Integer>} pulcbBufferLen Size of the <i>pbBuffer</i> array, in bytes.
     * @param {Pointer<Integer>} pbBuffer Pointer to a byte array that receives the guide data.
     * @param {Pointer<Integer>} pulGuideDataPercentageProgress Receives a value from 0 to 100. The value specifies the percent of guide data that was transferred from the media transform device (MTD) to the media sink device (MSD) since the last call to <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/nf-bdaiface-ibda_guidedatadeliveryservice-requestguidedataupdate">IBDA_GuideDataDeliveryService::RequestGuideDataUpdate</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following:
     * 
     * <table>
     * <tr>
     * <th>Return value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>S_OK</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>BDA_E_NO_MORE_DATA</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The MTD has no more data to return.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_guidedatadeliveryservice-getguidedata
     */
    GetGuideData(pulcbBufferLen, pbBuffer, pulGuideDataPercentageProgress) {
        pulcbBufferLenMarshal := pulcbBufferLen is VarRef ? "uint*" : "ptr"
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"
        pulGuideDataPercentageProgressMarshal := pulGuideDataPercentageProgress is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pulcbBufferLenMarshal, pulcbBufferLen, pbBufferMarshal, pbBuffer, pulGuideDataPercentageProgressMarshal, pulGuideDataPercentageProgress, "HRESULT")
        return result
    }

    /**
     * Requests updated guide data from the media transform device (MTD).
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_guidedatadeliveryservice-requestguidedataupdate
     */
    RequestGuideDataUpdate() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Converts a service identifier into an XML tune request.
     * @param {Integer} ul64ServiceIdx Identifier for the service.
     * @returns {BSTR} Receives the XML tune request. The caller must release the string by calling <b>SysFreeString</b>.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_guidedatadeliveryservice-gettunexmlfromserviceidx
     */
    GetTuneXmlFromServiceIdx(ul64ServiceIdx) {
        pbstrTuneXml := BSTR()
        result := ComCall(6, this, "uint", ul64ServiceIdx, "ptr", pbstrTuneXml, "HRESULT")
        return pbstrTuneXml
    }

    /**
     * Gets a list of services that are available on the the media transform device (MTD).
     * @param {Pointer<Integer>} pulcbBufferLen On input, specifies the size of the <i>pbBuffer</i> array, in bytes. On output, receives the size of the data that was written to the <i>pbBuffer</i> array.
     * @returns {Integer} Pointer to a byte array that receives a list of service identifiers. A service identifier is a 64-bit value. To translate a service identifier into a tune request, call <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/nf-bdaiface-ibda_guidedatadeliveryservice-gettunexmlfromserviceidx">IBDA_GuideDataDeliveryService::GetTuneXmlFromServiceIdx</a>.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_guidedatadeliveryservice-getservices
     */
    GetServices(pulcbBufferLen) {
        pulcbBufferLenMarshal := pulcbBufferLen is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pulcbBufferLenMarshal, pulcbBufferLen, "char*", &pbBuffer := 0, "HRESULT")
        return pbBuffer
    }

    /**
     * Gets service information from an XML tune request.
     * @param {BSTR} bstrTuneXml The XML tune request. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/nf-bdaiface-ibda_guidedatadeliveryservice-gettunexmlfromserviceidx">IBDA_GuideDataDeliveryService::GetTuneXmlFromServiceIdx</a>.
     * @returns {BSTR} Receives an XML string that contains information about the service. The caller must release the string by calling <b>SysFreeString</b>.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_guidedatadeliveryservice-getserviceinfofromtunexml
     */
    GetServiceInfoFromTuneXml(bstrTuneXml) {
        bstrTuneXml := bstrTuneXml is String ? BSTR.Alloc(bstrTuneXml).Value : bstrTuneXml

        pbstrServiceDescription := BSTR()
        result := ComCall(8, this, "ptr", bstrTuneXml, "ptr", pbstrServiceDescription, "HRESULT")
        return pbstrServiceDescription
    }
}
