#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFsiNamedStreams.ahk
#Include .\IFsiFileItem.ahk

/**
 * Use this interface to add, remove and enumerate named streams associated with a file. This interface also provides access to the 'Real-Time' attribute of a file.
 * @remarks
 * 
 * While UDF 2.0 is the lowest required revision for named stream support, the user must enable UDF  2.01 or higher to enable the use of both named streams and   real-time file attributes.
 * 
 * 
 * The recipients of a storage medium containing such files are required to read them using special MMC commands reducing read latency and increasing the worst-case read speed.
 * 
 * This interface is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nn-imapi2fs-ifsifileitem2
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IFsiFileItem2 extends IFsiFileItem{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsiFileItem2
     * @type {Guid}
     */
    static IID => Guid("{199d0c19-11e1-40eb-8ec2-c8c822a07792}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 24

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FsiNamedStreams", "get_IsNamedStream", "AddStream", "RemoveStream", "get_IsRealTime", "put_IsRealTime"]

    /**
     * @type {IFsiNamedStreams} 
     */
    FsiNamedStreams {
        get => this.get_FsiNamedStreams()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsNamedStream {
        get => this.get_IsNamedStream()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsRealTime {
        get => this.get_IsRealTime()
        set => this.put_IsRealTime(value)
    }

    /**
     * Retrieves a collection of named streams associated with a file in the file system image.
     * @returns {IFsiNamedStreams} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-ifsinamedstreams">IFsiNamedStreams</a> object that represents a collection of named streams associated with the file.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifsifileitem2-get_fsinamedstreams
     */
    get_FsiNamedStreams() {
        result := ComCall(24, this, "ptr*", &streams := 0, "HRESULT")
        return IFsiNamedStreams(streams)
    }

    /**
     * Determines if the item is a named stream.
     * @returns {VARIANT_BOOL} Pointer to a value that indicates if the item is a named stream. to <b>VARIANT_TRUE</b> if an ; otherwise, <b>VARIANT_FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifsifileitem2-get_isnamedstream
     */
    get_IsNamedStream() {
        result := ComCall(25, this, "short*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Associates a named stream with a specific file in the file system image.
     * @param {BSTR} name A string represents the name of the named stream. This should not include the path and should only contain valid characters as per file system naming conventions.
     * @param {IStream} streamData An <b>IStream</b> interface of the named stream used to write to the resultant file system image.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_S_IMAGE_FEATURE_NOT_SUPPORTED</b></dt>
     * <dt>Value: 0x00AAB15FL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Feature is not supported for the current file system revision, and as a result, will be created without this feature.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * <dt>Value: 0x80004003</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pointer is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_INVALID_PARAM</b></dt>
     * <dt>Value: 0xC0AAB101</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified for parameter '<i>%1!ls!</i>' is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_NOT_IN_FILE_SYSTEM</b></dt>
     * <dt>Value: 0xC0AAB10B</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>ls!'</i> is not part of the file system. It must be added to complete this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_READONLY</b></dt>
     * <dt>Value: 0xC0AAB102</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The referenced <a href="/windows/desktop/api/imapi2fs/nn-imapi2fs-ifilesystemimage">IFileSystemImage</a> object is in read only mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_FSI_INTERNAL_ERROR</b></dt>
     * <dt>Value: 0xC0AAB100L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Internal file system error has occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_DUP_NAME</b></dt>
     * <dt>Value: 0xC0AAB112L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>'%1!ls!'</i> name already exists.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_DATA_STREAM_READ_FAILURE</b></dt>
     * <dt>Value: 0xC0AAB129L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot read data from stream supplied for file <i>'%1!ls!'</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_IMAGE_SIZE_LIMIT</b></dt>
     * <dt>Value: 0xC0AAB120L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Adding <i>'%1!ls!'</i> would result in a result image having a size larger than the current configured limit.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_DATA_STREAM_INCONSISTENCY</b></dt>
     * <dt>Value: 0xC0AAB128L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data stream supplied for the file <i>'%1!ls!'</i> is inconsistent; expected <i>%2!I64d!</i> bytes, found <i>%3!I64d!</i>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * <dt>Value: 0x8007000EL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failed to allocate required memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifsifileitem2-addstream
     */
    AddStream(name, streamData) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(26, this, "ptr", name, "ptr", streamData, "HRESULT")
        return result
    }

    /**
     * Removes a named stream association with a file.
     * @param {BSTR} name String that specifies the name of the named stream association to remove. This should not include the path and should only contain valid characters as per file system naming conventions.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_S_IMAGE_FEATURE_NOT_SUPPORTED</b></dt>
     * <dt>Value: 0x00AAB15FL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Feature is not supported for the current file system revision, and as a result, will be created without this feature.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * <dt>Value: 0x80004003</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pointer is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_INVALID_PARAM</b></dt>
     * <dt>Value: 0xC0AAB101</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified for parameter '<i>%1!ls!</i>' is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_NOT_IN_FILE_SYSTEM</b></dt>
     * <dt>Value: 0xC0AAB10B</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>ls!'</i> is not part of the file system. It must be added to complete this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_READONLY</b></dt>
     * <dt>Value: 0xC0AAB102</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The referenced <a href="/windows/desktop/api/imapi2fs/nn-imapi2fs-ifilesystemimage">IFileSystemImage</a> object is in read only mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_FSI_INTERNAL_ERROR</b></dt>
     * <dt>Value: 0xC0AAB100L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Internal file system error has occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_DUP_NAME</b></dt>
     * <dt>Value: 0xC0AAB112L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>'%1!ls!'</i> name already exists.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_DATA_STREAM_READ_FAILURE</b></dt>
     * <dt>Value: 0xC0AAB129L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot read data from stream supplied for file <i>'%1!ls!'</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_IMAGE_SIZE_LIMIT</b></dt>
     * <dt>Value: 0xC0AAB120L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Adding <i>'%1!ls!'</i> would result in a result image having a size larger than the current configured limit.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_DATA_STREAM_INCONSISTENCY</b></dt>
     * <dt>Value: 0xC0AAB128L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data stream supplied for the file <i>'%1!ls!'</i> is inconsistent; expected <i>%2!I64d!</i> bytes, found <i>%3!I64d!</i>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * <dt>Value: 0x8007000EL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failed to allocate required memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifsifileitem2-removestream
     */
    RemoveStream(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(27, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * Retrieves the property value that specifies if a file item in the file system image is a 'Real-Time' or standard file.
     * @returns {VARIANT_BOOL} Pointer to a value that indicates if the Real-Time attribute of the file is set in the file system image.  A value of <b>VARIANT_TRUE</b>indicates the attribute is set; otherwise, <b>VARIANT_FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifsifileitem2-get_isrealtime
     */
    get_IsRealTime() {
        result := ComCall(28, this, "short*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Sets the 'Real-Time' attribute of a file in a file system. This attribute specifies whether or not the content requires a minimum data-transfer rate when writing or reading, for example, audio and video data.
     * @param {VARIANT_BOOL} newVal Specify <b>VARIANT_TRUE</b> to set the Real-Time attribute of a file in the file system image; otherwise, <b>VARIANT_FALSE</b>. The default is <b>VARIANT_FALSE</b>.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_S_IMAGE_FEATURE_NOT_SUPPORTED</b></dt>
     * <dt>Value: 0x00AAB15FL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Feature is not supported for the current file system revision, and as a result, the file has been marked as Real-Time but will not appear as such in the resultant file system image unless UDF revision 2.01 or higher is enabled in the file system object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_PROPERTY_NOT_ACCESSIBLE</b></dt>
     * <dt>Value: 0xC0AAB160L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Property '<i>%1!ls!</i>' is not accessible.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_INVALID_PARAM</b></dt>
     * <dt>Value: 0xC0AAB101</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified for parameter '<i>%1!ls!</i>' is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  Currently, S_OK is returned when using this method to set a  Real-Time attribute   value of a file that is 'Read Only' as a result of a successful  <a href="/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimage-createresultimage">CreateResultImage</a> operation.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifsifileitem2-put_isrealtime
     */
    put_IsRealTime(newVal) {
        result := ComCall(29, this, "short", newVal, "HRESULT")
        return result
    }
}
