#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct IVdsServiceSw extends IUnknown {
    /**
     * The interface identifier for IVdsServiceSw
     * @type {Guid}
     */
    static IID := Guid("{15fc031c-0652-4306-b2c3-f558b8f837e2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVdsServiceSw interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDiskObject : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVdsServiceSw.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pwszDeviceID 
     * @returns {IUnknown} 
     */
    GetDiskObject(pwszDeviceID) {
        pwszDeviceID := pwszDeviceID is String ? StrPtr(pwszDeviceID) : pwszDeviceID

        result := ComCall(3, this, "ptr", pwszDeviceID, "ptr*", &ppDiskUnk := 0, "HRESULT")
        return IUnknown(ppDiskUnk)
    }

    Query(iid) {
        if (IVdsServiceSw.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDiskObject := CallbackCreate(GetMethod(implObj, "GetDiskObject"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDiskObject)
    }
}
