#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a method to repair single volumes.
 * @see https://learn.microsoft.com/windows/win32/api/vds/nn-vds-ivdsvolumeonline
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct IVdsVolumeOnline extends IUnknown {
    /**
     * The interface identifier for IVdsVolumeOnline
     * @type {Guid}
     */
    static IID := Guid("{1be2275a-b315-4f70-9e44-879b3a2a53f2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVdsVolumeOnline interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Online : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVdsVolumeOnline.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns a volume to the healthy state, if possible. This method is supported only for dynamic disks.
     * @remarks
     * Despite its name, this method does not bring a volume online. It attempts to return a volume on a dynamic disk to a healthy state. 
     * 
     * This method checks whether the volume has a missing disk, plex, or RAID-5 column and attempts to make any needed repairs. 
     * 
     * To bring the volume online, call <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolumemf-mount">IVdsVolumeMF::Mount</a>.
     * 
     * To take the volume offline, call <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolumemf-dismount">IVdsVolumeMF::Dismount</a> with the <i>bPermanent</i> parameter set to <b>TRUE</b>.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_OUTOFMEMORY, and <a href="https://docs.microsoft.com/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="https://docs.microsoft.com/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_S_NO_NOTIFICATION</b></dt>
     * <dt>0x00042517L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No volume arrival notification was received. You may need to call <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-refresh">IVdsService::Refresh</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_NOT_SUPPORTED</b></dt>
     * <dt>0x80042400L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method is not supported for basic disks.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvolumeonline-online
     */
    Online() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVdsVolumeOnline.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Online := CallbackCreate(GetMethod(implObj, "Online"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Online)
    }
}
