#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Specifies how the Task Scheduler performs tasks when the computer is in an idle condition.
 * @remarks
 * 
 * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-idlesettings-settingstype-element">IdleSettings</a> element of the Task Scheduler schema.
 * 
 * If a task is triggered by an idle trigger, then the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iidlesettings-get_waittimeout">WaitTimeout</a> property of the <b>IIdleSettings</b> interface is ignored.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-iidlesettings
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class IIdleSettings extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIdleSettings
     * @type {Guid}
     */
    static IID => Guid("{84594461-0053-4342-a8fd-088fabf11f32}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IdleDuration", "put_IdleDuration", "get_WaitTimeout", "put_WaitTimeout", "get_StopOnIdleEnd", "put_StopOnIdleEnd", "get_RestartOnIdle", "put_RestartOnIdle"]

    /**
     */
    IdleDuration {
        get => this.get_IdleDuration()
        set => this.put_IdleDuration(value)
    }

    /**
     */
    WaitTimeout {
        get => this.get_WaitTimeout()
        set => this.put_WaitTimeout(value)
    }

    /**
     */
    StopOnIdleEnd {
        get => this.get_StopOnIdleEnd()
        set => this.put_StopOnIdleEnd(value)
    }

    /**
     */
    RestartOnIdle {
        get => this.get_RestartOnIdle()
        set => this.put_RestartOnIdle(value)
    }

    /**
     * 
     * @param {Pointer<BSTR>} pDelay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iidlesettings-get_idleduration
     */
    get_IdleDuration(pDelay) {
        result := ComCall(7, this, "ptr", pDelay, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} delay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iidlesettings-put_idleduration
     */
    put_IdleDuration(delay) {
        delay := delay is String ? BSTR.Alloc(delay).Value : delay

        result := ComCall(8, this, "ptr", delay, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pTimeout 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iidlesettings-get_waittimeout
     */
    get_WaitTimeout(pTimeout) {
        result := ComCall(9, this, "ptr", pTimeout, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} timeout 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iidlesettings-put_waittimeout
     */
    put_WaitTimeout(timeout) {
        timeout := timeout is String ? BSTR.Alloc(timeout).Value : timeout

        result := ComCall(10, this, "ptr", timeout, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pStop 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iidlesettings-get_stoponidleend
     */
    get_StopOnIdleEnd(pStop) {
        pStopMarshal := pStop is VarRef ? "short*" : "ptr"

        result := ComCall(11, this, pStopMarshal, pStop, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} stop 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iidlesettings-put_stoponidleend
     */
    put_StopOnIdleEnd(stop) {
        result := ComCall(12, this, "short", stop, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pRestart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iidlesettings-get_restartonidle
     */
    get_RestartOnIdle(pRestart) {
        pRestartMarshal := pRestart is VarRef ? "short*" : "ptr"

        result := ComCall(13, this, pRestartMarshal, pRestart, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} restart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iidlesettings-put_restartonidle
     */
    put_RestartOnIdle(restart) {
        result := ComCall(14, this, "short", restart, "HRESULT")
        return result
    }
}
