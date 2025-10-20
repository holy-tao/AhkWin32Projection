#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<IFsiDirectoryItem>} pVal 
     * @returns {HRESULT} 
     */
    get_Root(pVal) {
        result := ComCall(7, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_SessionStartBlock(pVal) {
        result := ComCall(8, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     */
    put_SessionStartBlock(newVal) {
        result := ComCall(9, this, "int", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_FreeMediaBlocks(pVal) {
        result := ComCall(10, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     */
    put_FreeMediaBlocks(newVal) {
        result := ComCall(11, this, "int", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDiscRecorder2>} discRecorder 
     * @returns {HRESULT} 
     */
    SetMaxMediaBlocksFromDevice(discRecorder) {
        result := ComCall(12, this, "ptr", discRecorder, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_UsedBlocks(pVal) {
        result := ComCall(13, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_VolumeName(pVal) {
        result := ComCall(14, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} newVal 
     * @returns {HRESULT} 
     */
    put_VolumeName(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(15, this, "ptr", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_ImportedVolumeName(pVal) {
        result := ComCall(16, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IBootOptions>} pVal 
     * @returns {HRESULT} 
     */
    get_BootImageOptions(pVal) {
        result := ComCall(17, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IBootOptions>} newVal 
     * @returns {HRESULT} 
     */
    put_BootImageOptions(newVal) {
        result := ComCall(18, this, "ptr", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_FileCount(pVal) {
        result := ComCall(19, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_DirectoryCount(pVal) {
        result := ComCall(20, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_WorkingDirectory(pVal) {
        result := ComCall(21, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} newVal 
     * @returns {HRESULT} 
     */
    put_WorkingDirectory(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(22, this, "ptr", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_ChangePoint(pVal) {
        result := ComCall(23, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pVal 
     * @returns {HRESULT} 
     */
    get_StrictFileSystemCompliance(pVal) {
        result := ComCall(24, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     */
    put_StrictFileSystemCompliance(newVal) {
        result := ComCall(25, this, "short", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pVal 
     * @returns {HRESULT} 
     */
    get_UseRestrictedCharacterSet(pVal) {
        result := ComCall(26, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     */
    put_UseRestrictedCharacterSet(newVal) {
        result := ComCall(27, this, "short", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_FileSystemsToCreate(pVal) {
        result := ComCall(28, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     */
    put_FileSystemsToCreate(newVal) {
        result := ComCall(29, this, "int", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_FileSystemsSupported(pVal) {
        result := ComCall(30, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     */
    put_UDFRevision(newVal) {
        result := ComCall(31, this, "int", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_UDFRevision(pVal) {
        result := ComCall(32, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} pVal 
     * @returns {HRESULT} 
     */
    get_UDFRevisionsSupported(pVal) {
        result := ComCall(33, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDiscRecorder2>} discRecorder 
     * @returns {HRESULT} 
     */
    ChooseImageDefaults(discRecorder) {
        result := ComCall(34, this, "ptr", discRecorder, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    ChooseImageDefaultsForMediaType(value) {
        result := ComCall(35, this, "int", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     */
    put_ISO9660InterchangeLevel(newVal) {
        result := ComCall(36, this, "int", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_ISO9660InterchangeLevel(pVal) {
        result := ComCall(37, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} pVal 
     * @returns {HRESULT} 
     */
    get_ISO9660InterchangeLevelsSupported(pVal) {
        result := ComCall(38, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFileSystemImageResult>} resultStream 
     * @returns {HRESULT} 
     */
    CreateResultImage(resultStream) {
        result := ComCall(39, this, "ptr", resultStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} fullPath 
     * @param {Pointer<Int32>} itemType 
     * @returns {HRESULT} 
     */
    Exists(fullPath, itemType) {
        fullPath := fullPath is String ? BSTR.Alloc(fullPath).Value : fullPath

        result := ComCall(40, this, "ptr", fullPath, "int*", itemType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} discIdentifier 
     * @returns {HRESULT} 
     */
    CalculateDiscIdentifier(discIdentifier) {
        result := ComCall(41, this, "ptr", discIdentifier, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDiscRecorder2>} discRecorder 
     * @param {Pointer<Int32>} fileSystems 
     * @returns {HRESULT} 
     */
    IdentifyFileSystemsOnDisc(discRecorder, fileSystems) {
        result := ComCall(42, this, "ptr", discRecorder, "int*", fileSystems, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} fileSystems 
     * @param {Pointer<Int32>} importDefault 
     * @returns {HRESULT} 
     */
    GetDefaultFileSystemForImport(fileSystems, importDefault) {
        result := ComCall(43, this, "int", fileSystems, "int*", importDefault, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} importedFileSystem 
     * @returns {HRESULT} 
     */
    ImportFileSystem(importedFileSystem) {
        result := ComCall(44, this, "int*", importedFileSystem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} fileSystemToUse 
     * @returns {HRESULT} 
     */
    ImportSpecificFileSystem(fileSystemToUse) {
        result := ComCall(45, this, "int", fileSystemToUse, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} changePoint 
     * @returns {HRESULT} 
     */
    RollbackToChangePoint(changePoint) {
        result := ComCall(46, this, "int", changePoint, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    LockInChangePoint() {
        result := ComCall(47, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {Pointer<IFsiDirectoryItem>} newItem 
     * @returns {HRESULT} 
     */
    CreateDirectoryItem(name, newItem) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(48, this, "ptr", name, "ptr", newItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {Pointer<IFsiFileItem>} newItem 
     * @returns {HRESULT} 
     */
    CreateFileItem(name, newItem) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(49, this, "ptr", name, "ptr", newItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_VolumeNameUDF(pVal) {
        result := ComCall(50, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_VolumeNameJoliet(pVal) {
        result := ComCall(51, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_VolumeNameISO9660(pVal) {
        result := ComCall(52, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pVal 
     * @returns {HRESULT} 
     */
    get_StageFiles(pVal) {
        result := ComCall(53, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     */
    put_StageFiles(newVal) {
        result := ComCall(54, this, "short", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} pVal 
     * @returns {HRESULT} 
     */
    get_MultisessionInterfaces(pVal) {
        result := ComCall(55, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} newVal 
     * @returns {HRESULT} 
     */
    put_MultisessionInterfaces(newVal) {
        result := ComCall(56, this, "ptr", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
