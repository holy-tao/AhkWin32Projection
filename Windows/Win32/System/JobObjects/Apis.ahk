#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\Foundation\HANDLE.ahk
/**
 * @namespace Windows.Win32.System.JobObjects
 * @version v4.0.30319
 */
class JobObjects {

;@region Constants
;@endregion Constants

;@region Methods
    /**
     * Determines whether the process is running in the specified job.
     * @param {HANDLE} ProcessHandle A handle to the process to be tested. The handle must have the PROCESS_QUERY_INFORMATION or PROCESS_QUERY_LIMITED_INFORMATION access right. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>The handle must have the PROCESS_QUERY_INFORMATION access right.
     * @param {HANDLE} JobHandle A handle to the job. If this parameter is NULL, the function tests if the process is running under any job.
     * 
     * If this parameter is not NULL, the handle must have the JOB_OBJECT_QUERY access right. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/job-object-security-and-access-rights">Job Object Security and Access Rights</a>.
     * @param {Pointer<BOOL>} Result A pointer to a value that receives TRUE if the process is running in the job, and FALSE otherwise.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//jobapi/nf-jobapi-isprocessinjob
     * @since windows5.1.2600
     */
    static IsProcessInJob(ProcessHandle, JobHandle, Result) {
        ProcessHandle := ProcessHandle is Win32Handle ? NumGet(ProcessHandle, "ptr") : ProcessHandle
        JobHandle := JobHandle is Win32Handle ? NumGet(JobHandle, "ptr") : JobHandle

        A_LastError := 0

        result := DllCall("KERNEL32.dll\IsProcessInJob", "ptr", ProcessHandle, "ptr", JobHandle, "ptr", Result, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates or opens a job object.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpJobAttributes A pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure that specifies the security descriptor for the job object and determines whether child processes can inherit the returned handle. If <i>lpJobAttributes</i> is <b>NULL</b>, the job object gets a default security descriptor and the handle cannot be inherited. The ACLs in the default security descriptor for a job object come from the primary or impersonation token of the creator.
     * @param {PWSTR} lpName The name of the job. The name is limited to <b>MAX_PATH</b> characters. Name comparison is case-sensitive. 
     * 
     * 
     * 
     * 
     * If <i>lpName</i> is <b>NULL</b>, the job is created without a name.
     * 
     * If <i>lpName</i> matches the name of an existing event, semaphore, mutex, waitable timer, or file-mapping object, the function fails and the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns <b>ERROR_INVALID_HANDLE</b>. This occurs because these objects share the same namespace.
     * 
     * The object can be created in a private namespace. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Sync/object-namespaces">Object Namespaces</a>.
     * 
     * <b>Terminal Services:  </b>The name can have a "Global\\" or "Local\\" prefix to explicitly create the object in the global or session namespace. The remainder of the name can contain any character except the backslash character (\\). For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/TermServ/kernel-object-namespaces">Kernel Object Namespaces</a>.
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the job object. The handle has the <b>JOB_OBJECT_ALL_ACCESS</b> access right. If the object existed before the function call, the function returns a handle to the existing job object and 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_ALREADY_EXISTS</b>.
     * 
     * If the function fails, the return value is NULL. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//jobapi2/nf-jobapi2-createjobobjectw
     * @since windows5.1.2600
     */
    static CreateJobObjectW(lpJobAttributes, lpName) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateJobObjectW", "ptr", lpJobAttributes, "ptr", lpName, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Frees memory that a function related to job objects allocated. Functions related to job objects that allocate memory include QueryIoRateControlInformationJobObject.
     * @param {Pointer<Void>} Buffer A pointer to the buffer of allocated memory that you want to free.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//jobapi2/nf-jobapi2-freememoryjobobject
     * @since windows10.0.10240
     */
    static FreeMemoryJobObject(Buffer) {
        DllCall("KERNEL32.dll\FreeMemoryJobObject", "ptr", Buffer)
    }

    /**
     * Opens an existing job object.
     * @param {Integer} dwDesiredAccess The access to the job object. This parameter can be one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/job-object-security-and-access-rights">job object access rights</a>. This access right is checked against any security descriptor for the object.
     * @param {BOOL} bInheritHandle If this value is TRUE, processes created by this process will inherit the handle. Otherwise, the processes do not inherit this handle.
     * @param {PWSTR} lpName The name of the job to be opened. Name comparisons are case sensitive.
     * 
     * This function can open objects in a private namespace. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Sync/object-namespaces">Object Namespaces</a>.
     * 
     * <b>Terminal Services:  </b>The name can have a "Global\\" or "Local\\" prefix to explicitly open the object in the global or session namespace. The remainder of the name can contain any character except the backslash character (\\). For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/TermServ/kernel-object-namespaces">Kernel Object Namespaces</a>.
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the job. The handle provides the requested access to the job.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//jobapi2/nf-jobapi2-openjobobjectw
     * @since windows5.1.2600
     */
    static OpenJobObjectW(dwDesiredAccess, bInheritHandle, lpName) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\OpenJobObjectW", "uint", dwDesiredAccess, "ptr", bInheritHandle, "ptr", lpName, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Assigns a process to an existing job object.
     * @param {HANDLE} hJob A handle to the job object to which the process will be associated. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createjobobjecta">CreateJobObject</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openjobobjecta">OpenJobObject</a> function returns this handle. The handle must have the JOB_OBJECT_ASSIGN_PROCESS access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/job-object-security-and-access-rights">Job Object Security and Access Rights</a>.
     * @param {HANDLE} hProcess A handle to the process to associate with the job object. The handle must have the PROCESS_SET_QUOTA and PROCESS_TERMINATE access rights. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * 
     * If the process is already associated with a job, the job specified by <i>hJob</i> must be empty or it must be in the hierarchy of nested jobs to which the process already belongs, and it cannot have UI limits set (<a href="https://docs.microsoft.com/windows/desktop/api/jobapi2/nf-jobapi2-setinformationjobobject">SetInformationJobObject</a> with <b>JobObjectBasicUIRestrictions</b>). For more information, see Remarks. 
     * 
     * <b>Windows 7, Windows Server 2008 R2, Windows XP with SP3, Windows Server 2008, Windows Vista and Windows Server 2003:  </b>The process must not already be assigned to a job; if it is, the function fails with ERROR_ACCESS_DENIED. This behavior changed starting in Windows 8 and Windows Server 2012.
     * 
     * <b>Terminal Services:  </b>All processes within a job must run within the same session as the job.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//jobapi2/nf-jobapi2-assignprocesstojobobject
     * @since windows5.1.2600
     */
    static AssignProcessToJobObject(hJob, hProcess) {
        hJob := hJob is Win32Handle ? NumGet(hJob, "ptr") : hJob
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        A_LastError := 0

        result := DllCall("KERNEL32.dll\AssignProcessToJobObject", "ptr", hJob, "ptr", hProcess, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Terminates all processes currently associated with the job.
     * @param {HANDLE} hJob A handle to the job whose processes will be terminated. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createjobobjecta">CreateJobObject</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openjobobjecta">OpenJobObject</a> function returns this handle. This handle must have the JOB_OBJECT_TERMINATE access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/job-object-security-and-access-rights">Job Object Security and Access Rights</a>.
     * 
     * The handle for each process in the job object must have the PROCESS_TERMINATE access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Integer} uExitCode The exit code to be used by all processes and threads in the job object. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getexitcodeprocess">GetExitCodeProcess</a> function to retrieve each process's exit value. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getexitcodethread">GetExitCodeThread</a> function to retrieve each thread's exit value.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//jobapi2/nf-jobapi2-terminatejobobject
     * @since windows5.1.2600
     */
    static TerminateJobObject(hJob, uExitCode) {
        hJob := hJob is Win32Handle ? NumGet(hJob, "ptr") : hJob

        A_LastError := 0

        result := DllCall("KERNEL32.dll\TerminateJobObject", "ptr", hJob, "uint", uExitCode, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets limits for a job object.
     * @param {HANDLE} hJob A handle to the job whose limits are being set. The 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createjobobjecta">CreateJobObject</a> or 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openjobobjecta">OpenJobObject</a> function returns this handle. The handle 
     *       must have the <b>JOB_OBJECT_SET_ATTRIBUTES</b> access right. For more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/ProcThread/job-object-security-and-access-rights">Job Object Security and Access Rights</a>.
     * @param {Integer} JobObjectInformationClass 
     * @param {Pointer} lpJobObjectInformation The limits or job state to be set for the job. The format of this data depends on the value of <i>JobObjectInfoClass</i>.
     * @param {Integer} cbJobObjectInformationLength The size of the job information being set, in bytes.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//jobapi2/nf-jobapi2-setinformationjobobject
     * @since windows5.1.2600
     */
    static SetInformationJobObject(hJob, JobObjectInformationClass, lpJobObjectInformation, cbJobObjectInformationLength) {
        hJob := hJob is Win32Handle ? NumGet(hJob, "ptr") : hJob

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetInformationJobObject", "ptr", hJob, "int", JobObjectInformationClass, "ptr", lpJobObjectInformation, "uint", cbJobObjectInformationLength, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets I/O limits on a job object.
     * @param {HANDLE} hJob A handle to the job on which to set I/O limits. Get this handle from the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createjobobjecta">CreateJobObject</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openjobobjecta">OpenJobObject</a> function. The handle must have the <b>JOB_OBJECT_SET_ATTRIBUTES</b> access right. For more information about access rights, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/job-object-security-and-access-rights">Job Object Security and Access Rights</a>.
     * @param {Pointer<JOBOBJECT_IO_RATE_CONTROL_INFORMATION>} IoRateControlInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/jobapi2/ns-jobapi2-jobobject_io_rate_control_information">JOBOBJECT_IO_RATE_CONTROL_INFORMATION</a> structure that specifies the I/O limits to set for the job.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//jobapi2/nf-jobapi2-setioratecontrolinformationjobobject
     * @since windows10.0.10240
     */
    static SetIoRateControlInformationJobObject(hJob, IoRateControlInfo) {
        hJob := hJob is Win32Handle ? NumGet(hJob, "ptr") : hJob

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetIoRateControlInformationJobObject", "ptr", hJob, "ptr", IoRateControlInfo, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves limit and job state information from the job object.
     * @param {HANDLE} hJob A handle to the job whose information is being queried. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createjobobjecta">CreateJobObject</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openjobobjecta">OpenJobObject</a> function returns this handle. The handle must have the <b>JOB_OBJECT_QUERY</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/job-object-security-and-access-rights">Job Object Security and Access Rights</a>. 
     * 
     * 
     * 
     * 
     * If this value is NULL and the calling process is associated with a job, the job associated with the calling process is used. If the job is nested, the immediate job of the calling process is used.
     * @param {Integer} JobObjectInformationClass 
     * @param {Pointer} lpJobObjectInformation The limit or job state information. The format of this data depends on the value of the <i>JobObjectInfoClass</i> parameter.
     * @param {Integer} cbJobObjectInformationLength The count of the job information being queried, in bytes. This value depends on the value of the <i>JobObjectInfoClass</i> parameter.
     * @param {Pointer<UInt32>} lpReturnLength A pointer to a variable that receives the length of data written to the structure pointed to by the <i>lpJobObjectInfo</i> parameter. Specify <b>NULL</b>  to not receive this information.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//jobapi2/nf-jobapi2-queryinformationjobobject
     * @since windows5.1.2600
     */
    static QueryInformationJobObject(hJob, JobObjectInformationClass, lpJobObjectInformation, cbJobObjectInformationLength, lpReturnLength) {
        hJob := hJob is Win32Handle ? NumGet(hJob, "ptr") : hJob

        A_LastError := 0

        result := DllCall("KERNEL32.dll\QueryInformationJobObject", "ptr", hJob, "int", JobObjectInformationClass, "ptr", lpJobObjectInformation, "uint", cbJobObjectInformationLength, "uint*", lpReturnLength, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets information about the control of the I/O rate for a job object.
     * @param {HANDLE} hJob A handle to the job to query for information. Get this handle from the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createjobobjecta">CreateJobObject</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openjobobjecta">OpenJobObject</a> function. The handle must have the <b>JOB_OBJECT_QUERY</b> access right. For more information about access rights, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/job-object-security-and-access-rights">Job Object Security and Access Rights</a>.
     * 
     * If this value is NULL and the process that calls <b>QueryIoRateControlInformationJobObject</b> is associated with a job, the function uses job that is associated with the process. If the job is nested within another job, the function uses the immediate job for the process.
     * @param {PWSTR} VolumeName The name of the volume to query. If this value is NULL, the function gets the information about I/O rate control for the job for all of the volumes for the system.
     * @param {Pointer<JOBOBJECT_IO_RATE_CONTROL_INFORMATION>} InfoBlocks A pointer to array of <a href="https://docs.microsoft.com/windows/desktop/api/jobapi2/ns-jobapi2-jobobject_io_rate_control_information">JOBOBJECT_IO_RATE_CONTROL_INFORMATION</a> structures that contain the information about I/O rate control for the job. Your code must free the memory for this array by calling the <a href="https://docs.microsoft.com/windows/desktop/api/jobapi2/nf-jobapi2-freememoryjobobject">FreeMemoryJobObject</a> function with the address of the array.
     * @param {Pointer<UInt32>} InfoBlockCount The number of <a href="https://docs.microsoft.com/windows/desktop/api/jobapi2/ns-jobapi2-jobobject_io_rate_control_information">JOBOBJECT_IO_RATE_CONTROL_INFORMATION</a> structures that the function allocated in the array to which the <i>InfoBlocks</i> parameter points.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//jobapi2/nf-jobapi2-queryioratecontrolinformationjobobject
     * @since windows10.0.10240
     */
    static QueryIoRateControlInformationJobObject(hJob, VolumeName, InfoBlocks, InfoBlockCount) {
        VolumeName := VolumeName is String ? StrPtr(VolumeName) : VolumeName
        hJob := hJob is Win32Handle ? NumGet(hJob, "ptr") : hJob

        A_LastError := 0

        result := DllCall("KERNEL32.dll\QueryIoRateControlInformationJobObject", "ptr", hJob, "ptr", VolumeName, "ptr", InfoBlocks, "uint*", InfoBlockCount, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Grants or denies access to a handle to a User object to a job that has a user-interface restriction.
     * @param {HANDLE} hUserHandle A handle to the User object.
     * @param {HANDLE} hJob A handle to the job to be granted access to the User handle. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createjobobjecta">CreateJobObject</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openjobobjecta">OpenJobObject</a> function returns this handle.
     * @param {BOOL} bGrant If this parameter is TRUE, all processes associated with the job can recognize and use the handle. If the parameter is FALSE, the processes cannot use the handle.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-userhandlegrantaccess
     * @since windows5.1.2600
     */
    static UserHandleGrantAccess(hUserHandle, hJob, bGrant) {
        hUserHandle := hUserHandle is Win32Handle ? NumGet(hUserHandle, "ptr") : hUserHandle
        hJob := hJob is Win32Handle ? NumGet(hJob, "ptr") : hJob

        A_LastError := 0

        result := DllCall("USER32.dll\UserHandleGrantAccess", "ptr", hUserHandle, "ptr", hJob, "ptr", bGrant, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates or opens a job object.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpJobAttributes A pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure that specifies the security descriptor for the job object and determines whether child processes can inherit the returned handle. If <i>lpJobAttributes</i> is <b>NULL</b>, the job object gets a default security descriptor and the handle cannot be inherited. The ACLs in the default security descriptor for a job object come from the primary or impersonation token of the creator.
     * @param {PSTR} lpName The name of the job. The name is limited to <b>MAX_PATH</b> characters. Name comparison is case-sensitive. 
     * 
     * 
     * 
     * 
     * If <i>lpName</i> is <b>NULL</b>, the job is created without a name.
     * 
     * If <i>lpName</i> matches the name of an existing event, semaphore, mutex, waitable timer, or file-mapping object, the function fails and the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns <b>ERROR_INVALID_HANDLE</b>. This occurs because these objects share the same namespace.
     * 
     * The object can be created in a private namespace. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Sync/object-namespaces">Object Namespaces</a>.
     * 
     * <b>Terminal Services:  </b>The name can have a "Global\" or "Local\" prefix to explicitly create the object in the global or session namespace. The remainder of the name can contain any character except the backslash character (\\). For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/TermServ/kernel-object-namespaces">Kernel Object Namespaces</a>.
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the job object. The handle has the <b>JOB_OBJECT_ALL_ACCESS</b> access right. If the object existed before the function call, the function returns a handle to the existing job object and 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_ALREADY_EXISTS</b>.
     * 
     * If the function fails, the return value is NULL. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-createjobobjecta
     * @since windows5.1.2600
     */
    static CreateJobObjectA(lpJobAttributes, lpName) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateJobObjectA", "ptr", lpJobAttributes, "ptr", lpName, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Opens an existing job object.
     * @param {Integer} dwDesiredAccess The access to the job object. This parameter can be one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/job-object-security-and-access-rights">job object access rights</a>. This access right is checked against any security descriptor for the object.
     * @param {BOOL} bInheritHandle If this value is TRUE, processes created by this process will inherit the handle. Otherwise, the processes do not inherit this handle.
     * @param {PSTR} lpName The name of the job to be opened. Name comparisons are case sensitive.
     * 
     * This function can open objects in a private namespace. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Sync/object-namespaces">Object Namespaces</a>.
     * 
     * <b>Terminal Services:  </b>The name can have a "Global\" or "Local\" prefix to explicitly open the object in the global or session namespace. The remainder of the name can contain any character except the backslash character (\\). For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/TermServ/kernel-object-namespaces">Kernel Object Namespaces</a>.
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the job. The handle provides the requested access to the job.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-openjobobjecta
     * @since windows5.1.2600
     */
    static OpenJobObjectA(dwDesiredAccess, bInheritHandle, lpName) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\OpenJobObjectA", "uint", dwDesiredAccess, "ptr", bInheritHandle, "ptr", lpName, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * 
     * @param {Integer} NumJob 
     * @param {Pointer<JOB_SET_ARRAY>} UserJobSet 
     * @param {Integer} Flags 
     * @returns {BOOL} 
     */
    static CreateJobSet(NumJob, UserJobSet, Flags) {
        result := DllCall("KERNEL32.dll\CreateJobSet", "uint", NumJob, "ptr", UserJobSet, "uint", Flags, "ptr")
        return result
    }

;@endregion Methods
}
