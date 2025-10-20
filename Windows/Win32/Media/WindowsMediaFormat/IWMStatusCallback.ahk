#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMStatusCallback interface is implemented by the application to receive status information from various objects.
 * @remarks
 * 
  * The following methods and functions associate an implementation of this interface with an object:
  * 
  * <ul>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmindexer-startindexing">IWMIndexer::StartIndexing</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmlicensebackup-backuplicenses">IWMLicenseBackup::BackupLicenses</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmlicenserestore-restorelicenses">IWMLicenseRestore::RestoreLicenses</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreader-open">IWMReader::Open</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmregistercallback-advise">IWMRegisterCallback::Advise</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-wmcreatebackuprestorer">WMCreateBackupRestorer</a>
  * </li>
  * </ul>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmstatuscallback
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMStatusCallback extends IUnknown{
    /**
     * The interface identifier for IWMStatusCallback
     * @type {Guid}
     */
    static IID => Guid("{6d7cdc70-9888-11d3-8edc-00c04f6109cf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} Status 
     * @param {HRESULT} hr 
     * @param {Integer} dwType 
     * @param {Pointer<Byte>} pValue 
     * @param {Pointer<Void>} pvContext 
     * @returns {HRESULT} 
     */
    OnStatus(Status, hr, dwType, pValue, pvContext) {
        result := ComCall(3, this, "int", Status, "int", hr, "int", dwType, "char*", pValue, "ptr", pvContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
