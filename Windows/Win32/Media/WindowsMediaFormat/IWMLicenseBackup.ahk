#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMLicenseBackup interface manages the backing up of licenses, typically so that they can be restored onto another computer.This interface is obtained by using the WMCreateBackupRestorer function.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmlicensebackup
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMLicenseBackup extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMLicenseBackup
     * @type {Guid}
     */
    static IID => Guid("{05e5ac9f-3fb6-4508-bb43-a4067ba1ebe8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BackupLicenses", "CancelLicenseBackup"]

    /**
     * The BackupLicenses method saves copies of the licenses.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmlicensebackup-backuplicenses
     */
    BackupLicenses(dwFlags, pCallback) {
        result := ComCall(3, this, "uint", dwFlags, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * The CancelLicenseBackup method cancels a current backup operation.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmlicensebackup-cancellicensebackup
     */
    CancelLicenseBackup() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
