#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IKeyStore.ahk" { IKeyStore }
#Import ".\IModelObject.ahk" { IModelObject }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IModelKeyReference extends IUnknown {
    /**
     * The interface identifier for IModelKeyReference
     * @type {Guid}
     */
    static IID := Guid("{5253dcf8-5aff-4c62-b302-56a289e00998}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IModelKeyReference interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetKeyName        : IntPtr
        GetOriginalObject : IntPtr
        GetContextObject  : IntPtr
        GetKey            : IntPtr
        GetKeyValue       : IntPtr
        SetKey            : IntPtr
        SetKeyValue       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IModelKeyReference.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetKeyName() {
        keyName := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, keyName, "HRESULT")
        return keyName
    }

    /**
     * 
     * @returns {IModelObject} 
     */
    GetOriginalObject() {
        result := ComCall(4, this, "ptr*", &originalObject := 0, "HRESULT")
        return IModelObject(originalObject)
    }

    /**
     * 
     * @returns {IModelObject} 
     */
    GetContextObject() {
        result := ComCall(5, this, "ptr*", &containingObject := 0, "HRESULT")
        return IModelObject(containingObject)
    }

    /**
     * 
     * @param {Pointer<IModelObject>} _object 
     * @param {Pointer<IKeyStore>} metadata 
     * @returns {HRESULT} 
     */
    GetKey(_object, metadata) {
        result := ComCall(6, this, IModelObject.Ptr, _object, IKeyStore.Ptr, metadata, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IModelObject>} _object 
     * @param {Pointer<IKeyStore>} metadata 
     * @returns {HRESULT} 
     */
    GetKeyValue(_object, metadata) {
        result := ComCall(7, this, IModelObject.Ptr, _object, IKeyStore.Ptr, metadata, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IModelObject} _object 
     * @param {IKeyStore} metadata 
     * @returns {HRESULT} 
     */
    SetKey(_object, metadata) {
        result := ComCall(8, this, "ptr", _object, "ptr", metadata, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IModelObject} _object 
     * @returns {HRESULT} 
     */
    SetKeyValue(_object) {
        result := ComCall(9, this, "ptr", _object, "HRESULT")
        return result
    }

    Query(iid) {
        if (IModelKeyReference.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetKeyName := CallbackCreate(GetMethod(implObj, "GetKeyName"), flags, 2)
        this.vtbl.GetOriginalObject := CallbackCreate(GetMethod(implObj, "GetOriginalObject"), flags, 2)
        this.vtbl.GetContextObject := CallbackCreate(GetMethod(implObj, "GetContextObject"), flags, 2)
        this.vtbl.GetKey := CallbackCreate(GetMethod(implObj, "GetKey"), flags, 3)
        this.vtbl.GetKeyValue := CallbackCreate(GetMethod(implObj, "GetKeyValue"), flags, 3)
        this.vtbl.SetKey := CallbackCreate(GetMethod(implObj, "SetKey"), flags, 3)
        this.vtbl.SetKeyValue := CallbackCreate(GetMethod(implObj, "SetKeyValue"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetKeyName)
        CallbackFree(this.vtbl.GetOriginalObject)
        CallbackFree(this.vtbl.GetContextObject)
        CallbackFree(this.vtbl.GetKey)
        CallbackFree(this.vtbl.GetKeyValue)
        CallbackFree(this.vtbl.SetKey)
        CallbackFree(this.vtbl.SetKeyValue)
    }
}
