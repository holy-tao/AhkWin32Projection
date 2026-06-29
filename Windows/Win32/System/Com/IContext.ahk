#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IEnumContextProps.ahk" { IEnumContextProps }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * The IContext (objidlbase.h) interface supports setting COM+ context properties.
 * @remarks
 * An instance of this interface for the current context can be obtained using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cogetobjectcontext">CoGetObjectContext</a>.
 * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nn-objidlbase-icontext
 * @namespace Windows.Win32.System.Com
 */
export default struct IContext extends IUnknown {
    /**
     * The interface identifier for IContext
     * @type {Guid}
     */
    static IID := Guid("{000001c0-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IContext interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetProperty      : IntPtr
        RemoveProperty   : IntPtr
        GetProperty      : IntPtr
        EnumContextProps : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IContext.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IContext::SetProperty (objidlbase.h) method adds the specified context property to the object context.
     * @param {Pointer<Guid>} rpolicyId A GUID that uniquely identifies this context property.
     * @param {Integer} flags This parameter is reserved and must be zero.
     * @param {IUnknown} pUnk A pointer to the context property to be added.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-icontext-setproperty
     */
    SetProperty(rpolicyId, flags, pUnk) {
        result := ComCall(3, this, Guid.Ptr, rpolicyId, "uint", flags, "ptr", pUnk, "HRESULT")
        return result
    }

    /**
     * The IContext::RemoveProperty (objidlbase.h) method removes the specified context property from the context.
     * @param {Pointer<Guid>} rPolicyId The GUID that uniquely identifies the context property to be removed.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-icontext-removeproperty
     */
    RemoveProperty(rPolicyId) {
        result := ComCall(4, this, Guid.Ptr, rPolicyId, "HRESULT")
        return result
    }

    /**
     * The IContext::GetProperty (objidlbase.h) method retrieves the specified context property from the context.
     * @param {Pointer<Guid>} rGuid The GUID that uniquely identifies the context property to be retrieved.
     * @param {Pointer<Integer>} pFlags The address of the variable that receives the flags associated with the property.
     * @param {Pointer<IUnknown>} ppUnk The address of the variable that receives the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface pointer of the requested context property.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-icontext-getproperty
     */
    GetProperty(rGuid, pFlags, ppUnk) {
        pFlagsMarshal := pFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, Guid.Ptr, rGuid, pFlagsMarshal, pFlags, IUnknown.Ptr, ppUnk, "HRESULT")
        return result
    }

    /**
     * The IContext::EnumContextProps (objidlbase.h) method returns an IEnumContextProps interface pointer that can be used to enumerate the context properties.
     * @returns {IEnumContextProps} The address of the variable that receives the new <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumcontextprops">IEnumContextProps</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-icontext-enumcontextprops
     */
    EnumContextProps() {
        result := ComCall(6, this, "ptr*", &ppEnumContextProps := 0, "HRESULT")
        return IEnumContextProps(ppEnumContextProps)
    }

    Query(iid) {
        if (IContext.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetProperty := CallbackCreate(GetMethod(implObj, "SetProperty"), flags, 4)
        this.vtbl.RemoveProperty := CallbackCreate(GetMethod(implObj, "RemoveProperty"), flags, 2)
        this.vtbl.GetProperty := CallbackCreate(GetMethod(implObj, "GetProperty"), flags, 4)
        this.vtbl.EnumContextProps := CallbackCreate(GetMethod(implObj, "EnumContextProps"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetProperty)
        CallbackFree(this.vtbl.RemoveProperty)
        CallbackFree(this.vtbl.GetProperty)
        CallbackFree(this.vtbl.EnumContextProps)
    }
}
