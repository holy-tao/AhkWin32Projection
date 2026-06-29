#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk" { IPropertyStore }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IMFMediaKeySystemAccess.ahk" { IMFMediaKeySystemAccess }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMediaEngineClassFactory3 extends IUnknown {
    /**
     * The interface identifier for IMFMediaEngineClassFactory3
     * @type {Guid}
     */
    static IID := Guid("{3787614f-65f7-4003-b673-ead8293a0e60}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMediaEngineClassFactory3 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateMediaKeySystemAccess : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMediaEngineClassFactory3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} keySystem 
     * @param {Pointer<IPropertyStore>} ppSupportedConfigurationsArray 
     * @param {Integer} uSize 
     * @returns {IMFMediaKeySystemAccess} 
     */
    CreateMediaKeySystemAccess(keySystem, ppSupportedConfigurationsArray, uSize) {
        keySystem := keySystem is String ? BSTR.Alloc(keySystem).Value : keySystem

        result := ComCall(3, this, BSTR, keySystem, IPropertyStore.Ptr, ppSupportedConfigurationsArray, "uint", uSize, "ptr*", &ppKeyAccess := 0, "HRESULT")
        return IMFMediaKeySystemAccess(ppKeyAccess)
    }

    Query(iid) {
        if (IMFMediaEngineClassFactory3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateMediaKeySystemAccess := CallbackCreate(GetMethod(implObj, "CreateMediaKeySystemAccess"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateMediaKeySystemAccess)
    }
}
