#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IKeyEnumerator.ahk" { IKeyEnumerator }
#Import ".\IKeyStore.ahk" { IKeyStore }
#Import ".\IModelObject.ahk" { IModelObject }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDynamicKeyProviderConcept extends IUnknown {
    /**
     * The interface identifier for IDynamicKeyProviderConcept
     * @type {Guid}
     */
    static IID := Guid("{e7983fa1-80a7-498c-988f-518ddc5d4025}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDynamicKeyProviderConcept interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetKey        : IntPtr
        SetKey        : IntPtr
        EnumerateKeys : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDynamicKeyProviderConcept.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IModelObject} contextObject 
     * @param {PWSTR} key 
     * @param {Pointer<IModelObject>} keyValue 
     * @param {Pointer<IKeyStore>} metadata 
     * @param {Pointer<Boolean>} hasKey 
     * @returns {HRESULT} 
     */
    GetKey(contextObject, key, keyValue, metadata, hasKey) {
        key := key is String ? StrPtr(key) : key

        hasKeyMarshal := hasKey is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", contextObject, "ptr", key, IModelObject.Ptr, keyValue, IKeyStore.Ptr, metadata, hasKeyMarshal, hasKey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IModelObject} contextObject 
     * @param {PWSTR} key 
     * @param {IModelObject} keyValue 
     * @param {IKeyStore} metadata 
     * @returns {HRESULT} 
     */
    SetKey(contextObject, key, keyValue, metadata) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(4, this, "ptr", contextObject, "ptr", key, "ptr", keyValue, "ptr", metadata, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IModelObject} contextObject 
     * @returns {IKeyEnumerator} 
     */
    EnumerateKeys(contextObject) {
        result := ComCall(5, this, "ptr", contextObject, "ptr*", &ppEnumerator := 0, "HRESULT")
        return IKeyEnumerator(ppEnumerator)
    }

    Query(iid) {
        if (IDynamicKeyProviderConcept.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetKey := CallbackCreate(GetMethod(implObj, "GetKey"), flags, 6)
        this.vtbl.SetKey := CallbackCreate(GetMethod(implObj, "SetKey"), flags, 5)
        this.vtbl.EnumerateKeys := CallbackCreate(GetMethod(implObj, "EnumerateKeys"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetKey)
        CallbackFree(this.vtbl.SetKey)
        CallbackFree(this.vtbl.EnumerateKeys)
    }
}
