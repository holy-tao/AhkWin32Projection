#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * This optional interface enables the protocol handler to perform an action on the thread used for filtering in the protocol host.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/nn-searchapi-isearchprotocolthreadcontext
 * @namespace Windows.Win32.System.Search
 */
export default struct ISearchProtocolThreadContext extends IUnknown {
    /**
     * The interface identifier for ISearchProtocolThreadContext
     * @type {Guid}
     */
    static IID := Guid("{c73106e1-ac80-11d1-8df3-00c04fb6ef4f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISearchProtocolThreadContext interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ThreadInit     : IntPtr
        ThreadShutdown : IntPtr
        ThreadIdle     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISearchProtocolThreadContext.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes communication between the protocol handler and the protocol host.
     * @remarks
     * After being created by the protocol host, a thread calls this method on the protocol handler to initialize communication between the protocol handler and its host. Depending on the protocol handler, the host might need to provide some per-thread context (for example, a logon session).
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchprotocolthreadcontext-threadinit
     */
    ThreadInit() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Notifies the protocol handler that the thread is being shut down.
     * @remarks
     * When the protocol host is shut down, it calls this method as the last operation before terminating the filtering thread. Depending on the protocol handler, there might be some per-thread context, such as a logon session, that the protocol handler needs to clean up.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchprotocolthreadcontext-threadshutdown
     */
    ThreadShutdown() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Notifies the protocol handler that the filtering thread is idle, so that the protocol handler can clean up any cache it might have built up.
     * @remarks
     * This method is called when the filtering thread is waiting for new requests from the indexer service so the protocol handler can use this idle time to clean up.
     * @param {Integer} dwTimeElaspedSinceLastCallInMS Type: <b>DWORD</b>
     * 
     * Passes the idle time, in milliseconds, to the protocol handler.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchprotocolthreadcontext-threadidle
     */
    ThreadIdle(dwTimeElaspedSinceLastCallInMS) {
        result := ComCall(5, this, "uint", dwTimeElaspedSinceLastCallInMS, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISearchProtocolThreadContext.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ThreadInit := CallbackCreate(GetMethod(implObj, "ThreadInit"), flags, 1)
        this.vtbl.ThreadShutdown := CallbackCreate(GetMethod(implObj, "ThreadShutdown"), flags, 1)
        this.vtbl.ThreadIdle := CallbackCreate(GetMethod(implObj, "ThreadIdle"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ThreadInit)
        CallbackFree(this.vtbl.ThreadShutdown)
        CallbackFree(this.vtbl.ThreadIdle)
    }
}
