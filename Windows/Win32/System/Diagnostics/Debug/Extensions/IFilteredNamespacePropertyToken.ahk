#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IModelMethod.ahk" { IModelMethod }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IFilteredNamespacePropertyToken extends IUnknown {
    /**
     * The interface identifier for IFilteredNamespacePropertyToken
     * @type {Guid}
     */
    static IID := Guid("{63832802-2db3-4de7-b76c-197ac15b5ec6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFilteredNamespacePropertyToken interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RemoveFilter : IntPtr
        GetFilter    : IntPtr
        TrySetFilter : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFilteredNamespacePropertyToken.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveFilter() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IModelMethod} 
     */
    GetFilter() {
        result := ComCall(4, this, "ptr*", &ppFilter := 0, "HRESULT")
        return IModelMethod(ppFilter)
    }

    /**
     * 
     * @param {IModelMethod} pFilter 
     * @returns {HRESULT} 
     */
    TrySetFilter(pFilter) {
        result := ComCall(5, this, "ptr", pFilter, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFilteredNamespacePropertyToken.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RemoveFilter := CallbackCreate(GetMethod(implObj, "RemoveFilter"), flags, 1)
        this.vtbl.GetFilter := CallbackCreate(GetMethod(implObj, "GetFilter"), flags, 2)
        this.vtbl.TrySetFilter := CallbackCreate(GetMethod(implObj, "TrySetFilter"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RemoveFilter)
        CallbackFree(this.vtbl.GetFilter)
        CallbackFree(this.vtbl.TrySetFilter)
    }
}
