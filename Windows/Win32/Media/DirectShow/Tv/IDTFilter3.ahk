#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IDTFilter2.ahk" { IDTFilter2 }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ProtType.ahk" { ProtType }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The IDTFilter3 interface extends the IDTFilter2 interface and is exposed by the Decrypter/Detagger filter.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IDTFilter3)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/encdec/nn-encdec-idtfilter3
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IDTFilter3 extends IDTFilter2 {
    /**
     * The interface identifier for IDTFilter3
     * @type {Guid}
     */
    static IID := Guid("{513998cc-e929-4cdf-9fbd-bad1e0314866}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDTFilter3 interfaces
    */
    struct Vtbl extends IDTFilter2.Vtbl {
        GetProtectionType        : IntPtr
        LicenseHasExpirationDate : IntPtr
        SetRights                : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDTFilter3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetProtectionType method retrieves the type of content protection that is currently in effect.
     * @returns {ProtType} Receives the current protection type, specified as a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/encdec/ne-encdec-prottype">ProtType</a> enumeration type.
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-idtfilter3-getprotectiontype
     */
    GetProtectionType() {
        result := ComCall(14, this, "int*", &pProtectionType := 0, "HRESULT")
        return pProtectionType
    }

    /**
     * The LicenseHasExpirationDate method queries whether the license for the content has an expiration date.
     * @returns {BOOL} Receives a Boolean value. If <b>TRUE</b>, the license has an expiration date. If <b>FALSE</b>, the license does not expire.
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-idtfilter3-licensehasexpirationdate
     */
    LicenseHasExpirationDate() {
        result := ComCall(15, this, BOOL.Ptr, &pfLicenseHasExpirationDate := 0, "HRESULT")
        return pfLicenseHasExpirationDate
    }

    /**
     * Not implemented in this release.
     * @param {BSTR} bstrRights Reserved.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-idtfilter3-setrights
     */
    SetRights(bstrRights) {
        bstrRights := bstrRights is String ? BSTR.Alloc(bstrRights).Value : bstrRights

        result := ComCall(16, this, BSTR, bstrRights, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDTFilter3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetProtectionType := CallbackCreate(GetMethod(implObj, "GetProtectionType"), flags, 2)
        this.vtbl.LicenseHasExpirationDate := CallbackCreate(GetMethod(implObj, "LicenseHasExpirationDate"), flags, 2)
        this.vtbl.SetRights := CallbackCreate(GetMethod(implObj, "SetRights"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetProtectionType)
        CallbackFree(this.vtbl.LicenseHasExpirationDate)
        CallbackFree(this.vtbl.SetRights)
    }
}
