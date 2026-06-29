#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDataModelScriptProviderEnumerator.ahk" { IDataModelScriptProviderEnumerator }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IDataModelScriptProvider.ahk" { IDataModelScriptProvider }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDataModelNameBinder.ahk" { IDataModelNameBinder }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDataModelScriptManager extends IUnknown {
    /**
     * The interface identifier for IDataModelScriptManager
     * @type {Guid}
     */
    static IID := Guid("{6fd11e33-e5ad-410b-8011-68c6bc4bf80d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDataModelScriptManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDefaultNameBinder           : IntPtr
        RegisterScriptProvider         : IntPtr
        UnregisterScriptProvider       : IntPtr
        FindProviderForScriptType      : IntPtr
        FindProviderForScriptExtension : IntPtr
        EnumerateScriptProviders       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDataModelScriptManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IDataModelNameBinder} 
     */
    GetDefaultNameBinder() {
        result := ComCall(3, this, "ptr*", &ppNameBinder := 0, "HRESULT")
        return IDataModelNameBinder(ppNameBinder)
    }

    /**
     * 
     * @param {IDataModelScriptProvider} provider 
     * @returns {HRESULT} 
     */
    RegisterScriptProvider(provider) {
        result := ComCall(4, this, "ptr", provider, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDataModelScriptProvider} provider 
     * @returns {HRESULT} 
     */
    UnregisterScriptProvider(provider) {
        result := ComCall(5, this, "ptr", provider, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} scriptType 
     * @returns {IDataModelScriptProvider} 
     */
    FindProviderForScriptType(scriptType) {
        scriptType := scriptType is String ? StrPtr(scriptType) : scriptType

        result := ComCall(6, this, "ptr", scriptType, "ptr*", &provider := 0, "HRESULT")
        return IDataModelScriptProvider(provider)
    }

    /**
     * 
     * @param {PWSTR} scriptExtension 
     * @returns {IDataModelScriptProvider} 
     */
    FindProviderForScriptExtension(scriptExtension) {
        scriptExtension := scriptExtension is String ? StrPtr(scriptExtension) : scriptExtension

        result := ComCall(7, this, "ptr", scriptExtension, "ptr*", &provider := 0, "HRESULT")
        return IDataModelScriptProvider(provider)
    }

    /**
     * 
     * @returns {IDataModelScriptProviderEnumerator} 
     */
    EnumerateScriptProviders() {
        result := ComCall(8, this, "ptr*", &_enumerator := 0, "HRESULT")
        return IDataModelScriptProviderEnumerator(_enumerator)
    }

    Query(iid) {
        if (IDataModelScriptManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDefaultNameBinder := CallbackCreate(GetMethod(implObj, "GetDefaultNameBinder"), flags, 2)
        this.vtbl.RegisterScriptProvider := CallbackCreate(GetMethod(implObj, "RegisterScriptProvider"), flags, 2)
        this.vtbl.UnregisterScriptProvider := CallbackCreate(GetMethod(implObj, "UnregisterScriptProvider"), flags, 2)
        this.vtbl.FindProviderForScriptType := CallbackCreate(GetMethod(implObj, "FindProviderForScriptType"), flags, 3)
        this.vtbl.FindProviderForScriptExtension := CallbackCreate(GetMethod(implObj, "FindProviderForScriptExtension"), flags, 3)
        this.vtbl.EnumerateScriptProviders := CallbackCreate(GetMethod(implObj, "EnumerateScriptProviders"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDefaultNameBinder)
        CallbackFree(this.vtbl.RegisterScriptProvider)
        CallbackFree(this.vtbl.UnregisterScriptProvider)
        CallbackFree(this.vtbl.FindProviderForScriptType)
        CallbackFree(this.vtbl.FindProviderForScriptExtension)
        CallbackFree(this.vtbl.EnumerateScriptProviders)
    }
}
