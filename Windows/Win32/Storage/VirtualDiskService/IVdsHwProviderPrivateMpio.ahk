#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\VDS_HBAPORT_PROP.ahk" { VDS_HBAPORT_PROP }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\VDS_PATH_STATUS.ahk" { VDS_PATH_STATUS }

/**
 * Provides a method that sets the status of paths originating from a particular HBA port to the provider.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nn-vdshwprv-ivdshwproviderprivatempio
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct IVdsHwProviderPrivateMpio extends IUnknown {
    /**
     * The interface identifier for IVdsHwProviderPrivateMpio
     * @type {Guid}
     */
    static IID := Guid("{310a7715-ac2b-4c6f-9827-3d742f351676}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVdsHwProviderPrivateMpio interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetAllPathStatusesFromHbaPort : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVdsHwProviderPrivateMpio.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the statuses of paths originating from a particular HBA port to a specified status.
     * @param {VDS_HBAPORT_PROP} hbaPortProp The properties of the HBA port from which the paths to be set originate.  The only fields that need to be 
     *       provided are <b>wwnNode</b> and <b>wwnPort</b>.  The hardware provider 
     *       must ignore all other fields.
     * @param {VDS_PATH_STATUS} _status The status (enumerated by the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_path_status">VDS_PATH_STATUS</a> enumeration) to set the paths.
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
     * The association name was successfully set.
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
     * At least one path's status was not successfully set due to a nonfatal error (for example, the status conflicts with 
     *         the current load balance policy).
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdshwproviderprivatempio-setallpathstatusesfromhbaport
     */
    SetAllPathStatusesFromHbaPort(hbaPortProp, _status) {
        result := ComCall(3, this, VDS_HBAPORT_PROP, hbaPortProp, VDS_PATH_STATUS, _status, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVdsHwProviderPrivateMpio.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetAllPathStatusesFromHbaPort := CallbackCreate(GetMethod(implObj, "SetAllPathStatusesFromHbaPort"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetAllPathStatusesFromHbaPort)
    }
}
