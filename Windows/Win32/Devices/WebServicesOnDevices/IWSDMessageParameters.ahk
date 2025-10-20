#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<IWSDAddress>} ppAddress 
     * @returns {HRESULT} 
     */
    GetLocalAddress(ppAddress) {
        result := ComCall(3, this, "ptr", ppAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWSDAddress>} pAddress 
     * @returns {HRESULT} 
     */
    SetLocalAddress(pAddress) {
        result := ComCall(4, this, "ptr", pAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWSDAddress>} ppAddress 
     * @returns {HRESULT} 
     */
    GetRemoteAddress(ppAddress) {
        result := ComCall(5, this, "ptr", ppAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWSDAddress>} pAddress 
     * @returns {HRESULT} 
     */
    SetRemoteAddress(pAddress) {
        result := ComCall(6, this, "ptr", pAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWSDMessageParameters>} ppTxParams 
     * @returns {HRESULT} 
     */
    GetLowerParameters(ppTxParams) {
        result := ComCall(7, this, "ptr", ppTxParams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
