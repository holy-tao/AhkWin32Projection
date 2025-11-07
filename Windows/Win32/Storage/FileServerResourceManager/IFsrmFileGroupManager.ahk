#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFsrmFileGroup.ahk
#Include .\IFsrmCommittableCollection.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Used to manage file group objects.
 * @remarks
 * 
  * FSRM defines the following groups:
  * 
  * <ul>
  * <li>Audio and Video Files</li>
  * <li>Backup Files</li>
  * <li>Compressed Files</li>
  * <li>Email Files</li>
  * <li>Executable Files</li>
  * <li>Image Files</li>
  * <li>Office Files</li>
  * <li>System Files</li>
  * <li>Temporary Files</li>
  * <li>Text Files</li>
  * <li>Webpage Files</li>
  * </ul>
  * To create this object from a script, use the "Fsrm.FsrmFileGroupManager" program 
  *     identifier.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nn-fsrmscreen-ifsrmfilegroupmanager
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmFileGroupManager extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmFileGroupManager
     * @type {Guid}
     */
    static IID => Guid("{426677d5-018c-485c-8a51-20b86d00bdc4}")

    /**
     * The class identifier for FsrmFileGroupManager
     * @type {Guid}
     */
    static CLSID => Guid("{8f1363f6-656f-4496-9226-13aecbd7718f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFileGroup", "GetFileGroup", "EnumFileGroups", "ExportFileGroups", "ImportFileGroups"]

    /**
     * 
     * @returns {IFsrmFileGroup} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilegroupmanager-createfilegroup
     */
    CreateFileGroup() {
        result := ComCall(7, this, "ptr*", &fileGroup := 0, "HRESULT")
        return IFsrmFileGroup(fileGroup)
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {IFsrmFileGroup} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilegroupmanager-getfilegroup
     */
    GetFileGroup(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(8, this, "ptr", name, "ptr*", &fileGroup := 0, "HRESULT")
        return IFsrmFileGroup(fileGroup)
    }

    /**
     * 
     * @param {Integer} options 
     * @returns {IFsrmCommittableCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilegroupmanager-enumfilegroups
     */
    EnumFileGroups(options) {
        result := ComCall(9, this, "int", options, "ptr*", &fileGroups := 0, "HRESULT")
        return IFsrmCommittableCollection(fileGroups)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} fileGroupNamesArray 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilegroupmanager-exportfilegroups
     */
    ExportFileGroups(fileGroupNamesArray) {
        serializedFileGroups := BSTR()
        result := ComCall(10, this, "ptr", fileGroupNamesArray, "ptr", serializedFileGroups, "HRESULT")
        return serializedFileGroups
    }

    /**
     * 
     * @param {BSTR} serializedFileGroups 
     * @param {Pointer<VARIANT>} fileGroupNamesArray 
     * @returns {IFsrmCommittableCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilegroupmanager-importfilegroups
     */
    ImportFileGroups(serializedFileGroups, fileGroupNamesArray) {
        serializedFileGroups := serializedFileGroups is String ? BSTR.Alloc(serializedFileGroups).Value : serializedFileGroups

        result := ComCall(11, this, "ptr", serializedFileGroups, "ptr", fileGroupNamesArray, "ptr*", &fileGroups := 0, "HRESULT")
        return IFsrmCommittableCollection(fileGroups)
    }
}
