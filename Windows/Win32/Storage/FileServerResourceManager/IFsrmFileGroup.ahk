#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IFsrmObject.ahk" { IFsrmObject }
#Import ".\IFsrmMutableCollection.ahk" { IFsrmMutableCollection }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Used to define a group of files based on one or more file name patterns.
 * @remarks
 * A file group is formed by including all members and then excluding all nonmembers. For example, to list all 
 *     files except for <i>examplename</i>, set <b>Members</b> 
 *     to "*.*" and <b>NonMembers</b> to 
 *     "<i>examplename</i>".
 * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nn-fsrmscreen-ifsrmfilegroup
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmFileGroup extends IFsrmObject {
    /**
     * The interface identifier for IFsrmFileGroup
     * @type {Guid}
     */
    static IID := Guid("{8dd04909-0e34-4d55-afaa-89e1f1a1bbb9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmFileGroup interfaces
    */
    struct Vtbl extends IFsrmObject.Vtbl {
        get_Name       : IntPtr
        put_Name       : IntPtr
        get_Members    : IntPtr
        put_Members    : IntPtr
        get_NonMembers : IntPtr
        put_NonMembers : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmFileGroup.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * @type {IFsrmMutableCollection} 
     */
    Members {
        get => this.get_Members()
        set => this.put_Members(value)
    }

    /**
     * @type {IFsrmMutableCollection} 
     */
    NonMembers {
        get => this.get_NonMembers()
        set => this.put_NonMembers(value)
    }

    /**
     * Retrieves or sets the name of the file group. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilegroup-get_name
     */
    get_Name() {
        name := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, name, "HRESULT")
        return name
    }

    /**
     * Retrieves or sets the name of the file group. (Put)
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilegroup-put_name
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(13, this, BSTR, name, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the filename patterns that determine the files that are included in the file group. (Get)
     * @remarks
     * A filename pattern is a string expression that defines a set of filenames. The expression may contain the 
     *     following wildcard characters: "*" and "?". The "*" wildcard 
     *     matches 0 or more characters and the "?" wildcard  matches exactly 1 character. For example, the 
     *     file name "example.cpp" matches the pattern "e*.cpp", 
     *     but not "e?.cpp". The filename "ex.cpp" would match 
     *     both patterns. Note that when the filename pattern is used to compare against a specific filename, the pattern 
     *     match is case-insensitive.
     * @returns {IFsrmMutableCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilegroup-get_members
     */
    get_Members() {
        result := ComCall(14, this, "ptr*", &members := 0, "HRESULT")
        return IFsrmMutableCollection(members)
    }

    /**
     * Retrieves or sets the filename patterns that determine the files that are included in the file group. (Put)
     * @remarks
     * A filename pattern is a string expression that defines a set of filenames. The expression may contain the 
     *     following wildcard characters: "*" and "?". The "*" wildcard 
     *     matches 0 or more characters and the "?" wildcard  matches exactly 1 character. For example, the 
     *     file name "example.cpp" matches the pattern "e*.cpp", 
     *     but not "e?.cpp". The filename "ex.cpp" would match 
     *     both patterns. Note that when the filename pattern is used to compare against a specific filename, the pattern 
     *     match is case-insensitive.
     * @param {IFsrmMutableCollection} members 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilegroup-put_members
     */
    put_Members(members) {
        result := ComCall(15, this, "ptr", members, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the filename patterns that determine the files that are excluded from the file group. (Get)
     * @remarks
     * A filename pattern is a string expression that defines a set of filenames. The expression may contain the 
     *     following wildcard characters: "*" and "?". The "*" wildcard 
     *     matches 0 or more characters and the "?" wildcard  matches exactly 1 character. For example, the 
     *     file name "example.cpp" matches the pattern "e*.cpp", 
     *     but not "e?.cpp". The filename "ex.cpp" would match 
     *     both patterns. Note that when the filename pattern is used to compare against a specific filename, the pattern 
     *     match is case-insensitive.
     * 
     * You use the property to allow file patterns that would otherwise be blocked by the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmscreen/nf-fsrmscreen-ifsrmfilegroup-get_members">Members</a> property. For example, if 
     *     <b>Members</b> property uses 
     *     "*.mp*" to block mp3 files, you could set this property to 
     *     "*.mpp" to allow "*.mpp" files.
     * @returns {IFsrmMutableCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilegroup-get_nonmembers
     */
    get_NonMembers() {
        result := ComCall(16, this, "ptr*", &nonMembers := 0, "HRESULT")
        return IFsrmMutableCollection(nonMembers)
    }

    /**
     * Retrieves or sets the filename patterns that determine the files that are excluded from the file group. (Put)
     * @remarks
     * A filename pattern is a string expression that defines a set of filenames. The expression may contain the 
     *     following wildcard characters: "*" and "?". The "*" wildcard 
     *     matches 0 or more characters and the "?" wildcard  matches exactly 1 character. For example, the 
     *     file name "example.cpp" matches the pattern "e*.cpp", 
     *     but not "e?.cpp". The filename "ex.cpp" would match 
     *     both patterns. Note that when the filename pattern is used to compare against a specific filename, the pattern 
     *     match is case-insensitive.
     * 
     * You use the property to allow file patterns that would otherwise be blocked by the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmscreen/nf-fsrmscreen-ifsrmfilegroup-get_members">Members</a> property. For example, if 
     *     <b>Members</b> property uses 
     *     "*.mp*" to block mp3 files, you could set this property to 
     *     "*.mpp" to allow "*.mpp" files.
     * @param {IFsrmMutableCollection} nonMembers 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilegroup-put_nonmembers
     */
    put_NonMembers(nonMembers) {
        result := ComCall(17, this, "ptr", nonMembers, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFsrmFileGroup.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.put_Name := CallbackCreate(GetMethod(implObj, "put_Name"), flags, 2)
        this.vtbl.get_Members := CallbackCreate(GetMethod(implObj, "get_Members"), flags, 2)
        this.vtbl.put_Members := CallbackCreate(GetMethod(implObj, "put_Members"), flags, 2)
        this.vtbl.get_NonMembers := CallbackCreate(GetMethod(implObj, "get_NonMembers"), flags, 2)
        this.vtbl.put_NonMembers := CallbackCreate(GetMethod(implObj, "put_NonMembers"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.put_Name)
        CallbackFree(this.vtbl.get_Members)
        CallbackFree(this.vtbl.put_Members)
        CallbackFree(this.vtbl.get_NonMembers)
        CallbackFree(this.vtbl.put_NonMembers)
    }
}
