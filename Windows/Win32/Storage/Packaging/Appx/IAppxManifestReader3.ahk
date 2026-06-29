#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IAppxManifestCapabilitiesEnumerator.ahk" { IAppxManifestCapabilitiesEnumerator }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\APPX_CAPABILITY_CLASS_TYPE.ahk" { APPX_CAPABILITY_CLASS_TYPE }
#Import ".\IAppxManifestReader2.ahk" { IAppxManifestReader2 }
#Import ".\IAppxManifestTargetDeviceFamiliesEnumerator.ahk" { IAppxManifestTargetDeviceFamiliesEnumerator }

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxManifestReader3 extends IAppxManifestReader2 {
    /**
     * The interface identifier for IAppxManifestReader3
     * @type {Guid}
     */
    static IID := Guid("{c43825ab-69b7-400a-9709-cc37f5a72d24}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxManifestReader3 interfaces
    */
    struct Vtbl extends IAppxManifestReader2.Vtbl {
        GetCapabilitiesByCapabilityClass : IntPtr
        GetTargetDeviceFamilies          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxManifestReader3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {APPX_CAPABILITY_CLASS_TYPE} capabilityClass 
     * @returns {IAppxManifestCapabilitiesEnumerator} 
     */
    GetCapabilitiesByCapabilityClass(capabilityClass) {
        result := ComCall(13, this, APPX_CAPABILITY_CLASS_TYPE, capabilityClass, "ptr*", &capabilities := 0, "HRESULT")
        return IAppxManifestCapabilitiesEnumerator(capabilities)
    }

    /**
     * 
     * @returns {IAppxManifestTargetDeviceFamiliesEnumerator} 
     */
    GetTargetDeviceFamilies() {
        result := ComCall(14, this, "ptr*", &targetDeviceFamilies := 0, "HRESULT")
        return IAppxManifestTargetDeviceFamiliesEnumerator(targetDeviceFamilies)
    }

    Query(iid) {
        if (IAppxManifestReader3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCapabilitiesByCapabilityClass := CallbackCreate(GetMethod(implObj, "GetCapabilitiesByCapabilityClass"), flags, 3)
        this.vtbl.GetTargetDeviceFamilies := CallbackCreate(GetMethod(implObj, "GetTargetDeviceFamilies"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCapabilitiesByCapabilityClass)
        CallbackFree(this.vtbl.GetTargetDeviceFamilies)
    }
}
