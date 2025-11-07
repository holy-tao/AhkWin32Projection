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
     * 
     * @returns {IFsiDirectoryItem} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-get_root
     */
    get_Root() {
        result := ComCall(7, this, "ptr*", &pVal := 0, "HRESULT")
        return IFsiDirectoryItem(pVal)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-get_sessionstartblock
     */
    get_SessionStartBlock() {
        result := ComCall(8, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-put_sessionstartblock
     */
    put_SessionStartBlock(newVal) {
        result := ComCall(9, this, "int", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-get_freemediablocks
     */
    get_FreeMediaBlocks() {
        result := ComCall(10, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-put_freemediablocks
     */
    put_FreeMediaBlocks(newVal) {
        result := ComCall(11, this, "int", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDiscRecorder2} discRecorder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-setmaxmediablocksfromdevice
     */
    SetMaxMediaBlocksFromDevice(discRecorder) {
        result := ComCall(12, this, "ptr", discRecorder, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-get_usedblocks
     */
    get_UsedBlocks() {
        result := ComCall(13, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-get_volumename
     */
    get_VolumeName() {
        pVal := BSTR()
        result := ComCall(14, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {BSTR} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-put_volumename
     */
    put_VolumeName(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(15, this, "ptr", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-get_importedvolumename
     */
    get_ImportedVolumeName() {
        pVal := BSTR()
        result := ComCall(16, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {IBootOptions} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-get_bootimageoptions
     */
    get_BootImageOptions() {
        result := ComCall(17, this, "ptr*", &pVal := 0, "HRESULT")
        return IBootOptions(pVal)
    }

    /**
     * 
     * @param {IBootOptions} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-put_bootimageoptions
     */
    put_BootImageOptions(newVal) {
        result := ComCall(18, this, "ptr", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-get_filecount
     */
    get_FileCount() {
        result := ComCall(19, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-get_directorycount
     */
    get_DirectoryCount() {
        result := ComCall(20, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-get_workingdirectory
     */
    get_WorkingDirectory() {
        pVal := BSTR()
        result := ComCall(21, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {BSTR} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-put_workingdirectory
     */
    put_WorkingDirectory(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(22, this, "ptr", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-get_changepoint
     */
    get_ChangePoint() {
        result := ComCall(23, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-get_strictfilesystemcompliance
     */
    get_StrictFileSystemCompliance() {
        result := ComCall(24, this, "short*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-put_strictfilesystemcompliance
     */
    put_StrictFileSystemCompliance(newVal) {
        result := ComCall(25, this, "short", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-get_userestrictedcharacterset
     */
    get_UseRestrictedCharacterSet() {
        result := ComCall(26, this, "short*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-put_userestrictedcharacterset
     */
    put_UseRestrictedCharacterSet(newVal) {
        result := ComCall(27, this, "short", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-get_filesystemstocreate
     */
    get_FileSystemsToCreate() {
        result := ComCall(28, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-put_filesystemstocreate
     */
    put_FileSystemsToCreate(newVal) {
        result := ComCall(29, this, "int", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-get_filesystemssupported
     */
    get_FileSystemsSupported() {
        result := ComCall(30, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-put_udfrevision
     */
    put_UDFRevision(newVal) {
        result := ComCall(31, this, "int", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-get_udfrevision
     */
    get_UDFRevision() {
        result := ComCall(32, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-get_udfrevisionssupported
     */
    get_UDFRevisionsSupported() {
        result := ComCall(33, this, "ptr*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {IDiscRecorder2} discRecorder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-chooseimagedefaults
     */
    ChooseImageDefaults(discRecorder) {
        result := ComCall(34, this, "ptr", discRecorder, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-chooseimagedefaultsformediatype
     */
    ChooseImageDefaultsForMediaType(value) {
        result := ComCall(35, this, "int", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-put_iso9660interchangelevel
     */
    put_ISO9660InterchangeLevel(newVal) {
        result := ComCall(36, this, "int", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-get_iso9660interchangelevel
     */
    get_ISO9660InterchangeLevel() {
        result := ComCall(37, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-get_iso9660interchangelevelssupported
     */
    get_ISO9660InterchangeLevelsSupported() {
        result := ComCall(38, this, "ptr*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {IFileSystemImageResult} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-createresultimage
     */
    CreateResultImage() {
        result := ComCall(39, this, "ptr*", &resultStream := 0, "HRESULT")
        return IFileSystemImageResult(resultStream)
    }

    /**
     * 
     * @param {BSTR} fullPath 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-exists
     */
    Exists(fullPath) {
        fullPath := fullPath is String ? BSTR.Alloc(fullPath).Value : fullPath

        result := ComCall(40, this, "ptr", fullPath, "int*", &itemType := 0, "HRESULT")
        return itemType
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-calculatediscidentifier
     */
    CalculateDiscIdentifier() {
        discIdentifier := BSTR()
        result := ComCall(41, this, "ptr", discIdentifier, "HRESULT")
        return discIdentifier
    }

    /**
     * 
     * @param {IDiscRecorder2} discRecorder 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-identifyfilesystemsondisc
     */
    IdentifyFileSystemsOnDisc(discRecorder) {
        result := ComCall(42, this, "ptr", discRecorder, "int*", &fileSystems := 0, "HRESULT")
        return fileSystems
    }

    /**
     * 
     * @param {Integer} fileSystems 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-getdefaultfilesystemforimport
     */
    GetDefaultFileSystemForImport(fileSystems) {
        result := ComCall(43, this, "int", fileSystems, "int*", &importDefault := 0, "HRESULT")
        return importDefault
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-importfilesystem
     */
    ImportFileSystem() {
        result := ComCall(44, this, "int*", &importedFileSystem := 0, "HRESULT")
        return importedFileSystem
    }

    /**
     * 
     * @param {Integer} fileSystemToUse 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-importspecificfilesystem
     */
    ImportSpecificFileSystem(fileSystemToUse) {
        result := ComCall(45, this, "int", fileSystemToUse, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} changePoint 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-rollbacktochangepoint
     */
    RollbackToChangePoint(changePoint) {
        result := ComCall(46, this, "int", changePoint, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-lockinchangepoint
     */
    LockInChangePoint() {
        result := ComCall(47, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {IFsiDirectoryItem} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-createdirectoryitem
     */
    CreateDirectoryItem(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(48, this, "ptr", name, "ptr*", &newItem := 0, "HRESULT")
        return IFsiDirectoryItem(newItem)
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {IFsiFileItem} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-createfileitem
     */
    CreateFileItem(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(49, this, "ptr", name, "ptr*", &newItem := 0, "HRESULT")
        return IFsiFileItem(newItem)
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-get_volumenameudf
     */
    get_VolumeNameUDF() {
        pVal := BSTR()
        result := ComCall(50, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-get_volumenamejoliet
     */
    get_VolumeNameJoliet() {
        pVal := BSTR()
        result := ComCall(51, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-get_volumenameiso9660
     */
    get_VolumeNameISO9660() {
        pVal := BSTR()
        result := ComCall(52, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-get_stagefiles
     */
    get_StageFiles() {
        result := ComCall(53, this, "short*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-put_stagefiles
     */
    put_StageFiles(newVal) {
        result := ComCall(54, this, "short", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-get_multisessioninterfaces
     */
    get_MultisessionInterfaces() {
        result := ComCall(55, this, "ptr*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage-put_multisessioninterfaces
     */
    put_MultisessionInterfaces(newVal) {
        result := ComCall(56, this, "ptr", newVal, "HRESULT")
        return result
    }
}
