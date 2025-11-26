#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFsiDirectoryItem.ahk

/**
 * Use this interface to add a directory tree, which includes all sub-directories, files, and associated named streams to a file system image.
 * @remarks
 * 
 * All sub-directories, files, and associated named streams can only be added after the directory item has been  added to the file system image.
 * 
 * UDF must be enabled and set to UDF revision 2.00 or later in order to enable named stream support during the creation of the file system image.
 * 
 * This interface is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nn-imapi2fs-ifsidirectoryitem2
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IFsiDirectoryItem2 extends IFsiDirectoryItem{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsiDirectoryItem2
     * @type {Guid}
     */
    static IID => Guid("{f7fb4b9b-6d96-4d7b-9115-201b144811ef}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 29

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddTreeWithNamedStreams"]

    /**
     * Adds the contents of a directory tree along with named streams associated with all files to the file system image.
     * @param {BSTR} sourceDirectory String that contains the relative path of the directory tree to create. The path should contain only valid characters as per file system naming conventions. 
     * This parameter cannot be <b>NULL</b>. 
     * 
     * <div class="alert"><b>Note</b>  You must specify the full path when calling this method from the root directory item.</div>
     * <div> </div>
     * @param {VARIANT_BOOL} includeBaseDirectory Set to <b>VARIANT_TRUE</b> to include the directory in <i>sourceDirectory</i> as a subdirectory in the file system image. Otherwise, <b>VARIANT_FALSE</b>.
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
     * <dt><b>IMAPI_E_DATA_STREAM_CREATE_FAILURE</b></dt>
     * <dt>Value: Value: 0xC0AAB12AL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Error occurred while creating data stream for <i>'%1!ls!'</i>.
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
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifsidirectoryitem2-addtreewithnamedstreams
     */
    AddTreeWithNamedStreams(sourceDirectory, includeBaseDirectory) {
        sourceDirectory := sourceDirectory is String ? BSTR.Alloc(sourceDirectory).Value : sourceDirectory

        result := ComCall(29, this, "ptr", sourceDirectory, "short", includeBaseDirectory, "HRESULT")
        return result
    }
}
