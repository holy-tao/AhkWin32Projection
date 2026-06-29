#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMSMQQueue.ahk" { IMSMQQueue }

/**
 * @namespace Windows.Win32.System.MessageQueuing
 */
export default struct IMSMQPrivateEvent extends IDispatch {
    /**
     * The interface identifier for IMSMQPrivateEvent
     * @type {Guid}
     */
    static IID := Guid("{d7ab3341-c9d3-11d1-bb47-0080c7c5a2c0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSMQPrivateEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Hwnd              : IntPtr
        FireArrivedEvent      : IntPtr
        FireArrivedErrorEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSMQPrivateEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Hwnd {
        get => this.get_Hwnd()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Hwnd() {
        result := ComCall(7, this, "int*", &phwnd := 0, "HRESULT")
        return phwnd
    }

    /**
     * 
     * @param {IMSMQQueue} pq 
     * @param {Integer} msgcursor 
     * @returns {HRESULT} 
     */
    FireArrivedEvent(pq, msgcursor) {
        result := ComCall(8, this, "ptr", pq, "int", msgcursor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMSMQQueue} pq 
     * @param {HRESULT} hrStatus 
     * @param {Integer} msgcursor 
     * @returns {HRESULT} 
     */
    FireArrivedErrorEvent(pq, hrStatus, msgcursor) {
        result := ComCall(9, this, "ptr", pq, "int", hrStatus, "int", msgcursor, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMSMQPrivateEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Hwnd := CallbackCreate(GetMethod(implObj, "get_Hwnd"), flags, 2)
        this.vtbl.FireArrivedEvent := CallbackCreate(GetMethod(implObj, "FireArrivedEvent"), flags, 3)
        this.vtbl.FireArrivedErrorEvent := CallbackCreate(GetMethod(implObj, "FireArrivedErrorEvent"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Hwnd)
        CallbackFree(this.vtbl.FireArrivedEvent)
        CallbackFree(this.vtbl.FireArrivedErrorEvent)
    }
}
