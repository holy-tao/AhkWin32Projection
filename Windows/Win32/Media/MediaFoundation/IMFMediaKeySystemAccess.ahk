#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFMediaKeys2.ahk" { IMFMediaKeys2 }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk" { IPropertyStore }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMediaKeySystemAccess extends IUnknown {
    /**
     * The interface identifier for IMFMediaKeySystemAccess
     * @type {Guid}
     */
    static IID := Guid("{aec63fda-7a97-4944-b35c-6c6df8085cc3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMediaKeySystemAccess interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateMediaKeys            : IntPtr
        get_SupportedConfiguration : IntPtr
        get_KeySystem              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMediaKeySystemAccess.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IPropertyStore} 
     */
    SupportedConfiguration {
        get => this.get_SupportedConfiguration()
    }

    /**
     * @type {BSTR} 
     */
    KeySystem {
        get => this.get_KeySystem()
    }

    /**
     * 
     * @param {IPropertyStore} pCdmCustomConfig 
     * @returns {IMFMediaKeys2} 
     */
    CreateMediaKeys(pCdmCustomConfig) {
        result := ComCall(3, this, "ptr", pCdmCustomConfig, "ptr*", &ppKeys := 0, "HRESULT")
        return IMFMediaKeys2(ppKeys)
    }

    /**
     * 
     * @returns {IPropertyStore} 
     */
    get_SupportedConfiguration() {
        result := ComCall(4, this, "ptr*", &ppSupportedConfiguration := 0, "HRESULT")
        return IPropertyStore(ppSupportedConfiguration)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_KeySystem() {
        pKeySystem := BSTR.Owned()
        result := ComCall(5, this, BSTR.Ptr, pKeySystem, "HRESULT")
        return pKeySystem
    }

    Query(iid) {
        if (IMFMediaKeySystemAccess.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateMediaKeys := CallbackCreate(GetMethod(implObj, "CreateMediaKeys"), flags, 3)
        this.vtbl.get_SupportedConfiguration := CallbackCreate(GetMethod(implObj, "get_SupportedConfiguration"), flags, 2)
        this.vtbl.get_KeySystem := CallbackCreate(GetMethod(implObj, "get_KeySystem"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateMediaKeys)
        CallbackFree(this.vtbl.get_SupportedConfiguration)
        CallbackFree(this.vtbl.get_KeySystem)
    }
}
