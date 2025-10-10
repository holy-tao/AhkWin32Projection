#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.ProcessStatus
 * @version v4.0.30319
 */
class ProcessStatus {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static PSAPI_VERSION => 2
;@endregion Constants

;@region Methods
    /**
     * Retrieves the process identifier for each process object in the system.
     * @param {Pointer} lpidProcess A pointer to an array that receives the list of process identifiers.
     * @param {Integer} cb The size of the <i>pProcessIds</i> array, in bytes.
     * @param {Pointer<UInt32>} lpcbNeeded The number of bytes returned in the <i>pProcessIds</i> array.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//psapi/nf-psapi-enumprocesses
     * @since windows5.1.2600
     */
    static EnumProcesses(lpidProcess, cb, lpcbNeeded) {
        A_LastError := 0

        result := DllCall("PSAPI.dll\EnumProcesses", "ptr", lpidProcess, "uint", cb, "uint*", lpcbNeeded, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves a handle for each module in the specified process.
     * @param {Pointer<Void>} hProcess A handle to the process.
     * @param {Pointer} lphModule An array that receives the list of module handles.
     * @param {Integer} cb The size of the <i>lphModule</i> array, in bytes.
     * @param {Pointer<UInt32>} lpcbNeeded The number of bytes required to store all module handles in the <i>lphModule</i> 
     *       array.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//psapi/nf-psapi-enumprocessmodules
     * @since windows5.1.2600
     */
    static EnumProcessModules(hProcess, lphModule, cb, lpcbNeeded) {
        A_LastError := 0

        result := DllCall("PSAPI.dll\EnumProcessModules", "ptr", hProcess, "ptr", lphModule, "uint", cb, "uint*", lpcbNeeded, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves a handle for each module in the specified process that meets the specified filter criteria.
     * @param {Pointer<Void>} hProcess A handle to the process.
     * @param {Pointer} lphModule An array that receives the list of module handles.
     * @param {Integer} cb The size of the <i>lphModule</i> array, in bytes.
     * @param {Pointer<UInt32>} lpcbNeeded The number of bytes required to store all module handles in the <i>lphModule</i> array.
     * @param {Integer} dwFilterFlag 
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//psapi/nf-psapi-enumprocessmodulesex
     * @since windows6.0.6000
     */
    static EnumProcessModulesEx(hProcess, lphModule, cb, lpcbNeeded, dwFilterFlag) {
        A_LastError := 0

        result := DllCall("PSAPI.dll\EnumProcessModulesEx", "ptr", hProcess, "ptr", lphModule, "uint", cb, "uint*", lpcbNeeded, "uint", dwFilterFlag, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the base name of the specified module.
     * @param {Pointer<Void>} hProcess A handle to the process that contains the module. 
     * 
     * The handle must have the <b>PROCESS_QUERY_INFORMATION</b> and <b>PROCESS_VM_READ</b> access rights. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Pointer<Void>} hModule A handle to the module. If this parameter is NULL, this function  returns the name of the file used to create the calling process.
     * @param {Pointer<Byte>} lpBaseName A pointer to the buffer that receives the base name of the module. If the base name is longer than maximum number of characters specified by the <i>nSize</i> parameter, the base name is truncated.
     * @param {Integer} nSize The size of the <i>lpBaseName</i> buffer, in characters.
     * @returns {Integer} If the function succeeds, the return value specifies the length of the string copied to the buffer, in characters.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//psapi/nf-psapi-getmodulebasenamea
     * @since windows5.1.2600
     */
    static GetModuleBaseNameA(hProcess, hModule, lpBaseName, nSize) {
        lpBaseName := lpBaseName is String? StrPtr(lpBaseName) : lpBaseName

        A_LastError := 0

        result := DllCall("PSAPI.dll\GetModuleBaseNameA", "ptr", hProcess, "ptr", hModule, "ptr", lpBaseName, "uint", nSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the base name of the specified module.
     * @param {Pointer<Void>} hProcess A handle to the process that contains the module. 
     * 
     * The handle must have the <b>PROCESS_QUERY_INFORMATION</b> and <b>PROCESS_VM_READ</b> access rights. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Pointer<Void>} hModule A handle to the module. If this parameter is NULL, this function  returns the name of the file used to create the calling process.
     * @param {Pointer<Char>} lpBaseName A pointer to the buffer that receives the base name of the module. If the base name is longer than maximum number of characters specified by the <i>nSize</i> parameter, the base name is truncated.
     * @param {Integer} nSize The size of the <i>lpBaseName</i> buffer, in characters.
     * @returns {Integer} If the function succeeds, the return value specifies the length of the string copied to the buffer, in characters.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//psapi/nf-psapi-getmodulebasenamew
     * @since windows5.1.2600
     */
    static GetModuleBaseNameW(hProcess, hModule, lpBaseName, nSize) {
        lpBaseName := lpBaseName is String? StrPtr(lpBaseName) : lpBaseName

        A_LastError := 0

        result := DllCall("PSAPI.dll\GetModuleBaseNameW", "ptr", hProcess, "ptr", hModule, "ptr", lpBaseName, "uint", nSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the fully qualified path for the file containing the specified module.
     * @param {Pointer<Void>} hProcess A handle to the process that contains the module.  
     * 
     * The handle must have the <b>PROCESS_QUERY_INFORMATION</b> or <b>PROCESS_QUERY_LIMITED_INFORMATION</b> access rights. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * 
     * The <b>GetModuleFileNameEx</b> function does not retrieve the path for modules  that were loaded using the <b>LOAD_LIBRARY_AS_DATAFILE</b> flag. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a>.
     * @param {Pointer<Void>} hModule A handle to the module. If this parameter is NULL, <b>GetModuleFileNameEx</b> returns the path of the executable file of the process specified in <i>hProcess</i>.
     * @param {Pointer<Byte>} lpFilename A pointer to a buffer that receives the fully qualified path to the module. If the size of the file name is larger than the value of the <i>nSize</i> parameter, the function succeeds but the file name is truncated and null-terminated.
     * @param {Integer} nSize The size of the <i>lpFilename</i> buffer, in characters.
     * @returns {Integer} If the function succeeds, the return value specifies the length of the string copied to the buffer.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//psapi/nf-psapi-getmodulefilenameexa
     * @since windows5.1.2600
     */
    static GetModuleFileNameExA(hProcess, hModule, lpFilename, nSize) {
        lpFilename := lpFilename is String? StrPtr(lpFilename) : lpFilename

        A_LastError := 0

        result := DllCall("PSAPI.dll\GetModuleFileNameExA", "ptr", hProcess, "ptr", hModule, "ptr", lpFilename, "uint", nSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the fully qualified path for the file containing the specified module.
     * @param {Pointer<Void>} hProcess A handle to the process that contains the module.  
     * 
     * The handle must have the <b>PROCESS_QUERY_INFORMATION</b> and <b>PROCESS_VM_READ</b> access rights. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * 
     * The <b>GetModuleFileNameEx</b> function does not retrieve the path for modules  that were loaded using the <b>LOAD_LIBRARY_AS_DATAFILE</b> flag. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a>.
     * @param {Pointer<Void>} hModule A handle to the module. If this parameter is NULL, <b>GetModuleFileNameEx</b> returns the path of the executable file of the process specified in <i>hProcess</i>.
     * @param {Pointer<Char>} lpFilename A pointer to a buffer that receives the fully qualified path to the module. If the size of the file name is larger than the value of the <i>nSize</i> parameter, the function succeeds but the file name is truncated and null-terminated.
     * @param {Integer} nSize The size of the <i>lpFilename</i> buffer, in characters.
     * @returns {Integer} If the function succeeds, the return value specifies the length of the string copied to the buffer.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//psapi/nf-psapi-getmodulefilenameexw
     * @since windows5.1.2600
     */
    static GetModuleFileNameExW(hProcess, hModule, lpFilename, nSize) {
        lpFilename := lpFilename is String? StrPtr(lpFilename) : lpFilename

        A_LastError := 0

        result := DllCall("PSAPI.dll\GetModuleFileNameExW", "ptr", hProcess, "ptr", hModule, "ptr", lpFilename, "uint", nSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the specified module in the MODULEINFO structure.
     * @param {Pointer<Void>} hProcess A handle to the process that contains the module.
     * 
     * The handle must have the <b>PROCESS_QUERY_INFORMATION</b> and <b>PROCESS_VM_READ</b> access rights. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Pointer<Void>} hModule A handle to the module.
     * @param {Pointer<MODULEINFO>} lpmodinfo A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/psapi/ns-psapi-moduleinfo">MODULEINFO</a> structure that receives information about the module.
     * @param {Integer} cb The size of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/psapi/ns-psapi-moduleinfo">MODULEINFO</a> structure, in bytes.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//psapi/nf-psapi-getmoduleinformation
     * @since windows5.1.2600
     */
    static GetModuleInformation(hProcess, hModule, lpmodinfo, cb) {
        A_LastError := 0

        result := DllCall("PSAPI.dll\GetModuleInformation", "ptr", hProcess, "ptr", hModule, "ptr", lpmodinfo, "uint", cb, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Removes as many pages as possible from the working set of the specified process.
     * @param {Pointer<Void>} hProcess A handle to the process. The handle must have the <b>PROCESS_QUERY_INFORMATION</b> or <b>PROCESS_QUERY_LIMITED_INFORMATION</b> access right and the <b>PROCESS_SET_QUOTA</b> access right. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//psapi/nf-psapi-emptyworkingset
     * @since windows5.1.2600
     */
    static EmptyWorkingSet(hProcess) {
        A_LastError := 0

        result := DllCall("PSAPI.dll\EmptyWorkingSet", "ptr", hProcess, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Initiates monitoring of the working set of the specified process.
     * @param {Pointer<Void>} hProcess A handle to the process. The handle must have the PROCESS_QUERY_INFORMATION access right. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//psapi/nf-psapi-initializeprocessforwswatch
     * @since windows5.1.2600
     */
    static InitializeProcessForWsWatch(hProcess) {
        A_LastError := 0

        result := DllCall("PSAPI.dll\InitializeProcessForWsWatch", "ptr", hProcess, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the pages that have been added to the working set of the specified process since the last time this function or the InitializeProcessForWsWatch function was called.
     * @param {Pointer<Void>} hProcess A handle to the process. The handle must have the <b>PROCESS_QUERY_INFORMATION</b> 
     *       access right. For more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Pointer} lpWatchInfo A pointer to a user-allocated buffer that receives an array of 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/psapi/ns-psapi-psapi_ws_watch_information">PSAPI_WS_WATCH_INFORMATION</a> structures. 
     *       The array is terminated with a structure whose <b>FaultingPc</b> member is NULL.
     * @param {Integer} cb The size of the <i>lpWatchInfo</i> buffer, in bytes.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns 
     *        <b>ERROR_INSUFFICIENT_BUFFER</b> if the <i>lpWatchInfo</i> buffer is not 
     *        large enough to contain all the working set change records; the buffer is returned empty. Reallocate a larger 
     *        block of memory for the buffer and call again.
     * @see https://docs.microsoft.com/windows/win32/api//psapi/nf-psapi-getwschanges
     * @since windows5.1.2600
     */
    static GetWsChanges(hProcess, lpWatchInfo, cb) {
        A_LastError := 0

        result := DllCall("PSAPI.dll\GetWsChanges", "ptr", hProcess, "ptr", lpWatchInfo, "uint", cb, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves extended information about the pages that have been added to the working set of the specified process since the last time this function or the InitializeProcessForWsWatch function was called.
     * @param {Pointer<Void>} hProcess A handle to the process. The handle must have the <b>PROCESS_QUERY_INFORMATION</b> access right. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Pointer} lpWatchInfoEx A pointer to a user-allocated buffer that receives an array of  
     * <a href="https://docs.microsoft.com/windows/desktop/api/psapi/ns-psapi-psapi_ws_watch_information_ex">PSAPI_WS_WATCH_INFORMATION_EX</a> structures. The array is terminated with a structure whose <b>FaultingPc</b> member is NULL.
     * @param {Pointer<UInt32>} cb The size of the 
     * <i>lpWatchInfoEx</i> buffer, in bytes.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 						
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     * The <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns <b>ERROR_INSUFFICIENT_BUFFER</b> if the <i>lpWatchInfoEx</i> buffer is not large enough to contain all the working set change records; the buffer is returned empty. Reallocate a larger block of memory for the buffer and call again.
     * @see https://docs.microsoft.com/windows/win32/api//psapi/nf-psapi-getwschangesex
     * @since windows6.0.6000
     */
    static GetWsChangesEx(hProcess, lpWatchInfoEx, cb) {
        A_LastError := 0

        result := DllCall("PSAPI.dll\GetWsChangesEx", "ptr", hProcess, "ptr", lpWatchInfoEx, "uint*", cb, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Checks whether the specified address is within a memory-mapped file in the address space of the specified process. If so, the function returns the name of the memory-mapped file.
     * @param {Pointer<Void>} hProcess A handle to the process. The handle must have the <b>PROCESS_QUERY_INFORMATION</b> access rightF. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Pointer<Void>} lpv The address to be verified.
     * @param {Pointer<Char>} lpFilename A pointer to the buffer that receives the name of the memory-mapped file to which the address specified by <i>lpv</i> belongs.
     * @param {Integer} nSize The size of the <i>lpFilename</i> buffer, in characters.
     * @returns {Integer} If the function succeeds, the return value specifies the length of the string copied to the buffer, in characters.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//psapi/nf-psapi-getmappedfilenamew
     * @since windows5.1.2600
     */
    static GetMappedFileNameW(hProcess, lpv, lpFilename, nSize) {
        lpFilename := lpFilename is String? StrPtr(lpFilename) : lpFilename

        A_LastError := 0

        result := DllCall("PSAPI.dll\GetMappedFileNameW", "ptr", hProcess, "ptr", lpv, "ptr", lpFilename, "uint", nSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Checks whether the specified address is within a memory-mapped file in the address space of the specified process. If so, the function returns the name of the memory-mapped file.
     * @param {Pointer<Void>} hProcess A handle to the process. The handle must have the <b>PROCESS_QUERY_INFORMATION</b> access right. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Pointer<Void>} lpv The address to be verified.
     * @param {Pointer<Byte>} lpFilename A pointer to the buffer that receives the name of the memory-mapped file to which the address specified by <i>lpv</i> belongs.
     * @param {Integer} nSize The size of the <i>lpFilename</i> buffer, in characters.
     * @returns {Integer} If the function succeeds, the return value specifies the length of the string copied to the buffer, in characters.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//psapi/nf-psapi-getmappedfilenamea
     * @since windows5.1.2600
     */
    static GetMappedFileNameA(hProcess, lpv, lpFilename, nSize) {
        lpFilename := lpFilename is String? StrPtr(lpFilename) : lpFilename

        A_LastError := 0

        result := DllCall("PSAPI.dll\GetMappedFileNameA", "ptr", hProcess, "ptr", lpv, "ptr", lpFilename, "uint", nSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the load address for each device driver in the system.
     * @param {Pointer} lpImageBase An array that receives the list of load addresses for the device drivers.
     * @param {Integer} cb The size of the <i>lpImageBase</i> array, in bytes. If the array is not large enough to store the load addresses, the <i>lpcbNeeded</i> parameter receives the required size of the array.
     * @param {Pointer<UInt32>} lpcbNeeded The number of bytes returned in the <i>lpImageBase</i> array.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//psapi/nf-psapi-enumdevicedrivers
     * @since windows5.1.2600
     */
    static EnumDeviceDrivers(lpImageBase, cb, lpcbNeeded) {
        A_LastError := 0

        result := DllCall("PSAPI.dll\EnumDeviceDrivers", "ptr", lpImageBase, "uint", cb, "uint*", lpcbNeeded, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the base name of the specified device driver.
     * @param {Pointer<Void>} ImageBase The load address of the device driver. This value can be retrieved using the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-enumdevicedrivers">EnumDeviceDrivers</a> 
     *       function.
     * @param {Pointer<Byte>} lpFilename TBD
     * @param {Integer} nSize The size of the <i>lpBaseName</i> buffer, in characters. If the buffer is not large enough to store the base name plus the terminating null character, the string is truncated.
     * @returns {Integer} If the function succeeds, the return value specifies the length of the string copied to the buffer, not including any terminating null character.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//psapi/nf-psapi-getdevicedriverbasenamea
     * @since windows5.1.2600
     */
    static GetDeviceDriverBaseNameA(ImageBase, lpFilename, nSize) {
        lpFilename := lpFilename is String? StrPtr(lpFilename) : lpFilename

        A_LastError := 0

        result := DllCall("PSAPI.dll\GetDeviceDriverBaseNameA", "ptr", ImageBase, "ptr", lpFilename, "uint", nSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the base name of the specified device driver.
     * @param {Pointer<Void>} ImageBase The load address of the device driver. This value can be retrieved using the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-enumdevicedrivers">EnumDeviceDrivers</a> 
     *       function.
     * @param {Pointer<Char>} lpBaseName A pointer to the buffer that receives the base name of the device driver.
     * @param {Integer} nSize The size of the <i>lpBaseName</i> buffer, in characters. If the buffer is not large enough to store the base name plus the terminating null character, the string is truncated.
     * @returns {Integer} If the function succeeds, the return value specifies the length of the string copied to the buffer, not including any terminating null character.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//psapi/nf-psapi-getdevicedriverbasenamew
     * @since windows5.1.2600
     */
    static GetDeviceDriverBaseNameW(ImageBase, lpBaseName, nSize) {
        lpBaseName := lpBaseName is String? StrPtr(lpBaseName) : lpBaseName

        A_LastError := 0

        result := DllCall("PSAPI.dll\GetDeviceDriverBaseNameW", "ptr", ImageBase, "ptr", lpBaseName, "uint", nSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the path available for the specified device driver.
     * @param {Pointer<Void>} ImageBase The load address of the device driver.
     * @param {Pointer<Byte>} lpFilename A pointer to the buffer that receives the path to the device driver.
     * @param {Integer} nSize The size of the <i>lpFilename</i> buffer, in characters. If the buffer is not large enough to store the path plus the terminating null character, the string is truncated.
     * @returns {Integer} If the function succeeds, the return value specifies the length of the string copied to the buffer, not including any terminating null character.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//psapi/nf-psapi-getdevicedriverfilenamea
     * @since windows5.1.2600
     */
    static GetDeviceDriverFileNameA(ImageBase, lpFilename, nSize) {
        lpFilename := lpFilename is String? StrPtr(lpFilename) : lpFilename

        A_LastError := 0

        result := DllCall("PSAPI.dll\GetDeviceDriverFileNameA", "ptr", ImageBase, "ptr", lpFilename, "uint", nSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the path available for the specified device driver.
     * @param {Pointer<Void>} ImageBase The load address of the device driver.
     * @param {Pointer<Char>} lpFilename A pointer to the buffer that receives the path to the device driver.
     * @param {Integer} nSize The size of the <i>lpFilename</i> buffer, in characters. If the buffer is not large enough to store the path plus the terminating null character, the string is truncated.
     * @returns {Integer} If the function succeeds, the return value specifies the length of the string copied to the buffer, not including any terminating null character.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//psapi/nf-psapi-getdevicedriverfilenamew
     * @since windows5.1.2600
     */
    static GetDeviceDriverFileNameW(ImageBase, lpFilename, nSize) {
        lpFilename := lpFilename is String? StrPtr(lpFilename) : lpFilename

        A_LastError := 0

        result := DllCall("PSAPI.dll\GetDeviceDriverFileNameW", "ptr", ImageBase, "ptr", lpFilename, "uint", nSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the pages currently added to the working set of the specified process.
     * @param {Pointer<Void>} hProcess A handle to the process. The handle must have the <b>PROCESS_QUERY_INFORMATION</b> and 
     *       <b>PROCESS_VM_READ</b> access rights. For more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Pointer} pv A pointer to the buffer that receives the information. For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/psapi/ns-psapi-psapi_working_set_information">PSAPI_WORKING_SET_INFORMATION</a>.
     * 
     * If the buffer pointed to by the <i>pv</i> parameter is not large enough to contain all 
     *        working set entries for the target process, the function fails with <b>ERROR_BAD_LENGTH</b>. 
     *        In this case, the <b>NumberOfEntries</b> member of the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/psapi/ns-psapi-psapi_working_set_information">PSAPI_WORKING_SET_INFORMATION</a> 
     *        structure is set to the required number of entries, but the function does not return information about the 
     *        working set entries.
     * @param {Integer} cb The size of the <i>pv</i> buffer, in bytes.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//psapi/nf-psapi-queryworkingset
     * @since windows5.1.2600
     */
    static QueryWorkingSet(hProcess, pv, cb) {
        A_LastError := 0

        result := DllCall("PSAPI.dll\QueryWorkingSet", "ptr", hProcess, "ptr", pv, "uint", cb, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves extended information about the pages at specific virtual addresses in the address space of the specified process.
     * @param {Pointer<Void>} hProcess A handle to the process. The handle must have the <b>PROCESS_QUERY_INFORMATION</b> access right. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Pointer} pv A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/psapi/ns-psapi-psapi_working_set_ex_information">PSAPI_WORKING_SET_EX_INFORMATION</a> structures. On input, each item in the array specifies a virtual address of interest. On output, each item in the array receives information about the corresponding virtual page.
     * @param {Integer} cb The size of the <i>pv</i> buffer, in bytes.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//psapi/nf-psapi-queryworkingsetex
     * @since windows6.0.6000
     */
    static QueryWorkingSetEx(hProcess, pv, cb) {
        A_LastError := 0

        result := DllCall("PSAPI.dll\QueryWorkingSetEx", "ptr", hProcess, "ptr", pv, "uint", cb, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the memory usage of the specified process.
     * @param {Pointer<Void>} Process A handle to the process. The handle must have the **PROCESS_QUERY_INFORMATION** or **PROCESS_QUERY_LIMITED_INFORMATION** access right. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * 
     * **Windows Server 2003 and Windows XP:  **The handle must have the **PROCESS_QUERY_INFORMATION** and **PROCESS_VM_READ** access rights.
     * @param {Pointer} ppsmemCounters A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/psapi/ns-psapi-process_memory_counters">PROCESS_MEMORY_COUNTERS</a> or <a href="https://docs.microsoft.com/windows/desktop/api/psapi/ns-psapi-process_memory_counters_ex">PROCESS_MEMORY_COUNTERS_EX</a> structure that receives information about the memory usage of the process.
     * @param {Integer} cb The size of the 
     * <i>ppsmemCounters</i> structure, in bytes.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//psapi/nf-psapi-getprocessmemoryinfo
     * @since windows5.1.2600
     */
    static GetProcessMemoryInfo(Process, ppsmemCounters, cb) {
        A_LastError := 0

        result := DllCall("PSAPI.dll\GetProcessMemoryInfo", "ptr", Process, "ptr", ppsmemCounters, "uint", cb, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the performance values contained in the PERFORMANCE_INFORMATION structure.
     * @param {Pointer<PERFORMANCE_INFORMATION>} pPerformanceInformation A pointer to a 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/psapi/ns-psapi-performance_information">PERFORMANCE_INFORMATION</a> 
     *       structure that receives the performance information.
     * @param {Integer} cb The size of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/psapi/ns-psapi-performance_information">PERFORMANCE_INFORMATION</a> structure, in 
     *       bytes.
     * @returns {Integer} If the function succeeds, the return value is TRUE. If the function fails, the return value is FALSE. To get 
     *        extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//psapi/nf-psapi-getperformanceinfo
     * @since windows5.1.2600
     */
    static GetPerformanceInfo(pPerformanceInformation, cb) {
        A_LastError := 0

        result := DllCall("PSAPI.dll\GetPerformanceInfo", "ptr", pPerformanceInformation, "uint", cb, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Calls the callback routine for each installed pagefile in the system.
     * @param {Pointer<PENUM_PAGE_FILE_CALLBACKW>} pCallBackRoutine A pointer to the routine called for each pagefile. For more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nc-psapi-penum_page_file_callbacka">EnumPageFilesProc</a>.
     * @param {Pointer<Void>} pContext The user-defined data passed to the callback routine.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>. If the function fails, the 
     *        return value is <b>FALSE</b>. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//psapi/nf-psapi-enumpagefilesw
     * @since windows5.1.2600
     */
    static EnumPageFilesW(pCallBackRoutine, pContext) {
        A_LastError := 0

        result := DllCall("PSAPI.dll\EnumPageFilesW", "ptr", pCallBackRoutine, "ptr", pContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Calls the callback routine for each installed pagefile in the system.
     * @param {Pointer<PENUM_PAGE_FILE_CALLBACKA>} pCallBackRoutine A pointer to the routine called for each pagefile. For more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nc-psapi-penum_page_file_callbacka">EnumPageFilesProc</a>.
     * @param {Pointer<Void>} pContext The user-defined data passed to the callback routine.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>. If the function fails, the 
     *        return value is <b>FALSE</b>. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//psapi/nf-psapi-enumpagefilesa
     * @since windows5.1.2600
     */
    static EnumPageFilesA(pCallBackRoutine, pContext) {
        A_LastError := 0

        result := DllCall("PSAPI.dll\EnumPageFilesA", "ptr", pCallBackRoutine, "ptr", pContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the name of the executable file for the specified process.
     * @param {Pointer<Void>} hProcess A handle to the process. The handle must have the <b>PROCESS_QUERY_INFORMATION</b>  or <b>PROCESS_QUERY_LIMITED_INFORMATION</b> access right. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>The handle must have the <b>PROCESS_QUERY_INFORMATION</b> access right.
     * @param {Pointer<Byte>} lpImageFileName A pointer to a buffer that receives the full path to the executable file.
     * @param {Integer} nSize The size of the <i>lpImageFileName</i> buffer, in characters.
     * @returns {Integer} If the function succeeds, the return value specifies the length of the string copied to the buffer.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//psapi/nf-psapi-getprocessimagefilenamea
     * @since windows5.1.2600
     */
    static GetProcessImageFileNameA(hProcess, lpImageFileName, nSize) {
        lpImageFileName := lpImageFileName is String? StrPtr(lpImageFileName) : lpImageFileName

        A_LastError := 0

        result := DllCall("PSAPI.dll\GetProcessImageFileNameA", "ptr", hProcess, "ptr", lpImageFileName, "uint", nSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the name of the executable file for the specified process.
     * @param {Pointer<Void>} hProcess A handle to the process. The handle must have the <b>PROCESS_QUERY_INFORMATION</b>  or <b>PROCESS_QUERY_LIMITED_INFORMATION</b> access right. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>The handle must have the <b>PROCESS_QUERY_INFORMATION</b> access right.
     * @param {Pointer<Char>} lpImageFileName A pointer to a buffer that receives the full path to the executable file.
     * @param {Integer} nSize The size of the <i>lpImageFileName</i> buffer, in characters.
     * @returns {Integer} If the function succeeds, the return value specifies the length of the string copied to the buffer.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//psapi/nf-psapi-getprocessimagefilenamew
     * @since windows5.1.2600
     */
    static GetProcessImageFileNameW(hProcess, lpImageFileName, nSize) {
        lpImageFileName := lpImageFileName is String? StrPtr(lpImageFileName) : lpImageFileName

        A_LastError := 0

        result := DllCall("PSAPI.dll\GetProcessImageFileNameW", "ptr", hProcess, "ptr", lpImageFileName, "uint", nSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer} lpidProcess 
     * @param {Integer} cb 
     * @param {Pointer<UInt32>} lpcbNeeded 
     * @returns {Integer} 
     */
    static K32EnumProcesses(lpidProcess, cb, lpcbNeeded) {
        result := DllCall("KERNEL32.dll\K32EnumProcesses", "ptr", lpidProcess, "uint", cb, "uint*", lpcbNeeded, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hProcess 
     * @param {Pointer} lphModule 
     * @param {Integer} cb 
     * @param {Pointer<UInt32>} lpcbNeeded 
     * @returns {Integer} 
     */
    static K32EnumProcessModules(hProcess, lphModule, cb, lpcbNeeded) {
        result := DllCall("KERNEL32.dll\K32EnumProcessModules", "ptr", hProcess, "ptr", lphModule, "uint", cb, "uint*", lpcbNeeded, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hProcess 
     * @param {Pointer} lphModule 
     * @param {Integer} cb 
     * @param {Pointer<UInt32>} lpcbNeeded 
     * @param {Integer} dwFilterFlag 
     * @returns {Integer} 
     */
    static K32EnumProcessModulesEx(hProcess, lphModule, cb, lpcbNeeded, dwFilterFlag) {
        result := DllCall("KERNEL32.dll\K32EnumProcessModulesEx", "ptr", hProcess, "ptr", lphModule, "uint", cb, "uint*", lpcbNeeded, "uint", dwFilterFlag, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hProcess 
     * @param {Pointer<Void>} hModule 
     * @param {Pointer<Byte>} lpBaseName 
     * @param {Integer} nSize 
     * @returns {Integer} 
     */
    static K32GetModuleBaseNameA(hProcess, hModule, lpBaseName, nSize) {
        lpBaseName := lpBaseName is String? StrPtr(lpBaseName) : lpBaseName

        result := DllCall("KERNEL32.dll\K32GetModuleBaseNameA", "ptr", hProcess, "ptr", hModule, "ptr", lpBaseName, "uint", nSize, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hProcess 
     * @param {Pointer<Void>} hModule 
     * @param {Pointer<Char>} lpBaseName 
     * @param {Integer} nSize 
     * @returns {Integer} 
     */
    static K32GetModuleBaseNameW(hProcess, hModule, lpBaseName, nSize) {
        lpBaseName := lpBaseName is String? StrPtr(lpBaseName) : lpBaseName

        result := DllCall("KERNEL32.dll\K32GetModuleBaseNameW", "ptr", hProcess, "ptr", hModule, "ptr", lpBaseName, "uint", nSize, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hProcess 
     * @param {Pointer<Void>} hModule 
     * @param {Pointer<Byte>} lpFilename 
     * @param {Integer} nSize 
     * @returns {Integer} 
     */
    static K32GetModuleFileNameExA(hProcess, hModule, lpFilename, nSize) {
        lpFilename := lpFilename is String? StrPtr(lpFilename) : lpFilename

        result := DllCall("KERNEL32.dll\K32GetModuleFileNameExA", "ptr", hProcess, "ptr", hModule, "ptr", lpFilename, "uint", nSize, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hProcess 
     * @param {Pointer<Void>} hModule 
     * @param {Pointer<Char>} lpFilename 
     * @param {Integer} nSize 
     * @returns {Integer} 
     */
    static K32GetModuleFileNameExW(hProcess, hModule, lpFilename, nSize) {
        lpFilename := lpFilename is String? StrPtr(lpFilename) : lpFilename

        result := DllCall("KERNEL32.dll\K32GetModuleFileNameExW", "ptr", hProcess, "ptr", hModule, "ptr", lpFilename, "uint", nSize, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hProcess 
     * @param {Pointer<Void>} hModule 
     * @param {Pointer<MODULEINFO>} lpmodinfo 
     * @param {Integer} cb 
     * @returns {Integer} 
     */
    static K32GetModuleInformation(hProcess, hModule, lpmodinfo, cb) {
        result := DllCall("KERNEL32.dll\K32GetModuleInformation", "ptr", hProcess, "ptr", hModule, "ptr", lpmodinfo, "uint", cb, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hProcess 
     * @returns {Integer} 
     */
    static K32EmptyWorkingSet(hProcess) {
        result := DllCall("KERNEL32.dll\K32EmptyWorkingSet", "ptr", hProcess, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hProcess 
     * @returns {Integer} 
     */
    static K32InitializeProcessForWsWatch(hProcess) {
        result := DllCall("KERNEL32.dll\K32InitializeProcessForWsWatch", "ptr", hProcess, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hProcess 
     * @param {Pointer} lpWatchInfo 
     * @param {Integer} cb 
     * @returns {Integer} 
     */
    static K32GetWsChanges(hProcess, lpWatchInfo, cb) {
        result := DllCall("KERNEL32.dll\K32GetWsChanges", "ptr", hProcess, "ptr", lpWatchInfo, "uint", cb, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hProcess 
     * @param {Pointer} lpWatchInfoEx 
     * @param {Pointer<UInt32>} cb 
     * @returns {Integer} 
     */
    static K32GetWsChangesEx(hProcess, lpWatchInfoEx, cb) {
        result := DllCall("KERNEL32.dll\K32GetWsChangesEx", "ptr", hProcess, "ptr", lpWatchInfoEx, "uint*", cb, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hProcess 
     * @param {Pointer<Void>} lpv 
     * @param {Pointer<Char>} lpFilename 
     * @param {Integer} nSize 
     * @returns {Integer} 
     */
    static K32GetMappedFileNameW(hProcess, lpv, lpFilename, nSize) {
        lpFilename := lpFilename is String? StrPtr(lpFilename) : lpFilename

        result := DllCall("KERNEL32.dll\K32GetMappedFileNameW", "ptr", hProcess, "ptr", lpv, "ptr", lpFilename, "uint", nSize, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hProcess 
     * @param {Pointer<Void>} lpv 
     * @param {Pointer<Byte>} lpFilename 
     * @param {Integer} nSize 
     * @returns {Integer} 
     */
    static K32GetMappedFileNameA(hProcess, lpv, lpFilename, nSize) {
        lpFilename := lpFilename is String? StrPtr(lpFilename) : lpFilename

        result := DllCall("KERNEL32.dll\K32GetMappedFileNameA", "ptr", hProcess, "ptr", lpv, "ptr", lpFilename, "uint", nSize, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer} lpImageBase 
     * @param {Integer} cb 
     * @param {Pointer<UInt32>} lpcbNeeded 
     * @returns {Integer} 
     */
    static K32EnumDeviceDrivers(lpImageBase, cb, lpcbNeeded) {
        result := DllCall("KERNEL32.dll\K32EnumDeviceDrivers", "ptr", lpImageBase, "uint", cb, "uint*", lpcbNeeded, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ImageBase 
     * @param {Pointer<Byte>} lpFilename 
     * @param {Integer} nSize 
     * @returns {Integer} 
     */
    static K32GetDeviceDriverBaseNameA(ImageBase, lpFilename, nSize) {
        lpFilename := lpFilename is String? StrPtr(lpFilename) : lpFilename

        result := DllCall("KERNEL32.dll\K32GetDeviceDriverBaseNameA", "ptr", ImageBase, "ptr", lpFilename, "uint", nSize, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ImageBase 
     * @param {Pointer<Char>} lpBaseName 
     * @param {Integer} nSize 
     * @returns {Integer} 
     */
    static K32GetDeviceDriverBaseNameW(ImageBase, lpBaseName, nSize) {
        lpBaseName := lpBaseName is String? StrPtr(lpBaseName) : lpBaseName

        result := DllCall("KERNEL32.dll\K32GetDeviceDriverBaseNameW", "ptr", ImageBase, "ptr", lpBaseName, "uint", nSize, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ImageBase 
     * @param {Pointer<Byte>} lpFilename 
     * @param {Integer} nSize 
     * @returns {Integer} 
     */
    static K32GetDeviceDriverFileNameA(ImageBase, lpFilename, nSize) {
        lpFilename := lpFilename is String? StrPtr(lpFilename) : lpFilename

        result := DllCall("KERNEL32.dll\K32GetDeviceDriverFileNameA", "ptr", ImageBase, "ptr", lpFilename, "uint", nSize, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ImageBase 
     * @param {Pointer<Char>} lpFilename 
     * @param {Integer} nSize 
     * @returns {Integer} 
     */
    static K32GetDeviceDriverFileNameW(ImageBase, lpFilename, nSize) {
        lpFilename := lpFilename is String? StrPtr(lpFilename) : lpFilename

        result := DllCall("KERNEL32.dll\K32GetDeviceDriverFileNameW", "ptr", ImageBase, "ptr", lpFilename, "uint", nSize, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hProcess 
     * @param {Pointer} pv 
     * @param {Integer} cb 
     * @returns {Integer} 
     */
    static K32QueryWorkingSet(hProcess, pv, cb) {
        result := DllCall("KERNEL32.dll\K32QueryWorkingSet", "ptr", hProcess, "ptr", pv, "uint", cb, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hProcess 
     * @param {Pointer} pv 
     * @param {Integer} cb 
     * @returns {Integer} 
     */
    static K32QueryWorkingSetEx(hProcess, pv, cb) {
        result := DllCall("KERNEL32.dll\K32QueryWorkingSetEx", "ptr", hProcess, "ptr", pv, "uint", cb, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Process 
     * @param {Pointer} ppsmemCounters 
     * @param {Integer} cb 
     * @returns {Integer} 
     */
    static K32GetProcessMemoryInfo(Process, ppsmemCounters, cb) {
        result := DllCall("KERNEL32.dll\K32GetProcessMemoryInfo", "ptr", Process, "ptr", ppsmemCounters, "uint", cb, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PERFORMANCE_INFORMATION>} pPerformanceInformation 
     * @param {Integer} cb 
     * @returns {Integer} 
     */
    static K32GetPerformanceInfo(pPerformanceInformation, cb) {
        result := DllCall("KERNEL32.dll\K32GetPerformanceInfo", "ptr", pPerformanceInformation, "uint", cb, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PENUM_PAGE_FILE_CALLBACKW>} pCallBackRoutine 
     * @param {Pointer<Void>} pContext 
     * @returns {Integer} 
     */
    static K32EnumPageFilesW(pCallBackRoutine, pContext) {
        result := DllCall("KERNEL32.dll\K32EnumPageFilesW", "ptr", pCallBackRoutine, "ptr", pContext, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PENUM_PAGE_FILE_CALLBACKA>} pCallBackRoutine 
     * @param {Pointer<Void>} pContext 
     * @returns {Integer} 
     */
    static K32EnumPageFilesA(pCallBackRoutine, pContext) {
        result := DllCall("KERNEL32.dll\K32EnumPageFilesA", "ptr", pCallBackRoutine, "ptr", pContext, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hProcess 
     * @param {Pointer<Byte>} lpImageFileName 
     * @param {Integer} nSize 
     * @returns {Integer} 
     */
    static K32GetProcessImageFileNameA(hProcess, lpImageFileName, nSize) {
        lpImageFileName := lpImageFileName is String? StrPtr(lpImageFileName) : lpImageFileName

        result := DllCall("KERNEL32.dll\K32GetProcessImageFileNameA", "ptr", hProcess, "ptr", lpImageFileName, "uint", nSize, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hProcess 
     * @param {Pointer<Char>} lpImageFileName 
     * @param {Integer} nSize 
     * @returns {Integer} 
     */
    static K32GetProcessImageFileNameW(hProcess, lpImageFileName, nSize) {
        lpImageFileName := lpImageFileName is String? StrPtr(lpImageFileName) : lpImageFileName

        result := DllCall("KERNEL32.dll\K32GetProcessImageFileNameW", "ptr", hProcess, "ptr", lpImageFileName, "uint", nSize, "uint")
        return result
    }

;@endregion Methods
}
