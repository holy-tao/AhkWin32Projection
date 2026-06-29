#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWMStatusCallback.ahk" { IWMStatusCallback }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWMLicenseRestore interface manages the restoring of licenses.This interface is obtained from another interface on the backup restorer object.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmlicenserestore
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMLicenseRestore extends IUnknown {
    /**
     * The interface identifier for IWMLicenseRestore
     * @type {Guid}
     */
    static IID := Guid("{c70b6334-a22e-4efb-a245-15e65a004a13}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMLicenseRestore interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RestoreLicenses      : IntPtr
        CancelLicenseRestore : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMLicenseRestore.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The RestoreLicenses method restores licenses that were previously backed up.
     * @remarks
     * For more information on how to specify the location of the backup file (there are predefined properties for the backup path and restore path for this purpose), see <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmbackuprestoreprops">IWMBackupRestoreProps Interface</a>.
     * 
     * The operation of this method is asynchronous, and an <b>IWMStatusCallback</b> interface can be used to track progress.
     * @param {Integer} dwFlags <b>DWORD</b> containing the flags.
     * 
     * <table>
     * <tr>
     * <th>Flag
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>WM_RESTORE_INDIVIDUALIZE</td>
     * <td>Indicates that the application has received permission from the user to individualize their computer. (See <a href="https://docs.microsoft.com/windows/desktop/wmformat/individualizing-drm-applications">Individualizing DRM Applications</a> section.)</td>
     * </tr>
     * </table>
     * @param {IWMStatusCallback} pCallback Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmstatuscallback">IWMStatusCallback</a> interface.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmlicenserestore-restorelicenses
     */
    RestoreLicenses(dwFlags, pCallback) {
        result := ComCall(3, this, "uint", dwFlags, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * The CancelLicenseRestore method cancels a current restore operation.
     * @remarks
     * This method operates asynchronously, and a call to this method cancels a restore operation that is in progress.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmlicenserestore-cancellicenserestore
     */
    CancelLicenseRestore() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMLicenseRestore.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RestoreLicenses := CallbackCreate(GetMethod(implObj, "RestoreLicenses"), flags, 3)
        this.vtbl.CancelLicenseRestore := CallbackCreate(GetMethod(implObj, "CancelLicenseRestore"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RestoreLicenses)
        CallbackFree(this.vtbl.CancelLicenseRestore)
    }
}
