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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "put_Id", "get_DisplayName", "put_DisplayName", "get_UserId", "put_UserId", "get_LogonType", "put_LogonType", "get_GroupId", "put_GroupId", "get_RunLevel", "put_RunLevel"]

    /**
     */
    Id {
        get => this.get_Id()
        set => this.put_Id(value)
    }

    /**
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     */
    UserId {
        get => this.get_UserId()
        set => this.put_UserId(value)
    }

    /**
     */
    LogonType {
        get => this.get_LogonType()
        set => this.put_LogonType(value)
    }

    /**
     */
    GroupId {
        get => this.get_GroupId()
        set => this.put_GroupId(value)
    }

    /**
     */
    RunLevel {
        get => this.get_RunLevel()
        set => this.put_RunLevel(value)
    }

    /**
     * 
     * @param {Pointer<BSTR>} pId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iprincipal-get_id
     */
    get_Id(pId) {
        result := ComCall(7, this, "ptr", pId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Id 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iprincipal-put_id
     */
    put_Id(Id) {
        Id := Id is String ? BSTR.Alloc(Id).Value : Id

        result := ComCall(8, this, "ptr", Id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iprincipal-get_displayname
     */
    get_DisplayName(pName) {
        result := ComCall(9, this, "ptr", pName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iprincipal-put_displayname
     */
    put_DisplayName(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(10, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pUser 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iprincipal-get_userid
     */
    get_UserId(pUser) {
        result := ComCall(11, this, "ptr", pUser, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} user 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iprincipal-put_userid
     */
    put_UserId(user) {
        user := user is String ? BSTR.Alloc(user).Value : user

        result := ComCall(12, this, "ptr", user, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pLogon 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iprincipal-get_logontype
     */
    get_LogonType(pLogon) {
        pLogonMarshal := pLogon is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, pLogonMarshal, pLogon, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} logon 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iprincipal-put_logontype
     */
    put_LogonType(logon) {
        result := ComCall(14, this, "int", logon, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pGroup 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iprincipal-get_groupid
     */
    get_GroupId(pGroup) {
        result := ComCall(15, this, "ptr", pGroup, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} group 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iprincipal-put_groupid
     */
    put_GroupId(group) {
        group := group is String ? BSTR.Alloc(group).Value : group

        result := ComCall(16, this, "ptr", group, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pRunLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iprincipal-get_runlevel
     */
    get_RunLevel(pRunLevel) {
        pRunLevelMarshal := pRunLevel is VarRef ? "int*" : "ptr"

        result := ComCall(17, this, pRunLevelMarshal, pRunLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} runLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iprincipal-put_runlevel
     */
    put_RunLevel(runLevel) {
        result := ComCall(18, this, "int", runLevel, "HRESULT")
        return result
    }
}
