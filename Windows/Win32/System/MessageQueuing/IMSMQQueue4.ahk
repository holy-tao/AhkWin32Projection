#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class IMSMQQueue4 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSMQQueue4
     * @type {Guid}
     */
    static IID => Guid("{eba96b20-2168-11d3-898c-00e02c074f6b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Access", "get_ShareMode", "get_QueueInfo", "get_Handle", "get_IsOpen", "Close", "Receive_v1", "Peek_v1", "EnableNotification", "Reset", "ReceiveCurrent_v1", "PeekNext_v1", "PeekCurrent_v1", "Receive", "Peek", "ReceiveCurrent", "PeekNext", "PeekCurrent", "get_Properties", "get_Handle2", "ReceiveByLookupId", "ReceiveNextByLookupId", "ReceivePreviousByLookupId", "ReceiveFirstByLookupId", "ReceiveLastByLookupId", "PeekByLookupId", "PeekNextByLookupId", "PeekPreviousByLookupId", "PeekFirstByLookupId", "PeekLastByLookupId", "Purge", "get_IsOpen2", "ReceiveByLookupIdAllowPeek"]

    /**
     * 
     * @param {Pointer<Integer>} plAccess 
     * @returns {HRESULT} 
     */
    get_Access(plAccess) {
        plAccessMarshal := plAccess is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, plAccessMarshal, plAccess, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plShareMode 
     * @returns {HRESULT} 
     */
    get_ShareMode(plShareMode) {
        plShareModeMarshal := plShareMode is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, plShareModeMarshal, plShareMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMSMQQueueInfo4>} ppqinfo 
     * @returns {HRESULT} 
     */
    get_QueueInfo(ppqinfo) {
        result := ComCall(9, this, "ptr*", ppqinfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plHandle 
     * @returns {HRESULT} 
     */
    get_Handle(plHandle) {
        plHandleMarshal := plHandle is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, plHandleMarshal, plHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pisOpen 
     * @returns {HRESULT} 
     */
    get_IsOpen(pisOpen) {
        pisOpenMarshal := pisOpen is VarRef ? "short*" : "ptr"

        result := ComCall(11, this, pisOpenMarshal, pisOpen, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Transaction 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} ReceiveTimeout 
     * @param {Pointer<IMSMQMessage>} ppmsg 
     * @returns {HRESULT} 
     */
    Receive_v1(Transaction, WantDestinationQueue, WantBody, ReceiveTimeout, ppmsg) {
        result := ComCall(13, this, "ptr", Transaction, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", ReceiveTimeout, "ptr*", ppmsg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} ReceiveTimeout 
     * @param {Pointer<IMSMQMessage>} ppmsg 
     * @returns {HRESULT} 
     */
    Peek_v1(WantDestinationQueue, WantBody, ReceiveTimeout, ppmsg) {
        result := ComCall(14, this, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", ReceiveTimeout, "ptr*", ppmsg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMSMQEvent3} Event 
     * @param {Pointer<VARIANT>} Cursor 
     * @param {Pointer<VARIANT>} ReceiveTimeout 
     * @returns {HRESULT} 
     */
    EnableNotification(Event, Cursor, ReceiveTimeout) {
        result := ComCall(15, this, "ptr", Event, "ptr", Cursor, "ptr", ReceiveTimeout, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Transaction 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} ReceiveTimeout 
     * @param {Pointer<IMSMQMessage>} ppmsg 
     * @returns {HRESULT} 
     */
    ReceiveCurrent_v1(Transaction, WantDestinationQueue, WantBody, ReceiveTimeout, ppmsg) {
        result := ComCall(17, this, "ptr", Transaction, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", ReceiveTimeout, "ptr*", ppmsg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} ReceiveTimeout 
     * @param {Pointer<IMSMQMessage>} ppmsg 
     * @returns {HRESULT} 
     */
    PeekNext_v1(WantDestinationQueue, WantBody, ReceiveTimeout, ppmsg) {
        result := ComCall(18, this, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", ReceiveTimeout, "ptr*", ppmsg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} ReceiveTimeout 
     * @param {Pointer<IMSMQMessage>} ppmsg 
     * @returns {HRESULT} 
     */
    PeekCurrent_v1(WantDestinationQueue, WantBody, ReceiveTimeout, ppmsg) {
        result := ComCall(19, this, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", ReceiveTimeout, "ptr*", ppmsg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Transaction 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} ReceiveTimeout 
     * @param {Pointer<VARIANT>} WantConnectorType 
     * @param {Pointer<IMSMQMessage4>} ppmsg 
     * @returns {HRESULT} 
     */
    Receive(Transaction, WantDestinationQueue, WantBody, ReceiveTimeout, WantConnectorType, ppmsg) {
        result := ComCall(20, this, "ptr", Transaction, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", ReceiveTimeout, "ptr", WantConnectorType, "ptr*", ppmsg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} ReceiveTimeout 
     * @param {Pointer<VARIANT>} WantConnectorType 
     * @param {Pointer<IMSMQMessage4>} ppmsg 
     * @returns {HRESULT} 
     */
    Peek(WantDestinationQueue, WantBody, ReceiveTimeout, WantConnectorType, ppmsg) {
        result := ComCall(21, this, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", ReceiveTimeout, "ptr", WantConnectorType, "ptr*", ppmsg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Transaction 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} ReceiveTimeout 
     * @param {Pointer<VARIANT>} WantConnectorType 
     * @param {Pointer<IMSMQMessage4>} ppmsg 
     * @returns {HRESULT} 
     */
    ReceiveCurrent(Transaction, WantDestinationQueue, WantBody, ReceiveTimeout, WantConnectorType, ppmsg) {
        result := ComCall(22, this, "ptr", Transaction, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", ReceiveTimeout, "ptr", WantConnectorType, "ptr*", ppmsg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} ReceiveTimeout 
     * @param {Pointer<VARIANT>} WantConnectorType 
     * @param {Pointer<IMSMQMessage4>} ppmsg 
     * @returns {HRESULT} 
     */
    PeekNext(WantDestinationQueue, WantBody, ReceiveTimeout, WantConnectorType, ppmsg) {
        result := ComCall(23, this, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", ReceiveTimeout, "ptr", WantConnectorType, "ptr*", ppmsg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} ReceiveTimeout 
     * @param {Pointer<VARIANT>} WantConnectorType 
     * @param {Pointer<IMSMQMessage4>} ppmsg 
     * @returns {HRESULT} 
     */
    PeekCurrent(WantDestinationQueue, WantBody, ReceiveTimeout, WantConnectorType, ppmsg) {
        result := ComCall(24, this, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", ReceiveTimeout, "ptr", WantConnectorType, "ptr*", ppmsg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppcolProperties 
     * @returns {HRESULT} 
     */
    get_Properties(ppcolProperties) {
        result := ComCall(25, this, "ptr*", ppcolProperties, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarHandle 
     * @returns {HRESULT} 
     */
    get_Handle2(pvarHandle) {
        result := ComCall(26, this, "ptr", pvarHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} LookupId 
     * @param {Pointer<VARIANT>} Transaction 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} WantConnectorType 
     * @param {Pointer<IMSMQMessage4>} ppmsg 
     * @returns {HRESULT} 
     */
    ReceiveByLookupId(LookupId, Transaction, WantDestinationQueue, WantBody, WantConnectorType, ppmsg) {
        result := ComCall(27, this, "ptr", LookupId, "ptr", Transaction, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", WantConnectorType, "ptr*", ppmsg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} LookupId 
     * @param {Pointer<VARIANT>} Transaction 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} WantConnectorType 
     * @param {Pointer<IMSMQMessage4>} ppmsg 
     * @returns {HRESULT} 
     */
    ReceiveNextByLookupId(LookupId, Transaction, WantDestinationQueue, WantBody, WantConnectorType, ppmsg) {
        result := ComCall(28, this, "ptr", LookupId, "ptr", Transaction, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", WantConnectorType, "ptr*", ppmsg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} LookupId 
     * @param {Pointer<VARIANT>} Transaction 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} WantConnectorType 
     * @param {Pointer<IMSMQMessage4>} ppmsg 
     * @returns {HRESULT} 
     */
    ReceivePreviousByLookupId(LookupId, Transaction, WantDestinationQueue, WantBody, WantConnectorType, ppmsg) {
        result := ComCall(29, this, "ptr", LookupId, "ptr", Transaction, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", WantConnectorType, "ptr*", ppmsg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Transaction 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} WantConnectorType 
     * @param {Pointer<IMSMQMessage4>} ppmsg 
     * @returns {HRESULT} 
     */
    ReceiveFirstByLookupId(Transaction, WantDestinationQueue, WantBody, WantConnectorType, ppmsg) {
        result := ComCall(30, this, "ptr", Transaction, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", WantConnectorType, "ptr*", ppmsg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Transaction 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} WantConnectorType 
     * @param {Pointer<IMSMQMessage4>} ppmsg 
     * @returns {HRESULT} 
     */
    ReceiveLastByLookupId(Transaction, WantDestinationQueue, WantBody, WantConnectorType, ppmsg) {
        result := ComCall(31, this, "ptr", Transaction, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", WantConnectorType, "ptr*", ppmsg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} LookupId 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} WantConnectorType 
     * @param {Pointer<IMSMQMessage4>} ppmsg 
     * @returns {HRESULT} 
     */
    PeekByLookupId(LookupId, WantDestinationQueue, WantBody, WantConnectorType, ppmsg) {
        result := ComCall(32, this, "ptr", LookupId, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", WantConnectorType, "ptr*", ppmsg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} LookupId 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} WantConnectorType 
     * @param {Pointer<IMSMQMessage4>} ppmsg 
     * @returns {HRESULT} 
     */
    PeekNextByLookupId(LookupId, WantDestinationQueue, WantBody, WantConnectorType, ppmsg) {
        result := ComCall(33, this, "ptr", LookupId, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", WantConnectorType, "ptr*", ppmsg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} LookupId 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} WantConnectorType 
     * @param {Pointer<IMSMQMessage4>} ppmsg 
     * @returns {HRESULT} 
     */
    PeekPreviousByLookupId(LookupId, WantDestinationQueue, WantBody, WantConnectorType, ppmsg) {
        result := ComCall(34, this, "ptr", LookupId, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", WantConnectorType, "ptr*", ppmsg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} WantConnectorType 
     * @param {Pointer<IMSMQMessage4>} ppmsg 
     * @returns {HRESULT} 
     */
    PeekFirstByLookupId(WantDestinationQueue, WantBody, WantConnectorType, ppmsg) {
        result := ComCall(35, this, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", WantConnectorType, "ptr*", ppmsg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} WantConnectorType 
     * @param {Pointer<IMSMQMessage4>} ppmsg 
     * @returns {HRESULT} 
     */
    PeekLastByLookupId(WantDestinationQueue, WantBody, WantConnectorType, ppmsg) {
        result := ComCall(36, this, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", WantConnectorType, "ptr*", ppmsg, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Purge() {
        result := ComCall(37, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pisOpen 
     * @returns {HRESULT} 
     */
    get_IsOpen2(pisOpen) {
        result := ComCall(38, this, "ptr", pisOpen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} LookupId 
     * @param {Pointer<VARIANT>} Transaction 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} WantConnectorType 
     * @param {Pointer<IMSMQMessage4>} ppmsg 
     * @returns {HRESULT} 
     */
    ReceiveByLookupIdAllowPeek(LookupId, Transaction, WantDestinationQueue, WantBody, WantConnectorType, ppmsg) {
        result := ComCall(39, this, "ptr", LookupId, "ptr", Transaction, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", WantConnectorType, "ptr*", ppmsg, "HRESULT")
        return result
    }
}
