#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Is used by generated stub code to send faults or responses to incoming messages.
 * @see https://docs.microsoft.com/windows/win32/api//wsdhost/nn-wsdhost-iwsdservicemessaging
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDServiceMessaging extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSDServiceMessaging
     * @type {Guid}
     */
    static IID => Guid("{94974cf4-0cab-460d-a3f6-7a0ad623c0e6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SendResponse", "FaultRequest"]

    /**
     * 
     * @param {Pointer<Void>} pBody 
     * @param {Pointer<WSD_OPERATION>} pOperation 
     * @param {IWSDMessageParameters} pMessageParameters 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdhost/nf-wsdhost-iwsdservicemessaging-sendresponse
     */
    SendResponse(pBody, pOperation, pMessageParameters) {
        pBodyMarshal := pBody is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, pBodyMarshal, pBody, "ptr", pOperation, "ptr", pMessageParameters, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WSD_SOAP_HEADER>} pRequestHeader 
     * @param {IWSDMessageParameters} pMessageParameters 
     * @param {Pointer<WSD_SOAP_FAULT>} pFault 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdhost/nf-wsdhost-iwsdservicemessaging-faultrequest
     */
    FaultRequest(pRequestHeader, pMessageParameters, pFault) {
        result := ComCall(4, this, "ptr", pRequestHeader, "ptr", pMessageParameters, "ptr", pFault, "HRESULT")
        return result
    }
}
