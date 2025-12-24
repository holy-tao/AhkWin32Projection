#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFsrmMutableCollection.ahk
#Include .\IFsrmObject.ahk

/**
 * Used to define a group of files based on one or more file name patterns.
 * @remarks
 * 
 * A file group is formed by including all members and then excluding all nonmembers. For example, to list all 
 *     files except for <i>examplename</i>, set <b>Members</b> 
 *     to "*.*" and <b>NonMembers</b> to 
 *     "<i>examplename</i>".
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nn-fsrmscreen-ifsrmfilegroup
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmFileGroup extends IFsrmObject{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmFileGroup
     * @type {Guid}
     */
    static IID => Guid("{8dd04909-0e34-4d55-afaa-89e1f1a1bbb9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "put_Name", "get_Members", "put_Members", "get_NonMembers", "put_NonMembers"]

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
     * Retrieves or sets the name of the file group.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nf-fsrmscreen-ifsrmfilegroup-get_name
     */
    get_Name() {
        name := BSTR()
        result := ComCall(12, this, "ptr", name, "HRESULT")
        return name
    }

    /**
     * Retrieves or sets the name of the file group.
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nf-fsrmscreen-ifsrmfilegroup-put_name
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(13, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the filename patterns that determine the files that are included in the file group.
     * @remarks
     * 
     * A filename pattern is a string expression that defines a set of filenames. The expression may contain the 
     *     following wildcard characters: "*" and "?". The "*" wildcard 
     *     matches 0 or more characters and the "?" wildcard  matches exactly 1 character. For example, the 
     *     file name "example.cpp" matches the pattern "e*.cpp", 
     *     but not "e?.cpp". The filename "ex.cpp" would match 
     *     both patterns. Note that when the filename pattern is used to compare against a specific filename, the pattern 
     *     match is case-insensitive.
     * 
     * 
     * 
     * @returns {IFsrmMutableCollection} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nf-fsrmscreen-ifsrmfilegroup-get_members
     */
    get_Members() {
        result := ComCall(14, this, "ptr*", &members := 0, "HRESULT")
        return IFsrmMutableCollection(members)
    }

    /**
     * Retrieves or sets the filename patterns that determine the files that are included in the file group.
     * @remarks
     * 
     * A filename pattern is a string expression that defines a set of filenames. The expression may contain the 
     *     following wildcard characters: "*" and "?". The "*" wildcard 
     *     matches 0 or more characters and the "?" wildcard  matches exactly 1 character. For example, the 
     *     file name "example.cpp" matches the pattern "e*.cpp", 
     *     but not "e?.cpp". The filename "ex.cpp" would match 
     *     both patterns. Note that when the filename pattern is used to compare against a specific filename, the pattern 
     *     match is case-insensitive.
     * 
     * 
     * 
     * @param {IFsrmMutableCollection} members 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nf-fsrmscreen-ifsrmfilegroup-put_members
     */
    put_Members(members) {
        result := ComCall(15, this, "ptr", members, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the filename patterns that determine the files that are excluded from the file group.
     * @remarks
     * 
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
     * 
     * 
     * 
     * @returns {IFsrmMutableCollection} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nf-fsrmscreen-ifsrmfilegroup-get_nonmembers
     */
    get_NonMembers() {
        result := ComCall(16, this, "ptr*", &nonMembers := 0, "HRESULT")
        return IFsrmMutableCollection(nonMembers)
    }

    /**
     * Retrieves or sets the filename patterns that determine the files that are excluded from the file group.
     * @remarks
     * 
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
     * 
     * 
     * 
     * @param {IFsrmMutableCollection} nonMembers 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nf-fsrmscreen-ifsrmfilegroup-put_nonmembers
     */
    put_NonMembers(nonMembers) {
        result := ComCall(17, this, "ptr", nonMembers, "HRESULT")
        return result
    }
}
