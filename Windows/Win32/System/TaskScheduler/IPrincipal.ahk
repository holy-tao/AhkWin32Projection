#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides the security credentials for a principal.
 * @remarks
 * 
  * When specifying an account, remember to properly use the double backslash in code to specify the domain and user name. For example, use DOMAIN\\UserName to specify a value for the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iprincipal-get_userid">UserId</a> property.
  * 
  * When reading or writing XML for a task, the security credentials for a principal are specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-principal-principaltype-element">Principal</a> element of the Task Scheduler schema.
  * 
  * If a task is registered using the at.exe command line tool, and this interface is used to retrieve information about the task, then the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iprincipal-get_logontype">LogonType</a> property will return 0, the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iprincipal-get_runlevel">RunLevel</a> property will return 0, and the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iprincipal-get_userid">UserId</a> property will return <b>NULL</b>.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-iprincipal
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class IPrincipal extends IDispatch{
    /**
     * The interface identifier for IPrincipal
     * @type {Guid}
     */
    static IID => Guid("{d98d51e5-c9b4-496a-a9c1-18980261cf0f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<BSTR>} pId 
     * @returns {HRESULT} 
     */
    get_Id(pId) {
        result := ComCall(7, this, "ptr", pId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Id 
     * @returns {HRESULT} 
     */
    put_Id(Id) {
        Id := Id is String ? BSTR.Alloc(Id).Value : Id

        result := ComCall(8, this, "ptr", Id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pName 
     * @returns {HRESULT} 
     */
    get_DisplayName(pName) {
        result := ComCall(9, this, "ptr", pName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     */
    put_DisplayName(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(10, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pUser 
     * @returns {HRESULT} 
     */
    get_UserId(pUser) {
        result := ComCall(11, this, "ptr", pUser, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} user 
     * @returns {HRESULT} 
     */
    put_UserId(user) {
        user := user is String ? BSTR.Alloc(user).Value : user

        result := ComCall(12, this, "ptr", user, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pLogon 
     * @returns {HRESULT} 
     */
    get_LogonType(pLogon) {
        result := ComCall(13, this, "int*", pLogon, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} logon 
     * @returns {HRESULT} 
     */
    put_LogonType(logon) {
        result := ComCall(14, this, "int", logon, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pGroup 
     * @returns {HRESULT} 
     */
    get_GroupId(pGroup) {
        result := ComCall(15, this, "ptr", pGroup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} group 
     * @returns {HRESULT} 
     */
    put_GroupId(group) {
        group := group is String ? BSTR.Alloc(group).Value : group

        result := ComCall(16, this, "ptr", group, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pRunLevel 
     * @returns {HRESULT} 
     */
    get_RunLevel(pRunLevel) {
        result := ComCall(17, this, "int*", pRunLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} runLevel 
     * @returns {HRESULT} 
     */
    put_RunLevel(runLevel) {
        result := ComCall(18, this, "int", runLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
