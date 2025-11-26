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
 * 
 * To create the <b>CFileSystemImage</b> object in a script, use IMAPI2.MsftFileSystemImage as the program identifier when calling <b>CreateObject</b>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nn-imapi2fs-ifilesystemimage
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
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-get_root
     */
    get_Root() {
        result := ComCall(7, this, "ptr*", &pVal := 0, "HRESULT")
        return IFsiDirectoryItem(pVal)
    }

    /**
     * Retrieves the starting block address for the recording session.
     * @returns {Integer} Starting block address for the recording session.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-get_sessionstartblock
     */
    get_SessionStartBlock() {
        result := ComCall(8, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Sets the starting block address for the recording session.
     * @param {Integer} newVal Block number of the new recording session.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-put_sessionstartblock
     */
    put_SessionStartBlock(newVal) {
        result := ComCall(9, this, "int", newVal, "HRESULT")
        return result
    }

    /**
     * Retrieves the maximum number of blocks available for the image.
     * @returns {Integer} Number of blocks to use in creating the file system image.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-get_freemediablocks
     */
    get_FreeMediaBlocks() {
        result := ComCall(10, this, "int*", &pVal := 0, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-put_freemediablocks
     */
    put_FreeMediaBlocks(newVal) {
        result := ComCall(11, this, "int", newVal, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-setmaxmediablocksfromdevice
     */
    SetMaxMediaBlocksFromDevice(discRecorder) {
        result := ComCall(12, this, "ptr", discRecorder, "HRESULT")
        return result
    }

    /**
     * Retrieves the number of blocks in use.
     * @returns {Integer} Estimated number of blocks used in the file-system image.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-get_usedblocks
     */
    get_UsedBlocks() {
        result := ComCall(13, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the volume name for this file system image.
     * @returns {BSTR} String that contains the volume name for this file system image.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-get_volumename
     */
    get_VolumeName() {
        pVal := BSTR()
        result := ComCall(14, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Sets the volume name for this file system image.
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
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-put_volumename
     */
    put_VolumeName(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(15, this, "ptr", newVal, "HRESULT")
        return result
    }

    /**
     * Retrieves the volume name provided from an imported file system.
     * @returns {BSTR} String that contains the volume name provided from an imported file system. Is <b>NULL</b> until a file system is imported.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-get_importedvolumename
     */
    get_ImportedVolumeName() {
        pVal := BSTR()
        result := ComCall(16, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the boot image that you want to add to the file system image.
     * @returns {IBootOptions} An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-ibootoptions">IBootOptions</a> interface of the boot image to add to the disc. Is <b>NULL</b> if a boot image has not been specified.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-get_bootimageoptions
     */
    get_BootImageOptions() {
        result := ComCall(17, this, "ptr*", &pVal := 0, "HRESULT")
        return IBootOptions(pVal)
    }

    /**
     * Sets the boot image that you want to add to the file-system image. This method creates a complete copy of the passed-in boot options by copying the stream from the supplied IBootOptions interface.
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
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-put_bootimageoptions
     */
    put_BootImageOptions(newVal) {
        result := ComCall(18, this, "ptr", newVal, "HRESULT")
        return result
    }

    /**
     * Retrieves the number of files in the file system image.
     * @returns {Integer} Number of files in the file system image.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-get_filecount
     */
    get_FileCount() {
        result := ComCall(19, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the number of directories in the file system image.
     * @returns {Integer} Number of directories in the file system image.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-get_directorycount
     */
    get_DirectoryCount() {
        result := ComCall(20, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the temporary directory in which stash files are built.
     * @returns {BSTR} String that contains the path to the temporary directory.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-get_workingdirectory
     */
    get_WorkingDirectory() {
        pVal := BSTR()
        result := ComCall(21, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Sets the temporary directory in which stash files are built.
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
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-put_workingdirectory
     */
    put_WorkingDirectory(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(22, this, "ptr", newVal, "HRESULT")
        return result
    }

    /**
     * Retrieves the change point identifier.
     * @returns {Integer} Change point identifier. The identifier is a count of the changes to the file system image since its inception.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-get_changepoint
     */
    get_ChangePoint() {
        result := ComCall(23, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Determines the compliance level for creating and developing the file-system image.
     * @returns {VARIANT_BOOL} Is VARIANT_TRUE if the file system images are created in strict compliance with applicable standards.  
     * 
     * Is VARIANT_FALSE if the compliance standards are relaxed to be compatible with IMAPI version 1.0.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-get_strictfilesystemcompliance
     */
    get_StrictFileSystemCompliance() {
        result := ComCall(24, this, "short*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Determines the compliance level for creating and developing the file-system image.
     * @param {VARIANT_BOOL} newVal Set to VARIANT_TRUE to create the file system images in strict compliance with applicable standards.  You can specify VARIANT_TRUE only when the file system image is empty.
     * 
     * Set to VARIANT_FALSE to relax the compliance standards to be compatible with IMAPI version 1.0.
     * 
     * The default is VARIANT_FALSE.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-put_strictfilesystemcompliance
     */
    put_StrictFileSystemCompliance(newVal) {
        result := ComCall(25, this, "short", newVal, "HRESULT")
        return result
    }

    /**
     * Determines if the file and directory names use a restricted character.
     * @returns {VARIANT_BOOL} Is VARIANT_TRUE if the file and directory names to add to the file system image must consist of characters that map directly to CP_ANSI (code points 32 through 127). Otherwise, VARIANT_FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-get_userestrictedcharacterset
     */
    get_UseRestrictedCharacterSet() {
        result := ComCall(26, this, "short*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Determines if file and directory names should be restricted to using only CP_ANSI characters.
     * @param {VARIANT_BOOL} newVal Set to VARIANT_TRUE to restrict file and directory names to use only CP_ANSI characters. Otherwise, VARIANT_FALSE. The default is VARIANT_FALSE.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-put_userestrictedcharacterset
     */
    put_UseRestrictedCharacterSet(newVal) {
        result := ComCall(27, this, "short", newVal, "HRESULT")
        return result
    }

    /**
     * Retrieves the types of file systems to create when generating the result stream.
     * @returns {Integer} One or more file system types to create when generating the result stream. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/ne-imapi2fs-fsifilesystems">FsiFileSystems</a> enumeration type.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-get_filesystemstocreate
     */
    get_FileSystemsToCreate() {
        result := ComCall(28, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Sets the file systems to create when generating the result stream.
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
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-put_filesystemstocreate
     */
    put_FileSystemsToCreate(newVal) {
        result := ComCall(29, this, "int", newVal, "HRESULT")
        return result
    }

    /**
     * Retrieves the list of file system types that a client can use to build a file system image.
     * @returns {Integer} One or more file system types that a client can use to build a file system image. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/ne-imapi2fs-fsifilesystems">FsiFileSystems</a> enumeration type.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-get_filesystemssupported
     */
    get_FileSystemsSupported() {
        result := ComCall(30, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Sets the UDF revision level of the file system image.
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
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-put_udfrevision
     */
    put_UDFRevision(newVal) {
        result := ComCall(31, this, "int", newVal, "HRESULT")
        return result
    }

    /**
     * Retrieves the UDF revision level of the imported file system image.
     * @returns {Integer} UDF revision level of the imported file system image.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-get_udfrevision
     */
    get_UDFRevision() {
        result := ComCall(32, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Retrieves a list of supported UDF revision levels.
     * @returns {Pointer<SAFEARRAY>} List of supported UDF revision levels. Each element of the list is VARIANT. The variant type is <b>VT_I4</b>. The <b>lVal</b> member of the variant contains the revision level.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-get_udfrevisionssupported
     */
    get_UDFRevisionsSupported() {
        result := ComCall(33, this, "ptr*", &pVal := 0, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-chooseimagedefaults
     */
    ChooseImageDefaults(discRecorder) {
        result := ComCall(34, this, "ptr", discRecorder, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-chooseimagedefaultsformediatype
     */
    ChooseImageDefaultsForMediaType(value) {
        result := ComCall(35, this, "int", value, "HRESULT")
        return result
    }

    /**
     * Sets the ISO9660 compatibility level of the file system image.
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
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-put_iso9660interchangelevel
     */
    put_ISO9660InterchangeLevel(newVal) {
        result := ComCall(36, this, "int", newVal, "HRESULT")
        return result
    }

    /**
     * Retrieves the ISO9660 compatibility level to use when creating the result image.
     * @returns {Integer} Identifies the interchange level of the ISO9660 file system.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-get_iso9660interchangelevel
     */
    get_ISO9660InterchangeLevel() {
        result := ComCall(37, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the supported ISO9660 compatibility levels.
     * @returns {Pointer<SAFEARRAY>} List of supported ISO9660 compatibility levels. Each item in the list is a VARIANT that identifies one supported interchange level. The variant type is <b>VT_UI4</b>. The <b>ulVal</b> member of the variant contains the compatibility level.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-get_iso9660interchangelevelssupported
     */
    get_ISO9660InterchangeLevelsSupported() {
        result := ComCall(38, this, "ptr*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Create the result object that contains the file system and file data.
     * @returns {IFileSystemImageResult} An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-ifilesystemimageresult">IFileSystemImageResult</a> interface of the image result.
     * 
     * Client applications can stream the image to media or other long-term storage devices, such as disk drives.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-createresultimage
     */
    CreateResultImage() {
        result := ComCall(39, this, "ptr*", &resultStream := 0, "HRESULT")
        return IFileSystemImageResult(resultStream)
    }

    /**
     * Checks for the existence of a given file or directory.
     * @param {BSTR} fullPath String that contains the fully qualified path of the directory or file to check.
     * @returns {Integer} Indicates if the item is a file, a directory, or does not exist. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/ne-imapi2fs-fsiitemtype">FsiItemType</a> enumeration type.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-exists
     */
    Exists(fullPath) {
        fullPath := fullPath is String ? BSTR.Alloc(fullPath).Value : fullPath

        result := ComCall(40, this, "ptr", fullPath, "int*", &itemType := 0, "HRESULT")
        return itemType
    }

    /**
     * Retrieves a string that identifies a disc and the sessions recorded on the disc.
     * @returns {BSTR} String that contains a signature that identifies the disc and the sessions on it. This string is not guaranteed to be unique between discs.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-calculatediscidentifier
     */
    CalculateDiscIdentifier() {
        discIdentifier := BSTR()
        result := ComCall(41, this, "ptr", discIdentifier, "HRESULT")
        return discIdentifier
    }

    /**
     * Retrieves a list of the different types of file systems on the optical media.
     * @param {IDiscRecorder2} discRecorder An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-idiscrecorder2">IDiscRecorder2</a> interface that identifies the recording device that contains the media. If this parameter is <b>NULL</b>, the <i>discRecorder</i>  specified in <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-imultisession">IMultisession</a> will be used.
     * @returns {Integer} One or more files systems on the disc. For possible values, see <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/ne-imapi2fs-fsifilesystems">FsiFileSystems</a> enumeration type.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-identifyfilesystemsondisc
     */
    IdentifyFileSystemsOnDisc(discRecorder) {
        result := ComCall(42, this, "ptr", discRecorder, "int*", &fileSystems := 0, "HRESULT")
        return fileSystems
    }

    /**
     * Retrieves the file system to import by default.
     * @param {Integer} fileSystems One or more file system values. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/ne-imapi2fs-fsifilesystems">FsiFileSystems</a> enumeration type.
     * @returns {Integer} A single file system value that identifies the default file system.  The value is one of the file systems specified in <i>fileSystems</i>
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-getdefaultfilesystemforimport
     */
    GetDefaultFileSystemForImport(fileSystems) {
        result := ComCall(43, this, "int", fileSystems, "int*", &importDefault := 0, "HRESULT")
        return importDefault
    }

    /**
     * Imports the default file system on the current disc.
     * @returns {Integer} Identifies the imported file system. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/ne-imapi2fs-fsifilesystems">FsiFileSystems</a> enumeration type.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-importfilesystem
     */
    ImportFileSystem() {
        result := ComCall(44, this, "int*", &importedFileSystem := 0, "HRESULT")
        return importedFileSystem
    }

    /**
     * Import a specific file system from disc.
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
     * <div class="alert"><b>Note</b>  <a href="/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimage-importfilesystem">IFileSystemImage::ImportFileSystem</a>  method returns this error if there is no media in the recording device.</div>
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
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-importspecificfilesystem
     */
    ImportSpecificFileSystem(fileSystemToUse) {
        result := ComCall(45, this, "int", fileSystemToUse, "HRESULT")
        return result
    }

    /**
     * Reverts the image back to the specified change point.
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
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-rollbacktochangepoint
     */
    RollbackToChangePoint(changePoint) {
        result := ComCall(46, this, "int", changePoint, "HRESULT")
        return result
    }

    /**
     * Locks the file system information at the current change-point level.
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
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-lockinchangepoint
     */
    LockInChangePoint() {
        result := ComCall(47, this, "HRESULT")
        return result
    }

    /**
     * Create a directory item with the specified name.
     * @param {BSTR} name String that contains the name of the directory item to create.
     * @returns {IFsiDirectoryItem} An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-ifsidirectoryitem">IFsiDirectoryItem</a> interface of the new directory item.  When done, call the <b>IFsiDirectoryItem::Release</b> method to release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-createdirectoryitem
     */
    CreateDirectoryItem(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(48, this, "ptr", name, "ptr*", &newItem := 0, "HRESULT")
        return IFsiDirectoryItem(newItem)
    }

    /**
     * Create a file item with the specified name.
     * @param {BSTR} name String that contains the name of the file item to create.
     * @returns {IFsiFileItem} An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-ifsifileitem">IFsiFileItem</a> interface of the new file item.  When done, call the <b>IFsiFileItem::Release</b> method to release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-createfileitem
     */
    CreateFileItem(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(49, this, "ptr", name, "ptr*", &newItem := 0, "HRESULT")
        return IFsiFileItem(newItem)
    }

    /**
     * Retrieves the volume name for the UDF system image.
     * @returns {BSTR} String that contains the volume name for the UDF system image.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-get_volumenameudf
     */
    get_VolumeNameUDF() {
        pVal := BSTR()
        result := ComCall(50, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the volume name for the Joliet system image.
     * @returns {BSTR} String that contains the volume name for the Joliet system image.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-get_volumenamejoliet
     */
    get_VolumeNameJoliet() {
        pVal := BSTR()
        result := ComCall(51, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the volume name for the ISO9660 system image.
     * @returns {BSTR} String that contains the volume name for the ISO9660 system image.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-get_volumenameiso9660
     */
    get_VolumeNameISO9660() {
        pVal := BSTR()
        result := ComCall(52, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Indicates if the files being added to the file system image should be staged before the burn.
     * @returns {VARIANT_BOOL} <b>VARIANT_TRUE</b> if the files being added to the file system image are required to be stageded in one or more stage files before burning. Otherwise, <b>VARIANT_FALSE</b> is returned if IMAPI is permitted to optimize the image creation process by not staging the files being added to the file system image.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-get_stagefiles
     */
    get_StageFiles() {
        result := ComCall(53, this, "short*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Determines if the files being added to the file system image should be staged before the burn.
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
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-put_stagefiles
     */
    put_StageFiles(newVal) {
        result := ComCall(54, this, "short", newVal, "HRESULT")
        return result
    }

    /**
     * Retrieves the list of multi-session interfaces for the optical media.
     * @returns {Pointer<SAFEARRAY>} List of multi-session interfaces for the optical media. Each element of the list is a <b>VARIANT</b> of type <b>VT_Dispatch</b>. Query the <b>pdispVal</b> member of the variant for the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-imultisession">IMultisession</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-get_multisessioninterfaces
     */
    get_MultisessionInterfaces() {
        result := ComCall(55, this, "ptr*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Sets the list of multi-session interfaces for the optical media.
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
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage-put_multisessioninterfaces
     */
    put_MultisessionInterfaces(newVal) {
        result := ComCall(56, this, "ptr", newVal, "HRESULT")
        return result
    }
}
