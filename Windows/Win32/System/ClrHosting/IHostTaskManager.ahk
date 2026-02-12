#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IHostTask.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class IHostTaskManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHostTaskManager
     * @type {Guid}
     */
    static IID => Guid("{997ff24c-43b7-4352-8667-0dc04fafd354}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCurrentTask", "CreateTask", "Sleep", "SwitchToTask", "SetUILocale", "SetLocale", "CallNeedsHostHook", "LeaveRuntime", "EnterRuntime", "ReverseLeaveRuntime", "ReverseEnterRuntime", "BeginDelayAbort", "EndDelayAbort", "BeginThreadAffinity", "EndThreadAffinity", "SetStackGuarantee", "GetStackGuarantee", "SetCLRTaskManager"]

    /**
     * 
     * @returns {IHostTask} 
     */
    GetCurrentTask() {
        result := ComCall(3, this, "ptr*", &pTask := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHostTask(pTask)
    }

    /**
     * 
     * @param {Integer} dwStackSize 
     * @param {Pointer<LPTHREAD_START_ROUTINE>} pStartAddress 
     * @param {Pointer<Void>} pParameter 
     * @returns {IHostTask} 
     */
    CreateTask(dwStackSize, pStartAddress, pParameter) {
        pParameterMarshal := pParameter is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "uint", dwStackSize, "ptr", pStartAddress, pParameterMarshal, pParameter, "ptr*", &ppTask := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHostTask(ppTask)
    }

    /**
     * Suspends the execution of the current thread until the time-out interval elapses.
     * @remarks
     * This function causes a thread to relinquish the remainder of its time slice and become unrunnable for an interval based on the value of <i>dwMilliseconds</i>. The system clock "ticks" at a constant rate. If <i>dwMilliseconds</i> is less than the resolution of the system clock, the thread may sleep for less than the specified length of time. If <i>dwMilliseconds</i> is greater than one tick but less than two, the wait can be anywhere between one and two ticks, and so on. To increase the accuracy of the sleep interval, call the <b>timeGetDevCaps</b> function to determine the supported minimum timer resolution and the <b>timeBeginPeriod</b> function to set the timer resolution to its minimum. Use caution when calling <b>timeBeginPeriod</b>, as frequent calls can significantly affect the system clock, system power usage, and the scheduler. If you call <b>timeBeginPeriod</b>, call it one time early in the application and be sure to call the <b>timeEndPeriod</b> function at the very end of the application.
     * 
     * After the sleep interval has passed, the thread is ready to run. If you specify 0 milliseconds, the thread will relinquish the remainder of its time slice but remain ready. Note that a ready thread is not guaranteed to run immediately. Consequently, the thread may not run until some time after the sleep interval elapses. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/scheduling-priorities">Scheduling Priorities</a>.
     * 
     * Be careful when using <b>Sleep</b> in the following scenarios:
     * 
     * <ul>
     * <li>Code  that directly or indirectly creates windows (for example, DDE and COM <b>CoInitialize</b>). If a thread creates any windows, it must process messages. Message broadcasts are sent to all windows in the system. If you have a thread that uses 
     * <b>Sleep</b> with infinite delay, the system will deadlock. </li>
     * <li>Threads that are under concurrency control. For example, an I/O completion port or thread pool limits the number of associated threads that can run. If the maximum number of threads is already running, no additional associated thread can run until a running thread finishes. If a thread uses <b>Sleep</b> with an interval of zero to wait for one of the additional associated threads to accomplish some work,  the process might deadlock. </li>
     * </ul>
     *  For these scenarios, use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-msgwaitformultipleobjects">MsgWaitForMultipleObjects</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-msgwaitformultipleobjectsex">MsgWaitForMultipleObjectsEx</a>, rather than 
     * <b>Sleep</b>.
     * 
     * <b>Windows Phone 8.1:</b> This function is supported for Windows Phone Store apps on Windows Phone 8.1 and later.
     * 
     * <b>Windows 8.1</b> and <b>Windows Server 2012 R2</b>: This function is supported for Windows Store apps on Windows 8.1, Windows Server 2012 R2, and later.
     * @param {Integer} dwMilliseconds The time interval for which execution is to be suspended, in milliseconds.
     * 
     * A value of zero causes the thread to relinquish the remainder of its time slice to any other thread  that is ready to run. If there are no other threads ready to run, the function returns immediately, and the thread continues execution. <b>Windows XP:</b> A value of zero causes the thread to relinquish the remainder of its time slice to any other thread of equal priority that is ready to run. If there are no other threads of equal priority ready to run, the function returns immediately, and the thread continues execution. This behavior changed starting with Windows Server 2003.
     * 
     * 
     * 
     * A value of INFINITE indicates that the suspension should not time out.
     * @param {Integer} option 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/synchapi/nf-synchapi-sleep
     */
    Sleep(dwMilliseconds, option) {
        result := ComCall(5, this, "uint", dwMilliseconds, "uint", option, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} option 
     * @returns {HRESULT} 
     */
    SwitchToTask(option) {
        result := ComCall(6, this, "uint", option, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} lcid 
     * @returns {HRESULT} 
     */
    SetUILocale(lcid) {
        result := ComCall(7, this, "uint", lcid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets an item of information in the user override portion of the current locale. This function does not set the system defaults. (Unicode)
     * @remarks
     * This function writes to the registry, where it sets values that are associated with a particular user instead of a particular application. These registry values affect the behavior of other applications run by the user. As a rule, an application should call this function only when the user has explicitly requested the changes. The registry settings should not be changed for the convenience of a single application.
     * 
     * For the <i>LCType</i> parameter, the application should set <a href="https://docs.microsoft.com/windows/desktop/Intl/locale-use-cp-acp">LOCALE_USE_CP_ACP</a> to use the operating system ANSI code page instead of the locale code page for string translation.
     * 
     * When the ANSI version of this function is used with a Unicode-only locale identifier, the function can succeed because the operating system uses the system code page. However, characters that are undefined in the system code page appear in the string as a question mark (?). 
     * 
     * As of Windows Vista, the <a href="https://docs.microsoft.com/windows/desktop/Intl/locale-sdate">LOCALE_SDATE</a> and <a href="https://docs.microsoft.com/windows/desktop/Intl/locale-stime-constants">LOCALE_STIME</a> constants are obsolete. Do not use these constants. Use <a href="https://docs.microsoft.com/windows/desktop/Intl/locale-sshortdate">LOCALE_SSHORTDATE</a> and <a href="https://docs.microsoft.com/windows/desktop/Intl/locale-stime-constants">LOCALE_STIMEFORMAT</a> instead. A custom locale might not have a single, uniform separator character within the date or time format: for example, a format such as "12/31, 2006" or "03:56'23" might be valid.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winnls.h header defines SetLocaleInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} lcid 
     * @returns {HRESULT} Returns a nonzero value if successful, or 0 otherwise. To get extended error information, the application can call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>, which can return one of the following error codes:
     * 
     * <ul>
     * <li>ERROR_ACCESS_DISABLED_BY_POLICY. The group policy of the computer or the user has forbidden this operation.</li>
     * <li>ERROR_INVALID_ACCESS. The access code was invalid.</li>
     * <li>ERROR_INVALID_FLAGS. The values supplied for flags were not valid.</li>
     * <li>ERROR_INVALID_PARAMETER. Any of the parameter values was invalid.</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api//content/winnls/nf-winnls-setlocaleinfow
     */
    SetLocale(lcid) {
        result := ComCall(8, this, "uint", lcid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer} target 
     * @returns {BOOL} 
     */
    CallNeedsHostHook(target) {
        result := ComCall(9, this, "ptr", target, "int*", &pbCallNeedsHostHook := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbCallNeedsHostHook
    }

    /**
     * 
     * @param {Pointer} target 
     * @returns {HRESULT} 
     */
    LeaveRuntime(target) {
        result := ComCall(10, this, "ptr", target, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EnterRuntime() {
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ReverseLeaveRuntime() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ReverseEnterRuntime() {
        result := ComCall(13, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    BeginDelayAbort() {
        result := ComCall(14, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndDelayAbort() {
        result := ComCall(15, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    BeginThreadAffinity() {
        result := ComCall(16, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndThreadAffinity() {
        result := ComCall(17, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} guarantee 
     * @returns {HRESULT} 
     */
    SetStackGuarantee(guarantee) {
        result := ComCall(18, this, "uint", guarantee, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetStackGuarantee() {
        result := ComCall(19, this, "uint*", &pGuarantee := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pGuarantee
    }

    /**
     * 
     * @param {ICLRTaskManager} ppManager 
     * @returns {HRESULT} 
     */
    SetCLRTaskManager(ppManager) {
        result := ComCall(20, this, "ptr", ppManager, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
