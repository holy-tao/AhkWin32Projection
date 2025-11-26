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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnStatus"]

    /**
     * The OnStatus method is called when status information must be communicated to the application.
     * @param {Integer} Status One member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_status">WMT_STATUS</a> enumeration type. For a description of possible <b>WMT_STATUS</b> values, see the tables in the Remarks section.
     * @param {HRESULT} hr <b>HRESULT</b> error code. If this indicates failure, you should not process the status as normal, as some error has occurred. Use <c>if (FAILED(hr))</c> to check for a failed value. See the topic <a href="https://docs.microsoft.com/windows/desktop/wmformat/error-codes">Error Codes</a> for a list of possible results.
     * @param {Integer} dwType Member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_attr_datatype">WMT_ATTR_DATATYPE</a> enumeration type. This value specifies the type of data in the buffer at <i>pValue</i>.
     * @param {Pointer<Integer>} pValue Pointer to a byte array containing the value. The contents of this array depend on the value of <i>Status</i> and the value of <i>dwType</i>.
     * @param {Pointer<Void>} pvContext Generic pointer provided by the application, for its own use. This pointer matches the context pointer given to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreader-open">IWMReader::Open</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmindexer-startindexing">IWMIndexer::StartIndexing</a>, and other methods. The SDK makes no assumptions about the use of this pointer; it is simply provided by the application and passed back to the application when a callback is made.
     * @returns {HRESULT} This method is implemented by the application. It should always return S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmstatuscallback-onstatus
     */
    OnStatus(Status, hr, dwType, pValue, pvContext) {
        pValueMarshal := pValue is VarRef ? "char*" : "ptr"
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "int", Status, "int", hr, "int", dwType, pValueMarshal, pValue, pvContextMarshal, pvContext, "HRESULT")
        return result
    }
}
