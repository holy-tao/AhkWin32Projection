#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDebugApplicationNode.ahk" { IDebugApplicationNode }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct AsyncIDebugApplicationNodeEvents extends IUnknown {
    /**
     * The interface identifier for AsyncIDebugApplicationNodeEvents
     * @type {Guid}
     */
    static IID := Guid("{a2e3aa3b-aa8d-4ebf-84cd-648b737b8c13}")

    /**
     * The class identifier for AsyncIDebugApplicationNodeEvents
     * @type {Guid}
     */
    static CLSID := Guid("{a2e3aa3b-aa8d-4ebf-84cd-648b737b8c13}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for AsyncIDebugApplicationNodeEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Begin_onAddChild     : IntPtr
        Finish_onAddChild    : IntPtr
        Begin_onRemoveChild  : IntPtr
        Finish_onRemoveChild : IntPtr
        Begin_onDetach       : IntPtr
        Finish_onDetach      : IntPtr
        Begin_onAttach       : IntPtr
        Finish_onAttach      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := AsyncIDebugApplicationNodeEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IDebugApplicationNode} prddpChild 
     * @returns {HRESULT} 
     */
    Begin_onAddChild(prddpChild) {
        result := ComCall(3, this, "ptr", prddpChild, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Finish_onAddChild() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugApplicationNode} prddpChild 
     * @returns {HRESULT} 
     */
    Begin_onRemoveChild(prddpChild) {
        result := ComCall(5, this, "ptr", prddpChild, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Finish_onRemoveChild() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Begin_onDetach() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Finish_onDetach() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugApplicationNode} prddpParent 
     * @returns {HRESULT} 
     */
    Begin_onAttach(prddpParent) {
        result := ComCall(9, this, "ptr", prddpParent, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Finish_onAttach() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (AsyncIDebugApplicationNodeEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Begin_onAddChild := CallbackCreate(GetMethod(implObj, "Begin_onAddChild"), flags, 2)
        this.vtbl.Finish_onAddChild := CallbackCreate(GetMethod(implObj, "Finish_onAddChild"), flags, 1)
        this.vtbl.Begin_onRemoveChild := CallbackCreate(GetMethod(implObj, "Begin_onRemoveChild"), flags, 2)
        this.vtbl.Finish_onRemoveChild := CallbackCreate(GetMethod(implObj, "Finish_onRemoveChild"), flags, 1)
        this.vtbl.Begin_onDetach := CallbackCreate(GetMethod(implObj, "Begin_onDetach"), flags, 1)
        this.vtbl.Finish_onDetach := CallbackCreate(GetMethod(implObj, "Finish_onDetach"), flags, 1)
        this.vtbl.Begin_onAttach := CallbackCreate(GetMethod(implObj, "Begin_onAttach"), flags, 2)
        this.vtbl.Finish_onAttach := CallbackCreate(GetMethod(implObj, "Finish_onAttach"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Begin_onAddChild)
        CallbackFree(this.vtbl.Finish_onAddChild)
        CallbackFree(this.vtbl.Begin_onRemoveChild)
        CallbackFree(this.vtbl.Finish_onRemoveChild)
        CallbackFree(this.vtbl.Begin_onDetach)
        CallbackFree(this.vtbl.Finish_onDetach)
        CallbackFree(this.vtbl.Begin_onAttach)
        CallbackFree(this.vtbl.Finish_onAttach)
    }
}
