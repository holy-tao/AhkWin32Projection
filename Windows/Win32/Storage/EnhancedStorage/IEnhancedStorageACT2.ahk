#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IEnhancedStorageACT.ahk" { IEnhancedStorageACT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * IEnhancedStorageACT2 interface is used to obtain information for a 1667 Addressable Contact Target (ACT).
 * @see https://learn.microsoft.com/windows/win32/api/ehstorapi/nn-ehstorapi-ienhancedstorageact2
 * @namespace Windows.Win32.Storage.EnhancedStorage
 */
export default struct IEnhancedStorageACT2 extends IEnhancedStorageACT {
    /**
     * The interface identifier for IEnhancedStorageACT2
     * @type {Guid}
     */
    static IID := Guid("{4da57d2e-8eb3-41f6-a07e-98b52b88242b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnhancedStorageACT2 interfaces
    */
    struct Vtbl extends IEnhancedStorageACT.Vtbl {
        GetDeviceName     : IntPtr
        IsDeviceRemovable : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnhancedStorageACT2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * IEnhancedStorageACT2::GetDeviceName method returns the device name associated with the Addressable Command Target (ACT).
     * @remarks
     * The memory containing the device name string is allocated by the Enhanced Storage API and must be freed by passing the returned pointer to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @returns {PWSTR} Pointer to a string that represents the device name associated with the ACT.
     * @see https://learn.microsoft.com/windows/win32/api/ehstorapi/nf-ehstorapi-ienhancedstorageact2-getdevicename
     */
    GetDeviceName() {
        result := ComCall(9, this, PWSTR.Ptr, &ppwszDeviceName := 0, "HRESULT")
        return ppwszDeviceName
    }

    /**
     * IEnhancedStorageACT2::IsDeviceRemovable method returns information that indicates if the device associated with the ACT is removable.
     * @returns {BOOL} Pointer to a boolean value that indicates if the device associated with the ACT is removable.
     * @see https://learn.microsoft.com/windows/win32/api/ehstorapi/nf-ehstorapi-ienhancedstorageact2-isdeviceremovable
     */
    IsDeviceRemovable() {
        result := ComCall(10, this, BOOL.Ptr, &pIsDeviceRemovable := 0, "HRESULT")
        return pIsDeviceRemovable
    }

    Query(iid) {
        if (IEnhancedStorageACT2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDeviceName := CallbackCreate(GetMethod(implObj, "GetDeviceName"), flags, 2)
        this.vtbl.IsDeviceRemovable := CallbackCreate(GetMethod(implObj, "IsDeviceRemovable"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDeviceName)
        CallbackFree(this.vtbl.IsDeviceRemovable)
    }
}
