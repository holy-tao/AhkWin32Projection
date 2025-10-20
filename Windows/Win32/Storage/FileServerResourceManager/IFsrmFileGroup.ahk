#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     */
    get_Name(name) {
        result := ComCall(12, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(13, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFsrmMutableCollection>} members 
     * @returns {HRESULT} 
     */
    get_Members(members) {
        result := ComCall(14, this, "ptr", members, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFsrmMutableCollection>} members 
     * @returns {HRESULT} 
     */
    put_Members(members) {
        result := ComCall(15, this, "ptr", members, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFsrmMutableCollection>} nonMembers 
     * @returns {HRESULT} 
     */
    get_NonMembers(nonMembers) {
        result := ComCall(16, this, "ptr", nonMembers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFsrmMutableCollection>} nonMembers 
     * @returns {HRESULT} 
     */
    put_NonMembers(nonMembers) {
        result := ComCall(17, this, "ptr", nonMembers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
