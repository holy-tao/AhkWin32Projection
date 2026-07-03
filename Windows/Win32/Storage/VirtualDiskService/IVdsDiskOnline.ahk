#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides methods to bring a disk online and take it offline.Windows Vista:  This interface is not supported until Windows Vista with Service Pack 1 (SP1). Use IVdsDisk2 instead.
 * @see https://learn.microsoft.com/windows/win32/api/vds/nn-vds-ivdsdiskonline
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct IVdsDiskOnline extends IUnknown {
    /**
     * The interface identifier for IVdsDiskOnline
     * @type {Guid}
     */
    static IID := Guid("{90681b1d-6a7f-48e8-9061-31b7aa125322}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVdsDiskOnline interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Online  : IntPtr
        Offline : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVdsDiskOnline.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Brings the disk online.
     * @remarks
     * If a dynamic disk is read-only and offline, it can be made read/write and brought online as follows:
     * 
     * <ol>
     * <li>Clear the read-only bit. (This is the <b>VDS_DF_READ_ONLY</b> flag in the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_disk_prop">VDS_DISK_PROP</a> structure.)</li>
     * <li>Call the <b>Online</b> method.</li>
     * </ol>
     * If a basic disk is read-only and offline, it can be made read/write and brought online the same way, but the order of the steps does not matter.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="https://docs.microsoft.com/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="https://docs.microsoft.com/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_FAILED_TO_ONLINE_DISK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The online operation failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsdiskonline-online
     */
    Online() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Takes the disk offline.Windows Vista:  This method is not supported until Windows Vista with Service Pack 1 (SP1). Use IVdsDisk2::SetSANMode instead.
     * @remarks
     * If a dynamic disk is read/write and online, it can be made read-only and taken offline as follows:
     * 
     * <ol>
     * <li>For each volume on the disk, call the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolumemf-dismount">IVdsVolumeMF::Dismount</a> method, setting the <i>bForce</i> and <i>bPermanent</i> parameters to <b>TRUE</b>.</li>
     * <li>Call the <b>Offline</b> method.</li>
     * <li>Set the read-only bit. (This is the <b>VDS_DF_READ_ONLY</b> flag in the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_disk_prop">VDS_DISK_PROP</a> structure.)</li>
     * </ol>
     * If a basic disk is read/write and online, it can be made read-only and taken offline the same way, but the order of the steps does not matter.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="https://docs.microsoft.com/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="https://docs.microsoft.com/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_FAILED_TO_OFFLINE_DISK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The offline operation failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsdiskonline-offline
     */
    Offline() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVdsDiskOnline.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Online := CallbackCreate(GetMethod(implObj, "Online"), flags, 1)
        this.vtbl.Offline := CallbackCreate(GetMethod(implObj, "Offline"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Online)
        CallbackFree(this.vtbl.Offline)
    }
}
