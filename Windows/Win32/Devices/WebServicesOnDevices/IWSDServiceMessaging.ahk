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
     * 
     * @param {Pointer<Void>} pBody 
     * @param {Pointer<WSD_OPERATION>} pOperation 
     * @param {Pointer<IWSDMessageParameters>} pMessageParameters 
     * @returns {HRESULT} 
     */
    SendResponse(pBody, pOperation, pMessageParameters) {
        result := ComCall(3, this, "ptr", pBody, "ptr", pOperation, "ptr", pMessageParameters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WSD_SOAP_HEADER>} pRequestHeader 
     * @param {Pointer<IWSDMessageParameters>} pMessageParameters 
     * @param {Pointer<WSD_SOAP_FAULT>} pFault 
     * @returns {HRESULT} 
     */
    FaultRequest(pRequestHeader, pMessageParameters, pFault) {
        result := ComCall(4, this, "ptr", pRequestHeader, "ptr", pMessageParameters, "ptr", pFault, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
