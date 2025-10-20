#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWSDServiceProxy.ahk

/**
 * Represents a remote WSD service for client applications and middleware. This interface allows for the implementation of multiple asynchronous operations.
 * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nn-wsdclient-iwsdserviceproxyeventing
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDServiceProxyEventing extends IWSDServiceProxy{
    /**
     * The interface identifier for IWSDServiceProxyEventing
     * @type {Guid}
     */
    static IID => Guid("{f9279d6d-1012-4a94-b8cc-fd35d2202bfe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * 
     * @param {Pointer<WSD_OPERATION>} pOperations 
     * @param {Integer} dwOperationCount 
     * @param {Pointer<IUnknown>} pUnknown 
     * @param {Pointer<WSD_EVENTING_EXPIRES>} pExpires 
     * @param {Pointer<WSDXML_ELEMENT>} pAny 
     * @param {Pointer<WSD_EVENTING_EXPIRES>} ppExpires 
     * @param {Pointer<WSDXML_ELEMENT>} ppAny 
     * @returns {HRESULT} 
     */
    SubscribeToMultipleOperations(pOperations, dwOperationCount, pUnknown, pExpires, pAny, ppExpires, ppAny) {
        result := ComCall(11, this, "ptr", pOperations, "uint", dwOperationCount, "ptr", pUnknown, "ptr", pExpires, "ptr", pAny, "ptr", ppExpires, "ptr", ppAny, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WSD_OPERATION>} pOperations 
     * @param {Integer} dwOperationCount 
     * @param {Pointer<IUnknown>} pUnknown 
     * @param {Pointer<WSD_EVENTING_EXPIRES>} pExpires 
     * @param {Pointer<WSDXML_ELEMENT>} pAny 
     * @param {Pointer<IUnknown>} pAsyncState 
     * @param {Pointer<IWSDAsyncCallback>} pAsyncCallback 
     * @param {Pointer<IWSDAsyncResult>} ppResult 
     * @returns {HRESULT} 
     */
    BeginSubscribeToMultipleOperations(pOperations, dwOperationCount, pUnknown, pExpires, pAny, pAsyncState, pAsyncCallback, ppResult) {
        result := ComCall(12, this, "ptr", pOperations, "uint", dwOperationCount, "ptr", pUnknown, "ptr", pExpires, "ptr", pAny, "ptr", pAsyncState, "ptr", pAsyncCallback, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WSD_OPERATION>} pOperations 
     * @param {Integer} dwOperationCount 
     * @param {Pointer<IWSDAsyncResult>} pResult 
     * @param {Pointer<WSD_EVENTING_EXPIRES>} ppExpires 
     * @param {Pointer<WSDXML_ELEMENT>} ppAny 
     * @returns {HRESULT} 
     */
    EndSubscribeToMultipleOperations(pOperations, dwOperationCount, pResult, ppExpires, ppAny) {
        result := ComCall(13, this, "ptr", pOperations, "uint", dwOperationCount, "ptr", pResult, "ptr", ppExpires, "ptr", ppAny, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WSD_OPERATION>} pOperations 
     * @param {Integer} dwOperationCount 
     * @param {Pointer<WSDXML_ELEMENT>} pAny 
     * @returns {HRESULT} 
     */
    UnsubscribeToMultipleOperations(pOperations, dwOperationCount, pAny) {
        result := ComCall(14, this, "ptr", pOperations, "uint", dwOperationCount, "ptr", pAny, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WSD_OPERATION>} pOperations 
     * @param {Integer} dwOperationCount 
     * @param {Pointer<WSDXML_ELEMENT>} pAny 
     * @param {Pointer<IUnknown>} pAsyncState 
     * @param {Pointer<IWSDAsyncCallback>} pAsyncCallback 
     * @param {Pointer<IWSDAsyncResult>} ppResult 
     * @returns {HRESULT} 
     */
    BeginUnsubscribeToMultipleOperations(pOperations, dwOperationCount, pAny, pAsyncState, pAsyncCallback, ppResult) {
        result := ComCall(15, this, "ptr", pOperations, "uint", dwOperationCount, "ptr", pAny, "ptr", pAsyncState, "ptr", pAsyncCallback, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WSD_OPERATION>} pOperations 
     * @param {Integer} dwOperationCount 
     * @param {Pointer<IWSDAsyncResult>} pResult 
     * @returns {HRESULT} 
     */
    EndUnsubscribeToMultipleOperations(pOperations, dwOperationCount, pResult) {
        result := ComCall(16, this, "ptr", pOperations, "uint", dwOperationCount, "ptr", pResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WSD_OPERATION>} pOperations 
     * @param {Integer} dwOperationCount 
     * @param {Pointer<WSD_EVENTING_EXPIRES>} pExpires 
     * @param {Pointer<WSDXML_ELEMENT>} pAny 
     * @param {Pointer<WSD_EVENTING_EXPIRES>} ppExpires 
     * @param {Pointer<WSDXML_ELEMENT>} ppAny 
     * @returns {HRESULT} 
     */
    RenewMultipleOperations(pOperations, dwOperationCount, pExpires, pAny, ppExpires, ppAny) {
        result := ComCall(17, this, "ptr", pOperations, "uint", dwOperationCount, "ptr", pExpires, "ptr", pAny, "ptr", ppExpires, "ptr", ppAny, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WSD_OPERATION>} pOperations 
     * @param {Integer} dwOperationCount 
     * @param {Pointer<WSD_EVENTING_EXPIRES>} pExpires 
     * @param {Pointer<WSDXML_ELEMENT>} pAny 
     * @param {Pointer<IUnknown>} pAsyncState 
     * @param {Pointer<IWSDAsyncCallback>} pAsyncCallback 
     * @param {Pointer<IWSDAsyncResult>} ppResult 
     * @returns {HRESULT} 
     */
    BeginRenewMultipleOperations(pOperations, dwOperationCount, pExpires, pAny, pAsyncState, pAsyncCallback, ppResult) {
        result := ComCall(18, this, "ptr", pOperations, "uint", dwOperationCount, "ptr", pExpires, "ptr", pAny, "ptr", pAsyncState, "ptr", pAsyncCallback, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WSD_OPERATION>} pOperations 
     * @param {Integer} dwOperationCount 
     * @param {Pointer<IWSDAsyncResult>} pResult 
     * @param {Pointer<WSD_EVENTING_EXPIRES>} ppExpires 
     * @param {Pointer<WSDXML_ELEMENT>} ppAny 
     * @returns {HRESULT} 
     */
    EndRenewMultipleOperations(pOperations, dwOperationCount, pResult, ppExpires, ppAny) {
        result := ComCall(19, this, "ptr", pOperations, "uint", dwOperationCount, "ptr", pResult, "ptr", ppExpires, "ptr", ppAny, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WSD_OPERATION>} pOperations 
     * @param {Integer} dwOperationCount 
     * @param {Pointer<WSDXML_ELEMENT>} pAny 
     * @param {Pointer<WSD_EVENTING_EXPIRES>} ppExpires 
     * @param {Pointer<WSDXML_ELEMENT>} ppAny 
     * @returns {HRESULT} 
     */
    GetStatusForMultipleOperations(pOperations, dwOperationCount, pAny, ppExpires, ppAny) {
        result := ComCall(20, this, "ptr", pOperations, "uint", dwOperationCount, "ptr", pAny, "ptr", ppExpires, "ptr", ppAny, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WSD_OPERATION>} pOperations 
     * @param {Integer} dwOperationCount 
     * @param {Pointer<WSDXML_ELEMENT>} pAny 
     * @param {Pointer<IUnknown>} pAsyncState 
     * @param {Pointer<IWSDAsyncCallback>} pAsyncCallback 
     * @param {Pointer<IWSDAsyncResult>} ppResult 
     * @returns {HRESULT} 
     */
    BeginGetStatusForMultipleOperations(pOperations, dwOperationCount, pAny, pAsyncState, pAsyncCallback, ppResult) {
        result := ComCall(21, this, "ptr", pOperations, "uint", dwOperationCount, "ptr", pAny, "ptr", pAsyncState, "ptr", pAsyncCallback, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WSD_OPERATION>} pOperations 
     * @param {Integer} dwOperationCount 
     * @param {Pointer<IWSDAsyncResult>} pResult 
     * @param {Pointer<WSD_EVENTING_EXPIRES>} ppExpires 
     * @param {Pointer<WSDXML_ELEMENT>} ppAny 
     * @returns {HRESULT} 
     */
    EndGetStatusForMultipleOperations(pOperations, dwOperationCount, pResult, ppExpires, ppAny) {
        result := ComCall(22, this, "ptr", pOperations, "uint", dwOperationCount, "ptr", pResult, "ptr", ppExpires, "ptr", ppAny, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
