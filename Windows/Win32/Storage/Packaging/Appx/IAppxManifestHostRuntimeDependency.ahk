#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxManifestHostRuntimeDependency extends IUnknown {
    /**
     * The interface identifier for IAppxManifestHostRuntimeDependency
     * @type {Guid}
     */
    static IID := Guid("{3455d234-8414-410d-95c7-7b35255b8391}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxManifestHostRuntimeDependency interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetName       : IntPtr
        GetPublisher  : IntPtr
        GetMinVersion : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxManifestHostRuntimeDependency.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetName
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/iwmcodecstrings-getname
     */
    GetName() {
        result := ComCall(3, this, PWSTR.Ptr, &name := 0, "HRESULT")
        return name
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    GetPublisher() {
        result := ComCall(4, this, PWSTR.Ptr, &publisher := 0, "HRESULT")
        return publisher
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetMinVersion() {
        result := ComCall(5, this, "uint*", &minVersion := 0, "HRESULT")
        return minVersion
    }

    Query(iid) {
        if (IAppxManifestHostRuntimeDependency.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetName := CallbackCreate(GetMethod(implObj, "GetName"), flags, 2)
        this.vtbl.GetPublisher := CallbackCreate(GetMethod(implObj, "GetPublisher"), flags, 2)
        this.vtbl.GetMinVersion := CallbackCreate(GetMethod(implObj, "GetMinVersion"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetName)
        CallbackFree(this.vtbl.GetPublisher)
        CallbackFree(this.vtbl.GetMinVersion)
    }
}
