#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a method that provides a simple, standard mechanism for objects to query a client for permission to continue an operation.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iquerycontinue
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IQueryContinue extends IUnknown {
    /**
     * The interface identifier for IQueryContinue
     * @type {Guid}
     */
    static IID := Guid("{7307055c-b24a-486b-9f25-163e597a28a9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IQueryContinue interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        QueryContinue : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IQueryContinue.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns S_OK if the operation associated with the current instance of this interface should continue.
     * @remarks
     * In typical usage, a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iquerycontinue">IQueryContinue</a> interface is passed to a method of another object.	That object, in turn, runs this method periodically to determine whether to continue its actions. For example, if a user clicks a cancel button, this method will start returning <b>S_FALSE</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns <b>S_OK</b> if the calling application should continue, <b>S_FALSE</b> if not.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iquerycontinue-querycontinue
     */
    QueryContinue() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IQueryContinue.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.QueryContinue := CallbackCreate(GetMethod(implObj, "QueryContinue"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.QueryContinue)
    }
}
