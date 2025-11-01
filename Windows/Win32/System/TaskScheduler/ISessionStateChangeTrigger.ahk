#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITrigger.ahk

/**
 * Triggers tasks for console connect or disconnect, remote connect or disconnect, or workstation lock or unlock notifications.
 * @remarks
 * 
  * When reading or writing your own XML for a task, a session state change trigger is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-sessionstatechangetrigger-triggergroup-element">SessionStateChangeTrigger</a> element of the Task Scheduler schema.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-isessionstatechangetrigger
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class ISessionStateChangeTrigger extends ITrigger{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISessionStateChangeTrigger
     * @type {Guid}
     */
    static IID => Guid("{754da71b-4385-4475-9dd9-598294fa3641}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Delay", "put_Delay", "get_UserId", "put_UserId", "get_StateChange", "put_StateChange"]

    /**
     * 
     * @param {Pointer<BSTR>} pDelay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-isessionstatechangetrigger-get_delay
     */
    get_Delay(pDelay) {
        result := ComCall(20, this, "ptr", pDelay, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} delay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-isessionstatechangetrigger-put_delay
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
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-isessionstatechangetrigger-get_userid
     */
    get_UserId(pUser) {
        result := ComCall(22, this, "ptr", pUser, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} user 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-isessionstatechangetrigger-put_userid
     */
    put_UserId(user) {
        user := user is String ? BSTR.Alloc(user).Value : user

        result := ComCall(23, this, "ptr", user, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-isessionstatechangetrigger-get_statechange
     */
    get_StateChange(pType) {
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"

        result := ComCall(24, this, pTypeMarshal, pType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} type 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-isessionstatechangetrigger-put_statechange
     */
    put_StateChange(type) {
        result := ComCall(25, this, "int", type, "HRESULT")
        return result
    }
}
