#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IVssWMFiledesc interface is a C++ (not COM) interface returned to a calling application by a number of query methods. It provides detailed information about a file or set of files (a file set).
 * @see https://learn.microsoft.com/windows/win32/api/vswriter/nl-vswriter-ivsswmfiledesc
 * @namespace Windows.Win32.Storage.Vss
 */
export default struct IVssWMFiledesc extends IUnknown {

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVssWMFiledesc interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPath              : IntPtr
        GetFilespec          : IntPtr
        GetRecursive         : IntPtr
        GetAlternateLocation : IntPtr
        GetBackupTypeMask    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVssWMFiledesc.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetPath method obtains the fully qualified directory path or the UNC path of the remote file share to obtain the list of files described in the current IVssWMFiledesc object.
     * @remarks
     * <b>Windows 7, Windows Server 2008 R2, Windows Vista, Windows Server 2008, Windows XP and Windows Server 2003:  </b>Remote file shares are not supported until Windows 8 and Windows Server 2012.
     * 
     * The caller must call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory held by the <i>pbstrPath</i> parameter.
     * @returns {BSTR} The address of a caller-allocated variable that receives a <b>NULL</b>-terminated wide character string specifying the fully qualified directory path or the UNC path of the remote file share directory. 
     * 
     * 
     * 
     * 
     * The path can be a long or short file name and can use the prefix "\\?\". For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/FileIO/naming-a-file">Naming a File</a>.
     * 
     * Users of this method need to check to determine whether this path ends with a backslash ("\").
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsswmfiledesc-getpath
     */
    GetPath() {
        pbstrPath := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, pbstrPath, "HRESULT")
        return pbstrPath
    }

    /**
     * The GetFilespec method returns the file specification used to obtain the list of files that the current IVssWMFiledesc object is a member of.
     * @remarks
     * The caller must call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory held by the <i>pbstrFilespec</i> parameter.
     * @returns {BSTR} The address of a caller-allocated variable that receives a string specifying the returned file specification. 
     * 
     * 
     * 
     * 
     * A file specification cannot contain directory specifications (for example, no backslashes) but can contain the ? and * wildcard characters.
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsswmfiledesc-getfilespec
     */
    GetFilespec() {
        pbstrFilespec := BSTR.Owned()
        result := ComCall(4, this, BSTR.Ptr, pbstrFilespec, "HRESULT")
        return pbstrFilespec
    }

    /**
     * Indicates whether the list of files described in a IVssWMFiledesc object with a root directory returned by IVssWMFiledesc::GetPath contains only files in that directory.
     * @returns {Boolean} A pointer to a Boolean value specifying whether the value returned by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsswmfiledesc-getpath">IVssWMFiledesc::GetPath</a> identifies 
     *       only a single directory or if it indicates a hierarchy of directories to be traversed recursively. The Boolean value receives 
     *       <b>true</b> if the path is treated as a hierarchy of directories to be traversed recursively, or <b>false</b> if not.
     *       
     * 
     * For information on traversing over mounted folders, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/VSS/working-with-reparse-and-mount-points">Working with Mounted Folders and Reparse Points</a>.
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsswmfiledesc-getrecursive
     */
    GetRecursive() {
        result := ComCall(5, this, "int*", &pbRecursive := 0, "HRESULT")
        return pbRecursive
    }

    /**
     * The GetAlternateLocation method obtains an alternate location for a file set.
     * @remarks
     * <b>Windows 7, Windows Server 2008 R2, Windows Vista, Windows Server 2008, Windows XP and Windows Server 2003:  </b>Remote file shares are not supported until Windows 8 and Windows Server 2012.
     * 
     * The caller must call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory held by the <i>pbstrAlternateLocation</i> parameter.
     * 
     * The interpretation of the alternate location returned by 
     * <b>GetAlternateLocation</b> differs depending on the method used to retrieve the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nl-vswriter-ivsswmfiledesc">IVssWMFiledesc</a> object.
     * 
     * 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssexaminewritermetadata-getexcludefile">IVssExamineWriterMetadata::GetExcludeFile</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivsswmcomponent-getdatabasefile">IVssWMComponent::GetDatabaseFile</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivsswmcomponent-getdatabaselogfile">IVssWMComponent::GetDatabaseLogFile</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivsswmcomponent-getfile">IVssWMComponent::GetFile</a>
     * </li>
     * </ul>
     * The value returned by 
     * <b>GetAlternateLocation</b> refers to an alternate location mapping when returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssexaminewritermetadata-getalternatelocationmapping">IVssExamineWriterMetadata::GetAlternateLocationMapping</a> method.
     * 
     * During backup operations, this is the alternate location from which to back up a file. During a restore, it is the alternate location to which to restore a file.
     * 
     * For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/VSS/non-default-backup-and-restore-locations">Non-Default Backup And Restore Locations</a>.
     * @returns {BSTR} The address of a caller-allocated variable that receives a string specifying the alternate backup location. The path of this location can be a local path or the UNC path of a remote file share. If there is no alternate location, the pointer is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsswmfiledesc-getalternatelocation
     */
    GetAlternateLocation() {
        pbstrAlternateLocation := BSTR.Owned()
        result := ComCall(6, this, BSTR.Ptr, pbstrAlternateLocation, "HRESULT")
        return pbstrAlternateLocation
    }

    /**
     * The GetBackupTypeMask method returns the file backup specification for the files specified by the current file descriptor as a bit mask (or bitwise OR) of VSS_FILE_SPEC_BACKUP_TYPE values.
     * @remarks
     * A file backup specification is specified by a writer when it adds a file specification to a component using the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscreatewritermetadata-addfilestofilegroup">IVssCreateWriterMetadata::AddFilesToFileGroup</a>, 
     *    <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscreatewritermetadata-adddatabasefiles">IVssCreateWriterMetadata::AddDatabaseFiles</a>, or 
     *    <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscreatewritermetadata-adddatabaselogfiles">IVssCreateWriterMetadata::AddDatabaseLogFiles</a> method.
     * @returns {Integer} Pointer to a <b>DWORD</b> containing a bit mask (or bitwise OR) of 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_file_spec_backup_type">VSS_FILE_SPEC_BACKUP_TYPE</a> values indicating 
     *       the file backup specification for the file or file set described by the current 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nl-vswriter-ivsswmfiledesc">IVssWMFiledesc</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsswmfiledesc-getbackuptypemask
     */
    GetBackupTypeMask() {
        result := ComCall(7, this, "uint*", &pdwTypeMask := 0, "HRESULT")
        return pdwTypeMask
    }

    Query(iid) {
        if (IVssWMFiledesc.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPath := CallbackCreate(GetMethod(implObj, "GetPath"), flags, 2)
        this.vtbl.GetFilespec := CallbackCreate(GetMethod(implObj, "GetFilespec"), flags, 2)
        this.vtbl.GetRecursive := CallbackCreate(GetMethod(implObj, "GetRecursive"), flags, 2)
        this.vtbl.GetAlternateLocation := CallbackCreate(GetMethod(implObj, "GetAlternateLocation"), flags, 2)
        this.vtbl.GetBackupTypeMask := CallbackCreate(GetMethod(implObj, "GetBackupTypeMask"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPath)
        CallbackFree(this.vtbl.GetFilespec)
        CallbackFree(this.vtbl.GetRecursive)
        CallbackFree(this.vtbl.GetAlternateLocation)
        CallbackFree(this.vtbl.GetBackupTypeMask)
    }
}
