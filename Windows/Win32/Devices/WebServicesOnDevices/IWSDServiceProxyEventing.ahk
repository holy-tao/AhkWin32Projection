#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWSDAsyncResult.ahk
#Include .\IWSDServiceProxy.ahk

/**
 * Represents a remote WSD service for client applications and middleware. This interface allows for the implementation of multiple asynchronous operations.
 * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nn-wsdclient-iwsdserviceproxyeventing
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDServiceProxyEventing extends IWSDServiceProxy{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SubscribeToMultipleOperations", "BeginSubscribeToMultipleOperations", "EndSubscribeToMultipleOperations", "UnsubscribeToMultipleOperations", "BeginUnsubscribeToMultipleOperations", "EndUnsubscribeToMultipleOperations", "RenewMultipleOperations", "BeginRenewMultipleOperations", "EndRenewMultipleOperations", "GetStatusForMultipleOperations", "BeginGetStatusForMultipleOperations", "EndGetStatusForMultipleOperations"]

    /**
     * 
     * @param {Pointer<WSD_OPERATION>} pOperations 
     * @param {Integer} dwOperationCount 
     * @param {IUnknown} pUnknown 
     * @param {Pointer<WSD_EVENTING_EXPIRES>} pExpires 
     * @param {Pointer<WSDXML_ELEMENT>} pAny 
     * @param {Pointer<Pointer<WSD_EVENTING_EXPIRES>>} ppExpires 
     * @param {Pointer<Pointer<WSDXML_ELEMENT>>} ppAny 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdserviceproxyeventing-subscribetomultipleoperations
     */
    SubscribeToMultipleOperations(pOperations, dwOperationCount, pUnknown, pExpires, pAny, ppExpires, ppAny) {
        ppExpiresMarshal := ppExpires is VarRef ? "ptr*" : "ptr"
        ppAnyMarshal := ppAny is VarRef ? "ptr*" : "ptr"

        result := ComCall(11, this, "ptr", pOperations, "uint", dwOperationCount, "ptr", pUnknown, "ptr", pExpires, "ptr", pAny, ppExpiresMarshal, ppExpires, ppAnyMarshal, ppAny, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WSD_OPERATION>} pOperations 
     * @param {Integer} dwOperationCount 
     * @param {IUnknown} pUnknown 
     * @param {Pointer<WSD_EVENTING_EXPIRES>} pExpires 
     * @param {Pointer<WSDXML_ELEMENT>} pAny 
     * @param {IUnknown} pAsyncState 
     * @param {IWSDAsyncCallback} pAsyncCallback 
     * @returns {IWSDAsyncResult} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdserviceproxyeventing-beginsubscribetomultipleoperations
     */
    BeginSubscribeToMultipleOperations(pOperations, dwOperationCount, pUnknown, pExpires, pAny, pAsyncState, pAsyncCallback) {
        result := ComCall(12, this, "ptr", pOperations, "uint", dwOperationCount, "ptr", pUnknown, "ptr", pExpires, "ptr", pAny, "ptr", pAsyncState, "ptr", pAsyncCallback, "ptr*", &ppResult := 0, "HRESULT")
        return IWSDAsyncResult(ppResult)
    }

    /**
     * 
     * @param {Pointer<WSD_OPERATION>} pOperations 
     * @param {Integer} dwOperationCount 
     * @param {IWSDAsyncResult} pResult 
     * @param {Pointer<Pointer<WSD_EVENTING_EXPIRES>>} ppExpires 
     * @param {Pointer<Pointer<WSDXML_ELEMENT>>} ppAny 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdserviceproxyeventing-endsubscribetomultipleoperations
     */
    EndSubscribeToMultipleOperations(pOperations, dwOperationCount, pResult, ppExpires, ppAny) {
        ppExpiresMarshal := ppExpires is VarRef ? "ptr*" : "ptr"
        ppAnyMarshal := ppAny is VarRef ? "ptr*" : "ptr"

        result := ComCall(13, this, "ptr", pOperations, "uint", dwOperationCount, "ptr", pResult, ppExpiresMarshal, ppExpires, ppAnyMarshal, ppAny, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WSD_OPERATION>} pOperations 
     * @param {Integer} dwOperationCount 
     * @param {Pointer<WSDXML_ELEMENT>} pAny 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdserviceproxyeventing-unsubscribetomultipleoperations
     */
    UnsubscribeToMultipleOperations(pOperations, dwOperationCount, pAny) {
        result := ComCall(14, this, "ptr", pOperations, "uint", dwOperationCount, "ptr", pAny, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WSD_OPERATION>} pOperations 
     * @param {Integer} dwOperationCount 
     * @param {Pointer<WSDXML_ELEMENT>} pAny 
     * @param {IUnknown} pAsyncState 
     * @param {IWSDAsyncCallback} pAsyncCallback 
     * @returns {IWSDAsyncResult} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdserviceproxyeventing-beginunsubscribetomultipleoperations
     */
    BeginUnsubscribeToMultipleOperations(pOperations, dwOperationCount, pAny, pAsyncState, pAsyncCallback) {
        result := ComCall(15, this, "ptr", pOperations, "uint", dwOperationCount, "ptr", pAny, "ptr", pAsyncState, "ptr", pAsyncCallback, "ptr*", &ppResult := 0, "HRESULT")
        return IWSDAsyncResult(ppResult)
    }

    /**
     * 
     * @param {Pointer<WSD_OPERATION>} pOperations 
     * @param {Integer} dwOperationCount 
     * @param {IWSDAsyncResult} pResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdserviceproxyeventing-endunsubscribetomultipleoperations
     */
    EndUnsubscribeToMultipleOperations(pOperations, dwOperationCount, pResult) {
        result := ComCall(16, this, "ptr", pOperations, "uint", dwOperationCount, "ptr", pResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WSD_OPERATION>} pOperations 
     * @param {Integer} dwOperationCount 
     * @param {Pointer<WSD_EVENTING_EXPIRES>} pExpires 
     * @param {Pointer<WSDXML_ELEMENT>} pAny 
     * @param {Pointer<Pointer<WSD_EVENTING_EXPIRES>>} ppExpires 
     * @param {Pointer<Pointer<WSDXML_ELEMENT>>} ppAny 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdserviceproxyeventing-renewmultipleoperations
     */
    RenewMultipleOperations(pOperations, dwOperationCount, pExpires, pAny, ppExpires, ppAny) {
        ppExpiresMarshal := ppExpires is VarRef ? "ptr*" : "ptr"
        ppAnyMarshal := ppAny is VarRef ? "ptr*" : "ptr"

        result := ComCall(17, this, "ptr", pOperations, "uint", dwOperationCount, "ptr", pExpires, "ptr", pAny, ppExpiresMarshal, ppExpires, ppAnyMarshal, ppAny, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WSD_OPERATION>} pOperations 
     * @param {Integer} dwOperationCount 
     * @param {Pointer<WSD_EVENTING_EXPIRES>} pExpires 
     * @param {Pointer<WSDXML_ELEMENT>} pAny 
     * @param {IUnknown} pAsyncState 
     * @param {IWSDAsyncCallback} pAsyncCallback 
     * @returns {IWSDAsyncResult} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdserviceproxyeventing-beginrenewmultipleoperations
     */
    BeginRenewMultipleOperations(pOperations, dwOperationCount, pExpires, pAny, pAsyncState, pAsyncCallback) {
        result := ComCall(18, this, "ptr", pOperations, "uint", dwOperationCount, "ptr", pExpires, "ptr", pAny, "ptr", pAsyncState, "ptr", pAsyncCallback, "ptr*", &ppResult := 0, "HRESULT")
        return IWSDAsyncResult(ppResult)
    }

    /**
     * 
     * @param {Pointer<WSD_OPERATION>} pOperations 
     * @param {Integer} dwOperationCount 
     * @param {IWSDAsyncResult} pResult 
     * @param {Pointer<Pointer<WSD_EVENTING_EXPIRES>>} ppExpires 
     * @param {Pointer<Pointer<WSDXML_ELEMENT>>} ppAny 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdserviceproxyeventing-endrenewmultipleoperations
     */
    EndRenewMultipleOperations(pOperations, dwOperationCount, pResult, ppExpires, ppAny) {
        ppExpiresMarshal := ppExpires is VarRef ? "ptr*" : "ptr"
        ppAnyMarshal := ppAny is VarRef ? "ptr*" : "ptr"

        result := ComCall(19, this, "ptr", pOperations, "uint", dwOperationCount, "ptr", pResult, ppExpiresMarshal, ppExpires, ppAnyMarshal, ppAny, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WSD_OPERATION>} pOperations 
     * @param {Integer} dwOperationCount 
     * @param {Pointer<WSDXML_ELEMENT>} pAny 
     * @param {Pointer<Pointer<WSD_EVENTING_EXPIRES>>} ppExpires 
     * @param {Pointer<Pointer<WSDXML_ELEMENT>>} ppAny 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdserviceproxyeventing-getstatusformultipleoperations
     */
    GetStatusForMultipleOperations(pOperations, dwOperationCount, pAny, ppExpires, ppAny) {
        ppExpiresMarshal := ppExpires is VarRef ? "ptr*" : "ptr"
        ppAnyMarshal := ppAny is VarRef ? "ptr*" : "ptr"

        result := ComCall(20, this, "ptr", pOperations, "uint", dwOperationCount, "ptr", pAny, ppExpiresMarshal, ppExpires, ppAnyMarshal, ppAny, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WSD_OPERATION>} pOperations 
     * @param {Integer} dwOperationCount 
     * @param {Pointer<WSDXML_ELEMENT>} pAny 
     * @param {IUnknown} pAsyncState 
     * @param {IWSDAsyncCallback} pAsyncCallback 
     * @returns {IWSDAsyncResult} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdserviceproxyeventing-begingetstatusformultipleoperations
     */
    BeginGetStatusForMultipleOperations(pOperations, dwOperationCount, pAny, pAsyncState, pAsyncCallback) {
        result := ComCall(21, this, "ptr", pOperations, "uint", dwOperationCount, "ptr", pAny, "ptr", pAsyncState, "ptr", pAsyncCallback, "ptr*", &ppResult := 0, "HRESULT")
        return IWSDAsyncResult(ppResult)
    }

    /**
     * 
     * @param {Pointer<WSD_OPERATION>} pOperations 
     * @param {Integer} dwOperationCount 
     * @param {IWSDAsyncResult} pResult 
     * @param {Pointer<Pointer<WSD_EVENTING_EXPIRES>>} ppExpires 
     * @param {Pointer<Pointer<WSDXML_ELEMENT>>} ppAny 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdserviceproxyeventing-endgetstatusformultipleoperations
     */
    EndGetStatusForMultipleOperations(pOperations, dwOperationCount, pResult, ppExpires, ppAny) {
        ppExpiresMarshal := ppExpires is VarRef ? "ptr*" : "ptr"
        ppAnyMarshal := ppAny is VarRef ? "ptr*" : "ptr"

        result := ComCall(22, this, "ptr", pOperations, "uint", dwOperationCount, "ptr", pResult, ppExpiresMarshal, ppExpires, ppAnyMarshal, ppAny, "HRESULT")
        return result
    }
}
