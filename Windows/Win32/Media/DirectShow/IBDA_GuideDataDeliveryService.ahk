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
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_guidedatadeliveryservice-getguidedatatype
     */
    GetGuideDataType() {
        pguidDataType := Guid()
        result := ComCall(3, this, "ptr", pguidDataType, "HRESULT")
        return pguidDataType
    }

    /**
     * 
     * @param {Pointer<Integer>} pulcbBufferLen 
     * @param {Pointer<Integer>} pbBuffer 
     * @param {Pointer<Integer>} pulGuideDataPercentageProgress 
     * @returns {HRESULT} 
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
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_guidedatadeliveryservice-requestguidedataupdate
     */
    RequestGuideDataUpdate() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ul64ServiceIdx 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_guidedatadeliveryservice-gettunexmlfromserviceidx
     */
    GetTuneXmlFromServiceIdx(ul64ServiceIdx) {
        pbstrTuneXml := BSTR()
        result := ComCall(6, this, "uint", ul64ServiceIdx, "ptr", pbstrTuneXml, "HRESULT")
        return pbstrTuneXml
    }

    /**
     * 
     * @param {Pointer<Integer>} pulcbBufferLen 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_guidedatadeliveryservice-getservices
     */
    GetServices(pulcbBufferLen) {
        pulcbBufferLenMarshal := pulcbBufferLen is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pulcbBufferLenMarshal, pulcbBufferLen, "char*", &pbBuffer := 0, "HRESULT")
        return pbBuffer
    }

    /**
     * 
     * @param {BSTR} bstrTuneXml 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_guidedatadeliveryservice-getserviceinfofromtunexml
     */
    GetServiceInfoFromTuneXml(bstrTuneXml) {
        bstrTuneXml := bstrTuneXml is String ? BSTR.Alloc(bstrTuneXml).Value : bstrTuneXml

        pbstrServiceDescription := BSTR()
        result := ComCall(8, this, "ptr", bstrTuneXml, "ptr", pbstrServiceDescription, "HRESULT")
        return pbstrServiceDescription
    }
}
