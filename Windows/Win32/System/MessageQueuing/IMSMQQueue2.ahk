#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMSMQMessage.ahk" { IMSMQMessage }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\IMSMQEvent2.ahk" { IMSMQEvent2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMSMQQueueInfo2.ahk" { IMSMQQueueInfo2 }
#Import ".\IMSMQMessage2.ahk" { IMSMQMessage2 }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.System.MessageQueuing
 */
export default struct IMSMQQueue2 extends IDispatch {
    /**
     * The interface identifier for IMSMQQueue2
     * @type {Guid}
     */
    static IID := Guid("{ef0574e0-06d8-11d3-b100-00e02c074f6b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSMQQueue2 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Access         : IntPtr
        get_ShareMode      : IntPtr
        get_QueueInfo      : IntPtr
        get_Handle         : IntPtr
        get_IsOpen         : IntPtr
        Close              : IntPtr
        Receive_v1         : IntPtr
        Peek_v1            : IntPtr
        EnableNotification : IntPtr
        Reset              : IntPtr
        ReceiveCurrent_v1  : IntPtr
        PeekNext_v1        : IntPtr
        PeekCurrent_v1     : IntPtr
        Receive            : IntPtr
        Peek               : IntPtr
        ReceiveCurrent     : IntPtr
        PeekNext           : IntPtr
        PeekCurrent        : IntPtr
        get_Properties     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSMQQueue2.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @type {IMSMQQueueInfo2} 
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
     * @returns {IMSMQQueueInfo2} 
     */
    get_QueueInfo() {
        result := ComCall(9, this, "ptr*", &ppqinfo := 0, "HRESULT")
        return IMSMQQueueInfo2(ppqinfo)
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
        result := ComCall(13, this, VARIANT.Ptr, Transaction, VARIANT.Ptr, WantDestinationQueue, VARIANT.Ptr, WantBody, VARIANT.Ptr, ReceiveTimeout, "ptr*", &ppmsg := 0, "HRESULT")
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
        result := ComCall(14, this, VARIANT.Ptr, WantDestinationQueue, VARIANT.Ptr, WantBody, VARIANT.Ptr, ReceiveTimeout, "ptr*", &ppmsg := 0, "HRESULT")
        return IMSMQMessage(ppmsg)
    }

    /**
     * 
     * @param {IMSMQEvent2} Event 
     * @param {Pointer<VARIANT>} Cursor 
     * @param {Pointer<VARIANT>} ReceiveTimeout 
     * @returns {HRESULT} 
     */
    EnableNotification(Event, Cursor, ReceiveTimeout) {
        result := ComCall(15, this, "ptr", Event, VARIANT.Ptr, Cursor, VARIANT.Ptr, ReceiveTimeout, "HRESULT")
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
        result := ComCall(17, this, VARIANT.Ptr, Transaction, VARIANT.Ptr, WantDestinationQueue, VARIANT.Ptr, WantBody, VARIANT.Ptr, ReceiveTimeout, "ptr*", &ppmsg := 0, "HRESULT")
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
        result := ComCall(18, this, VARIANT.Ptr, WantDestinationQueue, VARIANT.Ptr, WantBody, VARIANT.Ptr, ReceiveTimeout, "ptr*", &ppmsg := 0, "HRESULT")
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
        result := ComCall(19, this, VARIANT.Ptr, WantDestinationQueue, VARIANT.Ptr, WantBody, VARIANT.Ptr, ReceiveTimeout, "ptr*", &ppmsg := 0, "HRESULT")
        return IMSMQMessage(ppmsg)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Transaction 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} ReceiveTimeout 
     * @param {Pointer<VARIANT>} WantConnectorType 
     * @returns {IMSMQMessage2} 
     */
    Receive(Transaction, WantDestinationQueue, WantBody, ReceiveTimeout, WantConnectorType) {
        result := ComCall(20, this, VARIANT.Ptr, Transaction, VARIANT.Ptr, WantDestinationQueue, VARIANT.Ptr, WantBody, VARIANT.Ptr, ReceiveTimeout, VARIANT.Ptr, WantConnectorType, "ptr*", &ppmsg := 0, "HRESULT")
        return IMSMQMessage2(ppmsg)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} ReceiveTimeout 
     * @param {Pointer<VARIANT>} WantConnectorType 
     * @returns {IMSMQMessage2} 
     */
    Peek(WantDestinationQueue, WantBody, ReceiveTimeout, WantConnectorType) {
        result := ComCall(21, this, VARIANT.Ptr, WantDestinationQueue, VARIANT.Ptr, WantBody, VARIANT.Ptr, ReceiveTimeout, VARIANT.Ptr, WantConnectorType, "ptr*", &ppmsg := 0, "HRESULT")
        return IMSMQMessage2(ppmsg)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Transaction 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} ReceiveTimeout 
     * @param {Pointer<VARIANT>} WantConnectorType 
     * @returns {IMSMQMessage2} 
     */
    ReceiveCurrent(Transaction, WantDestinationQueue, WantBody, ReceiveTimeout, WantConnectorType) {
        result := ComCall(22, this, VARIANT.Ptr, Transaction, VARIANT.Ptr, WantDestinationQueue, VARIANT.Ptr, WantBody, VARIANT.Ptr, ReceiveTimeout, VARIANT.Ptr, WantConnectorType, "ptr*", &ppmsg := 0, "HRESULT")
        return IMSMQMessage2(ppmsg)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} ReceiveTimeout 
     * @param {Pointer<VARIANT>} WantConnectorType 
     * @returns {IMSMQMessage2} 
     */
    PeekNext(WantDestinationQueue, WantBody, ReceiveTimeout, WantConnectorType) {
        result := ComCall(23, this, VARIANT.Ptr, WantDestinationQueue, VARIANT.Ptr, WantBody, VARIANT.Ptr, ReceiveTimeout, VARIANT.Ptr, WantConnectorType, "ptr*", &ppmsg := 0, "HRESULT")
        return IMSMQMessage2(ppmsg)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} ReceiveTimeout 
     * @param {Pointer<VARIANT>} WantConnectorType 
     * @returns {IMSMQMessage2} 
     */
    PeekCurrent(WantDestinationQueue, WantBody, ReceiveTimeout, WantConnectorType) {
        result := ComCall(24, this, VARIANT.Ptr, WantDestinationQueue, VARIANT.Ptr, WantBody, VARIANT.Ptr, ReceiveTimeout, VARIANT.Ptr, WantConnectorType, "ptr*", &ppmsg := 0, "HRESULT")
        return IMSMQMessage2(ppmsg)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Properties() {
        result := ComCall(25, this, "ptr*", &ppcolProperties := 0, "HRESULT")
        return IDispatch(ppcolProperties)
    }

    Query(iid) {
        if (IMSMQQueue2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Access := CallbackCreate(GetMethod(implObj, "get_Access"), flags, 2)
        this.vtbl.get_ShareMode := CallbackCreate(GetMethod(implObj, "get_ShareMode"), flags, 2)
        this.vtbl.get_QueueInfo := CallbackCreate(GetMethod(implObj, "get_QueueInfo"), flags, 2)
        this.vtbl.get_Handle := CallbackCreate(GetMethod(implObj, "get_Handle"), flags, 2)
        this.vtbl.get_IsOpen := CallbackCreate(GetMethod(implObj, "get_IsOpen"), flags, 2)
        this.vtbl.Close := CallbackCreate(GetMethod(implObj, "Close"), flags, 1)
        this.vtbl.Receive_v1 := CallbackCreate(GetMethod(implObj, "Receive_v1"), flags, 6)
        this.vtbl.Peek_v1 := CallbackCreate(GetMethod(implObj, "Peek_v1"), flags, 5)
        this.vtbl.EnableNotification := CallbackCreate(GetMethod(implObj, "EnableNotification"), flags, 4)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
        this.vtbl.ReceiveCurrent_v1 := CallbackCreate(GetMethod(implObj, "ReceiveCurrent_v1"), flags, 6)
        this.vtbl.PeekNext_v1 := CallbackCreate(GetMethod(implObj, "PeekNext_v1"), flags, 5)
        this.vtbl.PeekCurrent_v1 := CallbackCreate(GetMethod(implObj, "PeekCurrent_v1"), flags, 5)
        this.vtbl.Receive := CallbackCreate(GetMethod(implObj, "Receive"), flags, 7)
        this.vtbl.Peek := CallbackCreate(GetMethod(implObj, "Peek"), flags, 6)
        this.vtbl.ReceiveCurrent := CallbackCreate(GetMethod(implObj, "ReceiveCurrent"), flags, 7)
        this.vtbl.PeekNext := CallbackCreate(GetMethod(implObj, "PeekNext"), flags, 6)
        this.vtbl.PeekCurrent := CallbackCreate(GetMethod(implObj, "PeekCurrent"), flags, 6)
        this.vtbl.get_Properties := CallbackCreate(GetMethod(implObj, "get_Properties"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Access)
        CallbackFree(this.vtbl.get_ShareMode)
        CallbackFree(this.vtbl.get_QueueInfo)
        CallbackFree(this.vtbl.get_Handle)
        CallbackFree(this.vtbl.get_IsOpen)
        CallbackFree(this.vtbl.Close)
        CallbackFree(this.vtbl.Receive_v1)
        CallbackFree(this.vtbl.Peek_v1)
        CallbackFree(this.vtbl.EnableNotification)
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.ReceiveCurrent_v1)
        CallbackFree(this.vtbl.PeekNext_v1)
        CallbackFree(this.vtbl.PeekCurrent_v1)
        CallbackFree(this.vtbl.Receive)
        CallbackFree(this.vtbl.Peek)
        CallbackFree(this.vtbl.ReceiveCurrent)
        CallbackFree(this.vtbl.PeekNext)
        CallbackFree(this.vtbl.PeekCurrent)
        CallbackFree(this.vtbl.get_Properties)
    }
}
