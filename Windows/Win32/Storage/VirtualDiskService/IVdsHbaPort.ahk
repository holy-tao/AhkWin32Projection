#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\VDS_HBAPORT_PROP.ahk" { VDS_HBAPORT_PROP }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\VDS_PATH_STATUS.ahk" { VDS_PATH_STATUS }

/**
 * Provides methods to query and interact with HBA ports on the local system.
 * @see https://learn.microsoft.com/windows/win32/api/vds/nn-vds-ivdshbaport
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct IVdsHbaPort extends IUnknown {
    /**
     * The interface identifier for IVdsHbaPort
     * @type {Guid}
     */
    static IID := Guid("{2abd757f-2851-4997-9a13-47d2a885d6ca}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVdsHbaPort interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetProperties      : IntPtr
        SetAllPathStatuses : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVdsHbaPort.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the properties of an HBA port.
     * @returns {VDS_HBAPORT_PROP} The address of a member of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_hbaport_prop">VDS_HBAPORT_PROP</a> structure 
     *       that is allocated and passed in by the caller.
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdshbaport-getproperties
     */
    GetProperties() {
        pHbaPortProp := VDS_HBAPORT_PROP()
        result := ComCall(3, this, VDS_HBAPORT_PROP.Ptr, pHbaPortProp, "HRESULT")
        return pHbaPortProp
    }

    /**
     * Sets the statuses of all paths originating from the HBA port to a specified status.
     * @param {VDS_PATH_STATUS} _status The status to be assigned to the paths.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="https://docs.microsoft.com/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="https://docs.microsoft.com/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The statuses were successfully set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_S_STATUSES_INCOMPLETELY_SET</b></b></dt>
     * <dt>0x00042702L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one path's status was not set successfully due to a nonfatal error (for example, the status 
     *         conflicts with the current load balance policy).
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdshbaport-setallpathstatuses
     */
    SetAllPathStatuses(_status) {
        result := ComCall(4, this, VDS_PATH_STATUS, _status, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVdsHbaPort.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetProperties := CallbackCreate(GetMethod(implObj, "GetProperties"), flags, 2)
        this.vtbl.SetAllPathStatuses := CallbackCreate(GetMethod(implObj, "SetAllPathStatuses"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetProperties)
        CallbackFree(this.vtbl.SetAllPathStatuses)
    }
}
