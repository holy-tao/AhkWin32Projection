#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DX_FEATURE_LEVEL.ahk" { DX_FEATURE_LEVEL }

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxManifestQualifiedResource extends IUnknown {
    /**
     * The interface identifier for IAppxManifestQualifiedResource
     * @type {Guid}
     */
    static IID := Guid("{3b53a497-3c5c-48d1-9ea3-bb7eac8cd7d4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxManifestQualifiedResource interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetLanguage       : IntPtr
        GetScale          : IntPtr
        GetDXFeatureLevel : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxManifestQualifiedResource.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    GetLanguage() {
        result := ComCall(3, this, PWSTR.Ptr, &language := 0, "HRESULT")
        return language
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetScale() {
        result := ComCall(4, this, "uint*", &scale := 0, "HRESULT")
        return scale
    }

    /**
     * 
     * @returns {DX_FEATURE_LEVEL} 
     */
    GetDXFeatureLevel() {
        result := ComCall(5, this, "int*", &dxFeatureLevel := 0, "HRESULT")
        return dxFeatureLevel
    }

    Query(iid) {
        if (IAppxManifestQualifiedResource.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetLanguage := CallbackCreate(GetMethod(implObj, "GetLanguage"), flags, 2)
        this.vtbl.GetScale := CallbackCreate(GetMethod(implObj, "GetScale"), flags, 2)
        this.vtbl.GetDXFeatureLevel := CallbackCreate(GetMethod(implObj, "GetDXFeatureLevel"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetLanguage)
        CallbackFree(this.vtbl.GetScale)
        CallbackFree(this.vtbl.GetDXFeatureLevel)
    }
}
