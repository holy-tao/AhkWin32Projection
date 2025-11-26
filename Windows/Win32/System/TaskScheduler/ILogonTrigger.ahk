#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITrigger.ahk

/**
 * Represents a trigger that starts a task when a user logs on.
 * @remarks
 * 
 * If you want a task to be triggered when any member of a group logs on to the computer rather than when  a specific user logs on, then do not assign a value to the  <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-ilogontrigger-get_userid">UserId</a> property.  Instead, create a logon trigger with an empty <b>UserId</b> property and assign a value to the principal for the task using the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iprincipal-get_groupid">GroupId</a> property.
 * 
 * When reading or writing XML for a task, a logon trigger is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-logontrigger-triggergroup-element">LogonTrigger</a> element of the Task Scheduler schema.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-ilogontrigger
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class ILogonTrigger extends ITrigger{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILogonTrigger
     * @type {Guid}
     */
    static IID => Guid("{72dade38-fae4-4b3e-baf4-5d009af02b1c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Delay", "put_Delay", "get_UserId", "put_UserId"]

    /**
     */
    Delay {
        get => this.get_Delay()
        set => this.put_Delay(value)
    }

    /**
     */
    UserId {
        get => this.get_UserId()
        set => this.put_UserId(value)
    }

    /**
     * 
     * @param {Pointer<BSTR>} pDelay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-ilogontrigger-get_delay
     */
    get_Delay(pDelay) {
        result := ComCall(20, this, "ptr", pDelay, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} delay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-ilogontrigger-put_delay
     */
    put_Delay(delay) {
        delay := delay is String ? BSTR.Alloc(delay).Value : delay

        result := ComCall(21, this, "ptr", delay, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pUser 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-ilogontrigger-get_userid
     */
    get_UserId(pUser) {
        result := ComCall(22, this, "ptr", pUser, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} user 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-ilogontrigger-put_userid
     */
    put_UserId(user) {
        user := user is String ? BSTR.Alloc(user).Value : user

        result := ComCall(23, this, "ptr", user, "HRESULT")
        return result
    }
}
