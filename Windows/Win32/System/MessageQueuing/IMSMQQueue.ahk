#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class IMSMQQueue extends IDispatch{
    /**
     * The interface identifier for IMSMQQueue
     * @type {Guid}
     */
    static IID => Guid("{d7d6e076-dccd-11d0-aa4b-0060970debae}")

    /**
     * The class identifier for MSMQQueue
     * @type {Guid}
     */
    static CLSID => Guid("{d7d6e079-dccd-11d0-aa4b-0060970debae}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} plAccess 
     * @returns {HRESULT} 
     */
    get_Access(plAccess) {
        result := ComCall(7, this, "int*", plAccess, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plShareMode 
     * @returns {HRESULT} 
     */
    get_ShareMode(plShareMode) {
        result := ComCall(8, this, "int*", plShareMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMSMQQueueInfo>} ppqinfo 
     * @returns {HRESULT} 
     */
    get_QueueInfo(ppqinfo) {
        result := ComCall(9, this, "ptr", ppqinfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plHandle 
     * @returns {HRESULT} 
     */
    get_Handle(plHandle) {
        result := ComCall(10, this, "int*", plHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int16>} pisOpen 
     * @returns {HRESULT} 
     */
    get_IsOpen(pisOpen) {
        result := ComCall(11, this, "short*", pisOpen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

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
    Receive(Transaction, WantDestinationQueue, WantBody, ReceiveTimeout, ppmsg) {
        result := ComCall(13, this, "ptr", Transaction, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", ReceiveTimeout, "ptr", ppmsg, "int")
        if(result != 0)
            throw OSError(result)

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
    Peek(WantDestinationQueue, WantBody, ReceiveTimeout, ppmsg) {
        result := ComCall(14, this, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", ReceiveTimeout, "ptr", ppmsg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMSMQEvent>} Event 
     * @param {Pointer<VARIANT>} Cursor 
     * @param {Pointer<VARIANT>} ReceiveTimeout 
     * @returns {HRESULT} 
     */
    EnableNotification(Event, Cursor, ReceiveTimeout) {
        result := ComCall(15, this, "ptr", Event, "ptr", Cursor, "ptr", ReceiveTimeout, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(16, this, "int")
        if(result != 0)
            throw OSError(result)

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
    ReceiveCurrent(Transaction, WantDestinationQueue, WantBody, ReceiveTimeout, ppmsg) {
        result := ComCall(17, this, "ptr", Transaction, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", ReceiveTimeout, "ptr", ppmsg, "int")
        if(result != 0)
            throw OSError(result)

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
    PeekNext(WantDestinationQueue, WantBody, ReceiveTimeout, ppmsg) {
        result := ComCall(18, this, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", ReceiveTimeout, "ptr", ppmsg, "int")
        if(result != 0)
            throw OSError(result)

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
    PeekCurrent(WantDestinationQueue, WantBody, ReceiveTimeout, ppmsg) {
        result := ComCall(19, this, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", ReceiveTimeout, "ptr", ppmsg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
