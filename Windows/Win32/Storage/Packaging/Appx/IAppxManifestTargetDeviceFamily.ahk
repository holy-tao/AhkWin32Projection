#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Retrieves information about the target device family from the AppxManifest.xml.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxmanifesttargetdevicefamily
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxManifestTargetDeviceFamily extends IUnknown {
    /**
     * The interface identifier for IAppxManifestTargetDeviceFamily
     * @type {Guid}
     */
    static IID := Guid("{9091b09b-c8d5-4f31-8687-a338259faefb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxManifestTargetDeviceFamily interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetName             : IntPtr
        GetMinVersion       : IntPtr
        GetMaxVersionTested : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxManifestTargetDeviceFamily.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the name of the target device family from the AppxManifest.xml..
     * @returns {PWSTR} The target device family name.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifesttargetdevicefamily-getname
     */
    GetName() {
        result := ComCall(3, this, PWSTR.Ptr, &name := 0, "HRESULT")
        return name
    }

    /**
     * Gets the minimum version of the target device family from the AppxManifest.xml.
     * @returns {Integer} The minimum version.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifesttargetdevicefamily-getminversion
     */
    GetMinVersion() {
        result := ComCall(4, this, "uint*", &minVersion := 0, "HRESULT")
        return minVersion
    }

    /**
     * Gets the maximum version tested from the AppxManifest.xml.
     * @returns {Integer} The max version tested attribute.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifesttargetdevicefamily-getmaxversiontested
     */
    GetMaxVersionTested() {
        result := ComCall(5, this, "uint*", &maxVersionTested := 0, "HRESULT")
        return maxVersionTested
    }

    Query(iid) {
        if (IAppxManifestTargetDeviceFamily.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetName := CallbackCreate(GetMethod(implObj, "GetName"), flags, 2)
        this.vtbl.GetMinVersion := CallbackCreate(GetMethod(implObj, "GetMinVersion"), flags, 2)
        this.vtbl.GetMaxVersionTested := CallbackCreate(GetMethod(implObj, "GetMaxVersionTested"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetName)
        CallbackFree(this.vtbl.GetMinVersion)
        CallbackFree(this.vtbl.GetMaxVersionTested)
    }
}
