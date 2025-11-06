#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWSDAddress.ahk
#Include .\IWSDMessageParameters.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Use this interface to communicate message specific information up and down the protocol stack.
 * @remarks
 * 
  * In a request-response message pattern, the parameters also provide a way for the transport to determine where the response message for a given request should be sent. To enable this, the message parameters for a request must always be passed down the stack with the corresponding response.
  * 
  * Since message parameters can be packaged with a request or a response, and can be sent or received, the meaning of the local and remote address depends on the direction the message parameters.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nn-wsdbase-iwsdmessageparameters
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDMessageParameters extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSDMessageParameters
     * @type {Guid}
     */
    static IID => Guid("{1fafe8a2-e6fc-4b80-b6cf-b7d45c416d7c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLocalAddress", "SetLocalAddress", "GetRemoteAddress", "SetRemoteAddress", "GetLowerParameters"]

    /**
     * 
     * @returns {IWSDAddress} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdmessageparameters-getlocaladdress
     */
    GetLocalAddress() {
        result := ComCall(3, this, "ptr*", &ppAddress := 0, "HRESULT")
        return IWSDAddress(ppAddress)
    }

    /**
     * 
     * @param {IWSDAddress} pAddress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdmessageparameters-setlocaladdress
     */
    SetLocalAddress(pAddress) {
        result := ComCall(4, this, "ptr", pAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IWSDAddress} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdmessageparameters-getremoteaddress
     */
    GetRemoteAddress() {
        result := ComCall(5, this, "ptr*", &ppAddress := 0, "HRESULT")
        return IWSDAddress(ppAddress)
    }

    /**
     * 
     * @param {IWSDAddress} pAddress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdmessageparameters-setremoteaddress
     */
    SetRemoteAddress(pAddress) {
        result := ComCall(6, this, "ptr", pAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IWSDMessageParameters} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdmessageparameters-getlowerparameters
     */
    GetLowerParameters() {
        result := ComCall(7, this, "ptr*", &ppTxParams := 0, "HRESULT")
        return IWSDMessageParameters(ppTxParams)
    }
}
