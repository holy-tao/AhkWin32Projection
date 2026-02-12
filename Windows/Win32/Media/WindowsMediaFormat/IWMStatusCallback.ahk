#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMStatusCallback interface is implemented by the application to receive status information from various objects.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nn-wmsdkidl-iwmstatuscallback
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
     * @remarks
     * The contents of <i>pParam</i> depend on those of <i>Status</i>.
     * 
     * The following <b>WMT_STATUS</b> values can be passed to this method by the reader.
     * 
     * <table>
     * <tr>
     * <th>Member
     *             </th>
     * <th>Description
     *             </th>
     * </tr>
     * <tr>
     * <td>WMT_ACQUIRE_LICENSE</td>
     * <td>The license acquisition process is complete. If the license acquisition is unsuccessful, an error is returned in the <i>hr</i> parameter. If the license acquisition is successful, S_OK is returned in the <i>hr</i> parameter, and a <a href="https://docs.microsoft.com/windows/desktop/wmformat/wm-get-license-data">WM_GET_LICENSE_DATA</a> data structure is returned in the <i>pvalue</i> parameter.</td>
     * </tr>
     * <tr>
     * <td>WMT_BUFFERING_START</td>
     * <td>The reader has started buffering data.</td>
     * </tr>
     * <tr>
     * <td>WMT_BUFFERING_STOP</td>
     * <td>The reader has stopped buffering data.</td>
     * </tr>
     * <tr>
     * <td>WMT_CLOSED</td>
     * <td>The reader has closed the file.</td>
     * </tr>
     * <tr>
     * <td>WMT_CONNECTING</td>
     * <td>The reader is connecting to a server.</td>
     * </tr>
     * <tr>
     * <td>WMT_END_OF_FILE</td>
     * <td>The reader has reached the end of the file.</td>
     * </tr>
     * <tr>
     * <td>WMT_END_OF_SEGMENT</td>
     * <td>When the <b>Start</b> method is called with a duration argument, WMT_END_OF_SEGMENT is returned when playback has been completed after the specified period. The argument is a <b>QWORD</b> indicating duration of playback in 100-nanosecond units.</td>
     * </tr>
     * <tr>
     * <td>WMT_END_OF_STREAMING</td>
     * <td>The file has finished streaming.</td>
     * </tr>
     * <tr>
     * <td>WMT_EOF</td>
     * <td>The reader has reached the end of the file.</td>
     * </tr>
     * <tr>
     * <td>WMT_ERROR</td>
     * <td>An error occurred in reading the file.</td>
     * </tr>
     * <tr>
     * <td>WMT_INDIVIDUALIZE</td>
     * <td>The individualization process is in progress or has completed. This event is sent repeatedly during the individualization process. <i>pvalue</i> contains a <a href="https://docs.microsoft.com/windows/desktop/wmformat/wm-individualize-status">WM_INDIVIDUALIZE_STATUS</a> structure that contains status information about the progress of the download.</td>
     * </tr>
     * <tr>
     * <td>WMT_LOCATING</td>
     * <td>The reader is locating a server.</td>
     * </tr>
     * <tr>
     * <td>WMT_MISSING_CODEC</td>
     * <td>The reader does not have the appropriate codec to decompress this file.</td>
     * </tr>
     * <tr>
     * <td>WMT_NEEDS_INDIVIDUALIZATION</td>
     * <td>The client needs a security update.</td>
     * </tr>
     * <tr>
     * <td>WMT_NEW_METADATA</td>
     * <td>The metadata has changed for the current source.</td>
     * </tr>
     * <tr>
     * <td>WMT_NEW_SOURCEFLAGS</td>
     * <td>There has been a change to the settings for the current source.</td>
     * </tr>
     * <tr>
     * <td>WMT_NO_RIGHTS</td>
     * <td>The reader has tried to play back DRM version 1 content and the computer does not have an appropriate license to play it.</td>
     * </tr>
     * <tr>
     * <td>WMT_NO_RIGHTS_EX</td>
     * <td>The reader has tried to play back DRM version 7 content and the computer does not have an appropriate license to play it.</td>
     * </tr>
     * <tr>
     * <td>WMT_OPENED</td>
     * <td>The file has been opened for reading.</td>
     * </tr>
     * <tr>
     * <td>WMT_SAVEAS_START</td>
     * <td>Starting to save the file to disk.</td>
     * </tr>
     * <tr>
     * <td>WMT_SAVEAS_STOP</td>
     * <td>Stopped saving the file to disk.</td>
     * </tr>
     * <tr>
     * <td>WMT_SOURCE_SWITCH</td>
     * <td>There has been a change in source file or stream.</td>
     * </tr>
     * <tr>
     * <td>WMT_STARTED</td>
     * <td>The reader has started reading the file. The <i>pValue</i> parameter points to a <b>QWORD</b> that indicates the starting timestamp. If it is -1 the starting timestamp is 0. When the value is any other negative number, it should be converted to a positive to give the starting timestamp.</td>
     * </tr>
     * <tr>
     * <td>WMT_STOPPED</td>
     * <td>The reader has stopped reading the file.</td>
     * </tr>
     * <tr>
     * <td>WMT_TIMER</td>
     * <td>A timer event has occurred.</td>
     * </tr>
     * </table>
     *  
     * 
     * The following <b>WMT_STATUS</b> values can be passed to the callback by the writer file sink.
     * 
     * <table>
     * <tr>
     * <th>Member
     *             </th>
     * <th>Description
     *             </th>
     * </tr>
     * <tr>
     * <td>WMT_ERROR</td>
     * <td>An error occurred in writing the file.</td>
     * </tr>
     * <tr>
     * <td>WMT_OPENED</td>
     * <td>The file has been opened for writing.</td>
     * </tr>
     * <tr>
     * <td>WMT_STARTED</td>
     * <td>The writer has started writing the file. The <i>pValue</i> parameter points to a <b>QWORD</b> that indicates the starting timestamp. If it is -1 the starting timestamp is 0. When the value is any other negative number, it should be converted to a positive to give the starting timestamp.</td>
     * </tr>
     * <tr>
     * <td>WMT_STOPPED</td>
     * <td>The writer has stopped writing the file.</td>
     * </tr>
     * <tr>
     * <td>WMT_CLOSED</td>
     * <td>The writer has closed the file.</td>
     * </tr>
     * </table>
     *  
     * 
     * The following <b>WMT_STATUS</b> enumeration values can be passed to the callback by the writer network sink.
     * 
     * <table>
     * <tr>
     * <th>Member
     *             </th>
     * <th>Description
     *             </th>
     * </tr>
     * <tr>
     * <td>WMT_CLIENT_CONNECT</td>
     * <td>A client has connected to the broadcast. The <i>dwType</i> parameter is WMT_TYPE_BINARY, and the <i>pValue</i> parameter points to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wm_client_properties">WM_CLIENT_PROPERTIES</a> structure.</td>
     * </tr>
     * <tr>
     * <td>WMT_CLIENT_DISCONNECT</td>
     * <td>A client has disconnected from the broadcast. The <i>dwType</i> parameter is WMT_TYPE_BINARY, and the <i>pValue</i> parameter points to a <b>WM_CLIENT_PROPERTIES</b> structure.</td>
     * </tr>
     * </table>
     *  
     * 
     * The following <b>WMT_STATUS</b> enumeration values can be passed to the callback by the indexer.
     * 
     * <table>
     * <tr>
     * <th>Member
     *             </th>
     * <th>Description
     *             </th>
     * </tr>
     * <tr>
     * <td>WMT_ERROR</td>
     * <td>An error occurred in reading the file.</td>
     * </tr>
     * <tr>
     * <td>WMT_OPENED</td>
     * <td>The file has been opened for indexing.</td>
     * </tr>
     * <tr>
     * <td>WMT_STARTED</td>
     * <td>The indexer has started indexing the file. The <i>pValue</i> parameter points to a <b>QWORD</b> that indicates the starting timestamp. If it is -1 the starting timestamp is 0. When the value is any other negative number, it should be converted to a positive to give the starting timestamp.</td>
     * </tr>
     * <tr>
     * <td>WMT_STOPPED</td>
     * <td>The indexer has stopped indexing the file.</td>
     * </tr>
     * <tr>
     * <td>WMT_CLOSED</td>
     * <td>The indexer has closed the file.</td>
     * </tr>
     * <tr>
     * <td>WMT_INDEX_PROGRESS</td>
     * <td>Indicates the progress of the current indexing operation. The argument is a <b>DWORD</b> that indicates percentage completed, ranging from 0 to 100.</td>
     * </tr>
     * </table>
     *  
     * 
     * The following <b>WMT_STATUS</b> enumeration values can be passed to the callback by the backup restorer.
     * 
     * <table>
     * <tr>
     * <th>Member
     *             </th>
     * <th>Description
     *             </th>
     * </tr>
     * <tr>
     * <td>WMT_BACKUPRESTORE_BEGIN</td>
     * <td>Sent when backing up or restoring licenses to indicate the process has started.</td>
     * </tr>
     * <tr>
     * <td>WMT_BACKUPRESTORE_END</td>
     * <td>Sent when backing up or restoring licenses to indicate the process has completed successfully.</td>
     * </tr>
     * <tr>
     * <td>WMT_BACKUPRESTORE_CONNECTING</td>
     * <td>Sent only when restoring licenses, to indicate the clients credentials are being validated.</td>
     * </tr>
     * <tr>
     * <td>WMT_BACKUPRESTORE_DISCONNECTING</td>
     * <td>Sent only when restoring licenses to indicate the clients credentials were validated successfully.</td>
     * </tr>
     * <tr>
     * <td>WMT_ERROR_WITHURL</td>
     * <td>Sent only when restoring licenses to indicate the client does not have the rights to do this.</td>
     * </tr>
     * <tr>
     * <td>WMT_RESTRICTED_LICENSE</td>
     * <td>Sent only when backing up licenses to indicate the licenses are restricted and cannot be backed up.</td>
     * </tr>
     * </table>
     * @param {Integer} Status_ One member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_status">WMT_STATUS</a> enumeration type. For a description of possible <b>WMT_STATUS</b> values, see the tables in the Remarks section.
     * @param {HRESULT} hr <b>HRESULT</b> error code. If this indicates failure, you should not process the status as normal, as some error has occurred. Use <c>if (FAILED(hr))</c> to check for a failed value. See the topic <a href="https://docs.microsoft.com/windows/desktop/wmformat/error-codes">Error Codes</a> for a list of possible results.
     * @param {Integer} dwType Member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_attr_datatype">WMT_ATTR_DATATYPE</a> enumeration type. This value specifies the type of data in the buffer at <i>pValue</i>.
     * @param {Pointer<Integer>} pValue Pointer to a byte array containing the value. The contents of this array depend on the value of <i>Status</i> and the value of <i>dwType</i>.
     * @param {Pointer<Void>} pvContext Generic pointer provided by the application, for its own use. This pointer matches the context pointer given to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreader-open">IWMReader::Open</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmindexer-startindexing">IWMIndexer::StartIndexing</a>, and other methods. The SDK makes no assumptions about the use of this pointer; it is simply provided by the application and passed back to the application when a callback is made.
     * @returns {HRESULT} This method is implemented by the application. It should always return S_OK.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmstatuscallback-onstatus
     */
    OnStatus(Status_, hr, dwType, pValue, pvContext) {
        pValueMarshal := pValue is VarRef ? "char*" : "ptr"
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "int", Status_, "int", hr, "int", dwType, pValueMarshal, pValue, pvContextMarshal, pvContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
