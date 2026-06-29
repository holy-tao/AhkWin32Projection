#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IAppxManifestTargetDeviceFamily.ahk" { IAppxManifestTargetDeviceFamily }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxManifestTargetDeviceFamiliesEnumerator extends IUnknown {
    /**
     * The interface identifier for IAppxManifestTargetDeviceFamiliesEnumerator
     * @type {Guid}
     */
    static IID := Guid("{36537f36-27a4-4788-88c0-733819575017}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxManifestTargetDeviceFamiliesEnumerator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCurrent    : IntPtr
        GetHasCurrent : IntPtr
        MoveNext      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxManifestTargetDeviceFamiliesEnumerator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IAppxManifestTargetDeviceFamily} 
     */
    GetCurrent() {
        result := ComCall(3, this, "ptr*", &targetDeviceFamily := 0, "HRESULT")
        return IAppxManifestTargetDeviceFamily(targetDeviceFamily)
    }

    /**
     * 
     * @returns {BOOL} 
     */
    GetHasCurrent() {
        result := ComCall(4, this, BOOL.Ptr, &hasCurrent := 0, "HRESULT")
        return hasCurrent
    }

    /**
     * 
     * @returns {BOOL} 
     */
    MoveNext() {
        result := ComCall(5, this, BOOL.Ptr, &hasNext := 0, "HRESULT")
        return hasNext
    }

    Query(iid) {
        if (IAppxManifestTargetDeviceFamiliesEnumerator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCurrent := CallbackCreate(GetMethod(implObj, "GetCurrent"), flags, 2)
        this.vtbl.GetHasCurrent := CallbackCreate(GetMethod(implObj, "GetHasCurrent"), flags, 2)
        this.vtbl.MoveNext := CallbackCreate(GetMethod(implObj, "MoveNext"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCurrent)
        CallbackFree(this.vtbl.GetHasCurrent)
        CallbackFree(this.vtbl.MoveNext)
    }
}
