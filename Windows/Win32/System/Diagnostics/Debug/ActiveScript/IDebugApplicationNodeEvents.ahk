#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDebugApplicationNode.ahk" { IDebugApplicationNode }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IDebugApplicationNodeEvents extends IUnknown {
    /**
     * The interface identifier for IDebugApplicationNodeEvents
     * @type {Guid}
     */
    static IID := Guid("{51973c35-cb0c-11d0-b5c9-00a0244a0e7a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugApplicationNodeEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        onAddChild    : IntPtr
        onRemoveChild : IntPtr
        onDetach      : IntPtr
        onAttach      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugApplicationNodeEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IDebugApplicationNode} prddpChild 
     * @returns {HRESULT} 
     */
    onAddChild(prddpChild) {
        result := ComCall(3, this, "ptr", prddpChild, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugApplicationNode} prddpChild 
     * @returns {HRESULT} 
     */
    onRemoveChild(prddpChild) {
        result := ComCall(4, this, "ptr", prddpChild, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    onDetach() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugApplicationNode} prddpParent 
     * @returns {HRESULT} 
     */
    onAttach(prddpParent) {
        result := ComCall(6, this, "ptr", prddpParent, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDebugApplicationNodeEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.onAddChild := CallbackCreate(GetMethod(implObj, "onAddChild"), flags, 2)
        this.vtbl.onRemoveChild := CallbackCreate(GetMethod(implObj, "onRemoveChild"), flags, 2)
        this.vtbl.onDetach := CallbackCreate(GetMethod(implObj, "onDetach"), flags, 1)
        this.vtbl.onAttach := CallbackCreate(GetMethod(implObj, "onAttach"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.onAddChild)
        CallbackFree(this.vtbl.onRemoveChild)
        CallbackFree(this.vtbl.onDetach)
        CallbackFree(this.vtbl.onAttach)
    }
}
