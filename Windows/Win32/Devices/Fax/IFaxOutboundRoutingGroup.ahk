#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IFaxDeviceIds.ahk" { IFaxDeviceIds }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\FAX_GROUP_STATUS_ENUM.ahk" { FAX_GROUP_STATUS_ENUM }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IFaxOutboundRoutingGroup interface describes a configuration object that is used by a fax client application to retrieve information about an individual fax outbound routing group.
 * @remarks
 * A default implementation of <b>IFaxOutboundRoutingGroup</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutboundroutinggroup">FaxOutboundRoutingGroup</a> object.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxoutboundroutinggroup
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IFaxOutboundRoutingGroup extends IDispatch {
    /**
     * The interface identifier for IFaxOutboundRoutingGroup
     * @type {Guid}
     */
    static IID := Guid("{ca6289a1-7e25-4f87-9a0b-93365734962c}")

    /**
     * The class identifier for FaxOutboundRoutingGroup
     * @type {Guid}
     */
    static CLSID := Guid("{0213f3e0-6791-4d77-a271-04d2357c50d6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFaxOutboundRoutingGroup interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Name      : IntPtr
        get_Status    : IntPtr
        get_DeviceIds : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFaxOutboundRoutingGroup.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {FAX_GROUP_STATUS_ENUM} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {IFaxDeviceIds} 
     */
    DeviceIds {
        get => this.get_DeviceIds()
    }

    /**
     * The Name property is a null-terminated string that specifies the name of the outbound routing group.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutinggroup-get_name
     */
    get_Name() {
        pbstrName := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * The Status property indicates the collective status of the fax devices in the outbound routing group.
     * @remarks
     * When devices are added to or removed from a group, the group's status does not change.
     * @returns {FAX_GROUP_STATUS_ENUM} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutinggroup-get_status
     */
    get_Status() {
        result := ComCall(8, this, "int*", &pStatus := 0, "HRESULT")
        return pStatus
    }

    /**
     * The DeviceIds property retrieves an interface that represents the ordered collection of device IDs that participate in the outbound routing group.
     * @returns {IFaxDeviceIds} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutinggroup-get_deviceids
     */
    get_DeviceIds() {
        result := ComCall(9, this, "ptr*", &pFaxDeviceIds := 0, "HRESULT")
        return IFaxDeviceIds(pFaxDeviceIds)
    }

    Query(iid) {
        if (IFaxOutboundRoutingGroup.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_Status := CallbackCreate(GetMethod(implObj, "get_Status"), flags, 2)
        this.vtbl.get_DeviceIds := CallbackCreate(GetMethod(implObj, "get_DeviceIds"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_Status)
        CallbackFree(this.vtbl.get_DeviceIds)
    }
}
