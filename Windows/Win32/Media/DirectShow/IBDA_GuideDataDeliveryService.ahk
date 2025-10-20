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
     * 
     * @param {Pointer<Guid>} pguidDataType 
     * @returns {HRESULT} 
     */
    GetGuideDataType(pguidDataType) {
        result := ComCall(3, this, "ptr", pguidDataType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulcbBufferLen 
     * @param {Pointer<Byte>} pbBuffer 
     * @param {Pointer<UInt32>} pulGuideDataPercentageProgress 
     * @returns {HRESULT} 
     */
    GetGuideData(pulcbBufferLen, pbBuffer, pulGuideDataPercentageProgress) {
        result := ComCall(4, this, "uint*", pulcbBufferLen, "char*", pbBuffer, "uint*", pulGuideDataPercentageProgress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RequestGuideDataUpdate() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ul64ServiceIdx 
     * @param {Pointer<BSTR>} pbstrTuneXml 
     * @returns {HRESULT} 
     */
    GetTuneXmlFromServiceIdx(ul64ServiceIdx, pbstrTuneXml) {
        result := ComCall(6, this, "uint", ul64ServiceIdx, "ptr", pbstrTuneXml, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulcbBufferLen 
     * @param {Pointer<Byte>} pbBuffer 
     * @returns {HRESULT} 
     */
    GetServices(pulcbBufferLen, pbBuffer) {
        result := ComCall(7, this, "uint*", pulcbBufferLen, "char*", pbBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrTuneXml 
     * @param {Pointer<BSTR>} pbstrServiceDescription 
     * @returns {HRESULT} 
     */
    GetServiceInfoFromTuneXml(bstrTuneXml, pbstrServiceDescription) {
        bstrTuneXml := bstrTuneXml is String ? BSTR.Alloc(bstrTuneXml).Value : bstrTuneXml

        result := ComCall(8, this, "ptr", bstrTuneXml, "ptr", pbstrServiceDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
