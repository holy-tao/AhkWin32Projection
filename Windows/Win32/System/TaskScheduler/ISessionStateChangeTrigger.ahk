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
     * 
     * @param {Pointer<BSTR>} pDelay 
     * @returns {HRESULT} 
     */
    get_Delay(pDelay) {
        result := ComCall(20, this, "ptr", pDelay, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} delay 
     * @returns {HRESULT} 
     */
    put_Delay(delay) {
        delay := delay is String ? BSTR.Alloc(delay).Value : delay

        result := ComCall(21, this, "ptr", delay, "int")
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
        result := ComCall(22, this, "ptr", pUser, "int")
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

        result := ComCall(23, this, "ptr", user, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pType 
     * @returns {HRESULT} 
     */
    get_StateChange(pType) {
        result := ComCall(24, this, "int*", pType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} type 
     * @returns {HRESULT} 
     */
    put_StateChange(type) {
        result := ComCall(25, this, "int", type, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
