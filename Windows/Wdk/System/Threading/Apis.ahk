#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Wdk.System.Threading
 * @version v4.0.30319
 */
class Threading {

;@region Constants
;@endregion Constants

;@region Methods
    /**
     * Retrieves information about the specified process.
     * @param {HANDLE} ProcessHandle A handle to the process for which information is to be retrieved.
     * @param {Integer} ProcessInformationClass 
     * @param {Pointer<Void>} ProcessInformation A pointer to a buffer supplied by the calling application into which the function writes the requested information. The size of the information written varies depending on the data type of the <i>ProcessInformationClass</i> parameter:
     * @param {Integer} ProcessInformationLength The size of the buffer pointed to by the <i>ProcessInformation</i> parameter, in bytes.
     * @param {Pointer<Integer>} ReturnLength A pointer to a variable in which the function returns the size of the requested information. If the function was successful, this is the size of the information written to the buffer pointed to by the <i>ProcessInformation</i> parameter, but if the buffer was too small, this is the minimum size of buffer needed to receive the information successfully.
     * @returns {NTSTATUS} The function returns  an NTSTATUS success or error code. 
     * 
     * The forms and significance of NTSTATUS error codes are listed in the Ntstatus.h header file available in the DDK, and are described in the DDK documentation under Kernel-Mode Driver Architecture / Design Guide / Driver Programming Techniques / Logging Errors.
     * @see https://docs.microsoft.com/windows/win32/api//winternl/nf-winternl-ntqueryinformationprocess
     */
    static NtQueryInformationProcess(ProcessHandle, ProcessInformationClass, ProcessInformation, ProcessInformationLength, ReturnLength) {
        ProcessHandle := ProcessHandle is Win32Handle ? NumGet(ProcessHandle, "ptr") : ProcessHandle

        ProcessInformationMarshal := ProcessInformation is VarRef ? "ptr" : "ptr"
        ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\NtQueryInformationProcess", "ptr", ProcessHandle, "int", ProcessInformationClass, ProcessInformationMarshal, ProcessInformation, "uint", ProcessInformationLength, ReturnLengthMarshal, ReturnLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ProcessHandle 
     * @param {Integer} ProcessInformationClass 
     * @param {Pointer<Void>} ProcessInformation 
     * @param {Integer} ProcessInformationLength 
     * @param {Pointer<Integer>} ReturnLength 
     * @returns {NTSTATUS} 
     */
    static ZwQueryInformationProcess(ProcessHandle, ProcessInformationClass, ProcessInformation, ProcessInformationLength, ReturnLength) {
        ProcessHandle := ProcessHandle is Win32Handle ? NumGet(ProcessHandle, "ptr") : ProcessHandle

        ProcessInformationMarshal := ProcessInformation is VarRef ? "ptr" : "ptr"
        ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\ZwQueryInformationProcess", "ptr", ProcessHandle, "int", ProcessInformationClass, ProcessInformationMarshal, ProcessInformation, "uint", ProcessInformationLength, ReturnLengthMarshal, ReturnLength, "int")
        return result
    }

    /**
     * Retrieves information about the specified thread.
     * @param {HANDLE} ThreadHandle A handle to the thread about which information is being requested.
     * @param {Integer} ThreadInformationClass If this parameter is the <b>ThreadIsIoPending</b> value of the  <b>THREADINFOCLASS</b> enumeration, the function determines whether the thread has any I/O operations pending.
     * 
     * Use the public  function <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getthreadiopendingflag">GetThreadIOPendingFlag</a> instead to obtain this information.
     * 
     * If this parameter is the <b>ThreadQuerySetWin32StartAddress</b> value of the <b>THREADINFOCLASS</b> enumeration, the function returns the start address of the thread. Note that on versions of Windows prior to Windows Vista, the returned start address is only reliable before the thread starts running.
     * 
     * If this parameter is the <b>ThreadSubsystemInformation</b> value of the  <b>THREADINFOCLASS</b> enumeration, the function retrieves a <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ntddk/ne-ntddk-_subsystem_information_type">SUBSYSTEM_INFORMATION_TYPE</a> value indicating the subsystem type of the thread. The buffer pointed to by the <i>ThreadInformation</i> parameter should be large enough to hold a single <b>SUBSYSTEM_INFORMATION_TYPE</b> enumeration.
     * @param {Pointer<Void>} ThreadInformation A pointer to a buffer in which the function writes the requested information. If <b>ThreadIsIoPending</b> is specified for the <i>ThreadInformationClass</i> parameter, this buffer must be large enough to hold a <b>ULONG</b> value, which indicates whether  the specified thread has I/O requests pending. If this value is equal to zero, then there are no I/O operations pending; otherwise, if the value is nonzero, then the thread does have I/O operations pending.
     * 
     * Use the public  function <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getthreadiopendingflag">GetThreadIOPendingFlag</a> instead to obtain this information.
     * 
     * If <b>ThreadQuerySetWin32StartAddress</b> is specified for the <i>ThreadInformationClass</i> parameter, this buffer must be large enough to hold a PVOID value, which is the start address of the thread.
     * @param {Integer} ThreadInformationLength The size of the buffer pointed to by the <i>ThreadInformation</i> parameter, in bytes.
     * @param {Pointer<Integer>} ReturnLength A pointer to a variable in which the function returns the size of the requested information. If the function was successful, this is the size of the information written to the buffer pointed to by the <i>ThreadInformation</i> parameter, but if the buffer was too small, this is the minimum size of buffer required to receive the information successfully.
     * @returns {NTSTATUS} Returns an NTSTATUS success or error code. 
     * 
     * The forms and significance of NTSTATUS error codes are listed in the Ntstatus.h header file available in the DDK, and are described in the DDK documentation under Kernel-Mode Driver Architecture / Design Guide / Driver Programming Techniques / Logging Errors.
     * @see https://docs.microsoft.com/windows/win32/api//winternl/nf-winternl-ntqueryinformationthread
     */
    static NtQueryInformationThread(ThreadHandle, ThreadInformationClass, ThreadInformation, ThreadInformationLength, ReturnLength) {
        ThreadHandle := ThreadHandle is Win32Handle ? NumGet(ThreadHandle, "ptr") : ThreadHandle

        ThreadInformationMarshal := ThreadInformation is VarRef ? "ptr" : "ptr"
        ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\NtQueryInformationThread", "ptr", ThreadHandle, "int", ThreadInformationClass, ThreadInformationMarshal, ThreadInformation, "uint", ThreadInformationLength, ReturnLengthMarshal, ReturnLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ThreadHandle 
     * @param {Integer} ThreadInformationClass 
     * @param {Pointer<Void>} ThreadInformation 
     * @param {Integer} ThreadInformationLength 
     * @param {Pointer<Integer>} ReturnLength 
     * @returns {NTSTATUS} 
     */
    static ZwQueryInformationThread(ThreadHandle, ThreadInformationClass, ThreadInformation, ThreadInformationLength, ReturnLength) {
        ThreadHandle := ThreadHandle is Win32Handle ? NumGet(ThreadHandle, "ptr") : ThreadHandle

        ThreadInformationMarshal := ThreadInformation is VarRef ? "ptr" : "ptr"
        ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\ZwQueryInformationThread", "ptr", ThreadHandle, "int", ThreadInformationClass, ThreadInformationMarshal, ThreadInformation, "uint", ThreadInformationLength, ReturnLengthMarshal, ReturnLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ThreadHandle 
     * @param {Integer} ThreadInformationClass 
     * @param {Pointer} ThreadInformation 
     * @param {Integer} ThreadInformationLength 
     * @returns {NTSTATUS} 
     */
    static NtSetInformationThread(ThreadHandle, ThreadInformationClass, ThreadInformation, ThreadInformationLength) {
        ThreadHandle := ThreadHandle is Win32Handle ? NumGet(ThreadHandle, "ptr") : ThreadHandle

        result := DllCall("ntdll.dll\NtSetInformationThread", "ptr", ThreadHandle, "int", ThreadInformationClass, "ptr", ThreadInformation, "uint", ThreadInformationLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} Handle 
     * @param {BOOLEAN} Alertable 
     * @param {Pointer<Integer>} Timeout 
     * @returns {NTSTATUS} 
     */
    static NtWaitForSingleObject(Handle, Alertable, Timeout) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle

        TimeoutMarshal := Timeout is VarRef ? "int64*" : "ptr"

        result := DllCall("ntdll.dll\NtWaitForSingleObject", "ptr", Handle, "char", Alertable, TimeoutMarshal, Timeout, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ProcessHandle 
     * @param {NTSTATUS} ExitStatus 
     * @returns {NTSTATUS} 
     */
    static NtTerminateProcess(ProcessHandle, ExitStatus) {
        ProcessHandle := ProcessHandle is Win32Handle ? NumGet(ProcessHandle, "ptr") : ProcessHandle

        result := DllCall("ntdll.dll\NtTerminateProcess", "ptr", ProcessHandle, "int", ExitStatus, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} TimerHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Integer} TimerType 
     * @returns {NTSTATUS} 
     */
    static NtCreateTimer(TimerHandle, DesiredAccess, ObjectAttributes, TimerType) {
        result := DllCall("ntdll.dll\NtCreateTimer", "ptr", TimerHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "int", TimerType, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} TimerHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @returns {NTSTATUS} 
     */
    static NtOpenTimer(TimerHandle, DesiredAccess, ObjectAttributes) {
        result := DllCall("ntdll.dll\NtOpenTimer", "ptr", TimerHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} TimerHandle 
     * @param {Pointer<BOOLEAN>} CurrentState 
     * @returns {NTSTATUS} 
     */
    static NtCancelTimer(TimerHandle, CurrentState) {
        TimerHandle := TimerHandle is Win32Handle ? NumGet(TimerHandle, "ptr") : TimerHandle

        CurrentStateMarshal := CurrentState is VarRef ? "char*" : "ptr"

        result := DllCall("ntdll.dll\NtCancelTimer", "ptr", TimerHandle, CurrentStateMarshal, CurrentState, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} TimerHandle 
     * @param {Pointer<Integer>} DueTime 
     * @param {Pointer<PTIMER_APC_ROUTINE>} TimerApcRoutine 
     * @param {Pointer<Void>} TimerContext 
     * @param {BOOLEAN} ResumeTimer 
     * @param {Integer} Period 
     * @param {Pointer<BOOLEAN>} PreviousState 
     * @returns {NTSTATUS} 
     */
    static NtSetTimer(TimerHandle, DueTime, TimerApcRoutine, TimerContext, ResumeTimer, Period, PreviousState) {
        TimerHandle := TimerHandle is Win32Handle ? NumGet(TimerHandle, "ptr") : TimerHandle

        DueTimeMarshal := DueTime is VarRef ? "int64*" : "ptr"
        TimerContextMarshal := TimerContext is VarRef ? "ptr" : "ptr"
        PreviousStateMarshal := PreviousState is VarRef ? "char*" : "ptr"

        result := DllCall("ntdll.dll\NtSetTimer", "ptr", TimerHandle, DueTimeMarshal, DueTime, "ptr", TimerApcRoutine, TimerContextMarshal, TimerContext, "char", ResumeTimer, "int", Period, PreviousStateMarshal, PreviousState, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} TimerHandle 
     * @param {Integer} TimerSetInformationClass 
     * @param {Pointer} TimerSetInformation 
     * @param {Integer} TimerSetInformationLength 
     * @returns {NTSTATUS} 
     */
    static NtSetTimerEx(TimerHandle, TimerSetInformationClass, TimerSetInformation, TimerSetInformationLength) {
        TimerHandle := TimerHandle is Win32Handle ? NumGet(TimerHandle, "ptr") : TimerHandle

        result := DllCall("ntdll.dll\NtSetTimerEx", "ptr", TimerHandle, "int", TimerSetInformationClass, "ptr", TimerSetInformation, "uint", TimerSetInformationLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} EventHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @returns {NTSTATUS} 
     */
    static NtOpenEvent(EventHandle, DesiredAccess, ObjectAttributes) {
        result := DllCall("ntdll.dll\NtOpenEvent", "ptr", EventHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} Handle 
     * @param {BOOLEAN} Alertable 
     * @param {Pointer<Integer>} Timeout 
     * @returns {NTSTATUS} 
     */
    static ZwWaitForSingleObject(Handle, Alertable, Timeout) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle

        TimeoutMarshal := Timeout is VarRef ? "int64*" : "ptr"

        result := DllCall("ntdll.dll\ZwWaitForSingleObject", "ptr", Handle, "char", Alertable, TimeoutMarshal, Timeout, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} EventHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @returns {NTSTATUS} 
     */
    static ZwOpenEvent(EventHandle, DesiredAccess, ObjectAttributes) {
        result := DllCall("ntdll.dll\ZwOpenEvent", "ptr", EventHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} ProcessHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Pointer<CLIENT_ID>} ClientId 
     * @returns {NTSTATUS} 
     */
    static NtOpenProcess(ProcessHandle, DesiredAccess, ObjectAttributes, ClientId) {
        result := DllCall("ntdll.dll\NtOpenProcess", "ptr", ProcessHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "ptr", ClientId, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ThreadHandle 
     * @param {Integer} ThreadInformationClass 
     * @param {Pointer} ThreadInformation 
     * @param {Integer} ThreadInformationLength 
     * @returns {NTSTATUS} 
     */
    static ZwSetInformationThread(ThreadHandle, ThreadInformationClass, ThreadInformation, ThreadInformationLength) {
        ThreadHandle := ThreadHandle is Win32Handle ? NumGet(ThreadHandle, "ptr") : ThreadHandle

        result := DllCall("ntdll.dll\ZwSetInformationThread", "ptr", ThreadHandle, "int", ThreadInformationClass, "ptr", ThreadInformation, "uint", ThreadInformationLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} TimerHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Integer} TimerType 
     * @returns {NTSTATUS} 
     */
    static ZwCreateTimer(TimerHandle, DesiredAccess, ObjectAttributes, TimerType) {
        result := DllCall("ntdll.dll\ZwCreateTimer", "ptr", TimerHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "int", TimerType, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} TimerHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @returns {NTSTATUS} 
     */
    static ZwOpenTimer(TimerHandle, DesiredAccess, ObjectAttributes) {
        result := DllCall("ntdll.dll\ZwOpenTimer", "ptr", TimerHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} TimerHandle 
     * @param {Pointer<BOOLEAN>} CurrentState 
     * @returns {NTSTATUS} 
     */
    static ZwCancelTimer(TimerHandle, CurrentState) {
        TimerHandle := TimerHandle is Win32Handle ? NumGet(TimerHandle, "ptr") : TimerHandle

        CurrentStateMarshal := CurrentState is VarRef ? "char*" : "ptr"

        result := DllCall("ntdll.dll\ZwCancelTimer", "ptr", TimerHandle, CurrentStateMarshal, CurrentState, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} TimerHandle 
     * @param {Pointer<Integer>} DueTime 
     * @param {Pointer<PTIMER_APC_ROUTINE>} TimerApcRoutine 
     * @param {Pointer<Void>} TimerContext 
     * @param {BOOLEAN} ResumeTimer 
     * @param {Integer} Period 
     * @param {Pointer<BOOLEAN>} PreviousState 
     * @returns {NTSTATUS} 
     */
    static ZwSetTimer(TimerHandle, DueTime, TimerApcRoutine, TimerContext, ResumeTimer, Period, PreviousState) {
        TimerHandle := TimerHandle is Win32Handle ? NumGet(TimerHandle, "ptr") : TimerHandle

        DueTimeMarshal := DueTime is VarRef ? "int64*" : "ptr"
        TimerContextMarshal := TimerContext is VarRef ? "ptr" : "ptr"
        PreviousStateMarshal := PreviousState is VarRef ? "char*" : "ptr"

        result := DllCall("ntdll.dll\ZwSetTimer", "ptr", TimerHandle, DueTimeMarshal, DueTime, "ptr", TimerApcRoutine, TimerContextMarshal, TimerContext, "char", ResumeTimer, "int", Period, PreviousStateMarshal, PreviousState, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} TimerHandle 
     * @param {Integer} TimerSetInformationClass 
     * @param {Pointer} TimerSetInformation 
     * @param {Integer} TimerSetInformationLength 
     * @returns {NTSTATUS} 
     */
    static ZwSetTimerEx(TimerHandle, TimerSetInformationClass, TimerSetInformation, TimerSetInformationLength) {
        TimerHandle := TimerHandle is Win32Handle ? NumGet(TimerHandle, "ptr") : TimerHandle

        result := DllCall("ntdll.dll\ZwSetTimerEx", "ptr", TimerHandle, "int", TimerSetInformationClass, "ptr", TimerSetInformation, "uint", TimerSetInformationLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ProcessHandle 
     * @param {NTSTATUS} ExitStatus 
     * @returns {NTSTATUS} 
     */
    static ZwTerminateProcess(ProcessHandle, ExitStatus) {
        ProcessHandle := ProcessHandle is Win32Handle ? NumGet(ProcessHandle, "ptr") : ProcessHandle

        result := DllCall("ntdll.dll\ZwTerminateProcess", "ptr", ProcessHandle, "int", ExitStatus, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} ProcessHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Pointer<CLIENT_ID>} ClientId 
     * @returns {NTSTATUS} 
     */
    static ZwOpenProcess(ProcessHandle, DesiredAccess, ObjectAttributes, ClientId) {
        result := DllCall("ntdll.dll\ZwOpenProcess", "ptr", ProcessHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "ptr", ClientId, "int")
        return result
    }

;@endregion Methods
}
