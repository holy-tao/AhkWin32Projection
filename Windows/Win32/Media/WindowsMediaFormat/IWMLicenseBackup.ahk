#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWMStatusCallback.ahk" { IWMStatusCallback }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWMLicenseBackup interface manages the backing up of licenses, typically so that they can be restored onto another computer.This interface is obtained by using the WMCreateBackupRestorer function.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmlicensebackup
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMLicenseBackup extends IUnknown {
    /**
     * The interface identifier for IWMLicenseBackup
     * @type {Guid}
     */
    static IID := Guid("{05e5ac9f-3fb6-4508-bb43-a4067ba1ebe8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMLicenseBackup interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        BackupLicenses      : IntPtr
        CancelLicenseBackup : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMLicenseBackup.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The BackupLicenses method saves copies of the licenses.
     * @remarks
     * For more information on how to specify the location of the backup file (there are predefined properties for the backup path and restore path for this purpose), see <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmbackuprestoreprops">IWMBackupRestoreProps Interface</a>.
     * 
     * This method operates asynchronously, and an <b>IWMStatusCallback</b> object can be used to track progress.
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
     * <td>WM_BACKUP_OVERWRITE</td>
     * <td>Indicates that any existing backup file should be overwritten. If this is not set, and a backup file exists, the NS_E_DRM_BACKUP_EXISTS error code is returned.</td>
     * </tr>
     * </table>
     * @param {IWMStatusCallback} pCallback Pointer to an object that implements the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmstatuscallback">IWMStatusCallback</a> interface.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pCallback</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory available to perform the task.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmlicensebackup-backuplicenses
     */
    BackupLicenses(dwFlags, pCallback) {
        result := ComCall(3, this, "uint", dwFlags, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * The CancelLicenseBackup method cancels a current backup operation.
     * @remarks
     * A backup operation is asynchronous, and a call to this method cancels a backup that is in progress.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmlicensebackup-cancellicensebackup
     */
    CancelLicenseBackup() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMLicenseBackup.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.BackupLicenses := CallbackCreate(GetMethod(implObj, "BackupLicenses"), flags, 3)
        this.vtbl.CancelLicenseBackup := CallbackCreate(GetMethod(implObj, "CancelLicenseBackup"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.BackupLicenses)
        CallbackFree(this.vtbl.CancelLicenseBackup)
    }
}
