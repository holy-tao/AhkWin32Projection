#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFsiDirectoryItem.ahk
#Include .\IBootOptions.ahk
#Include .\IFileSystemImageResult.ahk
#Include .\IFsiFileItem.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Use this interface to build a file system image, set session parameter, and import or export an image.
 * @remarks
 * To create the <b>CFileSystemImage</b> object in a script, use IMAPI2.MsftFileSystemImage as the program identifier when calling <b>CreateObject</b>.
 * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nn-imapi2fs-ifilesystemimage
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IFileSystemImage extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileSystemImage
     * @type {Guid}
     */
    static IID => Guid("{2c941fe1-975b-59be-a960-9a2a262853a5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Root", "get_SessionStartBlock", "put_SessionStartBlock", "get_FreeMediaBlocks", "put_FreeMediaBlocks", "SetMaxMediaBlocksFromDevice", "get_UsedBlocks", "get_VolumeName", "put_VolumeName", "get_ImportedVolumeName", "get_BootImageOptions", "put_BootImageOptions", "get_FileCount", "get_DirectoryCount", "get_WorkingDirectory", "put_WorkingDirectory", "get_ChangePoint", "get_StrictFileSystemCompliance", "put_StrictFileSystemCompliance", "get_UseRestrictedCharacterSet", "put_UseRestrictedCharacterSet", "get_FileSystemsToCreate", "put_FileSystemsToCreate", "get_FileSystemsSupported", "put_UDFRevision", "get_UDFRevision", "get_UDFRevisionsSupported", "ChooseImageDefaults", "ChooseImageDefaultsForMediaType", "put_ISO9660InterchangeLevel", "get_ISO9660InterchangeLevel", "get_ISO9660InterchangeLevelsSupported", "CreateResultImage", "Exists", "CalculateDiscIdentifier", "IdentifyFileSystemsOnDisc", "GetDefaultFileSystemForImport", "ImportFileSystem", "ImportSpecificFileSystem", "RollbackToChangePoint", "LockInChangePoint", "CreateDirectoryItem", "CreateFileItem", "get_VolumeNameUDF", "get_VolumeNameJoliet", "get_VolumeNameISO9660", "get_StageFiles", "put_StageFiles", "get_MultisessionInterfaces", "put_MultisessionInterfaces"]

    /**
     * @type {IFsiDirectoryItem} 
     */
    Root {
        get => this.get_Root()
    }

    /**
     * @type {Integer} 
     */
    SessionStartBlock {
        get => this.get_SessionStartBlock()
        set => this.put_SessionStartBlock(value)
    }

    /**
     * @type {Integer} 
     */
    FreeMediaBlocks {
        get => this.get_FreeMediaBlocks()
        set => this.put_FreeMediaBlocks(value)
    }

    /**
     * @type {Integer} 
     */
    UsedBlocks {
        get => this.get_UsedBlocks()
    }

    /**
     * @type {BSTR} 
     */
    VolumeName {
        get => this.get_VolumeName()
        set => this.put_VolumeName(value)
    }

    /**
     * @type {BSTR} 
     */
    ImportedVolumeName {
        get => this.get_ImportedVolumeName()
    }

    /**
     * @type {IBootOptions} 
     */
    BootImageOptions {
        get => this.get_BootImageOptions()
        set => this.put_BootImageOptions(value)
    }

    /**
     * @type {Integer} 
     */
    FileCount {
        get => this.get_FileCount()
    }

    /**
     * @type {Integer} 
     */
    DirectoryCount {
        get => this.get_DirectoryCount()
    }

    /**
     * @type {BSTR} 
     */
    WorkingDirectory {
        get => this.get_WorkingDirectory()
        set => this.put_WorkingDirectory(value)
    }

    /**
     * @type {Integer} 
     */
    ChangePoint {
        get => this.get_ChangePoint()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    StrictFileSystemCompliance {
        get => this.get_StrictFileSystemCompliance()
        set => this.put_StrictFileSystemCompliance(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    UseRestrictedCharacterSet {
        get => this.get_UseRestrictedCharacterSet()
        set => this.put_UseRestrictedCharacterSet(value)
    }

    /**
     * @type {Integer} 
     */
    FileSystemsToCreate {
        get => this.get_FileSystemsToCreate()
        set => this.put_FileSystemsToCreate(value)
    }

    /**
     * @type {Integer} 
     */
    FileSystemsSupported {
        get => this.get_FileSystemsSupported()
    }

    /**
     * @type {Integer} 
     */
    UDFRevision {
        get => this.get_UDFRevision()
        set => this.put_UDFRevision(value)
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    UDFRevisionsSupported {
        get => this.get_UDFRevisionsSupported()
    }

    /**
     * @type {Integer} 
     */
    ISO9660InterchangeLevel {
        get => this.get_ISO9660InterchangeLevel()
        set => this.put_ISO9660InterchangeLevel(value)
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    ISO9660InterchangeLevelsSupported {
        get => this.get_ISO9660InterchangeLevelsSupported()
    }

    /**
     * @type {BSTR} 
     */
    VolumeNameUDF {
        get => this.get_VolumeNameUDF()
    }

    /**
     * @type {BSTR} 
     */
    VolumeNameJoliet {
        get => this.get_VolumeNameJoliet()
    }

    /**
     * @type {BSTR} 
     */
    VolumeNameISO9660 {
        get => this.get_VolumeNameISO9660()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    StageFiles {
        get => this.get_StageFiles()
        set => this.put_StageFiles(value)
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    MultisessionInterfaces {
        get => this.get_MultisessionInterfaces()
        set => this.put_MultisessionInterfaces(value)
    }

    /**
     * Retrieves the root directory item.
     * @returns {IFsiDirectoryItem} An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-ifsidirectoryitem">IFsiDirectoryItem</a> interface of the root directory item.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-get_root
     */
    get_Root() {
        result := ComCall(7, this, "ptr*", &pVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IFsiDirectoryItem(pVal)
    }

    /**
     * Retrieves the starting block address for the recording session.
     * @remarks
     * The session starting block can be set in the following ways:
     * 
     * <ul>
     * <li>Importing a file system automatically sets the session starting block.</li>
     * <li>If the previous session is not imported, the client can call <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimage-put_sessionstartblock">IFileSystemImage::put_SessionStartBlock</a> to set this property.</li>
     * </ul>
     * @returns {Integer} Starting block address for the recording session.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-get_sessionstartblock
     */
    get_SessionStartBlock() {
        result := ComCall(8, this, "int*", &pVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVal
    }

    /**
     * Sets the starting block address for the recording session.
     * @remarks
     * If the previous session is imported, the session start block cannot be changed manually.
     * @param {Integer} newVal Block number of the new recording session.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-put_sessionstartblock
     */
    put_SessionStartBlock(newVal) {
        result := ComCall(9, this, "int", newVal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the maximum number of blocks available for the image.
     * @returns {Integer} Number of blocks to use in creating the file system image.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-get_freemediablocks
     */
    get_FreeMediaBlocks() {
        result := ComCall(10, this, "int*", &pVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVal
    }

    /**
     * Sets the maximum number of blocks available for the image.
     * @param {Integer} newVal Number of blocks to use in creating the file system image. 
     * 
     * By default, 332,800 blocks are used to create the file system image. This value assumes a capacity of 74 minutes of audio per 650MB disc.
     * 
     * To specify an infinite number of block, set <i>newVal</i> to zero.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_IMAGE_TOO_BIG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Value specified for FreeMediaBlocks property is too small for estimated image size based on current data. 
     * 
     * Value: 0xC0AAB121
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-put_freemediablocks
     */
    put_FreeMediaBlocks(newVal) {
        result := ComCall(11, this, "int", newVal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Set maximum number of blocks available based on the capabilities of the recorder.
     * @param {IDiscRecorder2} discRecorder An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-idiscrecorder2">IDiscRecorder2</a> interface that identifies the recording device from which you want to set the maximum number of blocks available.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pointer is not valid.
     * 
     * Value: 0x80004003
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_FSI_INTERNAL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Internal error occurred: <i>%1!ls!</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-setmaxmediablocksfromdevice
     */
    SetMaxMediaBlocksFromDevice(discRecorder) {
        result := ComCall(12, this, "ptr", discRecorder, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the number of blocks in use.
     * @returns {Integer} Estimated number of blocks used in the file-system image.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-get_usedblocks
     */
    get_UsedBlocks() {
        result := ComCall(13, this, "int*", &pVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVal
    }

    /**
     * Retrieves the volume name for this file system image.
     * @remarks
     * To set the volume name, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimage-put_volumename">IFileSystemImage::put_VolumeName</a> method.
     * @returns {BSTR} String that contains the volume name for this file system image.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-get_volumename
     */
    get_VolumeName() {
        pVal := BSTR()
        result := ComCall(14, this, "ptr", pVal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVal
    }

    /**
     * Sets the volume name for this file system image.
     * @remarks
     * The string is limited to 15 characters. For ISO 9660 discs, the volume name can use the following characters:
     * 
     * <ul>
     * <li>"A" through "Z"</li>
     * <li>"0" through "9"</li>
     * <li>"_" (underscore)</li>
     * </ul>
     * For Joliet and UDF discs, the volume name can use the following characters:
     * 
     * <ul>
     * <li>"a" through "z"</li>
     * <li>"A" through "Z"</li>
     * <li>"0" through "9"</li>
     * <li>"." (period)</li>
     * <li>"_" (underscore)</li>
     * </ul>
     * If you do not specify a volume name, a default volume name is generated using the system date and time when the result object is created.
     * @param {BSTR} newVal String that contains the volume name for this file system image.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_INVALID_VOLUME_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified for parameter <i>%1!ls!</i> is not valid.
     * 
     * Value: 0xC0AAB101
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-put_volumename
     */
    put_VolumeName(newVal) {
        if(newVal is String) {
            pin := BSTR.Alloc(newVal)
            newVal := pin.Value
        }

        result := ComCall(15, this, "ptr", newVal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the volume name provided from an imported file system.
     * @remarks
     * The imported volume name is provided for user information and is not automatically carried forward to subsequent sessions.
     * @returns {BSTR} String that contains the volume name provided from an imported file system. Is <b>NULL</b> until a file system is imported.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-get_importedvolumename
     */
    get_ImportedVolumeName() {
        pVal := BSTR()
        result := ComCall(16, this, "ptr", pVal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVal
    }

    /**
     * Retrieves the boot image that you want to add to the file system image.
     * @returns {IBootOptions} An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-ibootoptions">IBootOptions</a> interface of the boot image to add to the disc. Is <b>NULL</b> if a boot image has not been specified.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-get_bootimageoptions
     */
    get_BootImageOptions() {
        result := ComCall(17, this, "ptr*", &pVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBootOptions(pVal)
    }

    /**
     * Sets the boot image that you want to add to the file-system image. This method creates a complete copy of the passed-in boot options by copying the stream from the supplied IBootOptions interface.
     * @remarks
     * You can specify a boot image only if the file system image has no previous sessions. The boot image must start at the first sector of the disc.
     * @param {IBootOptions} newVal An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-ibootoptions">IBootOptions</a> interface of the boot image that you want to add to the file-system image. Can be <b>NULL</b>.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_BOOT_OBJECT_CONFLICT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A boot object can only be included in an initial disc image.
     * 
     * Value: 0xC0AAB149
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_BOOT_IMAGE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The boot object could not be added to the image.
     * 
     * Value: 0xC0AAB148
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-put_bootimageoptions
     */
    put_BootImageOptions(newVal) {
        result := ComCall(18, this, "ptr", newVal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the number of files in the file system image.
     * @returns {Integer} Number of files in the file system image.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-get_filecount
     */
    get_FileCount() {
        result := ComCall(19, this, "int*", &pVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVal
    }

    /**
     * Retrieves the number of directories in the file system image.
     * @returns {Integer} Number of directories in the file system image.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-get_directorycount
     */
    get_DirectoryCount() {
        result := ComCall(20, this, "int*", &pVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVal
    }

    /**
     * Retrieves the temporary directory in which stash files are built.
     * @returns {BSTR} String that contains the path to the temporary directory.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-get_workingdirectory
     */
    get_WorkingDirectory() {
        pVal := BSTR()
        result := ComCall(21, this, "ptr", pVal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVal
    }

    /**
     * Sets the temporary directory in which stash files are built.
     * @remarks
     * Stash files are the temporary files used to build the file-system image.
     * 
     * An exception results if the existing stash files cannot move to the new working directory. 
     * 
     * You cannot change the working directory if a result stream exists for the file-system image.
     * @param {BSTR} newVal String that contains the path to the temporary working directory. The default is the current temp directory.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_INVALID_PARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified for parameter <i>%1!ls!</i> is not valid.
     * 
     * Value: 0xC0AAB101
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_INVALID_WORKING_DIRECTORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The working directory <i>%1!ls!</i> is not valid.
     * 
     * Value: 0xC0AAB140
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_WORKING_DIRECTORY_SPACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot set working directory to <i>%1!ls!</i>. Space available is <i>%2!I64d!</i> bytes, approximately <i>%3!I64d!</i> bytes required. 
     * 
     * Value: 0xC0AAB141
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-put_workingdirectory
     */
    put_WorkingDirectory(newVal) {
        if(newVal is String) {
            pin := BSTR.Alloc(newVal)
            newVal := pin.Value
        }

        result := ComCall(22, this, "ptr", newVal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the change point identifier.
     * @remarks
     * An application can store the value of this property prior to making a change to the file system, then at a later point pass the value to the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimage-rollbacktochangepoint">IFileSystemImage::RollbackToChangePoint</a> method to revert changes since that point in development.
     * 
     * An application can call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimage-lockinchangepoint">IFileSystemImage::LockInChangePoint</a> method to lock the state of  a file system image at any point in its development. Once a lock is set, you cannot call <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimage-rollbacktochangepoint">RollbackToChangePoint</a> to revert the file system image to its earlier state.
     * @returns {Integer} Change point identifier. The identifier is a count of the changes to the file system image since its inception.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-get_changepoint
     */
    get_ChangePoint() {
        result := ComCall(23, this, "int*", &pVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVal
    }

    /**
     * Determines the compliance level for creating and developing the file-system image. (Get)
     * @returns {VARIANT_BOOL} Is VARIANT_TRUE if the file system images are created in strict compliance with applicable standards.  
     * 
     * Is VARIANT_FALSE if the compliance standards are relaxed to be compatible with IMAPI version 1.0.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-get_strictfilesystemcompliance
     */
    get_StrictFileSystemCompliance() {
        result := ComCall(24, this, "short*", &pVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVal
    }

    /**
     * Determines the compliance level for creating and developing the file-system image. (Put)
     * @remarks
     * If this property is VARIANT_TRUE and a method requests an action that violates one of the file system constraints, an exception is thrown.
     * @param {VARIANT_BOOL} newVal Set to VARIANT_TRUE to create the file system images in strict compliance with applicable standards.  You can specify VARIANT_TRUE only when the file system image is empty.
     * 
     * Set to VARIANT_FALSE to relax the compliance standards to be compatible with IMAPI version 1.0.
     * 
     * The default is VARIANT_FALSE.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-put_strictfilesystemcompliance
     */
    put_StrictFileSystemCompliance(newVal) {
        result := ComCall(25, this, "short", newVal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Determines if the file and directory names use a restricted character.
     * @returns {VARIANT_BOOL} Is VARIANT_TRUE if the file and directory names to add to the file system image must consist of characters that map directly to CP_ANSI (code points 32 through 127). Otherwise, VARIANT_FALSE.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-get_userestrictedcharacterset
     */
    get_UseRestrictedCharacterSet() {
        result := ComCall(26, this, "short*", &pVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVal
    }

    /**
     * Determines if file and directory names should be restricted to using only CP_ANSI characters.
     * @remarks
     * Setting this property does not affect files or directories already in the file system image.
     * 
     * You can change the value of this property only when the result stream is not active.
     * @param {VARIANT_BOOL} newVal Set to VARIANT_TRUE to restrict file and directory names to use only CP_ANSI characters. Otherwise, VARIANT_FALSE. The default is VARIANT_FALSE.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-put_userestrictedcharacterset
     */
    put_UseRestrictedCharacterSet(newVal) {
        result := ComCall(27, this, "short", newVal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the types of file systems to create when generating the result stream.
     * @remarks
     * To specify the file system types, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimage-put_filesystemstocreate">IFileSystemImage::put_FileSystemsToCreate</a> method. You could also call either <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimage-chooseimagedefaults">IFilesystemImage::ChooseImageDefaults</a> or <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimage-chooseimagedefaultsformediatype">IFilesystemImage::ChooseImageDefaultsForMediaType</a> to have IMAPI choose the file system for you.
     * 
     * To retrieve a list of supported file system types, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimage-get_filesystemssupported">IFileSystemImage::get_FileSystemsSupported</a> method.
     * @returns {Integer} One or more file system types to create when generating the result stream. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/ne-imapi2fs-fsifilesystems">FsiFileSystems</a> enumeration type.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-get_filesystemstocreate
     */
    get_FileSystemsToCreate() {
        result := ComCall(28, this, "int*", &pVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVal
    }

    /**
     * Sets the file systems to create when generating the result stream.
     * @remarks
     * This method returns <b>IMAPI_E_INCOMPATIBLE_PREVIOUS_SESSION</b> if the previous session was imported  using <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimage-importfilesystem">IFileSystemImage::ImportFileSystem</a> or <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimage-importspecificfilesystem">IFileSystemImage::ImportSpecificFileSystem</a> and the layout of that session is incompatible with the layout used by IMAPI for the file systems identified by the specified <i>newVal</i> in <b>IFileSystemImage::put_FileSystemToCreate</b>.
     * 
     * You can change the file system only when the result stream is not active.
     * @param {Integer} newVal One or more file systems to create when generating the result stream. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/ne-imapi2fs-fsifilesystems">FsiFileSystems</a> enumeration type.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_INVALID_PARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified for parameter <i>%1!ls!</i> is not valid.
     * 
     * Value: 0xC0AAB101
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_TOO_MANY_DIRS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This file system image has too many directories for the <i>%1!ls!</i> file system.
     * 
     * Value: 0xC0AAB130
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_FILE_SYSTEM_CHANGE_NOT_ALLOWED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * You cannot change the file system specified for creation, because the file system in the imported session and the one in the new session do not match.
     * 
     * Value: 0xC0AAB163L
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_ISO9660_LEVELS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * ISO9660 is limited to 8 levels of directories.
     * 
     * Value: 0xC0AAB131
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_INCOMPATIBLE_PREVIOUS_SESSION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * You cannot change the file system specified for creation, because the file system from the imported session and the file system in the current session do not match.
     * 
     * Value: 0xC0AAB133
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_S_IMAGE_FEATURE_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This feature is not supported for the current file system revision. The image will be created without this feature.
     * 
     * Value: 0x00AAB15FL
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-put_filesystemstocreate
     */
    put_FileSystemsToCreate(newVal) {
        result := ComCall(29, this, "int", newVal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the list of file system types that a client can use to build a file system image.
     * @returns {Integer} One or more file system types that a client can use to build a file system image. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/ne-imapi2fs-fsifilesystems">FsiFileSystems</a> enumeration type.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-get_filesystemssupported
     */
    get_FileSystemsSupported() {
        result := ComCall(30, this, "int*", &pVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVal
    }

    /**
     * Sets the UDF revision level of the file system image.
     * @remarks
     * The value is encoded according to the UDF specification, except the variable size is LONG. For example, revision level 1.02 is represented as 0x102.
     * 
     * This property is used to specify the UDF revision in a new file system image. If the file system is imported, you cannot call this method to change the UDF revision level.
     * 
     * To determine the supported UDF revision levels, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimage-get_udfrevisionssupported">IFileSystemImage::get_UDFRevisionsSupported</a> method.
     * @param {Integer} newVal A hexadecimal number representing the UDF revision level.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_INVALID_PARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified for parameter <i>%1!ls!</i> is not valid.
     * 
     * Value: 0xC0AAB101
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-put_udfrevision
     */
    put_UDFRevision(newVal) {
        result := ComCall(31, this, "int", newVal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the UDF revision level of the imported file system image.
     * @remarks
     * The value is encoded according to the UDF specification, except the variable size is LONG. For example, revision level 1.02 is represented as 0x102.
     * @returns {Integer} UDF revision level of the imported file system image.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-get_udfrevision
     */
    get_UDFRevision() {
        result := ComCall(32, this, "int*", &pVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVal
    }

    /**
     * Retrieves a list of supported UDF revision levels.
     * @remarks
     * The value is encoded according to the UDF specification, except the variable size is LONG. For example, revision level 1.02 is represented as 0x102.
     * @returns {Pointer<SAFEARRAY>} List of supported UDF revision levels. Each element of the list is VARIANT. The variant type is <b>VT_I4</b>. The <b>lVal</b> member of the variant contains the revision level.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-get_udfrevisionssupported
     */
    get_UDFRevisionsSupported() {
        result := ComCall(33, this, "ptr*", &pVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVal
    }

    /**
     * Sets the default file system types and the image size based on the current media.
     * @param {IDiscRecorder2} discRecorder An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-idiscrecorder2">IDiscRecorder2</a> the identifies the device that contains the current media.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pointer is not valid.
     * 
     * Value: 0x80004003
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_RECORDER_MEDIA_INCOMPATIBLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The media is not compatible or of unknown physical format.
     * 
     * Value: 0xC0AA0203
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_IMAGE_TOO_BIG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Value specified for FreeMediaBlocks property is too small for estimated image size based on current data. 
     * 
     * Value: 0xC0AAB121
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_NO_SUPPORTED_FILE_SYSTEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified disc does not contain one of the supported file systems.
     * 
     * Value: 0xC0AAB151
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-chooseimagedefaults
     */
    ChooseImageDefaults(discRecorder) {
        result := ComCall(34, this, "ptr", discRecorder, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the default file system types and the image size based on the specified media type.
     * @param {Integer} value Identifies the physical media type that will receive the burn image. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/ne-imapi2-imapi_media_physical_type">IMAPI_MEDIA_PHYSICAL_TYPE</a> enumeration type.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_INVALID_PARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified for parameter <i>%1!ls!</i> is not valid.
     * 
     * Value: 0xC0AAB101
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_IMAGE_TOO_BIG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Value specified for FreeMediaBlocks property is too small for estimated image size based on current data. 
     * 
     * Value: 0xC0AAB121
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-chooseimagedefaultsformediatype
     */
    ChooseImageDefaultsForMediaType(value) {
        result := ComCall(35, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the ISO9660 compatibility level of the file system image.
     * @remarks
     * To determine the supported compatibility levels, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimage-get_iso9660interchangelevelssupported">IFileSystemImage::get_ISO9660InterchangeLevelsSupported</a> method.
     * 
     * This property is meaningful only if you specified FsiFileSystemISO9660 when calling <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimage-put_filesystemstocreate">IFileSystemImage::put_FileSystemsToCreate</a>.
     * @param {Integer} newVal ISO9660 compatibility level of the file system image.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_INVALID_PARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified for parameter <i>%1!ls!</i> is not valid.
     * 
     * Value: 0xC0AAB101
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-put_iso9660interchangelevel
     */
    put_ISO9660InterchangeLevel(newVal) {
        result := ComCall(36, this, "int", newVal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the ISO9660 compatibility level to use when creating the result image.
     * @remarks
     * For a list of supported compatibility levels, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimage-get_iso9660interchangelevelssupported">IFileSystemImage::get_ISO9660InterchangeLevelsSupported</a> method.
     * @returns {Integer} Identifies the interchange level of the ISO9660 file system.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-get_iso9660interchangelevel
     */
    get_ISO9660InterchangeLevel() {
        result := ComCall(37, this, "int*", &pVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVal
    }

    /**
     * Retrieves the supported ISO9660 compatibility levels.
     * @returns {Pointer<SAFEARRAY>} List of supported ISO9660 compatibility levels. Each item in the list is a VARIANT that identifies one supported interchange level. The variant type is <b>VT_UI4</b>. The <b>ulVal</b> member of the variant contains the compatibility level.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-get_iso9660interchangelevelssupported
     */
    get_ISO9660InterchangeLevelsSupported() {
        result := ComCall(38, this, "ptr*", &pVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVal
    }

    /**
     * Create the result object that contains the file system and file data.
     * @remarks
     * Currently, <b>IFileSystemImage::CreateResultImage</b> will require disc media access as a result of  a previous <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimage-identifyfilesystemsondisc">IFileSystemImage::IdentifyFileSystemsOnDisc</a> method call. To resolve this issue, it is recommended that another  <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-ifilesystemimage">IFileSystemImage</a> object be created specifically for the <b>IFileSystemImage::IdentifyFileSystemsOnDisc</b> operation.
     * 
     * The resulting stream can be saved as an ISO file if the file system is generated in a single session and has a start address of zero.
     * @returns {IFileSystemImageResult} An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-ifilesystemimageresult">IFileSystemImageResult</a> interface of the image result.
     * 
     * Client applications can stream the image to media or other long-term storage devices, such as disk drives.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-createresultimage
     */
    CreateResultImage() {
        result := ComCall(39, this, "ptr*", &resultStream := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IFileSystemImageResult(resultStream)
    }

    /**
     * Checks for the existence of a given file or directory.
     * @param {BSTR} fullPath String that contains the fully qualified path of the directory or file to check.
     * @returns {Integer} Indicates if the item is a file, a directory, or does not exist. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/ne-imapi2fs-fsiitemtype">FsiItemType</a> enumeration type.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-exists
     */
    Exists(fullPath) {
        if(fullPath is String) {
            pin := BSTR.Alloc(fullPath)
            fullPath := pin.Value
        }

        result := ComCall(40, this, "ptr", fullPath, "int*", &itemType := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return itemType
    }

    /**
     * Retrieves a string that identifies a disc and the sessions recorded on the disc.
     * @remarks
     * When layering sessions on a disc, the signature acts as a key that the client can use to ensure the session order, and to distinguish sessions on disc from session images that will be laid on the disc. 
     * 
     * You must call <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimage-put_multisessioninterfaces">IFileSystemImage::put_MultisessionInterfaces</a> prior to calling <b>CalculateDiscIdentifier</b>.
     * @returns {BSTR} String that contains a signature that identifies the disc and the sessions on it. This string is not guaranteed to be unique between discs.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-calculatediscidentifier
     */
    CalculateDiscIdentifier() {
        discIdentifier := BSTR()
        result := ComCall(41, this, "ptr", discIdentifier, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return discIdentifier
    }

    /**
     * Retrieves a list of the different types of file systems on the optical media.
     * @remarks
     * Client applications can call <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimage-getdefaultfilesystemforimport">IFileSystemImage::GetDefaultFileSystemForImport</a> with the value returned by this method to determine the type of file system to import.
     * @param {IDiscRecorder2} discRecorder An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-idiscrecorder2">IDiscRecorder2</a> interface that identifies the recording device that contains the media. If this parameter is <b>NULL</b>, the <i>discRecorder</i>  specified in <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-imultisession">IMultisession</a> will be used.
     * @returns {Integer} One or more files systems on the disc. For possible values, see <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/ne-imapi2fs-fsifilesystems">FsiFileSystems</a> enumeration type.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-identifyfilesystemsondisc
     */
    IdentifyFileSystemsOnDisc(discRecorder) {
        result := ComCall(42, this, "ptr", discRecorder, "int*", &fileSystems := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return fileSystems
    }

    /**
     * Retrieves the file system to import by default.
     * @remarks
     * Use this method to identify the default file system to use with <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimage-importfilesystem">IFileSystemImage::ImportFileSystem</a>.
     * 
     * To identify the supported file systems, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimage-get_filesystemssupported">IFileSystemImage::get_FileSystemsSupported</a> method.
     * @param {Integer} fileSystems One or more file system values. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/ne-imapi2fs-fsifilesystems">FsiFileSystems</a> enumeration type.
     * @returns {Integer} A single file system value that identifies the default file system.  The value is one of the file systems specified in <i>fileSystems</i>
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-getdefaultfilesystemforimport
     */
    GetDefaultFileSystemForImport(fileSystems) {
        result := ComCall(43, this, "int", fileSystems, "int*", &importDefault := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return importDefault
    }

    /**
     * Imports the default file system on the current disc.
     * @remarks
     * You must call <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimage-put_multisessioninterfaces">IFileSystemImage::put_MultisessionInterfaces</a> prior to calling <b>IFileSystemImage::ImportFileSystem</b>. Additionally, it is recommended that  <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2-get_mediaheuristicallyblank">IDiscFormat2::get_MediaHeuristicallyBlank</a> is called before <b>IFileSystemImage::put_MultisessionInterfaces</b> to verify that the media is not blank.
     * 
     * If the disc contains more than one file system, only one file system is imported. This method chooses the file system to import in the following order: UDF, Joliet, ISO 9660.  The import includes transferring directories and files to the in-memory file system structure.
     * 
     * You may call this method at any time during the construction of the in-memory file system.  If, during import, a file or directory already exists in the in-memory copy, the in-memory version will be retained; the imported file will be discarded.
     * 
     * To determine which file system is the default file system for the disc, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimage-getdefaultfilesystemforimport">IFileSystemImage::GetDefaultFileSystemForImport</a> method.
     * 
     * This method only reads the file information. If the item is a file, the file data is copied when calling <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifsidirectoryitem-addfile">IFsiDirectoryItem::AddFile</a>, <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifsidirectoryitem-addtree">IFsiDirectoryItem::AddTree</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifsidirectoryitem-add">IFsiDirectoryItem::Add</a> method. 
     * 
     * This method returns <b>IMAPI_E_NO_SUPPORTED_FILE_SYSTEM</b> if a supported file system is not found in the last session.  Additionally, this method returns <b>IMAPI_E_INCOMPATIBLE_PREVIOUS_SESSION</b> if the layout of the file system  in the last session is incompatible with the layout used by IMAPI for the creation of requested file systems for the result image. For more details see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimage-put_filesystemstocreate">IFileSystemImage::put_FileSystemsToCreate</a> method documentation.
     * @returns {Integer} Identifies the imported file system. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/ne-imapi2fs-fsifilesystems">FsiFileSystems</a> enumeration type.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-importfilesystem
     */
    ImportFileSystem() {
        result := ComCall(44, this, "int*", &importedFileSystem := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return importedFileSystem
    }

    /**
     * Import a specific file system from disc.
     * @remarks
     * You must call <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimage-put_multisessioninterfaces">IFileSystemImage::put_MultisessionInterfaces</a> prior to calling <b>IFileSystemImage::ImportSpecificFileSystem</b>. Additionally, it is recommended that  <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2-get_mediaheuristicallyblank">IDiscFormat2::get_MediaHeuristicallyBlank</a> is called before <b>IFileSystemImage::put_MultisessionInterfaces</b> to verify that the media is not blank.
     * 
     * You may call this method at any time during the construction of the in-memory file system.  If, during import, a file or directory already exists in the in-memory copy, the in-memory version will be retained; the imported file will be discarded.
     * 
     * On re-writable media (DVD+/-RW, DVDRAM, BD-RE), import or burning a second session is not support if the first session has an ISO9660 file system, due to file system limitations.
     * 
     * This method only reads the file information. If the item is a file, the file data is copied when calling <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifsidirectoryitem-addfile">IFsiDirectoryItem::AddFile</a>, <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifsidirectoryitem-addtree">IFsiDirectoryItem::AddTree</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifsidirectoryitem-add">IFsiDirectoryItem::Add</a> method. 
     * 
     * this method returns <b>IMAPI_E_INCOMPATIBLE_PREVIOUS_SESSION</b> if the layout of the file system  in the last session is incompatible with the layout used by IMAPI for the creation of requested file systems for the result image. For more details see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimage-put_filesystemstocreate">IFileSystemImage::put_FileSystemsToCreate</a> method documentation.
     * If the file system specified by <i>fileSystemToUse</i> has not been found, this method returns <b>IMAPI_E_FILE_SYSTEM_NOT_FOUND</b>.
     * @param {Integer} fileSystemToUse Identifies the file system to import. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/ne-imapi2fs-fsifilesystems">FsiFileSystems</a> enumeration type.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_INVALID_PARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified for parameter <i>%1!ls!</i> is not valid.
     * 
     * Value: 0xC0AAB101
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_MULTISESSION_NOT_SET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * MultisessionInterfaces property must be set prior calling this method.
     * 
     * Value: 0xC0AAB15D
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_BOOT_OBJECT_CONFLICT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A boot object can only be included in an initial disc image.
     * 
     * Value: 0xC0AAB149
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_EMPTY_DISC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Optical media is empty.
     * 
     * Value: 0xC0AAB150
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
     * Failed to allocate the required memory.
     * 
     * Value: 0x8007000E
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_NO_COMPATIBLE_MULTISESSION_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * IMAPI supports none of the multisession type(s) provided on the current media.
     * 
     * Value: 0xC0AAB15C
     * 
     * <div class="alert"><b>Note</b>  <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimage-importfilesystem">IFileSystemImage::ImportFileSystem</a>  method returns this error if there is no media in the recording device.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_INCOMPATIBLE_PREVIOUS_SESSION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Operation failed because of incompatible layout of the previous session imported from the medium.
     * 
     * Value: 0xC0AAB133
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_FILE_SYSTEM_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified disc does not contain a '%1!ls!' file system.
     * 
     * Value: 0xC0AAB152
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_INVALID_PATH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file system specified for import contains an invalid file name.
     * 
     * Value: 0xC0AAB110
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-importspecificfilesystem
     */
    ImportSpecificFileSystem(fileSystemToUse) {
        result := ComCall(45, this, "int", fileSystemToUse, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Reverts the image back to the specified change point.
     * @remarks
     * Typically, an application calls the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimage-get_changepoint">IFileSystemImage::get_ChangePoint</a> method and stores the change point value prior to making a change to the file system. If necessary, you can pass the change point value to this method to revert changes since that point in development.
     * 
     * An application can call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimage-lockinchangepoint">IFileSystemImage::LockInChangePoint</a> method to lock the state of  a file system image at any point in its development. After a lock is set, you cannot call this method to revert the file system image to its earlier state.
     * @param {Integer} changePoint Change point that identifies the target state for rollback.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_TOO_MANY_DIRS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This file system image has too many directories for the <i>%1!ls!</i> file system.
     * 
     * Value: 0xC0AAB130
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_ISO9660_LEVELS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * ISO9660 is limited to 8 levels of directories.
     * 
     * Value: 0xC0AAB131
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-rollbacktochangepoint
     */
    RollbackToChangePoint(changePoint) {
        result := ComCall(46, this, "int", changePoint, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Locks the file system information at the current change-point level.
     * @remarks
     * Once the change point is locked, rollback to earlier change points is not permitted.
     * 
     * Locking the change point does not change the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimage-get_changepoint">IFileSystemImage::get_ChangePoint</a> property.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_FSI_INTERNAL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Internal error occurred: <i>%1!ls!</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-lockinchangepoint
     */
    LockInChangePoint() {
        result := ComCall(47, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Create a directory item with the specified name.
     * @remarks
     * After setting properties on the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-ifsidirectoryitem">IFsiDirectoryItem</a> interface, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifsidirectoryitem-add">IFsiDirectoryItem::Add</a> method on the parent directory item to add it to the file system image.
     * @param {BSTR} name String that contains the name of the directory item to create.
     * @returns {IFsiDirectoryItem} An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-ifsidirectoryitem">IFsiDirectoryItem</a> interface of the new directory item.  When done, call the <b>IFsiDirectoryItem::Release</b> method to release the interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-createdirectoryitem
     */
    CreateDirectoryItem(name) {
        if(name is String) {
            pin := BSTR.Alloc(name)
            name := pin.Value
        }

        result := ComCall(48, this, "ptr", name, "ptr*", &newItem := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IFsiDirectoryItem(newItem)
    }

    /**
     * Create a file item with the specified name.
     * @remarks
     * After setting properties on the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-ifsifileitem">IFsiFileItem</a> interface, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifsidirectoryitem-add">IFsiDirectoryItem::Add</a> method on the parent directory item to add it to the file system image.
     * @param {BSTR} name String that contains the name of the file item to create.
     * @returns {IFsiFileItem} An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-ifsifileitem">IFsiFileItem</a> interface of the new file item.  When done, call the <b>IFsiFileItem::Release</b> method to release the interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-createfileitem
     */
    CreateFileItem(name) {
        if(name is String) {
            pin := BSTR.Alloc(name)
            name := pin.Value
        }

        result := ComCall(49, this, "ptr", name, "ptr*", &newItem := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IFsiFileItem(newItem)
    }

    /**
     * Retrieves the volume name for the UDF system image.
     * @returns {BSTR} String that contains the volume name for the UDF system image.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-get_volumenameudf
     */
    get_VolumeNameUDF() {
        pVal := BSTR()
        result := ComCall(50, this, "ptr", pVal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVal
    }

    /**
     * Retrieves the volume name for the Joliet system image.
     * @returns {BSTR} String that contains the volume name for the Joliet system image.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-get_volumenamejoliet
     */
    get_VolumeNameJoliet() {
        pVal := BSTR()
        result := ComCall(51, this, "ptr", pVal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVal
    }

    /**
     * Retrieves the volume name for the ISO9660 system image.
     * @returns {BSTR} String that contains the volume name for the ISO9660 system image.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-get_volumenameiso9660
     */
    get_VolumeNameISO9660() {
        pVal := BSTR()
        result := ComCall(52, this, "ptr", pVal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVal
    }

    /**
     * Indicates if the files being added to the file system image should be staged before the burn.
     * @remarks
     * "Staging" is a process in which an image is created on the hard-drive, containing all files to be burned, prior to the initiation of the  burn operation.
     * 
     * Setting this this property to <b>VARIANT_TRUE</b> via <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimage-put_stagefiles">IFileSystemImage::put_StageFiles</a> will only affect files that are added after the property is set: those files will always be staged. Files that were not staged prior  to a specified property value of   <b>VARIANT_TRUE</b>, will not be staged.
     * 
     * By specifying <b>VARIANT_FALSE</b>, the file system image creation process is optimized in two ways:
     * 
     * <ul>
     * <li>Less time is required for image generation</li>
     * <li>Less space is consumed on a local disk by IMAPI</li>
     * </ul>
     * However, in order to avoid buffer underrun problems during burning, a certain minimum throughput is required for read operations on non-staged files. In the event that file accessibility or throughput may not meet the requirements of the burner, IMAPI enforces file staging regardless of the specified property value. For example, file staging is enforced for source files from removable storage devices, such as USB Flash Disk.
     * @returns {VARIANT_BOOL} <b>VARIANT_TRUE</b> if the files being added to the file system image are required to be staged in one or more stage files before burning. Otherwise, <b>VARIANT_FALSE</b> is returned if IMAPI is permitted to optimize the image creation process by not staging the files being added to the file system image.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-get_stagefiles
     */
    get_StageFiles() {
        result := ComCall(53, this, "short*", &pVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVal
    }

    /**
     * Determines if the files being added to the file system image should be staged before the burn.
     * @remarks
     * "Staging" is a process in which an image is created on the hard-drive, containing all files to be burned, prior to the initiation of the  burn operation.
     * 
     * Setting this this property to <b>VARIANT_TRUE</b> will only affect files that are added after the property is set: those files will always be staged. Files that were not staged prior  to a specified property value of   <b>VARIANT_TRUE</b>, will not be staged.
     * 
     * By specifying <b>VARIANT_FALSE</b>, the file system image creation process is optimized in two ways:
     * 
     * <ul>
     * <li>Less time is required for image generation</li>
     * <li>Less space is consumed on a local disk by IMAPI</li>
     * </ul>
     * However, in order to avoid buffer underrun problems during burning, a certain minimum throughput is required for read operations on non-staged files. In the event that file accessibility or throughput may not meet the requirements of the burner, IMAPI enforces file staging regardless of the specified property value. For example, file staging is enforced for source files from removable storage devices, such as USB Flash Disk.
     * @param {VARIANT_BOOL} newVal Set to VARIANT_TRUE to force files added to the file system image to be staged in one or more stage files before burning. Otherwise, set to VARIANT_FALSE if staging is not required and higher performance is desired.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not implemented.
     * 
     * Value: 0x80004001
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-put_stagefiles
     */
    put_StageFiles(newVal) {
        result := ComCall(54, this, "short", newVal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the list of multi-session interfaces for the optical media.
     * @remarks
     * Query the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-imultisession">IMultisession</a> interface for a derived <b>IMultisession</b> interface, for example, the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-imultisessionsequential">IMultisessionSequential</a> interface.
     * @returns {Pointer<SAFEARRAY>} List of multi-session interfaces for the optical media. Each element of the list is a <b>VARIANT</b> of type <b>VT_Dispatch</b>. Query the <b>pdispVal</b> member of the variant for the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-imultisession">IMultisession</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-get_multisessioninterfaces
     */
    get_MultisessionInterfaces() {
        result := ComCall(55, this, "ptr*", &pVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVal
    }

    /**
     * Sets the list of multi-session interfaces for the optical media.
     * @remarks
     * This method validates that the multi-session type is compatible. The method succeeds if either
     * 
     * <ul>
     * <li>The list contains a single derived <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-imultisession">IMultisession</a> interface with <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-imultisession-put_inuse">IMultisession::put_InUse</a> set to VARIANT_TRUE and if the multi-session type is supported on the current media and supported by the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-ifilesystemimage">IFileSystemImage</a> implementation.</li>
     * <li>The list contains no derived <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-imultisession">IMultisession</a> interfaces whose <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-imultisession-put_inuse">IMultisession::put_InUse</a> property is set to VARIANT_TRUE, but contains at least one derived <b>IMultisession</b> that is supported on current media and supported by the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-ifilesystemimage">IFileSystemImage</a> implementation.</li>
     * </ul>
     * Unless the media is overwritable (i.e. DVD+/-RW, BD-RE, etc..), this method will fail if the media is blank. Failure will also occur if the list contains more than one <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-imultisession">IMultisession</a> interface whose <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-imultisession-put_inuse">IMultisession::put_InUse</a> property is set to VARIANT_TRUE, or no derived <b>IMultisession</b> interface is supported by the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-ifilesystemimage">IFileSystemImage</a> implementation. Currently, only the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-imultisessionsequential">IMultisessionSequential</a> interface which derives from <b>IMultisession</b> is supported by <b>IFileSystemImage</b> implementation.
     * 
     * For an example, see <a href="https://docs.microsoft.com/windows/desktop/imapi/creating-a-multisession-disc">Creating a Multisession Disc</a>.
     * @param {Pointer<SAFEARRAY>} newVal List of multi-session  interfaces for the optical media. Each element of the list is a VARIANT whose type is <b>VT_DISPATCH</b>. Query the multi-session interface for its <b>IDispatch</b> interface and set the <b>pdispVal</b> member of the variant to the <b>IDispatch</b> interface.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pointer is not valid.
     * 
     * Value: 0x80004003
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_INCOMPATIBLE_MULTISESSION_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * IMAPI does not support the multisession type requested.
     * 
     * Value: 0xC0AAB15B
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_IMPORT_MEDIA_NOT_ALLOWED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * IMAPI does not allow multi-session with the current media type.
     * 
     * Value: 0xC0AAB159
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_NO_COMPATIBLE_MULTISESSION_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * IMAPI supports none of the multisession type(s) provided on the current media.
     * 
     * Value: 0xC0AAB15C
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_BAD_MULTISESSION_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of multisession parameters cannot be retrieved or has a wrong value.
     * 
     * Value: 0xC0AAB162
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_FSI_INTERNAL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Internal error occurred: %1!ls!.
     * 
     * 
     * Value: 0xC0AAB100
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_IMPORT_SEEK_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot seek to block %1!I64d! on source disc. This value is also returned if the optical media is blank.
     * 
     * Value: 0xC0AAB156
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  Values returned by the  IUnknown::QueryInterface method may also be returned here.</div>
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-ifilesystemimage-put_multisessioninterfaces
     */
    put_MultisessionInterfaces(newVal) {
        result := ComCall(56, this, "ptr", newVal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
