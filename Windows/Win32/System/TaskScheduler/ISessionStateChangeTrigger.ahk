#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITrigger.ahk

/**
 * Triggers tasks for console connect or disconnect, remote connect or disconnect, or workstation lock or unlock notifications.
 * @remarks
 * When reading or writing your own XML for a task, a session state change trigger is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-sessionstatechangetrigger-triggergroup-element">SessionStateChangeTrigger</a> element of the Task Scheduler schema.
 * @see https://learn.microsoft.com/windows/win32/api//content/taskschd/nn-taskschd-isessionstatechangetrigger
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
     */
    StateChange {
        get => this.get_StateChange()
        set => this.put_StateChange(value)
    }

    /**
     * Gets or sets a value that indicates how long of a delay takes place before a task is started after a Terminal Server session state change is detected. (ISessionStateChangeTrigger.get_Delay)
     * @param {Pointer<BSTR>} pDelay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/taskschd/nf-taskschd-isessionstatechangetrigger-get_delay
     */
    get_Delay(pDelay) {
        result := ComCall(20, this, "ptr", pDelay, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets or sets a value that indicates how long of a delay takes place before a task is started after a Terminal Server session state change is detected. (ISessionStateChangeTrigger.put_Delay)
     * @param {BSTR} delay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/taskschd/nf-taskschd-isessionstatechangetrigger-put_delay
     */
    put_Delay(delay) {
        if(delay is String) {
            pin := BSTR.Alloc(delay)
            delay := pin.Value
        }

        result := ComCall(21, this, "ptr", delay, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets or sets the user for the Terminal Server session. When a session state change is detected for this user, a task is started. (Get)
     * @param {Pointer<BSTR>} pUser 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/taskschd/nf-taskschd-isessionstatechangetrigger-get_userid
     */
    get_UserId(pUser) {
        result := ComCall(22, this, "ptr", pUser, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets or sets the user for the Terminal Server session. When a session state change is detected for this user, a task is started. (Put)
     * @param {BSTR} user 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/taskschd/nf-taskschd-isessionstatechangetrigger-put_userid
     */
    put_UserId(user) {
        if(user is String) {
            pin := BSTR.Alloc(user)
            user := pin.Value
        }

        result := ComCall(23, this, "ptr", user, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets or sets the kind of Terminal Server session change that would trigger a task launch. (Get)
     * @param {Pointer<Integer>} pType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/taskschd/nf-taskschd-isessionstatechangetrigger-get_statechange
     */
    get_StateChange(pType) {
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"

        result := ComCall(24, this, pTypeMarshal, pType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets or sets the kind of Terminal Server session change that would trigger a task launch. (Put)
     * @param {Integer} type 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/taskschd/nf-taskschd-isessionstatechangetrigger-put_statechange
     */
    put_StateChange(type) {
        result := ComCall(25, this, "int", type, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
