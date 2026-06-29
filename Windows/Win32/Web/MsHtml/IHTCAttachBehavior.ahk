#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTCAttachBehavior extends IDispatch {
    /**
     * The interface identifier for IHTCAttachBehavior
     * @type {Guid}
     */
    static IID := Guid("{3050f5f4-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTCAttachBehavior
     * @type {Guid}
     */
    static CLSID := Guid("{3050f5f5-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTCAttachBehavior interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        fireEvent   : IntPtr
        detachEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTCAttachBehavior.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IDispatch} evt 
     * @returns {HRESULT} 
     */
    fireEvent(evt) {
        result := ComCall(7, this, "ptr", evt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    detachEvent() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHTCAttachBehavior.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.fireEvent := CallbackCreate(GetMethod(implObj, "fireEvent"), flags, 2)
        this.vtbl.detachEvent := CallbackCreate(GetMethod(implObj, "detachEvent"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.fireEvent)
        CallbackFree(this.vtbl.detachEvent)
    }
}
