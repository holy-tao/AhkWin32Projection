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
     * Retrieves information about the specified process. (NtQueryInformationProcess)
     * @remarks
     * The <b>NtQueryInformationProcess</b> function and the structures that it returns are internal to the operating system and  subject to change from one  release of Windows to another.  To maintain the    compatibility of your application, it is better to use public functions mentioned in the description of the <i>ProcessInformationClass</i> parameter instead.
     * 
     * If you do use <b>NtQueryInformationProcess</b>, access the function through <a href="https://docs.microsoft.com/windows/desktop/Dlls/using-run-time-dynamic-linking">run-time dynamic linking</a>.  This gives  your code an opportunity to respond gracefully if the function has been   changed or removed from the operating system. Signature changes, however, may not be detectable.
     * 
     * This function has no associated import library. You must use the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> and <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> functions to dynamically link to Ntdll.dll.
     * @param {HANDLE} ProcessHandle A handle to the process for which information is to be retrieved.
     * @param {Integer} ProcessInformationClass 
     * @param {Pointer<Void>} ProcessInformation A pointer to a buffer supplied by the calling application into which the function writes the requested information. The size of the information written varies depending on the data type of the <i>ProcessInformationClass</i> parameter:
     * @param {Integer} ProcessInformationLength The size of the buffer pointed to by the <i>ProcessInformation</i> parameter, in bytes.
     * @param {Pointer<Integer>} ReturnLength A pointer to a variable in which the function returns the size of the requested information. If the function was successful, this is the size of the information written to the buffer pointed to by the <i>ProcessInformation</i> parameter (if the buffer was too small, this is the minimum size of buffer needed to receive the information successfully).
     * @returns {NTSTATUS} The function returns an NTSTATUS success or error code. 
     * 
     * The forms and significance of NTSTATUS error codes are listed in the Ntstatus.h header file available in the DDK. See [Logging Errors](/windows-hardware/drivers/kernel/logging-errors) for more details.
     * @see https://learn.microsoft.com/windows/win32/api/winternl/nf-winternl-ntqueryinformationprocess
     */
    static NtQueryInformationProcess(ProcessHandle, ProcessInformationClass, ProcessInformation, ProcessInformationLength, ReturnLength) {
        ProcessHandle := ProcessHandle is Win32Handle ? NumGet(ProcessHandle, "ptr") : ProcessHandle

        ProcessInformationMarshal := ProcessInformation is VarRef ? "ptr" : "ptr"
        ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\NtQueryInformationProcess", "ptr", ProcessHandle, "int", ProcessInformationClass, ProcessInformationMarshal, ProcessInformation, "uint", ProcessInformationLength, ReturnLengthMarshal, ReturnLength, "int")
        return result
    }

    /**
     * Retrieves information about the specified process.
     * @remarks
     * The **ZwQueryInformationProcess** function and the structures that it returns are internal to the operating system and subject to change from one release of Windows to another. To maintain the compatibility of your application, it is better to use public functions mentioned in the description of the *ProcessInformationClass* parameter instead.
     * 
     * If you do use **ZwQueryInformationProcess**, access the function through [run-time dynamic linking](../dlls/using-run-time-dynamic-linking.md). This gives your code an opportunity to respond gracefully if the function has been changed or removed from the operating system. Signature changes, however, may not be detectable.
     * 
     * This function has no associated import library. You must use the [**LoadLibrary**](/windows/win32/api/libloaderapi/nf-libloaderapi-loadlibrarya) and [**GetProcAddress**](/windows/win32/api/libloaderapi/nf-libloaderapi-getprocaddress) functions to dynamically link to Ntdll.dll.
     * @param {HANDLE} ProcessHandle A handle to the process for which information is to be retrieved.
     * @param {Integer} ProcessInformationClass The type of process information to be retrieved. This parameter can be one of the following values from the **PROCESSINFOCLASS** enumeration.
     * 
     * 
     * 
     * 
     * | Value | Meaning |
     * |-------|---------|
     * | <span id="ProcessBasicInformation"></span><span id="processbasicinformation"></span><span id="PROCESSBASICINFORMATION"></span><dl><dt><strong>ProcessBasicInformation</strong></dt><dt>0</dt></dl> | Retrieves a pointer to a PEB structure that can be used to determine whether the specified process is being debugged, and a unique value used by the system to identify the specified process. <br /> It is best to use the <a href="https://docs.microsoft.com/windows/desktop/api/debugapi/nf-debugapi-checkremotedebuggerpresent"><strong>CheckRemoteDebuggerPresent</strong></a> and <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getprocessid"><strong>GetProcessId</strong></a> functions to obtain this information.<br /> |
     * | <span id="ProcessDebugPort"></span><span id="processdebugport"></span><span id="PROCESSDEBUGPORT"></span><dl><dt><strong>ProcessDebugPort</strong></dt><dt>7</dt></dl> | Retrieves a <strong>DWORD_PTR</strong> value that is the port number of the debugger for the process. A nonzero value indicates that the process is being run under the control of a ring 3 debugger.<br /> It is best to use the <a href="https://docs.microsoft.com/windows/desktop/api/debugapi/nf-debugapi-checkremotedebuggerpresent"><strong>CheckRemoteDebuggerPresent</strong></a> or <a href="https://docs.microsoft.com/windows/desktop/api/debugapi/nf-debugapi-isdebuggerpresent"><strong>IsDebuggerPresent</strong></a> function.<br /> |
     * | <span id="ProcessWow64Information"></span><span id="processwow64information"></span><span id="PROCESSWOW64INFORMATION"></span><dl><dt><strong>ProcessWow64Information</strong></dt><dt>26</dt></dl> | Determines whether the process is running in the WOW64 environment (WOW64 is the x86 emulator that allows Win32-based applications to run on 64-bit Windows).<br /> It is best to use the <a href="https://docs.microsoft.com/windows/desktop/api/wow64apiset/nf-wow64apiset-iswow64process"><strong>IsWow64Process</strong></a> function to obtain this information.<br /> |
     * | <span id="ProcessImageFileName"></span><span id="processimagefilename"></span><span id="PROCESSIMAGEFILENAME"></span><dl><dt><strong>ProcessImageFileName</strong></dt><dt>27</dt></dl> | Retrieves a <strong>UNICODE_STRING</strong> value containing the name of the image file for the process.<br /> |
     * | <span id="ProcessBreakOnTermination"></span><span id="processbreakontermination"></span><span id="PROCESSBREAKONTERMINATION"></span><dl><dt><strong>ProcessBreakOnTermination</strong></dt><dt>29</dt></dl> | Retrieves a <strong>ULONG</strong> value indicating whether the process is considered critical.<br /><blockquote>[!Note]<br />This value can be used starting in Windows XP with SP3. Starting in Windows 8.1, <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-isprocesscritical"><strong>IsProcessCritical</strong></a> should be used instead.</blockquote><br /> |
     * | <span id="ProcessProtectionInformation"></span><span id="processprotectioninformation"></span><span id="PROCESSPROTECTIONINFORMATION"></span><dl><dt><strong>ProcessProtectionInformation</strong></dt><dt>61</dt></dl> | Retrieves a BYTE value indicating the type of protected process and the protected process signer.<br /> |
     * @param {Pointer<Void>} ProcessInformation A pointer to a buffer supplied by the calling application into which the function writes the requested information. The size of the information written varies depending on the value of the *ProcessInformationClass* parameter:
     * 
     * 
     * <span id="PROCESS_BASIC_INFORMATION"></span><span id="process_basic_information"></span>PROCESS\_BASIC\_INFORMATION
     * 
     * When the *ProcessInformationClass* parameter is **ProcessBasicInformation**, the buffer pointed to by the *ProcessInformation* parameter should be large enough to hold a single **PROCESS\_BASIC\_INFORMATION** structure having the following layout:
     * 
     * ``` syntax
     * typedef struct _PROCESS_BASIC_INFORMATION {
     *     NTSTATUS ExitStatus;
     *     PPEB PebBaseAddress;
     *     ULONG_PTR AffinityMask;
     *     KPRIORITY BasePriority;
     *     ULONG_PTR UniqueProcessId;
     *     ULONG_PTR InheritedFromUniqueProcessId;
     * } PROCESS_BASIC_INFORMATION;
     * ```
     * 
     * | Field | Meaning |
     * |-------|---------|
     * | **ExitStatus** | Contains the same value that [**GetExitCodeProcess**](/windows/win32/api/processthreadsapi/nf-processthreadsapi-getexitcodeprocess) would return. However the use of **GetExitCodeProcess** is preferable for clarity and safety. |
     * | **PebBaseAddress** | Points to a [**PEB**](/windows/desktop/api/Winternl/ns-winternl-peb) structure. |
     * | **AffinityMask** | Can be cast to a **DWORD** and contains the same value that [**GetProcessAffinityMask**](/windows/win32/api/winbase/nf-winbase-getprocessaffinitymask) would return for the `lpProcessAffinityMask` parameter. |
     * | **BasePriority** | Contains the process priority as described in [Scheduling Priorities](/windows/win32/procthread/scheduling-priorities#base-priority). |
     * | **UniqueProcessId** | Can be cast to a **DWORD** and contains a unique identifier for this process. It is best to use the [**GetProcessId**](/windows/win32/api/processthreadsapi/nf-processthreadsapi-getprocessid) function to retrieve this information. |
     * | **InheritedFromUniqueProcessId** | Can be cast to a **DWORD** and contains a unique identifier for the parent process. |
     * 
     * 
     * <span id="ULONG_PTR"></span><span id="ulong_ptr"></span>ULONG\_PTR
     * 
     * When the *ProcessInformationClass* parameter is **ProcessWow64Information**, the buffer pointed to by the *ProcessInformation* parameter should be large enough to hold a **ULONG\_PTR**. If this value is nonzero, the process is running in a WOW64 environment; otherwise, if the value is equal to zero, the process is not running in a WOW64 environment.
     * 
     * It is best to use the [**IsWow64Process**](/windows/win32/api/wow64apiset/nf-wow64apiset-iswow64process) function to determine whether a process is running in the WOW64 environment.
     * 
     * 
     * <span id="UNICODE_STRING"></span><span id="unicode_string"></span>UNICODE\_STRING
     * 
     * When the *ProcessInformationClass* parameter is **ProcessImageFileName**, the buffer pointed to by the *ProcessInformation* parameter should be large enough to hold a **UNICODE\_STRING** structure as well as the string itself. The string stored in the **Buffer** member is the name of the image file.
     * 
     * If the buffer is too small, the function fails with the STATUS\_INFO\_LENGTH\_MISMATCH error code and the *ReturnLength* parameter is set to the required buffer size.
     * 
     * 
     * <span id="PS_PROTECTION"></span><span id="ps_protection"></span>PS_PROTECTION
     * 
     * When the *ProcessInformationClass* parameter is **ProcessProtectionInformation**, the buffer pointed to by the *ProcessInformation* parameter should be large enough to hold a single **PS_PROTECTION** structure having the following layout:
     * 
     * ``` syntax
     * typedef struct _PS_PROTECTION {
     *     union {
     *         UCHAR Level;
     *         struct {
     *             UCHAR Type   : 3;
     *             UCHAR Audit  : 1;                  // Reserved
     *             UCHAR Signer : 4;
     *         };
     *     };
     * } PS_PROTECTION, *PPS_PROTECTION;
     * ```
     * 
     * The first 3 bits contain the type of protected process:
     * 
     * ``` syntax
     * typedef enum _PS_PROTECTED_TYPE {
     *     PsProtectedTypeNone = 0,
     *     PsProtectedTypeProtectedLight = 1,
     *     PsProtectedTypeProtected = 2
     * } PS_PROTECTED_TYPE, *PPS_PROTECTED_TYPE;
     * ```
     * 
     * The top 4 bits contain the protected process signer:
     * 
     * ``` syntax
     * typedef enum _PS_PROTECTED_SIGNER {
     *     PsProtectedSignerNone = 0,
     *     PsProtectedSignerAuthenticode,
     *     PsProtectedSignerCodeGen,
     *     PsProtectedSignerAntimalware,
     *     PsProtectedSignerLsa,
     *     PsProtectedSignerWindows,
     *     PsProtectedSignerWinTcb,
     *     PsProtectedSignerWinSystem,
     *     PsProtectedSignerApp,
     *     PsProtectedSignerMax
     * } PS_PROTECTED_SIGNER, *PPS_PROTECTED_SIGNER;
     * ```
     * @param {Integer} ProcessInformationLength The size of the buffer pointed to by the *ProcessInformation* parameter, in bytes.
     * @param {Pointer<Integer>} ReturnLength A pointer to a variable in which the function returns the size of the requested information. If the function was successful, this is the size of the information written to the buffer pointed to by the *ProcessInformation* parameter, but if the buffer was too small, this is the minimum size of buffer needed to receive the information successfully.
     * @returns {NTSTATUS} Returns an NTSTATUS success or error code.
     * 
     * The forms and significance of NTSTATUS error codes are listed in the Ntstatus.h header file available in the DDK, and are described in the DDK documentation under Kernel-Mode Driver Architecture / Design Guide / Driver Programming Techniques / Logging Errors.
     * @see https://learn.microsoft.com/windows/win32/ProcThread/zwqueryinformationprocess
     */
    static ZwQueryInformationProcess(ProcessHandle, ProcessInformationClass, ProcessInformation, ProcessInformationLength, ReturnLength) {
        ProcessHandle := ProcessHandle is Win32Handle ? NumGet(ProcessHandle, "ptr") : ProcessHandle

        ProcessInformationMarshal := ProcessInformation is VarRef ? "ptr" : "ptr"
        ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\ZwQueryInformationProcess", "ptr", ProcessHandle, "int", ProcessInformationClass, ProcessInformationMarshal, ProcessInformation, "uint", ProcessInformationLength, ReturnLengthMarshal, ReturnLength, "int")
        return result
    }

    /**
     * Retrieves information about the specified thread. (NtQueryInformationThread)
     * @remarks
     * The <b>NtQueryInformationThread</b> function is internal to the operating system and  subject to change from one  release of Windows to another.  To maintain the    compatibility of your application, it is better to use the public  function previously mentioned instead.
     * 
     * If you do use <b>NtQueryInformationThread</b>, access the function through <a href="https://docs.microsoft.com/windows/desktop/Dlls/using-run-time-dynamic-linking">run-time dynamic linking</a>.  This gives  your code an opportunity to respond gracefully if the function has been   changed or removed from the operating system. Signature changes, however, may not be detectable.
     * 
     * This function has no associated import library. You must use the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> and <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> functions to dynamically link to Ntdll.dll.
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
     * @see https://learn.microsoft.com/windows/win32/api/winternl/nf-winternl-ntqueryinformationthread
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
     * Deprecated. Waits until the specified object attains a state of signaled. NtWaitForSingleObject is superseded by WaitForSingleObject.
     * @remarks
     * Because there is no import library for this function, you must use <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>.
     * @param {HANDLE} Handle The handle to the wait object.
     * @param {BOOLEAN} Alertable Specifies whether an alert can be delivered when the object is waiting.
     * @param {Pointer<Integer>} Timeout A pointer to an absolute or relative time over
     *         which the wait is to occur. Can be null. If a timeout is specified, and
     *     the object has not attained a state of <c>signaled</c> when the timeout
     *     expires, then the wait is automatically satisfied.  If an explicit
     *     timeout value of zero is specified, then no wait occurs if the
     *     wait cannot be satisfied immediately.
     * @returns {NTSTATUS} The wait completion status. The various NTSTATUS values are defined in NTSTATUS.H, which is distributed with the Windows DDK.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified
     *     object satisfied the wait. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A
     *     timeout occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_ALERTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The
     *     wait was aborted to deliver an alert to the current thread.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_USER_APC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The wait was aborted to deliver a user <a href="https://docs.microsoft.com/windows/desktop/Sync/asynchronous-procedure-calls">Asynchronous Procedure Call (APC)</a> to the current thread.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winternl/nf-winternl-ntwaitforsingleobject
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
