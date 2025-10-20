#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class IMSMQQueue2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSMQQueue2
     * @type {Guid}
     */
    static IID => Guid("{ef0574e0-06d8-11d3-b100-00e02c074f6b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Access", "get_ShareMode", "get_QueueInfo", "get_Handle", "get_IsOpen", "Close", "Receive_v1", "Peek_v1", "EnableNotification", "Reset", "ReceiveCurrent_v1", "PeekNext_v1", "PeekCurrent_v1", "Receive", "Peek", "ReceiveCurrent", "PeekNext", "PeekCurrent", "get_Properties"]

    /**
     * 
     * @param {Pointer<Integer>} plAccess 
     * @returns {HRESULT} 
     */
    get_Access(plAccess) {
        result := ComCall(7, this, "int*", plAccess, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plShareMode 
     * @returns {HRESULT} 
     */
    get_ShareMode(plShareMode) {
        result := ComCall(8, this, "int*", plShareMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMSMQQueueInfo2>} ppqinfo 
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
        result := ComCall(10, this, "int*", plHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pisOpen 
     * @returns {HRESULT} 
     */
    get_IsOpen(pisOpen) {
        result := ComCall(11, this, "short*", pisOpen, "HRESULT")
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
     * @param {IMSMQEvent2} Event 
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
     * @param {Pointer<IMSMQMessage2>} ppmsg 
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
     * @param {Pointer<IMSMQMessage2>} ppmsg 
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
     * @param {Pointer<IMSMQMessage2>} ppmsg 
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
     * @param {Pointer<IMSMQMessage2>} ppmsg 
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
     * @param {Pointer<IMSMQMessage2>} ppmsg 
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
}
