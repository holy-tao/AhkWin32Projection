#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMSMQQueueInfo3.ahk
#Include .\IMSMQMessage.ahk
#Include .\IMSMQMessage3.ahk
#Include ..\Com\IDispatch.ahk
#Include ..\Variant\VARIANT.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class IMSMQQueue3 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSMQQueue3
     * @type {Guid}
     */
    static IID => Guid("{eba96b1b-2168-11d3-898c-00e02c074f6b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Access", "get_ShareMode", "get_QueueInfo", "get_Handle", "get_IsOpen", "Close", "Receive_v1", "Peek_v1", "EnableNotification", "Reset", "ReceiveCurrent_v1", "PeekNext_v1", "PeekCurrent_v1", "Receive", "Peek", "ReceiveCurrent", "PeekNext", "PeekCurrent", "get_Properties", "get_Handle2", "ReceiveByLookupId", "ReceiveNextByLookupId", "ReceivePreviousByLookupId", "ReceiveFirstByLookupId", "ReceiveLastByLookupId", "PeekByLookupId", "PeekNextByLookupId", "PeekPreviousByLookupId", "PeekFirstByLookupId", "PeekLastByLookupId", "Purge", "get_IsOpen2"]

    /**
     * @type {Integer} 
     */
    Access {
        get => this.get_Access()
    }

    /**
     * @type {Integer} 
     */
    ShareMode {
        get => this.get_ShareMode()
    }

    /**
     * @type {IMSMQQueueInfo3} 
     */
    QueueInfo {
        get => this.get_QueueInfo()
    }

    /**
     * @type {Integer} 
     */
    Handle {
        get => this.get_Handle()
    }

    /**
     * @type {Integer} 
     */
    IsOpen {
        get => this.get_IsOpen()
    }

    /**
     * @type {IDispatch} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * @type {VARIANT} 
     */
    Handle2 {
        get => this.get_Handle2()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsOpen2 {
        get => this.get_IsOpen2()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Access() {
        result := ComCall(7, this, "int*", &plAccess := 0, "HRESULT")
        return plAccess
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ShareMode() {
        result := ComCall(8, this, "int*", &plShareMode := 0, "HRESULT")
        return plShareMode
    }

    /**
     * 
     * @returns {IMSMQQueueInfo3} 
     */
    get_QueueInfo() {
        result := ComCall(9, this, "ptr*", &ppqinfo := 0, "HRESULT")
        return IMSMQQueueInfo3(ppqinfo)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Handle() {
        result := ComCall(10, this, "int*", &plHandle := 0, "HRESULT")
        return plHandle
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IsOpen() {
        result := ComCall(11, this, "short*", &pisOpen := 0, "HRESULT")
        return pisOpen
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
     * @returns {IMSMQMessage} 
     */
    Receive_v1(Transaction, WantDestinationQueue, WantBody, ReceiveTimeout) {
        result := ComCall(13, this, "ptr", Transaction, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", ReceiveTimeout, "ptr*", &ppmsg := 0, "HRESULT")
        return IMSMQMessage(ppmsg)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} ReceiveTimeout 
     * @returns {IMSMQMessage} 
     */
    Peek_v1(WantDestinationQueue, WantBody, ReceiveTimeout) {
        result := ComCall(14, this, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", ReceiveTimeout, "ptr*", &ppmsg := 0, "HRESULT")
        return IMSMQMessage(ppmsg)
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
     * @returns {IMSMQMessage} 
     */
    ReceiveCurrent_v1(Transaction, WantDestinationQueue, WantBody, ReceiveTimeout) {
        result := ComCall(17, this, "ptr", Transaction, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", ReceiveTimeout, "ptr*", &ppmsg := 0, "HRESULT")
        return IMSMQMessage(ppmsg)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} ReceiveTimeout 
     * @returns {IMSMQMessage} 
     */
    PeekNext_v1(WantDestinationQueue, WantBody, ReceiveTimeout) {
        result := ComCall(18, this, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", ReceiveTimeout, "ptr*", &ppmsg := 0, "HRESULT")
        return IMSMQMessage(ppmsg)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} ReceiveTimeout 
     * @returns {IMSMQMessage} 
     */
    PeekCurrent_v1(WantDestinationQueue, WantBody, ReceiveTimeout) {
        result := ComCall(19, this, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", ReceiveTimeout, "ptr*", &ppmsg := 0, "HRESULT")
        return IMSMQMessage(ppmsg)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Transaction 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} ReceiveTimeout 
     * @param {Pointer<VARIANT>} WantConnectorType 
     * @returns {IMSMQMessage3} 
     */
    Receive(Transaction, WantDestinationQueue, WantBody, ReceiveTimeout, WantConnectorType) {
        result := ComCall(20, this, "ptr", Transaction, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", ReceiveTimeout, "ptr", WantConnectorType, "ptr*", &ppmsg := 0, "HRESULT")
        return IMSMQMessage3(ppmsg)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} ReceiveTimeout 
     * @param {Pointer<VARIANT>} WantConnectorType 
     * @returns {IMSMQMessage3} 
     */
    Peek(WantDestinationQueue, WantBody, ReceiveTimeout, WantConnectorType) {
        result := ComCall(21, this, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", ReceiveTimeout, "ptr", WantConnectorType, "ptr*", &ppmsg := 0, "HRESULT")
        return IMSMQMessage3(ppmsg)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Transaction 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} ReceiveTimeout 
     * @param {Pointer<VARIANT>} WantConnectorType 
     * @returns {IMSMQMessage3} 
     */
    ReceiveCurrent(Transaction, WantDestinationQueue, WantBody, ReceiveTimeout, WantConnectorType) {
        result := ComCall(22, this, "ptr", Transaction, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", ReceiveTimeout, "ptr", WantConnectorType, "ptr*", &ppmsg := 0, "HRESULT")
        return IMSMQMessage3(ppmsg)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} ReceiveTimeout 
     * @param {Pointer<VARIANT>} WantConnectorType 
     * @returns {IMSMQMessage3} 
     */
    PeekNext(WantDestinationQueue, WantBody, ReceiveTimeout, WantConnectorType) {
        result := ComCall(23, this, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", ReceiveTimeout, "ptr", WantConnectorType, "ptr*", &ppmsg := 0, "HRESULT")
        return IMSMQMessage3(ppmsg)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} ReceiveTimeout 
     * @param {Pointer<VARIANT>} WantConnectorType 
     * @returns {IMSMQMessage3} 
     */
    PeekCurrent(WantDestinationQueue, WantBody, ReceiveTimeout, WantConnectorType) {
        result := ComCall(24, this, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", ReceiveTimeout, "ptr", WantConnectorType, "ptr*", &ppmsg := 0, "HRESULT")
        return IMSMQMessage3(ppmsg)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Properties() {
        result := ComCall(25, this, "ptr*", &ppcolProperties := 0, "HRESULT")
        return IDispatch(ppcolProperties)
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Handle2() {
        pvarHandle := VARIANT()
        result := ComCall(26, this, "ptr", pvarHandle, "HRESULT")
        return pvarHandle
    }

    /**
     * 
     * @param {VARIANT} LookupId 
     * @param {Pointer<VARIANT>} Transaction 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} WantConnectorType 
     * @returns {IMSMQMessage3} 
     */
    ReceiveByLookupId(LookupId, Transaction, WantDestinationQueue, WantBody, WantConnectorType) {
        result := ComCall(27, this, "ptr", LookupId, "ptr", Transaction, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", WantConnectorType, "ptr*", &ppmsg := 0, "HRESULT")
        return IMSMQMessage3(ppmsg)
    }

    /**
     * 
     * @param {VARIANT} LookupId 
     * @param {Pointer<VARIANT>} Transaction 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} WantConnectorType 
     * @returns {IMSMQMessage3} 
     */
    ReceiveNextByLookupId(LookupId, Transaction, WantDestinationQueue, WantBody, WantConnectorType) {
        result := ComCall(28, this, "ptr", LookupId, "ptr", Transaction, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", WantConnectorType, "ptr*", &ppmsg := 0, "HRESULT")
        return IMSMQMessage3(ppmsg)
    }

    /**
     * 
     * @param {VARIANT} LookupId 
     * @param {Pointer<VARIANT>} Transaction 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} WantConnectorType 
     * @returns {IMSMQMessage3} 
     */
    ReceivePreviousByLookupId(LookupId, Transaction, WantDestinationQueue, WantBody, WantConnectorType) {
        result := ComCall(29, this, "ptr", LookupId, "ptr", Transaction, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", WantConnectorType, "ptr*", &ppmsg := 0, "HRESULT")
        return IMSMQMessage3(ppmsg)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Transaction 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} WantConnectorType 
     * @returns {IMSMQMessage3} 
     */
    ReceiveFirstByLookupId(Transaction, WantDestinationQueue, WantBody, WantConnectorType) {
        result := ComCall(30, this, "ptr", Transaction, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", WantConnectorType, "ptr*", &ppmsg := 0, "HRESULT")
        return IMSMQMessage3(ppmsg)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Transaction 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} WantConnectorType 
     * @returns {IMSMQMessage3} 
     */
    ReceiveLastByLookupId(Transaction, WantDestinationQueue, WantBody, WantConnectorType) {
        result := ComCall(31, this, "ptr", Transaction, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", WantConnectorType, "ptr*", &ppmsg := 0, "HRESULT")
        return IMSMQMessage3(ppmsg)
    }

    /**
     * 
     * @param {VARIANT} LookupId 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} WantConnectorType 
     * @returns {IMSMQMessage3} 
     */
    PeekByLookupId(LookupId, WantDestinationQueue, WantBody, WantConnectorType) {
        result := ComCall(32, this, "ptr", LookupId, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", WantConnectorType, "ptr*", &ppmsg := 0, "HRESULT")
        return IMSMQMessage3(ppmsg)
    }

    /**
     * 
     * @param {VARIANT} LookupId 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} WantConnectorType 
     * @returns {IMSMQMessage3} 
     */
    PeekNextByLookupId(LookupId, WantDestinationQueue, WantBody, WantConnectorType) {
        result := ComCall(33, this, "ptr", LookupId, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", WantConnectorType, "ptr*", &ppmsg := 0, "HRESULT")
        return IMSMQMessage3(ppmsg)
    }

    /**
     * 
     * @param {VARIANT} LookupId 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} WantConnectorType 
     * @returns {IMSMQMessage3} 
     */
    PeekPreviousByLookupId(LookupId, WantDestinationQueue, WantBody, WantConnectorType) {
        result := ComCall(34, this, "ptr", LookupId, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", WantConnectorType, "ptr*", &ppmsg := 0, "HRESULT")
        return IMSMQMessage3(ppmsg)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} WantConnectorType 
     * @returns {IMSMQMessage3} 
     */
    PeekFirstByLookupId(WantDestinationQueue, WantBody, WantConnectorType) {
        result := ComCall(35, this, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", WantConnectorType, "ptr*", &ppmsg := 0, "HRESULT")
        return IMSMQMessage3(ppmsg)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} WantConnectorType 
     * @returns {IMSMQMessage3} 
     */
    PeekLastByLookupId(WantDestinationQueue, WantBody, WantConnectorType) {
        result := ComCall(36, this, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", WantConnectorType, "ptr*", &ppmsg := 0, "HRESULT")
        return IMSMQMessage3(ppmsg)
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
     * @returns {VARIANT_BOOL} 
     */
    get_IsOpen2() {
        result := ComCall(38, this, "short*", &pisOpen := 0, "HRESULT")
        return pisOpen
    }
}
