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
     * Creates a file group object.
     * @returns {IFsrmFileGroup} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmscreen/nn-fsrmscreen-ifsrmfilegroup">IFsrmFileGroup</a> interface to the new file group. To 
     *       add the file group to FSRM, call 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmobject-commit">IFsrmFileGroup::Commit</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nf-fsrmscreen-ifsrmfilegroupmanager-createfilegroup
     */
    CreateFileGroup() {
        result := ComCall(7, this, "ptr*", &fileGroup := 0, "HRESULT")
        return IFsrmFileGroup(fileGroup)
    }

    /**
     * Retrieves the specified file group from FSRM.
     * @param {BSTR} name The name of the file group to retrieve. The string is limited to 4,000 characters.
     * @returns {IFsrmFileGroup} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmscreen/nn-fsrmscreen-ifsrmfilegroup">IFsrmFileGroup</a> interface to the retrieved file 
     *       group.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nf-fsrmscreen-ifsrmfilegroupmanager-getfilegroup
     */
    GetFileGroup(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(8, this, "ptr", name, "ptr*", &fileGroup := 0, "HRESULT")
        return IFsrmFileGroup(fileGroup)
    }

    /**
     * Enumerates the file groups in FSRM.
     * @param {Integer} options One or more options for enumerating the file groups. For possible values, see the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmenumoptions">FsrmEnumOptions</a> enumeration.
     * @returns {IFsrmCommittableCollection} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmcommittablecollection">IFsrmCommittableCollection</a> interface 
     *        that contains a collection of file groups. Each item of the collection is a 
     *        <b>VARIANT</b> of type <b>VT_DISPATCH</b>. Query the 
     *        <b>pdispVal</b> member of the variant for the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmscreen/nn-fsrmscreen-ifsrmfilegroup">IFsrmFileGroup</a> interface.
     * 
     * The collection contains only committed file groups; the collection will not contain newly created file groups 
     *        that have not been committed.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nf-fsrmscreen-ifsrmfilegroupmanager-enumfilegroups
     */
    EnumFileGroups(options) {
        result := ComCall(9, this, "int", options, "ptr*", &fileGroups := 0, "HRESULT")
        return IFsrmCommittableCollection(fileGroups)
    }

    /**
     * Exports the specified file groups as an XML string.
     * @param {Pointer<VARIANT>} fileGroupNamesArray A <b>VARIANT</b> that contains a <b>SAFEARRAY</b> of the names 
     *       of the file groups to export. If <b>NULL</b>, the method exports all file groups.
     * @returns {BSTR} The specified file groups in XML format.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nf-fsrmscreen-ifsrmfilegroupmanager-exportfilegroups
     */
    ExportFileGroups(fileGroupNamesArray) {
        serializedFileGroups := BSTR()
        result := ComCall(10, this, "ptr", fileGroupNamesArray, "ptr", serializedFileGroups, "HRESULT")
        return serializedFileGroups
    }

    /**
     * Imports the specified file groups from an XML string.
     * @param {BSTR} serializedFileGroups An XML string that represents one or more file groups.
     * @param {Pointer<VARIANT>} fileGroupNamesArray A <b>VARIANT</b> that contains a <b>SAFEARRAY</b> of the names 
     *       of the file groups to import. If <b>NULL</b>, the method imports all file groups.
     * @returns {IFsrmCommittableCollection} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmcommittablecollection">IFsrmCommittableCollection</a> interface 
     *        that contains a collection of file groups.
     * 
     * Each item of the collection is a <b>VARIANT</b> of type 
     *        <b>VT_DISPATCH</b>. Query the <b>pdispVal</b> member of the variant for 
     *        the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmscreen/nn-fsrmscreen-ifsrmfilegroupimported">IFsrmFileGroupImported</a> interface.
     * 
     * To add the file groups to FSRM, call the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmcommittablecollection-commit">IFsrmCommittableCollection::Commit</a> 
     *        method.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nf-fsrmscreen-ifsrmfilegroupmanager-importfilegroups
     */
    ImportFileGroups(serializedFileGroups, fileGroupNamesArray) {
        serializedFileGroups := serializedFileGroups is String ? BSTR.Alloc(serializedFileGroups).Value : serializedFileGroups

        result := ComCall(11, this, "ptr", serializedFileGroups, "ptr", fileGroupNamesArray, "ptr*", &fileGroups := 0, "HRESULT")
        return IFsrmCommittableCollection(fileGroups)
    }
}
