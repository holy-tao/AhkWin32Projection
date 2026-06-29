#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a method to set the SAN mode of a disk to offline or online.
 * @see https://learn.microsoft.com/windows/win32/api/vds/nn-vds-ivdsdisk2
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct IVdsDisk2 extends IUnknown {
    /**
     * The interface identifier for IVdsDisk2
     * @type {Guid}
     */
    static IID := Guid("{40f73c8b-687d-4a13-8d96-3d7f2e683936}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVdsDisk2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetSANMode : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVdsDisk2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the SAN mode of a disk to offline or online.
     * @remarks
     * Setting the SAN mode of a disk to offline is called "offlining" the disk. Setting it to online is called "onlining" the disk.
     * 
     * <b>Windows Vista:  </b>Setting the SAN mode of a disk to offline also makes the disk read-only. Setting it to online also makes the disk read-write.
     * @param {BOOL} bEnable Specify <b>TRUE</b> for online or <b>FALSE</b> for offline.
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
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The SAN mode was set successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_FAILED_TO_OFFLINE_DISK</b></dt>
     * <dt>0x80042597L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The offline operation failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_FAILED_TO_ONLINE_DISK</b></dt>
     * <dt>0x80042596L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The online operation failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsdisk2-setsanmode
     */
    SetSANMode(bEnable) {
        result := ComCall(3, this, BOOL, bEnable, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVdsDisk2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetSANMode := CallbackCreate(GetMethod(implObj, "SetSANMode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetSANMode)
    }
}
