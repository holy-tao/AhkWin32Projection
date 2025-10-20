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
     * 
     * @param {Pointer<BSTR>} pDelay 
     * @returns {HRESULT} 
     */
    get_IdleDuration(pDelay) {
        result := ComCall(7, this, "ptr", pDelay, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} delay 
     * @returns {HRESULT} 
     */
    put_IdleDuration(delay) {
        delay := delay is String ? BSTR.Alloc(delay).Value : delay

        result := ComCall(8, this, "ptr", delay, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pTimeout 
     * @returns {HRESULT} 
     */
    get_WaitTimeout(pTimeout) {
        result := ComCall(9, this, "ptr", pTimeout, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} timeout 
     * @returns {HRESULT} 
     */
    put_WaitTimeout(timeout) {
        timeout := timeout is String ? BSTR.Alloc(timeout).Value : timeout

        result := ComCall(10, this, "ptr", timeout, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pStop 
     * @returns {HRESULT} 
     */
    get_StopOnIdleEnd(pStop) {
        result := ComCall(11, this, "ptr", pStop, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} stop 
     * @returns {HRESULT} 
     */
    put_StopOnIdleEnd(stop) {
        result := ComCall(12, this, "short", stop, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pRestart 
     * @returns {HRESULT} 
     */
    get_RestartOnIdle(pRestart) {
        result := ComCall(13, this, "ptr", pRestart, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} restart 
     * @returns {HRESULT} 
     */
    put_RestartOnIdle(restart) {
        result := ComCall(14, this, "short", restart, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
