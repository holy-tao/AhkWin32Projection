#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Retrieves out-of-band guide data from a media transform device (MTD). This interface provides access to a device's Guide Data Delivery Service.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_GuideDataDeliveryService)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nn-bdaiface-ibda_guidedatadeliveryservice
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IBDA_GuideDataDeliveryService extends IUnknown {
    /**
     * The interface identifier for IBDA_GuideDataDeliveryService
     * @type {Guid}
     */
    static IID := Guid("{c0afcb73-23e7-4bc6-bafa-fdc167b4719f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBDA_GuideDataDeliveryService interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetGuideDataType          : IntPtr
        GetGuideData              : IntPtr
        RequestGuideDataUpdate    : IntPtr
        GetTuneXmlFromServiceIdx  : IntPtr
        GetServices               : IntPtr
        GetServiceInfoFromTuneXml : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBDA_GuideDataDeliveryService.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_guidedatadeliveryservice-getguidedatatype
     */
    GetGuideDataType() {
        pguidDataType := Guid()
        result := ComCall(3, this, Guid.Ptr, pguidDataType, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_guidedatadeliveryservice-getguidedata
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
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_guidedatadeliveryservice-requestguidedataupdate
     */
    RequestGuideDataUpdate() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Converts a service identifier into an XML tune request.
     * @param {Integer} ul64ServiceIdx Identifier for the service.
     * @returns {BSTR} Receives the XML tune request. The caller must release the string by calling <b>SysFreeString</b>.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_guidedatadeliveryservice-gettunexmlfromserviceidx
     */
    GetTuneXmlFromServiceIdx(ul64ServiceIdx) {
        pbstrTuneXml := BSTR.Owned()
        result := ComCall(6, this, "uint", ul64ServiceIdx, BSTR.Ptr, pbstrTuneXml, "HRESULT")
        return pbstrTuneXml
    }

    /**
     * Gets a list of services that are available on the the media transform device (MTD).
     * @param {Pointer<Integer>} pulcbBufferLen On input, specifies the size of the <i>pbBuffer</i> array, in bytes. On output, receives the size of the data that was written to the <i>pbBuffer</i> array.
     * @returns {Integer} Pointer to a byte array that receives a list of service identifiers. A service identifier is a 64-bit value. To translate a service identifier into a tune request, call <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/nf-bdaiface-ibda_guidedatadeliveryservice-gettunexmlfromserviceidx">IBDA_GuideDataDeliveryService::GetTuneXmlFromServiceIdx</a>.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_guidedatadeliveryservice-getservices
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
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_guidedatadeliveryservice-getserviceinfofromtunexml
     */
    GetServiceInfoFromTuneXml(bstrTuneXml) {
        bstrTuneXml := bstrTuneXml is String ? BSTR.Alloc(bstrTuneXml).Value : bstrTuneXml

        pbstrServiceDescription := BSTR.Owned()
        result := ComCall(8, this, BSTR, bstrTuneXml, BSTR.Ptr, pbstrServiceDescription, "HRESULT")
        return pbstrServiceDescription
    }

    Query(iid) {
        if (IBDA_GuideDataDeliveryService.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetGuideDataType := CallbackCreate(GetMethod(implObj, "GetGuideDataType"), flags, 2)
        this.vtbl.GetGuideData := CallbackCreate(GetMethod(implObj, "GetGuideData"), flags, 4)
        this.vtbl.RequestGuideDataUpdate := CallbackCreate(GetMethod(implObj, "RequestGuideDataUpdate"), flags, 1)
        this.vtbl.GetTuneXmlFromServiceIdx := CallbackCreate(GetMethod(implObj, "GetTuneXmlFromServiceIdx"), flags, 3)
        this.vtbl.GetServices := CallbackCreate(GetMethod(implObj, "GetServices"), flags, 3)
        this.vtbl.GetServiceInfoFromTuneXml := CallbackCreate(GetMethod(implObj, "GetServiceInfoFromTuneXml"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetGuideDataType)
        CallbackFree(this.vtbl.GetGuideData)
        CallbackFree(this.vtbl.RequestGuideDataUpdate)
        CallbackFree(this.vtbl.GetTuneXmlFromServiceIdx)
        CallbackFree(this.vtbl.GetServices)
        CallbackFree(this.vtbl.GetServiceInfoFromTuneXml)
    }
}
