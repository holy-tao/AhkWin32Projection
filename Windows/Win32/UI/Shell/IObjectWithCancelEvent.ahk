#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Not supported.Supplies a caller with an event that will be signaled by the called object to denote cancellation of a task.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iobjectwithcancelevent
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IObjectWithCancelEvent extends IUnknown {
    /**
     * The interface identifier for IObjectWithCancelEvent
     * @type {Guid}
     */
    static IID := Guid("{f279b885-0ae9-4b85-ac06-ddecf9408941}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IObjectWithCancelEvent interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCancelEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IObjectWithCancelEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves an event that will be sent when an operation is canceled.
     * @remarks
     * Call this function to retrieve an event that will be signaled when the called object cancels the operation it is performing. The caller is responsible for closing the returned handle.
     * @returns {HANDLE} Type: <b>HANDLE*</b>
     * 
     * Pointer to a handle that, when this method successfully returns, is the handle to the cancel event. The caller is responsible for closing this handle when it is no longer needed.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iobjectwithcancelevent-getcancelevent
     */
    GetCancelEvent() {
        phEvent := HANDLE.Owned()
        result := ComCall(3, this, HANDLE.Ptr, phEvent, "HRESULT")
        return phEvent
    }

    Query(iid) {
        if (IObjectWithCancelEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCancelEvent := CallbackCreate(GetMethod(implObj, "GetCancelEvent"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCancelEvent)
    }
}
