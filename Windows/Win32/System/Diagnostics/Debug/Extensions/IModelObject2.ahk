#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IKeyEnumerator.ahk" { IKeyEnumerator }
#Import ".\IModelObject.ahk" { IModelObject }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IModelObject2 extends IModelObject {
    /**
     * The interface identifier for IModelObject2
     * @type {Guid}
     */
    static IID := Guid("{d61e19f4-ab3d-4344-9f7b-0993f3d58745}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IModelObject2 interfaces
    */
    struct Vtbl extends IModelObject.Vtbl {
        EnumerateOwnKeyValues     : IntPtr
        EnumerateOwnKeys          : IntPtr
        EnumerateOwnKeyReferences : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IModelObject2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IKeyEnumerator} 
     */
    EnumerateOwnKeyValues() {
        result := ComCall(36, this, "ptr*", &ppEnumerator := 0, "HRESULT")
        return IKeyEnumerator(ppEnumerator)
    }

    /**
     * 
     * @returns {IKeyEnumerator} 
     */
    EnumerateOwnKeys() {
        result := ComCall(37, this, "ptr*", &ppEnumerator := 0, "HRESULT")
        return IKeyEnumerator(ppEnumerator)
    }

    /**
     * 
     * @returns {IKeyEnumerator} 
     */
    EnumerateOwnKeyReferences() {
        result := ComCall(38, this, "ptr*", &ppEnumerator := 0, "HRESULT")
        return IKeyEnumerator(ppEnumerator)
    }

    Query(iid) {
        if (IModelObject2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnumerateOwnKeyValues := CallbackCreate(GetMethod(implObj, "EnumerateOwnKeyValues"), flags, 2)
        this.vtbl.EnumerateOwnKeys := CallbackCreate(GetMethod(implObj, "EnumerateOwnKeys"), flags, 2)
        this.vtbl.EnumerateOwnKeyReferences := CallbackCreate(GetMethod(implObj, "EnumerateOwnKeyReferences"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnumerateOwnKeyValues)
        CallbackFree(this.vtbl.EnumerateOwnKeys)
        CallbackFree(this.vtbl.EnumerateOwnKeyReferences)
    }
}
