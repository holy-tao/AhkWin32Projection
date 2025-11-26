#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVssWMFiledesc interface is a C++ (not COM) interface returned to a calling application by a number of query methods. It provides detailed information about a file or set of files (a file set).
 * @see https://docs.microsoft.com/windows/win32/api//vswriter/nl-vswriter-ivsswmfiledesc
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssWMFiledesc extends IUnknown{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPath", "GetFilespec", "GetRecursive", "GetAlternateLocation", "GetBackupTypeMask"]

    /**
     * The GetPath method obtains the fully qualified directory path or the UNC path of the remote file share to obtain the list of files described in the current IVssWMFiledesc object.
     * @returns {BSTR} The address of a caller-allocated variable that receives a <b>NULL</b>-terminated wide character string specifying the fully qualified directory path or the UNC path of the remote file share directory. 
     * 
     * 
     * 
     * 
     * The path can be a long or short file name and can use the prefix "\\?\". For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/FileIO/naming-a-file">Naming a File</a>.
     * 
     * Users of this method need to check to determine whether this path ends with a backslash ("\").
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsswmfiledesc-getpath
     */
    GetPath() {
        pbstrPath := BSTR()
        result := ComCall(3, this, "ptr", pbstrPath, "HRESULT")
        return pbstrPath
    }

    /**
     * The GetFilespec method returns the file specification used to obtain the list of files that the current IVssWMFiledesc object is a member of.
     * @returns {BSTR} The address of a caller-allocated variable that receives a string specifying the returned file specification. 
     * 
     * 
     * 
     * 
     * A file specification cannot contain directory specifications (for example, no backslashes) but can contain the ? and * wildcard characters.
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsswmfiledesc-getfilespec
     */
    GetFilespec() {
        pbstrFilespec := BSTR()
        result := ComCall(4, this, "ptr", pbstrFilespec, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsswmfiledesc-getrecursive
     */
    GetRecursive() {
        result := ComCall(5, this, "int*", &pbRecursive := 0, "HRESULT")
        return pbRecursive
    }

    /**
     * The GetAlternateLocation method obtains an alternate location for a file set.
     * @returns {BSTR} The address of a caller-allocated variable that receives a string specifying the alternate backup location. The path of this location can be a local path or the UNC path of a remote file share. If there is no alternate location, the pointer is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsswmfiledesc-getalternatelocation
     */
    GetAlternateLocation() {
        pbstrAlternateLocation := BSTR()
        result := ComCall(6, this, "ptr", pbstrAlternateLocation, "HRESULT")
        return pbstrAlternateLocation
    }

    /**
     * The GetBackupTypeMask method returns the file backup specification for the files specified by the current file descriptor as a bit mask (or bitwise OR) of VSS_FILE_SPEC_BACKUP_TYPE values.
     * @returns {Integer} Pointer to a <b>DWORD</b> containing a bit mask (or bitwise OR) of 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_file_spec_backup_type">VSS_FILE_SPEC_BACKUP_TYPE</a> values indicating 
     *       the file backup specification for the file or file set described by the current 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nl-vswriter-ivsswmfiledesc">IVssWMFiledesc</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsswmfiledesc-getbackuptypemask
     */
    GetBackupTypeMask() {
        result := ComCall(7, this, "uint*", &pdwTypeMask := 0, "HRESULT")
        return pdwTypeMask
    }
}
