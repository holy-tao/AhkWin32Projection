#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IPTFilterLicenseRenewal extends IUnknown {
    /**
     * The interface identifier for IPTFilterLicenseRenewal
     * @type {Guid}
     */
    static IID := Guid("{26d836a5-0c15-44c7-ac59-b0da8728f240}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPTFilterLicenseRenewal interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RenewLicenses        : IntPtr
        CancelLicenseRenewal : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPTFilterLicenseRenewal.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} wszFileName 
     * @param {PWSTR} wszExpiredKid 
     * @param {Integer} dwCallersId 
     * @param {BOOL} bHighPriority 
     * @returns {HRESULT} 
     */
    RenewLicenses(wszFileName, wszExpiredKid, dwCallersId, bHighPriority) {
        wszFileName := wszFileName is String ? StrPtr(wszFileName) : wszFileName
        wszExpiredKid := wszExpiredKid is String ? StrPtr(wszExpiredKid) : wszExpiredKid

        result := ComCall(3, this, "ptr", wszFileName, "ptr", wszExpiredKid, "uint", dwCallersId, BOOL, bHighPriority, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CancelLicenseRenewal() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPTFilterLicenseRenewal.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RenewLicenses := CallbackCreate(GetMethod(implObj, "RenewLicenses"), flags, 5)
        this.vtbl.CancelLicenseRenewal := CallbackCreate(GetMethod(implObj, "CancelLicenseRenewal"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RenewLicenses)
        CallbackFree(this.vtbl.CancelLicenseRenewal)
    }
}
