#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\IESEvent.ahk" { IESEvent }

/**
 * Gets information from a FileExpiryDate event.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IESFileExpiryDateEvent)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-iesfileexpirydateevent
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IESFileExpiryDateEvent extends IESEvent {
    /**
     * The interface identifier for IESFileExpiryDateEvent
     * @type {Guid}
     */
    static IID := Guid("{ba9edcb6-4d36-4cfe-8c56-87a6b0ca48e1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IESFileExpiryDateEvent interfaces
    */
    struct Vtbl extends IESEvent.Vtbl {
        GetTunerId                : IntPtr
        GetExpiryDate             : IntPtr
        GetFinalExpiryDate        : IntPtr
        GetMaxRenewalCount        : IntPtr
        IsEntitlementTokenPresent : IntPtr
        DoesExpireAfterFirstUse   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IESFileExpiryDateEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a globally unique identifier (GUID) from a FileExpiryDate event that identifies the media transform device (MTD) that originated the event.
     * @returns {Guid} Receives the GUID for the MTD.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesfileexpirydateevent-gettunerid
     */
    GetTunerId() {
        pguidTunerId := Guid()
        result := ComCall(8, this, Guid.Ptr, pguidTunerId, "HRESULT")
        return pguidTunerId
    }

    /**
     * Gets the date from a FileExpiryDate event that indicates when a license for protected content expires.
     * @returns {Integer} Receives the expiry date from the event.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesfileexpirydateevent-getexpirydate
     */
    GetExpiryDate() {
        result := ComCall(9, this, "uint*", &pqwExpiryDate := 0, "HRESULT")
        return pqwExpiryDate
    }

    /**
     * Gets the date from a FileExpiryDate event that indicates when a renewable license for protected content finally expires.
     * @returns {Integer} Receives the final expiry date.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesfileexpirydateevent-getfinalexpirydate
     */
    GetFinalExpiryDate() {
        result := ComCall(10, this, "uint*", &pqwExpiryDate := 0, "HRESULT")
        return pqwExpiryDate
    }

    /**
     * Gets the maximum number of times that a license for protected content can be renewed from a FileExpiryDate event.
     * @returns {Integer} Receives the maximum renewal count.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesfileexpirydateevent-getmaxrenewalcount
     */
    GetMaxRenewalCount() {
        result := ComCall(11, this, "uint*", &dwMaxRenewalCount := 0, "HRESULT")
        return dwMaxRenewalCount
    }

    /**
     * Gets a flag from FileExpiryDate event that indicates whether a license for protected content contains an entitlement token.
     * @returns {BOOL} Receives the flag, which is true if the license for protected content contains an entitlement token or false otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesfileexpirydateevent-isentitlementtokenpresent
     */
    IsEntitlementTokenPresent() {
        result := ComCall(12, this, BOOL.Ptr, &pfEntTokenPresent := 0, "HRESULT")
        return pfEntTokenPresent
    }

    /**
     * Gets a flag from a FileExpiryDate event that indicates whether a license for protected content expires after its first use.
     * @returns {BOOL} Receives the flag, which is true if the license expires after first use or false otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesfileexpirydateevent-doesexpireafterfirstuse
     */
    DoesExpireAfterFirstUse() {
        result := ComCall(13, this, BOOL.Ptr, &pfExpireAfterFirstUse := 0, "HRESULT")
        return pfExpireAfterFirstUse
    }

    Query(iid) {
        if (IESFileExpiryDateEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTunerId := CallbackCreate(GetMethod(implObj, "GetTunerId"), flags, 2)
        this.vtbl.GetExpiryDate := CallbackCreate(GetMethod(implObj, "GetExpiryDate"), flags, 2)
        this.vtbl.GetFinalExpiryDate := CallbackCreate(GetMethod(implObj, "GetFinalExpiryDate"), flags, 2)
        this.vtbl.GetMaxRenewalCount := CallbackCreate(GetMethod(implObj, "GetMaxRenewalCount"), flags, 2)
        this.vtbl.IsEntitlementTokenPresent := CallbackCreate(GetMethod(implObj, "IsEntitlementTokenPresent"), flags, 2)
        this.vtbl.DoesExpireAfterFirstUse := CallbackCreate(GetMethod(implObj, "DoesExpireAfterFirstUse"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTunerId)
        CallbackFree(this.vtbl.GetExpiryDate)
        CallbackFree(this.vtbl.GetFinalExpiryDate)
        CallbackFree(this.vtbl.GetMaxRenewalCount)
        CallbackFree(this.vtbl.IsEntitlementTokenPresent)
        CallbackFree(this.vtbl.DoesExpireAfterFirstUse)
    }
}
