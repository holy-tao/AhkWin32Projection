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
     * 
     * @param {Integer} dwFlags 
     * @param {IWMStatusCallback} pCallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmlicensebackup-backuplicenses
     */
    BackupLicenses(dwFlags, pCallback) {
        result := ComCall(3, this, "uint", dwFlags, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmlicensebackup-cancellicensebackup
     */
    CancelLicenseBackup() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
