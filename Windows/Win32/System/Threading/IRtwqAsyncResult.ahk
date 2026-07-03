#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides information about the result of an asynchronous operation. (IRtwqAsyncResult)
 * @see https://learn.microsoft.com/windows/win32/api/rtworkq/nn-rtworkq-irtwqasyncresult
 * @namespace Windows.Win32.System.Threading
 */
export default struct IRtwqAsyncResult extends IUnknown {
    /**
     * The interface identifier for IRtwqAsyncResult
     * @type {Guid}
     */
    static IID := Guid("{ac6b7889-0740-4d51-8619-905994a55cc6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRtwqAsyncResult interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetState         : IntPtr
        GetStatus        : IntPtr
        SetStatus        : IntPtr
        GetObject        : IntPtr
        GetStateNoAddRef : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRtwqAsyncResult.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns the state object specified by the caller in the asynchronous Begin method. (IRtwqAsyncResult.GetState)
     * @returns {IUnknown} Receives a pointer to the state object's <b>IUnknown</b> interface. If the value is not <b>NULL</b>, the caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-irtwqasyncresult-getstate
     */
    GetState() {
        result := ComCall(3, this, "ptr*", &ppunkState := 0, "HRESULT")
        return IUnknown(ppunkState)
    }

    /**
     * Returns the status of the asynchronous operation. (IRtwqAsyncResult.GetStatus)
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation completed successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-irtwqasyncresult-getstatus
     */
    GetStatus() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Sets the status of the asynchronous operation. (IRtwqAsyncResult.SetStatus)
     * @param {HRESULT} hrStatus The status of the asynchronous operation.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-irtwqasyncresult-setstatus
     */
    SetStatus(hrStatus) {
        result := ComCall(5, this, "int", hrStatus, "HRESULT")
        return result
    }

    /**
     * Returns an object associated with the asynchronous operation. The type of object, if any, depends on the asynchronous method that was called. (IRtwqAsyncResult.GetObject)
     * @returns {IUnknown} Receives a pointer to the object's <b>IUnknown</b> interface. If no object is associated with the operation, this parameter receives the value <b>NULL</b>. If the value is not <b>NULL</b>, the caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-irtwqasyncresult-getobject
     */
    GetObject() {
        result := ComCall(6, this, "ptr*", &ppObject := 0, "HRESULT")
        return IUnknown(ppObject)
    }

    /**
     * Returns the state object specified by the caller in the asynchronous Begin method, without incrementing the object's reference count. (IRtwqAsyncResult.GetStateNoAddRef)
     * @returns {IUnknown} Returns a pointer to the state object's <b>IUnknown</b> interface, or <b>NULL</b> if no object was set. This pointer does not have an outstanding reference count. If you store this pointer, you must call <b>AddRef</b> on the pointer.
     * @see https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-irtwqasyncresult-getstatenoaddref
     */
    GetStateNoAddRef() {
        result := ComCall(7, this, IUnknown)
        return result
    }

    Query(iid) {
        if (IRtwqAsyncResult.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetState := CallbackCreate(GetMethod(implObj, "GetState"), flags, 2)
        this.vtbl.GetStatus := CallbackCreate(GetMethod(implObj, "GetStatus"), flags, 1)
        this.vtbl.SetStatus := CallbackCreate(GetMethod(implObj, "SetStatus"), flags, 2)
        this.vtbl.GetObject := CallbackCreate(GetMethod(implObj, "GetObject"), flags, 2)
        this.vtbl.GetStateNoAddRef := CallbackCreate(GetMethod(implObj, "GetStateNoAddRef"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetState)
        CallbackFree(this.vtbl.GetStatus)
        CallbackFree(this.vtbl.SetStatus)
        CallbackFree(this.vtbl.GetObject)
        CallbackFree(this.vtbl.GetStateNoAddRef)
    }
}
