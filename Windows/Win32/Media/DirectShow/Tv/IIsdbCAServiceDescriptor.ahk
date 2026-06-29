#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Implements methods that get data from an Integrated Services Digital Broadcasting (ISDB) conditional access (CA) service descriptor.
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-iisdbcaservicedescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IIsdbCAServiceDescriptor extends IUnknown {
    /**
     * The interface identifier for IIsdbCAServiceDescriptor
     * @type {Guid}
     */
    static IID := Guid("{39cbeb97-ff0b-42a7-9ab9-7b9cfe70a77a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IIsdbCAServiceDescriptor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTag                  : IntPtr
        GetLength               : IntPtr
        GetCASystemId           : IntPtr
        GetCABroadcasterGroupId : IntPtr
        GetMessageControl       : IntPtr
        GetServiceIds           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IIsdbCAServiceDescriptor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the tag that identifies a conditional access (CA) service descriptor.
     * @returns {Integer} Receives the tag value. For conditional access service descriptors, this value is 0xCC.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcaservicedescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of conditional access (CA) service descriptor, in bytes.
     * @returns {Integer} Receives the descriptor length.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcaservicedescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the conditional access (CA) system identifier from a CA service descriptor.
     * @returns {Integer} Receives the conditional access system identifier.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcaservicedescriptor-getcasystemid
     */
    GetCASystemId() {
        result := ComCall(5, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the conditional access (CA) broadcaster group identifier from a CA service descriptor.
     * @returns {Integer} Receives the conditional access broadcaster group identifier.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcaservicedescriptor-getcabroadcastergroupid
     */
    GetCABroadcasterGroupId() {
        result := ComCall(6, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the delay time, in days, before the automatic entitlement management message (EMM) is displayed from a conditional access (CA) service descriptor.
     * @remarks
     * When playing a previously received and stored program on a receiver with stored
     * reception functionality, a least significant bit of 1 in this field indicates that the
     * automatic display message will not be displayed.
     * @returns {Integer} Receives the number of days before the EMM message is displayed. A value of 0xFF indicates that the delay time is
     * disabled (that the start of the delay time has been put on hold).
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcaservicedescriptor-getmessagecontrol
     */
    GetMessageControl() {
        result := ComCall(7, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the service identifier (ID) records from a conditional access (CA) service descriptor.
     * @param {Pointer<Integer>} pbNumServiceIds On input specifies the expected number of service ID records. On output returns the actual number of records.
     * @returns {Integer} Receives the service ID records.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcaservicedescriptor-getserviceids
     */
    GetServiceIds(pbNumServiceIds) {
        pbNumServiceIdsMarshal := pbNumServiceIds is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, pbNumServiceIdsMarshal, pbNumServiceIds, "ushort*", &pwServiceIds := 0, "HRESULT")
        return pwServiceIds
    }

    Query(iid) {
        if (IIsdbCAServiceDescriptor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTag := CallbackCreate(GetMethod(implObj, "GetTag"), flags, 2)
        this.vtbl.GetLength := CallbackCreate(GetMethod(implObj, "GetLength"), flags, 2)
        this.vtbl.GetCASystemId := CallbackCreate(GetMethod(implObj, "GetCASystemId"), flags, 2)
        this.vtbl.GetCABroadcasterGroupId := CallbackCreate(GetMethod(implObj, "GetCABroadcasterGroupId"), flags, 2)
        this.vtbl.GetMessageControl := CallbackCreate(GetMethod(implObj, "GetMessageControl"), flags, 2)
        this.vtbl.GetServiceIds := CallbackCreate(GetMethod(implObj, "GetServiceIds"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTag)
        CallbackFree(this.vtbl.GetLength)
        CallbackFree(this.vtbl.GetCASystemId)
        CallbackFree(this.vtbl.GetCABroadcasterGroupId)
        CallbackFree(this.vtbl.GetMessageControl)
        CallbackFree(this.vtbl.GetServiceIds)
    }
}
