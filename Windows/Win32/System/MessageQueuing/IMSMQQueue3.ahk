#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMSMQMessage3.ahk" { IMSMQMessage3 }
#Import ".\IMSMQMessage.ahk" { IMSMQMessage }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IMSMQEvent3.ahk" { IMSMQEvent3 }
#Import ".\IMSMQQueueInfo3.ahk" { IMSMQQueueInfo3 }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.System.MessageQueuing
 */
export default struct IMSMQQueue3 extends IDispatch {
    /**
     * The interface identifier for IMSMQQueue3
     * @type {Guid}
     */
    static IID := Guid("{eba96b1b-2168-11d3-898c-00e02c074f6b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSMQQueue3 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Access                : IntPtr
        get_ShareMode             : IntPtr
        get_QueueInfo             : IntPtr
        get_Handle                : IntPtr
        get_IsOpen                : IntPtr
        Close                     : IntPtr
        Receive_v1                : IntPtr
        Peek_v1                   : IntPtr
        EnableNotification        : IntPtr
        Reset                     : IntPtr
        ReceiveCurrent_v1         : IntPtr
        PeekNext_v1               : IntPtr
        PeekCurrent_v1            : IntPtr
        Receive                   : IntPtr
        Peek                      : IntPtr
        ReceiveCurrent            : IntPtr
        PeekNext                  : IntPtr
        PeekCurrent               : IntPtr
        get_Properties            : IntPtr
        get_Handle2               : IntPtr
        ReceiveByLookupId         : IntPtr
        ReceiveNextByLookupId     : IntPtr
        ReceivePreviousByLookupId : IntPtr
        ReceiveFirstByLookupId    : IntPtr
        ReceiveLastByLookupId     : IntPtr
        PeekByLookupId            : IntPtr
        PeekNextByLookupId        : IntPtr
        PeekPreviousByLookupId    : IntPtr
        PeekFirstByLookupId       : IntPtr
        PeekLastByLookupId        : IntPtr
        Purge                     : IntPtr
        get_IsOpen2               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSMQQueue3.Vtbl()
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
     * @param {IMSMQEvent3} Event 
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
     * @returns {IMSMQMessage3} 
     */
    Receive(Transaction, WantDestinationQueue, WantBody, ReceiveTimeout, WantConnectorType) {
        result := ComCall(20, this, VARIANT.Ptr, Transaction, VARIANT.Ptr, WantDestinationQueue, VARIANT.Ptr, WantBody, VARIANT.Ptr, ReceiveTimeout, VARIANT.Ptr, WantConnectorType, "ptr*", &ppmsg := 0, "HRESULT")
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
        result := ComCall(21, this, VARIANT.Ptr, WantDestinationQueue, VARIANT.Ptr, WantBody, VARIANT.Ptr, ReceiveTimeout, VARIANT.Ptr, WantConnectorType, "ptr*", &ppmsg := 0, "HRESULT")
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
        result := ComCall(22, this, VARIANT.Ptr, Transaction, VARIANT.Ptr, WantDestinationQueue, VARIANT.Ptr, WantBody, VARIANT.Ptr, ReceiveTimeout, VARIANT.Ptr, WantConnectorType, "ptr*", &ppmsg := 0, "HRESULT")
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
        result := ComCall(23, this, VARIANT.Ptr, WantDestinationQueue, VARIANT.Ptr, WantBody, VARIANT.Ptr, ReceiveTimeout, VARIANT.Ptr, WantConnectorType, "ptr*", &ppmsg := 0, "HRESULT")
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
        result := ComCall(24, this, VARIANT.Ptr, WantDestinationQueue, VARIANT.Ptr, WantBody, VARIANT.Ptr, ReceiveTimeout, VARIANT.Ptr, WantConnectorType, "ptr*", &ppmsg := 0, "HRESULT")
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
        result := ComCall(26, this, VARIANT.Ptr, pvarHandle, "HRESULT")
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
        result := ComCall(27, this, VARIANT, LookupId, VARIANT.Ptr, Transaction, VARIANT.Ptr, WantDestinationQueue, VARIANT.Ptr, WantBody, VARIANT.Ptr, WantConnectorType, "ptr*", &ppmsg := 0, "HRESULT")
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
        result := ComCall(28, this, VARIANT, LookupId, VARIANT.Ptr, Transaction, VARIANT.Ptr, WantDestinationQueue, VARIANT.Ptr, WantBody, VARIANT.Ptr, WantConnectorType, "ptr*", &ppmsg := 0, "HRESULT")
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
        result := ComCall(29, this, VARIANT, LookupId, VARIANT.Ptr, Transaction, VARIANT.Ptr, WantDestinationQueue, VARIANT.Ptr, WantBody, VARIANT.Ptr, WantConnectorType, "ptr*", &ppmsg := 0, "HRESULT")
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
        result := ComCall(30, this, VARIANT.Ptr, Transaction, VARIANT.Ptr, WantDestinationQueue, VARIANT.Ptr, WantBody, VARIANT.Ptr, WantConnectorType, "ptr*", &ppmsg := 0, "HRESULT")
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
        result := ComCall(31, this, VARIANT.Ptr, Transaction, VARIANT.Ptr, WantDestinationQueue, VARIANT.Ptr, WantBody, VARIANT.Ptr, WantConnectorType, "ptr*", &ppmsg := 0, "HRESULT")
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
        result := ComCall(32, this, VARIANT, LookupId, VARIANT.Ptr, WantDestinationQueue, VARIANT.Ptr, WantBody, VARIANT.Ptr, WantConnectorType, "ptr*", &ppmsg := 0, "HRESULT")
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
        result := ComCall(33, this, VARIANT, LookupId, VARIANT.Ptr, WantDestinationQueue, VARIANT.Ptr, WantBody, VARIANT.Ptr, WantConnectorType, "ptr*", &ppmsg := 0, "HRESULT")
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
        result := ComCall(34, this, VARIANT, LookupId, VARIANT.Ptr, WantDestinationQueue, VARIANT.Ptr, WantBody, VARIANT.Ptr, WantConnectorType, "ptr*", &ppmsg := 0, "HRESULT")
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
        result := ComCall(35, this, VARIANT.Ptr, WantDestinationQueue, VARIANT.Ptr, WantBody, VARIANT.Ptr, WantConnectorType, "ptr*", &ppmsg := 0, "HRESULT")
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
        result := ComCall(36, this, VARIANT.Ptr, WantDestinationQueue, VARIANT.Ptr, WantBody, VARIANT.Ptr, WantConnectorType, "ptr*", &ppmsg := 0, "HRESULT")
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
        result := ComCall(38, this, VARIANT_BOOL.Ptr, &pisOpen := 0, "HRESULT")
        return pisOpen
    }

    Query(iid) {
        if (IMSMQQueue3.IID.Equals(iid)) {
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
        this.vtbl.get_Handle2 := CallbackCreate(GetMethod(implObj, "get_Handle2"), flags, 2)
        this.vtbl.ReceiveByLookupId := CallbackCreate(GetMethod(implObj, "ReceiveByLookupId"), flags, 7)
        this.vtbl.ReceiveNextByLookupId := CallbackCreate(GetMethod(implObj, "ReceiveNextByLookupId"), flags, 7)
        this.vtbl.ReceivePreviousByLookupId := CallbackCreate(GetMethod(implObj, "ReceivePreviousByLookupId"), flags, 7)
        this.vtbl.ReceiveFirstByLookupId := CallbackCreate(GetMethod(implObj, "ReceiveFirstByLookupId"), flags, 6)
        this.vtbl.ReceiveLastByLookupId := CallbackCreate(GetMethod(implObj, "ReceiveLastByLookupId"), flags, 6)
        this.vtbl.PeekByLookupId := CallbackCreate(GetMethod(implObj, "PeekByLookupId"), flags, 6)
        this.vtbl.PeekNextByLookupId := CallbackCreate(GetMethod(implObj, "PeekNextByLookupId"), flags, 6)
        this.vtbl.PeekPreviousByLookupId := CallbackCreate(GetMethod(implObj, "PeekPreviousByLookupId"), flags, 6)
        this.vtbl.PeekFirstByLookupId := CallbackCreate(GetMethod(implObj, "PeekFirstByLookupId"), flags, 5)
        this.vtbl.PeekLastByLookupId := CallbackCreate(GetMethod(implObj, "PeekLastByLookupId"), flags, 5)
        this.vtbl.Purge := CallbackCreate(GetMethod(implObj, "Purge"), flags, 1)
        this.vtbl.get_IsOpen2 := CallbackCreate(GetMethod(implObj, "get_IsOpen2"), flags, 2)
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
        CallbackFree(this.vtbl.get_Handle2)
        CallbackFree(this.vtbl.ReceiveByLookupId)
        CallbackFree(this.vtbl.ReceiveNextByLookupId)
        CallbackFree(this.vtbl.ReceivePreviousByLookupId)
        CallbackFree(this.vtbl.ReceiveFirstByLookupId)
        CallbackFree(this.vtbl.ReceiveLastByLookupId)
        CallbackFree(this.vtbl.PeekByLookupId)
        CallbackFree(this.vtbl.PeekNextByLookupId)
        CallbackFree(this.vtbl.PeekPreviousByLookupId)
        CallbackFree(this.vtbl.PeekFirstByLookupId)
        CallbackFree(this.vtbl.PeekLastByLookupId)
        CallbackFree(this.vtbl.Purge)
        CallbackFree(this.vtbl.get_IsOpen2)
    }
}
