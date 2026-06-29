#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IFsrmCommittableCollection.ahk" { IFsrmCommittableCollection }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IFsrmFileGroup.ahk" { IFsrmFileGroup }
#Import ".\FsrmEnumOptions.ahk" { FsrmEnumOptions }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Used to manage file group objects.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nn-fsrmscreen-ifsrmfilegroupmanager
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmFileGroupManager extends IDispatch {
    /**
     * The interface identifier for IFsrmFileGroupManager
     * @type {Guid}
     */
    static IID := Guid("{426677d5-018c-485c-8a51-20b86d00bdc4}")

    /**
     * The class identifier for FsrmFileGroupManager
     * @type {Guid}
     */
    static CLSID := Guid("{8f1363f6-656f-4496-9226-13aecbd7718f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmFileGroupManager interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        CreateFileGroup  : IntPtr
        GetFileGroup     : IntPtr
        EnumFileGroups   : IntPtr
        ExportFileGroups : IntPtr
        ImportFileGroups : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmFileGroupManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a file group object.
     * @returns {IFsrmFileGroup} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmscreen/nn-fsrmscreen-ifsrmfilegroup">IFsrmFileGroup</a> interface to the new file group. To 
     *       add the file group to FSRM, call 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmobject-commit">IFsrmFileGroup::Commit</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilegroupmanager-createfilegroup
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
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilegroupmanager-getfilegroup
     */
    GetFileGroup(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(8, this, BSTR, name, "ptr*", &fileGroup := 0, "HRESULT")
        return IFsrmFileGroup(fileGroup)
    }

    /**
     * Enumerates the file groups in FSRM.
     * @param {FsrmEnumOptions} options One or more options for enumerating the file groups. For possible values, see the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmenumoptions">FsrmEnumOptions</a> enumeration.
     * @returns {IFsrmCommittableCollection} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmcommittablecollection">IFsrmCommittableCollection</a> interface 
     *        that contains a collection of file groups. Each item of the collection is a 
     *        <b>VARIANT</b> of type <b>VT_DISPATCH</b>. Query the 
     *        <b>pdispVal</b> member of the variant for the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmscreen/nn-fsrmscreen-ifsrmfilegroup">IFsrmFileGroup</a> interface.
     * 
     * The collection contains only committed file groups; the collection will not contain newly created file groups 
     *        that have not been committed.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilegroupmanager-enumfilegroups
     */
    EnumFileGroups(options) {
        result := ComCall(9, this, FsrmEnumOptions, options, "ptr*", &fileGroups := 0, "HRESULT")
        return IFsrmCommittableCollection(fileGroups)
    }

    /**
     * Exports the specified file groups as an XML string.
     * @remarks
     * Typically, you use this method to save the file groups information to a file. You can then copy the file to 
     *     another computer and call the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmscreen/nf-fsrmscreen-ifsrmfilegroupmanager-importfilegroups">IFsrmFileGroupManager::ImportFileGroups</a> 
     *     method to import the file groups.
     * @param {Pointer<VARIANT>} fileGroupNamesArray A <b>VARIANT</b> that contains a <b>SAFEARRAY</b> of the names 
     *       of the file groups to export. If <b>NULL</b>, the method exports all file groups.
     * @returns {BSTR} The specified file groups in XML format.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilegroupmanager-exportfilegroups
     */
    ExportFileGroups(fileGroupNamesArray) {
        serializedFileGroups := BSTR.Owned()
        result := ComCall(10, this, VARIANT.Ptr, fileGroupNamesArray, BSTR.Ptr, serializedFileGroups, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilegroupmanager-importfilegroups
     */
    ImportFileGroups(serializedFileGroups, fileGroupNamesArray) {
        serializedFileGroups := serializedFileGroups is String ? BSTR.Alloc(serializedFileGroups).Value : serializedFileGroups

        result := ComCall(11, this, BSTR, serializedFileGroups, VARIANT.Ptr, fileGroupNamesArray, "ptr*", &fileGroups := 0, "HRESULT")
        return IFsrmCommittableCollection(fileGroups)
    }

    Query(iid) {
        if (IFsrmFileGroupManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateFileGroup := CallbackCreate(GetMethod(implObj, "CreateFileGroup"), flags, 2)
        this.vtbl.GetFileGroup := CallbackCreate(GetMethod(implObj, "GetFileGroup"), flags, 3)
        this.vtbl.EnumFileGroups := CallbackCreate(GetMethod(implObj, "EnumFileGroups"), flags, 3)
        this.vtbl.ExportFileGroups := CallbackCreate(GetMethod(implObj, "ExportFileGroups"), flags, 3)
        this.vtbl.ImportFileGroups := CallbackCreate(GetMethod(implObj, "ImportFileGroups"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateFileGroup)
        CallbackFree(this.vtbl.GetFileGroup)
        CallbackFree(this.vtbl.EnumFileGroups)
        CallbackFree(this.vtbl.ExportFileGroups)
        CallbackFree(this.vtbl.ImportFileGroups)
    }
}
