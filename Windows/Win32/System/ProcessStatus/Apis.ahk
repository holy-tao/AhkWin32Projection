#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

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
     * @remarks
     * It is a good idea to use a large array, because it is hard to predict how many processes there will be at the time you call 
     * <b>EnumProcesses</b>. 
     * 
     * To determine how many processes were enumerated, divide the <i>lpcbNeeded</i> value by sizeof(DWORD). There is no indication given when the buffer is too small to store all process identifiers. Therefore, if <i>lpcbNeeded</i> equals <i>cb</i>, consider retrying the call with a larger array.
     * 
     * To obtain process handles for the processes whose identifiers you have just obtained, call the <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-openprocess">OpenProcess</a> function.
     * 
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes version numbers for the PSAPI functions. The PSAPI version number affects  the name used to call the function and the library that a program must load. 
     * 
     * If PSAPI_VERSION is 2 or greater, this function is defined as <b>K32EnumProcesses</b> in Psapi.h and exported in Kernel32.lib and Kernel32.dll. If PSAPI_VERSION is 1, this function is defined as <b>EnumProcesses</b> in Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls <b>K32EnumProcesses</b>. 
     * 
     * Programs that must run on earlier versions of Windows as well as Windows 7 and later versions should always call this function as <b>EnumProcesses</b>. To ensure correct resolution of symbols, add Psapi.lib to the TARGETLIBS macro and compile the program with –DPSAPI_VERSION=1. To use run-time dynamic linking, load Psapi.dll.
     * @param {Pointer} lpidProcess A pointer to an array that receives the list of process identifiers.
     * @param {Integer} cb The size of the <i>pProcessIds</i> array, in bytes.
     * @param {Pointer<Integer>} lpcbNeeded The number of bytes returned in the <i>pProcessIds</i> array.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-enumprocesses
     * @since windows5.1.2600
     */
    static EnumProcesses(lpidProcess, cb, lpcbNeeded) {
        lpcbNeededMarshal := lpcbNeeded is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("PSAPI.dll\EnumProcesses", "ptr", lpidProcess, "uint", cb, lpcbNeededMarshal, lpcbNeeded, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves a handle for each module in the specified process.
     * @remarks
     * The <b>EnumProcessModules</b> function is primarily 
     *     designed for use by debuggers and similar applications that must extract module information from another process. 
     *     If the module list in the target process is corrupted or not yet initialized, or if the module list changes during 
     *     the function call as a result of DLLs being loaded or unloaded, 
     *     <b>EnumProcessModules</b> may fail or return incorrect 
     *     information.
     * 
     * It is a good idea to specify a large array of <b>HMODULE</b> values, because it is hard 
     *     to predict how many modules there will be in the process at the time you call 
     *     <b>EnumProcessModules</b>. To determine if the 
     *     <i>lphModule</i> array is too small to hold all module handles for the process, compare the 
     *     value returned in <i>lpcbNeeded</i> with the value specified in <i>cb</i>. 
     *     If <i>lpcbNeeded</i> is greater than <i>cb</i>, increase the size of the 
     *     array and call <b>EnumProcessModules</b> again.
     * 
     * To determine how many modules were enumerated by the call to 
     *     <b>EnumProcessModules</b>, divide the resulting value in 
     *     the <i>lpcbNeeded</i> parameter by 
     *     <c>sizeof(HMODULE)</c>.
     * 
     * The <b>EnumProcessModules</b> function does not 
     *     retrieve handles for modules that were loaded with the <b>LOAD_LIBRARY_AS_DATAFILE</b> or similar  flags. 
     *     For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a>.
     * 
     * Do not call <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> on any of the handles returned 
     *     by this function. The information comes from a snapshot, so there are no resources to be freed.
     * 
     * If this function is called from a 32-bit application running on WOW64, it can only enumerate the modules of a 
     *     32-bit process. If the process is a 64-bit process, this function fails and the last error code is 
     *     <b>ERROR_PARTIAL_COPY</b> (299).
     * 
     * To take a snapshot of specified processes and the heaps, modules, and threads used by these processes, use the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-createtoolhelp32snapshot">CreateToolhelp32Snapshot</a> function.
     * 
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes 
     *     version numbers for the PSAPI functions. The PSAPI version number affects the name used to call the function and 
     *     the library that a program must load.
     * 
     * If <b>PSAPI_VERSION</b> is 2 or greater, this function is defined as 
     *     <b>K32EnumProcessModules</b> in Psapi.h and exported in 
     *     Kernel32.lib and Kernel32.dll. If <b>PSAPI_VERSION</b> is 1, this 
     *     function is defined as <b>EnumProcessModules</b> in 
     *     Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls 
     *     <b>K32EnumProcessModules</b>.
     * 
     * Programs that must run on earlier versions of Windows as well as Windows 7 and later versions 
     *     should always call this function as 
     *     <b>EnumProcessModules</b>. To ensure correct resolution 
     *     of symbols, add Psapi.lib to the <b>TARGETLIBS</b> macro and compile the 
     *     program with <b>-DPSAPI_VERSION=1</b>. To use run-time dynamic linking, load 
     *     Psapi.dll.
     * @param {HANDLE} hProcess A handle to the process.
     * @param {Pointer} lphModule An array that receives the list of module handles.
     * @param {Integer} cb The size of the <i>lphModule</i> array, in bytes.
     * @param {Pointer<Integer>} lpcbNeeded The number of bytes required to store all module handles in the <i>lphModule</i> 
     *       array.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-enumprocessmodules
     * @since windows5.1.2600
     */
    static EnumProcessModules(hProcess, lphModule, cb, lpcbNeeded) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        lpcbNeededMarshal := lpcbNeeded is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("PSAPI.dll\EnumProcessModules", "ptr", hProcess, "ptr", lphModule, "uint", cb, lpcbNeededMarshal, lpcbNeeded, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves a handle for each module in the specified process that meets the specified filter criteria.
     * @remarks
     * The <b>EnumProcessModulesEx</b> function is primarily designed for use by debuggers and similar applications that must extract module information from another process. If the module list in the target process is corrupted or not yet initialized, or if the module list changes during the function call as a result of DLLs being loaded or unloaded, <b>EnumProcessModulesEx</b> may fail or return incorrect information.
     * 
     * This function is intended primarily for 64-bit applications. If the function is called by a 32-bit application running under WOW64, the <i>dwFilterFlag</i> option is ignored and the function provides the same results as the <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-enumprocessmodules">EnumProcessModules</a> function.
     * 
     * It is a good idea to specify a large array of <b>HMODULE</b> values, because it is hard to predict how many modules there will be in the process at the time you call 
     * <b>EnumProcessModulesEx</b>. To determine if the <i>lphModule</i> array is too small to hold all module handles for the process, compare the value returned in <i>lpcbNeeded</i> with the value specified in <i>cb</i>. If <i>lpcbNeeded</i> is greater than <i>cb</i>, increase the size of the array and call 
     * <b>EnumProcessModulesEx</b> again.
     * 
     * To determine how many modules were enumerated by the call to 
     * <b>EnumProcessModulesEx</b>, divide the resulting value in the <i>lpcbNeeded</i> parameter by <c>sizeof(HMODULE)</c>.
     * 
     * The <b>EnumProcessModulesEx</b> function does not retrieve handles for modules that were loaded with the <b>LOAD_LIBRARY_AS_DATAFILE</b> flag. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a>.
     * 
     * Do not call <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> on any of the handles returned by this function. The information comes from a snapshot, so there are no resources to be freed.
     * 
     * To take a snapshot of specified processes and the heaps, modules, and threads used by these processes, use the <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-createtoolhelp32snapshot">CreateToolhelp32Snapshot</a> function.
     * 
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes version numbers for the PSAPI functions. The PSAPI version number affects  the name used to call the function and the library that a program must load. 
     * 
     * If PSAPI_VERSION is 2 or greater, this function is defined as <b>K32EnumProcessModulesEx</b> in Psapi.h and exported in Kernel32.lib and Kernel32.dll. If PSAPI_VERSION is 1, this function is defined as <b>EnumProcessModulesEx</b> in Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls <b>K32EnumProcessModulesEx</b>. 
     * 
     * Programs that must run on earlier versions of Windows as well as Windows 7 and later versions should always call this function as <b>EnumProcessModulesEx</b>. To ensure correct resolution of symbols, add Psapi.lib to the TARGETLIBS macro and compile the program with –DPSAPI_VERSION=1. To use run-time dynamic linking, load Psapi.dll.
     * @param {HANDLE} hProcess A handle to the process.
     * @param {Pointer} lphModule An array that receives the list of module handles.
     * @param {Integer} cb The size of the <i>lphModule</i> array, in bytes.
     * @param {Pointer<Integer>} lpcbNeeded The number of bytes required to store all module handles in the <i>lphModule</i> array.
     * @param {Integer} dwFilterFlag 
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-enumprocessmodulesex
     * @since windows6.0.6000
     */
    static EnumProcessModulesEx(hProcess, lphModule, cb, lpcbNeeded, dwFilterFlag) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        lpcbNeededMarshal := lpcbNeeded is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("PSAPI.dll\EnumProcessModulesEx", "ptr", hProcess, "ptr", lphModule, "uint", cb, lpcbNeededMarshal, lpcbNeeded, "uint", dwFilterFlag, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the base name of the specified module. (ANSI)
     * @remarks
     * The <b>GetModuleBaseName</b> function is primarily designed for use by debuggers and similar applications that must extract module information from another process. If the module list in the target process is corrupted or is not yet initialized, or if the module list changes during the function call as a result of DLLs being loaded or unloaded, <b>GetModuleBaseName</b> may fail or return incorrect information.
     * 
     * 
     * 
     * To retrieve the base name of a module in the current process, use the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulefilenamea">GetModuleFileName</a> function to retrieve the full module name and then use a function call such as <c>strrchr(szmodulename, '\\')</c> to scan to the beginning of the base name within the module name string. This is more efficient and more reliable than calling  <b>GetModuleBaseName</b>  with a handle to the current process.
     * 
     * 
     * 
     * To retrieve the base name of the main executable module for a remote process, use the <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-getprocessimagefilenamea">GetProcessImageFileName</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-queryfullprocessimagenamea">QueryFullProcessImageName</a> function to retrieve the module name and then use the <c>strrchr</c> function as described in the previous paragraph. This is more efficient and more reliable than calling  <b>GetModuleBaseName</b>  with a NULL module handle.
     * 
     * 
     * The <b>GetModuleBaseName</b> function does not retrieve the base name for modules that were loaded with the <b>LOAD_LIBRARY_AS_DATAFILE</b> flag. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a>.
     * 
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes 
     *     version numbers for the PSAPI functions. The PSAPI version number affects the name used to call the function and 
     *     the library that a program must load.
     * 
     * If <b>PSAPI_VERSION</b> is 2 or greater, this function is defined as 
     *     <b>K32GetModuleBaseName</b> in Psapi.h and exported in 
     *     Kernel32.lib and Kernel32.dll. If <b>PSAPI_VERSION</b> is 1, this 
     *     function is defined as <b>GetModuleBaseName</b> in 
     *     Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls 
     *     <b>K32GetModuleBaseName</b>. 
     * 
     * Programs that must run on earlier versions of Windows as 
     *     well as Windows 7 and later versions should always call this function as 
     *     <b>GetModuleBaseName</b>. To ensure correct resolution of symbols, 
     *     add Psapi.lib to the <b>TARGETLIBS</b> macro and compile the program with 
     *     <b>-DPSAPI_VERSION=1</b>. To use run-time dynamic linking, load Psapi.dll.
     * @param {HANDLE} hProcess A handle to the process that contains the module. 
     * 
     * The handle must have the <b>PROCESS_QUERY_INFORMATION</b> and <b>PROCESS_VM_READ</b> access rights. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {HMODULE} hModule A handle to the module. If this parameter is NULL, this function  returns the name of the file used to create the calling process.
     * @param {PSTR} lpBaseName A pointer to the buffer that receives the base name of the module. If the base name is longer than maximum number of characters specified by the <i>nSize</i> parameter, the base name is truncated.
     * @param {Integer} nSize The size of the <i>lpBaseName</i> buffer, in characters.
     * @returns {Integer} If the function succeeds, the return value specifies the length of the string copied to the buffer, in characters.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-getmodulebasenamea
     * @since windows5.1.2600
     */
    static GetModuleBaseNameA(hProcess, hModule, lpBaseName, nSize) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess
        hModule := hModule is Win32Handle ? NumGet(hModule, "ptr") : hModule
        lpBaseName := lpBaseName is String ? StrPtr(lpBaseName) : lpBaseName

        A_LastError := 0

        result := DllCall("PSAPI.dll\GetModuleBaseNameA", "ptr", hProcess, "ptr", hModule, "ptr", lpBaseName, "uint", nSize, "uint")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the base name of the specified module. (Unicode)
     * @remarks
     * The <b>GetModuleBaseName</b> function is primarily designed for use by debuggers and similar applications that must extract module information from another process. If the module list in the target process is corrupted or is not yet initialized, or if the module list changes during the function call as a result of DLLs being loaded or unloaded, <b>GetModuleBaseName</b> may fail or return incorrect information.
     * 
     * 
     * 
     * To retrieve the base name of a module in the current process, use the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulefilenamea">GetModuleFileName</a> function to retrieve the full module name and then use a function call such as <c>strrchr(szmodulename, '\\')</c> to scan to the beginning of the base name within the module name string. This is more efficient and more reliable than calling  <b>GetModuleBaseName</b>  with a handle to the current process.
     * 
     * 
     * 
     * To retrieve the base name of the main executable module for a remote process, use the <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-getprocessimagefilenamea">GetProcessImageFileName</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-queryfullprocessimagenamea">QueryFullProcessImageName</a> function to retrieve the module name and then use the <c>strrchr</c> function as described in the previous paragraph. This is more efficient and more reliable than calling  <b>GetModuleBaseName</b>  with a NULL module handle.
     * 
     * 
     * The <b>GetModuleBaseName</b> function does not retrieve the base name for modules that were loaded with the <b>LOAD_LIBRARY_AS_DATAFILE</b> flag. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a>.
     * 
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes 
     *     version numbers for the PSAPI functions. The PSAPI version number affects the name used to call the function and 
     *     the library that a program must load.
     * 
     * If <b>PSAPI_VERSION</b> is 2 or greater, this function is defined as 
     *     <b>K32GetModuleBaseName</b> in Psapi.h and exported in 
     *     Kernel32.lib and Kernel32.dll. If <b>PSAPI_VERSION</b> is 1, this 
     *     function is defined as <b>GetModuleBaseName</b> in 
     *     Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls 
     *     <b>K32GetModuleBaseName</b>. 
     * 
     * Programs that must run on earlier versions of Windows as 
     *     well as Windows 7 and later versions should always call this function as 
     *     <b>GetModuleBaseName</b>. To ensure correct resolution of symbols, 
     *     add Psapi.lib to the <b>TARGETLIBS</b> macro and compile the program with 
     *     <b>-DPSAPI_VERSION=1</b>. To use run-time dynamic linking, load Psapi.dll.
     * @param {HANDLE} hProcess A handle to the process that contains the module. 
     * 
     * The handle must have the <b>PROCESS_QUERY_INFORMATION</b> and <b>PROCESS_VM_READ</b> access rights. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {HMODULE} hModule A handle to the module. If this parameter is NULL, this function  returns the name of the file used to create the calling process.
     * @param {PWSTR} lpBaseName A pointer to the buffer that receives the base name of the module. If the base name is longer than maximum number of characters specified by the <i>nSize</i> parameter, the base name is truncated.
     * @param {Integer} nSize The size of the <i>lpBaseName</i> buffer, in characters.
     * @returns {Integer} If the function succeeds, the return value specifies the length of the string copied to the buffer, in characters.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-getmodulebasenamew
     * @since windows5.1.2600
     */
    static GetModuleBaseNameW(hProcess, hModule, lpBaseName, nSize) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess
        hModule := hModule is Win32Handle ? NumGet(hModule, "ptr") : hModule
        lpBaseName := lpBaseName is String ? StrPtr(lpBaseName) : lpBaseName

        A_LastError := 0

        result := DllCall("PSAPI.dll\GetModuleBaseNameW", "ptr", hProcess, "ptr", hModule, "ptr", lpBaseName, "uint", nSize, "uint")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the fully qualified path for the file containing the specified module. (ANSI)
     * @remarks
     * The <b>GetModuleFileNameEx</b> function is primarily designed for use by debuggers and similar applications that must extract module information from another process. If the module list in the target process is corrupted or is not yet initialized, or if the module list changes during the function call as a result of DLLs being loaded or unloaded, <b>GetModuleFileNameEx</b> may fail or return incorrect information.
     * 
     * To retrieve the name of a module in the current process, use the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulefilenamea">GetModuleFileName</a> function. This is more efficient and more reliable than calling <b>GetModuleFileNameEx</b> with a handle to the current process.
     * 
     * To retrieve the name of the main executable module for a remote process, use the <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-getprocessimagefilenamea">GetProcessImageFileName</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-queryfullprocessimagenamea">QueryFullProcessImageName</a> function. This is more efficient and more reliable than calling the <b>GetModuleFileNameEx</b> function with a NULL module handle.
     * 
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes 
     *     version numbers for the PSAPI functions. The PSAPI version number affects the name used to call the function and 
     *     the library that a program must load.
     * 
     * If <b>PSAPI_VERSION</b> is 2 or greater, this function is defined as 
     *     <b>K32GetModuleFileNameEx</b> in Psapi.h and exported in 
     *     Kernel32.lib and Kernel32.dll. If <b>PSAPI_VERSION</b> is 1, this 
     *     function is defined as <b>GetModuleFileNameEx</b> in 
     *     Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls 
     *     <b>K32GetModuleFileNameEx</b>. 
     * 
     * Programs that must run on earlier versions of Windows as 
     *     well as Windows 7 and later versions should always call this function as 
     *     <b>GetModuleFileNameEx</b>. To ensure correct resolution of symbols, 
     *     add Psapi.lib to the <b>TARGETLIBS</b> macro and compile the program with 
     *     <b>-DPSAPI_VERSION=1</b>. To use run-time dynamic linking, load Psapi.dll.
     * @param {HANDLE} hProcess A handle to the process that contains the module.  
     * 
     * The handle must have the <b>PROCESS_QUERY_INFORMATION</b> and <b>PROCESS_VM_READ</b> access rights. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * 
     * <b>Windows 10 and later, Windows Server 2016 and later</b>: If the <i>hModule</i> parameter is NULL, then the handle requires only <b>PROCESS_QUERY_LIMITED_INFORMATION</b> access rights.
     * 
     * The <b>GetModuleFileNameEx</b> function does not retrieve the path for modules  that were loaded using the <b>LOAD_LIBRARY_AS_DATAFILE</b> flag. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a>.
     * @param {HMODULE} hModule A handle to the module. If this parameter is NULL, <b>GetModuleFileNameEx</b> returns the path of the executable file of the process specified in <i>hProcess</i>.
     * @param {PSTR} lpFilename A pointer to a buffer that receives the fully qualified path to the module. If the size of the file name is larger than the value of the <i>nSize</i> parameter, the function succeeds but the file name is truncated and null-terminated.
     * @param {Integer} nSize The size of the <i>lpFilename</i> buffer, in characters.
     * @returns {Integer} If the function succeeds, the return value specifies the length of the string copied to the buffer.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-getmodulefilenameexa
     * @since windows5.1.2600
     */
    static GetModuleFileNameExA(hProcess, hModule, lpFilename, nSize) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess
        hModule := hModule is Win32Handle ? NumGet(hModule, "ptr") : hModule
        lpFilename := lpFilename is String ? StrPtr(lpFilename) : lpFilename

        A_LastError := 0

        result := DllCall("PSAPI.dll\GetModuleFileNameExA", "ptr", hProcess, "ptr", hModule, "ptr", lpFilename, "uint", nSize, "uint")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the fully qualified path for the file containing the specified module. (Unicode)
     * @remarks
     * The <b>GetModuleFileNameEx</b> function is primarily designed for use by debuggers and similar applications that must extract module information from another process. If the module list in the target process is corrupted or is not yet initialized, or if the module list changes during the function call as a result of DLLs being loaded or unloaded, <b>GetModuleFileNameEx</b> may fail or return incorrect information.
     * 
     * To retrieve the name of a module in the current process, use the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulefilenamew">GetModuleFileName</a> function. This is more efficient and more reliable than calling <b>GetModuleFileNameEx</b> with a handle to the current process.
     * 
     * To retrieve the name of the main executable module for a remote process, use the <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-getprocessimagefilenamew">GetProcessImageFileName</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-queryfullprocessimagenamew">QueryFullProcessImageName</a> function. This is more efficient and more reliable than calling the <b>GetModuleFileNameEx</b> function with a NULL module handle.
     * 
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes 
     *     version numbers for the PSAPI functions. The PSAPI version number affects the name used to call the function and 
     *     the library that a program must load.
     * 
     * If <b>PSAPI_VERSION</b> is 2 or greater, this function is defined as 
     *     <b>K32GetModuleFileNameEx</b> in Psapi.h and exported in 
     *     Kernel32.lib and Kernel32.dll. If <b>PSAPI_VERSION</b> is 1, this 
     *     function is defined as <b>GetModuleFileNameEx</b> in 
     *     Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls 
     *     <b>K32GetModuleFileNameEx</b>. 
     * 
     * Programs that must run on earlier versions of Windows as 
     *     well as Windows 7 and later versions should always call this function as 
     *     <b>GetModuleFileNameEx</b>. To ensure correct resolution of symbols, 
     *     add Psapi.lib to the <b>TARGETLIBS</b> macro and compile the program with 
     *     <b>-DPSAPI_VERSION=1</b>. To use run-time dynamic linking, load Psapi.dll.
     * @param {HANDLE} hProcess A handle to the process that contains the module.  
     * 
     * The handle must have the <b>PROCESS_QUERY_INFORMATION</b> and <b>PROCESS_VM_READ</b> access rights. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * 
     * <b>Windows 10 and later, Windows Server 2016 and later</b>: If the <i>hModule</i> parameter is NULL, then the handle requires only <b>PROCESS_QUERY_LIMITED_INFORMATION</b> access rights.
     * 
     * The <b>GetModuleFileNameEx</b> function does not retrieve the path for modules  that were loaded using the <b>LOAD_LIBRARY_AS_DATAFILE</b> flag. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexw">LoadLibraryEx</a>.
     * @param {HMODULE} hModule A handle to the module. If this parameter is NULL, <b>GetModuleFileNameEx</b> returns the path of the executable file of the process specified in <i>hProcess</i>.
     * @param {PWSTR} lpFilename A pointer to a buffer that receives the fully qualified path to the module. If the size of the file name is larger than the value of the <i>nSize</i> parameter, the function succeeds but the file name is truncated and null-terminated.
     * @param {Integer} nSize The size of the <i>lpFilename</i> buffer, in characters.
     * @returns {Integer} If the function succeeds, the return value specifies the length of the string copied to the buffer.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-getmodulefilenameexw
     * @since windows5.1.2600
     */
    static GetModuleFileNameExW(hProcess, hModule, lpFilename, nSize) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess
        hModule := hModule is Win32Handle ? NumGet(hModule, "ptr") : hModule
        lpFilename := lpFilename is String ? StrPtr(lpFilename) : lpFilename

        A_LastError := 0

        result := DllCall("PSAPI.dll\GetModuleFileNameExW", "ptr", hProcess, "ptr", hModule, "ptr", lpFilename, "uint", nSize, "uint")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves information about the specified module in the MODULEINFO structure.
     * @remarks
     * To get information for the calling process, pass the handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getcurrentprocess">GetCurrentProcess</a>.
     * 
     * The <b>GetModuleInformation</b> function does not retrieve information for modules that were loaded with the <b>LOAD_LIBRARY_AS_DATAFILE</b> flag. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a>.
     * 
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes 
     *     version numbers for the PSAPI functions. The PSAPI version number affects the name used to call the function and 
     *     the library that a program must load.
     * 
     * If <b>PSAPI_VERSION</b> is 2 or greater, this function is defined as 
     *     <b>K32GetModuleInformation</b> in Psapi.h and exported in 
     *     Kernel32.lib and Kernel32.dll. If <b>PSAPI_VERSION</b> is 1, this 
     *     function is defined as K32GetModuleInformation in 
     *     Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls 
     *     <b>K32GetModuleInformation</b>. 
     * 
     * Programs that must run on earlier versions of Windows as 
     *     well as Windows 7 and later versions should always call this function as 
     *     K32GetModuleInformation. To ensure correct resolution of symbols, 
     *     add Psapi.lib to the <b>TARGETLIBS</b> macro and compile the program with 
     *     <b>-DPSAPI_VERSION=1</b>. To use run-time dynamic linking, load Psapi.dll.
     * @param {HANDLE} hProcess A handle to the process that contains the module.
     * 
     * The handle must have the <b>PROCESS_QUERY_INFORMATION</b> and <b>PROCESS_VM_READ</b> access rights. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {HMODULE} hModule A handle to the module.
     * @param {Pointer<MODULEINFO>} lpmodinfo A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/psapi/ns-psapi-moduleinfo">MODULEINFO</a> structure that receives information about the module.
     * @param {Integer} cb The size of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/psapi/ns-psapi-moduleinfo">MODULEINFO</a> structure, in bytes.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-getmoduleinformation
     * @since windows5.1.2600
     */
    static GetModuleInformation(hProcess, hModule, lpmodinfo, cb) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess
        hModule := hModule is Win32Handle ? NumGet(hModule, "ptr") : hModule

        A_LastError := 0

        result := DllCall("PSAPI.dll\GetModuleInformation", "ptr", hProcess, "ptr", hModule, "ptr", lpmodinfo, "uint", cb, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes as many pages as possible from the working set of the specified process.
     * @remarks
     * You can also empty the working set by calling  the <a href="https://docs.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-setprocessworkingsetsize">SetProcessWorkingSetSize</a> or <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-setprocessworkingsetsizeex">SetProcessWorkingSetSizeEx</a> function with the <i>dwMinimumWorkingSetSize</i> and <i>dwMaximumWorkingSetSize</i> parameters set to the value <c>(SIZE_T)(-1)</c>.
     * 
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes 
     *     version numbers for the PSAPI functions. The PSAPI version number affects the name used to call the function and 
     *     the library that a program must load.
     * 
     * If <b>PSAPI_VERSION</b> is 2 or greater, this function is defined as 
     *     <b>K32EmptyWorkingSet</b> in Psapi.h and exported in 
     *     Kernel32.lib and Kernel32.dll. If <b>PSAPI_VERSION</b> is 1, this 
     *     function is defined as K32EmptyWorkingSet in 
     *     Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls 
     *     <b>K32EmptyWorkingSet</b>. 
     * 
     * Programs that must run on earlier versions of Windows as 
     *     well as Windows 7 and later versions should always call this function as 
     *     K32EmptyWorkingSet. To ensure correct resolution of symbols, 
     *     add Psapi.lib to the <b>TARGETLIBS</b> macro and compile the program with 
     *     <b>-DPSAPI_VERSION=1</b>. To use run-time dynamic linking, load Psapi.dll.
     * @param {HANDLE} hProcess A handle to the process. The handle must have the <b>PROCESS_QUERY_INFORMATION</b> or <b>PROCESS_QUERY_LIMITED_INFORMATION</b> access right and the <b>PROCESS_SET_QUOTA</b> access right. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-emptyworkingset
     * @since windows5.1.2600
     */
    static EmptyWorkingSet(hProcess) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        A_LastError := 0

        result := DllCall("PSAPI.dll\EmptyWorkingSet", "ptr", hProcess, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initiates monitoring of the working set of the specified process.
     * @remarks
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes 
     *     version numbers for the PSAPI functions. The PSAPI version number affects the name used to call the function and 
     *     the library that a program must load.
     * 
     * If <b>PSAPI_VERSION</b> is 2 or greater, this function is defined as 
     *     <b>K32InitializeProcessForWsWatch</b> in Psapi.h and exported in 
     *     Kernel32.lib and Kernel32.dll. If <b>PSAPI_VERSION</b> is 1, this 
     *     function is defined as <b>InitializeProcessForWsWatch</b> in 
     *     Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls 
     *     <b>K32InitializeProcessForWsWatch</b>. 
     * 
     * Programs that must run on earlier versions of Windows as 
     *     well as Windows 7 and later versions should always call this function as 
     *     <b>InitializeProcessForWsWatch</b>. To ensure correct resolution of symbols, 
     *     add Psapi.lib to the <b>TARGETLIBS</b> macro and compile the program with 
     *     <b>-DPSAPI_VERSION=1</b>. To use run-time dynamic linking, load Psapi.dll.
     * @param {HANDLE} hProcess A handle to the process. The handle must have the PROCESS_QUERY_INFORMATION access right. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-initializeprocessforwswatch
     * @since windows5.1.2600
     */
    static InitializeProcessForWsWatch(hProcess) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        A_LastError := 0

        result := DllCall("PSAPI.dll\InitializeProcessForWsWatch", "ptr", hProcess, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves information about the pages that have been added to the working set of the specified process since the last time this function or the InitializeProcessForWsWatch function was called.
     * @remarks
     * The operating system uses one buffer per process to maintain working set change records. If more than one 
     *     application (or multiple threads in the same application) calls this function with the same process handle, 
     *     neither application will have a complete accounting of the working set changes because each call empties the 
     *     buffer.
     * 
     * The operating system does not record new change records while it is processing the query (and emptying the 
     *     buffer). The function sets the error code to <b>NO_MORE_ENTRIES</b> if a concurrent query is 
     *     received while it is processing another query.
     * 
     * If the buffer becomes full, no new records are added to the buffer until this function or the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-initializeprocessforwswatch">InitializeProcessForWsWatch</a> function is 
     *     called. You should call this method with enough frequency to prevent possible data loss. If records are lost, the 
     *     array is terminated with a structure whose <b>FaultingPc</b> member is NULL and whose 
     *     <b>FaultingVa</b> member is set to the number of records that were lost.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>If records are lost, the array is terminated with a structure whose <b>FaultingPc</b> 
     *       member is NULL and whose <b>FaultingVa</b> member is 1.
     * 
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes 
     *     version numbers for the PSAPI functions. The PSAPI version number affects the name used to call the function and 
     *     the library that a program must load.
     * 
     * If <b>PSAPI_VERSION</b> is 2 or greater, this function is defined as 
     *     <b>K32GetWsChanges</b> in Psapi.h and exported in 
     *     Kernel32.lib and Kernel32.dll. If <b>PSAPI_VERSION</b> is 1, this 
     *     function is defined as <b>GetWsChanges</b> in 
     *     Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls 
     *     <b>K32GetWsChanges</b>. 
     * 
     * Programs that must run on earlier versions of Windows as 
     *     well as Windows 7 and later versions should always call this function as 
     *     <b>GetWsChanges</b>. To ensure correct resolution of symbols, 
     *     add Psapi.lib to the <b>TARGETLIBS</b> macro and compile the program with 
     *     <b>-DPSAPI_VERSION=1</b>. To use run-time dynamic linking, load Psapi.dll.
     * @param {HANDLE} hProcess A handle to the process. The handle must have the <b>PROCESS_QUERY_INFORMATION</b> 
     *       access right. For more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Pointer} lpWatchInfo A pointer to a user-allocated buffer that receives an array of 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/psapi/ns-psapi-psapi_ws_watch_information">PSAPI_WS_WATCH_INFORMATION</a> structures. 
     *       The array is terminated with a structure whose <b>FaultingPc</b> member is NULL.
     * @param {Integer} cb The size of the <i>lpWatchInfo</i> buffer, in bytes.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns 
     *        <b>ERROR_INSUFFICIENT_BUFFER</b> if the <i>lpWatchInfo</i> buffer is not 
     *        large enough to contain all the working set change records; the buffer is returned empty. Reallocate a larger 
     *        block of memory for the buffer and call again.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-getwschanges
     * @since windows5.1.2600
     */
    static GetWsChanges(hProcess, lpWatchInfo, cb) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        A_LastError := 0

        result := DllCall("PSAPI.dll\GetWsChanges", "ptr", hProcess, "ptr", lpWatchInfo, "uint", cb, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves extended information about the pages that have been added to the working set of the specified process since the last time this function or the InitializeProcessForWsWatch function was called.
     * @remarks
     * The operating system uses one buffer per process to maintain working set change records. If more than one application (or multiple threads in the same application) calls this function with the same process handle, neither application will have a complete accounting of the working set changes because each call empties the buffer.
     * 
     * The operating system does not record new change records while it is processing the query (and emptying the buffer). This function sets the error code to <b>NO_MORE_ENTRIES</b> if a concurrent query is received while it is processing another query.
     * 
     * If the buffer becomes full, no new records are added to the buffer until this function or the <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-initializeprocessforwswatch">InitializeProcessForWsWatch</a> function is called. You should call <b>GetWsChangesEx</b> with enough frequency to prevent possible data loss. If records are lost, the array is terminated with a structure whose <b>FaultingPc</b> member is NULL and whose <b>FaultingVa</b> member is set to the number of records that were lost.
     * 
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes 
     *     version numbers for the PSAPI functions. The PSAPI version number affects the name used to call the function and 
     *     the library that a program must load.
     * 
     * If <b>PSAPI_VERSION</b> is 2 or greater, this function is defined as 
     *     <b>K32GetWsChangesEx</b> in Psapi.h and exported in 
     *     Kernel32.lib and Kernel32.dll. If <b>PSAPI_VERSION</b> is 1, this 
     *     function is defined as <b>GetWsChangesEx</b> in 
     *     Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls 
     *     <b>K32GetWsChangesEx</b>. 
     * 
     * Programs that must run on earlier versions of Windows as 
     *     well as Windows 7 and later versions should always call this function as 
     *     <b>GetWsChangesEx</b>. To ensure correct resolution of symbols, 
     *     add Psapi.lib to the <b>TARGETLIBS</b> macro and compile the program with 
     *     <b>-DPSAPI_VERSION=1</b>. To use run-time dynamic linking, load Psapi.dll.
     * @param {HANDLE} hProcess A handle to the process. The handle must have the <b>PROCESS_QUERY_INFORMATION</b> access right. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Pointer} lpWatchInfoEx A pointer to a user-allocated buffer that receives an array of  
     * <a href="https://docs.microsoft.com/windows/desktop/api/psapi/ns-psapi-psapi_ws_watch_information_ex">PSAPI_WS_WATCH_INFORMATION_EX</a> structures. The array is terminated with a structure whose <b>FaultingPc</b> member is NULL.
     * @param {Pointer<Integer>} cb The size of the 
     * <i>lpWatchInfoEx</i> buffer, in bytes.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 						
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns <b>ERROR_INSUFFICIENT_BUFFER</b> if the <i>lpWatchInfoEx</i> buffer is not large enough to contain all the working set change records; the buffer is returned empty. Reallocate a larger block of memory for the buffer and call again.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-getwschangesex
     * @since windows6.0.6000
     */
    static GetWsChangesEx(hProcess, lpWatchInfoEx, cb) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        cbMarshal := cb is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("PSAPI.dll\GetWsChangesEx", "ptr", hProcess, "ptr", lpWatchInfoEx, cbMarshal, cb, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Checks whether the specified address is within a memory-mapped file in the address space of the specified process. If so, the function returns the name of the memory-mapped file. (Unicode)
     * @remarks
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes 
     *     version numbers for the PSAPI functions. The PSAPI version number affects the name used to call the function and 
     *     the library that a program must load.
     * 
     * If <b>PSAPI_VERSION</b> is 2 or greater, this function is defined as 
     *     <b>K32GetMappedFileName</b> in Psapi.h and exported in 
     *     Kernel32.lib and Kernel32.dll. If <b>PSAPI_VERSION</b> is 1, this 
     *     function is defined as <b>GetMappedFileName</b> in 
     *     Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls 
     *     <b>K32GetMappedFileName</b>. 
     * 
     * Programs that must run on earlier versions of Windows as 
     *     well as Windows 7 and later versions should always call this function as 
     *     <b>GetMappedFileName</b>. To ensure correct resolution of symbols, 
     *     add Psapi.lib to the <b>TARGETLIBS</b> macro and compile the program with 
     *     <b>-DPSAPI_VERSION=1</b>. To use run-time dynamic linking, load Psapi.dll.
     * 
     * In Windows Server 2012, this function is supported by the following technologies.
     * 
     * <table>
     * <tr>
     * <th>Technology</th>
     * <th>Supported</th>
     * </tr>
     * <tr>
     * <td>
     * Server Message Block (SMB) 3.0 protocol
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 Transparent Failover (TFO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 with Scale-out File Shares (SO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Cluster Shared Volume File System (CsvFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Resilient File System (ReFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * </table>
     * @param {HANDLE} hProcess A handle to the process. The handle must have the <b>PROCESS_QUERY_INFORMATION</b> access rightF. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Pointer<Void>} lpv The address to be verified.
     * @param {PWSTR} lpFilename A pointer to the buffer that receives the name of the memory-mapped file to which the address specified by <i>lpv</i> belongs.
     * @param {Integer} nSize The size of the <i>lpFilename</i> buffer, in characters.
     * @returns {Integer} If the function succeeds, the return value specifies the length of the string copied to the buffer, in characters.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-getmappedfilenamew
     * @since windows5.1.2600
     */
    static GetMappedFileNameW(hProcess, lpv, lpFilename, nSize) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess
        lpFilename := lpFilename is String ? StrPtr(lpFilename) : lpFilename

        lpvMarshal := lpv is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("PSAPI.dll\GetMappedFileNameW", "ptr", hProcess, lpvMarshal, lpv, "ptr", lpFilename, "uint", nSize, "uint")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Checks whether the specified address is within a memory-mapped file in the address space of the specified process. If so, the function returns the name of the memory-mapped file. (ANSI)
     * @remarks
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes 
     *     version numbers for the PSAPI functions. The PSAPI version number affects the name used to call the function and 
     *     the library that a program must load.
     * 
     * If <b>PSAPI_VERSION</b> is 2 or greater, this function is defined as 
     *     <b>K32GetMappedFileName</b> in Psapi.h and exported in 
     *     Kernel32.lib and Kernel32.dll. If <b>PSAPI_VERSION</b> is 1, this 
     *     function is defined as <b>GetMappedFileName</b> in 
     *     Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls 
     *     <b>K32GetMappedFileName</b>. 
     * 
     * Programs that must run on earlier versions of Windows as 
     *     well as Windows 7 and later versions should always call this function as 
     *     <b>GetMappedFileName</b>. To ensure correct resolution of symbols, 
     *     add Psapi.lib to the <b>TARGETLIBS</b> macro and compile the program with 
     *     <b>-DPSAPI_VERSION=1</b>. To use run-time dynamic linking, load Psapi.dll.
     * 
     * In Windows Server 2012, this function is supported by the following technologies.
     * 
     * <table>
     * <tr>
     * <th>Technology</th>
     * <th>Supported</th>
     * </tr>
     * <tr>
     * <td>
     * Server Message Block (SMB) 3.0 protocol
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 Transparent Failover (TFO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 with Scale-out File Shares (SO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Cluster Shared Volume File System (CsvFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Resilient File System (ReFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * </table>
     * @param {HANDLE} hProcess A handle to the process. The handle must have the <b>PROCESS_QUERY_INFORMATION</b> access right. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Pointer<Void>} lpv The address to be verified.
     * @param {PSTR} lpFilename A pointer to the buffer that receives the name of the memory-mapped file to which the address specified by <i>lpv</i> belongs.
     * @param {Integer} nSize The size of the <i>lpFilename</i> buffer, in characters.
     * @returns {Integer} If the function succeeds, the return value specifies the length of the string copied to the buffer, in characters.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-getmappedfilenamea
     * @since windows5.1.2600
     */
    static GetMappedFileNameA(hProcess, lpv, lpFilename, nSize) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess
        lpFilename := lpFilename is String ? StrPtr(lpFilename) : lpFilename

        lpvMarshal := lpv is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("PSAPI.dll\GetMappedFileNameA", "ptr", hProcess, lpvMarshal, lpv, "ptr", lpFilename, "uint", nSize, "uint")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the load address for each device driver in the system.
     * @remarks
     * To determine how many device drivers were enumerated by the call to 
     * <b>EnumDeviceDrivers</b>, divide the resulting value in the <i>lpcbNeeded</i> parameter by <c>sizeof(LPVOID)</c>.
     * 
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes version numbers for the PSAPI functions. The PSAPI version number affects  the name used to call the function and the library that a program must load. 
     * 
     * If PSAPI_VERSION is 2 or greater, this function is defined as <b>K32EnumDeviceDrivers</b> in Psapi.h and exported in Kernel32.lib and Kernel32.dll. If PSAPI_VERSION is 1, this function is defined as <b>EnumDeviceDrivers</b> in Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls <b>K32EnumDeviceDrivers</b>. 
     * 
     * Programs that must run on earlier versions of Windows as well as Windows 7 and later versions should always call this function as <b>EnumDeviceDrivers</b>. To ensure correct resolution of symbols, add Psapi.lib to the TARGETLIBS macro and compile the program with –DPSAPI_VERSION=1. To use run-time dynamic linking, load Psapi.dll.
     * @param {Pointer} lpImageBase An array that receives the list of load addresses for the device drivers.
     * @param {Integer} cb The size of the <i>lpImageBase</i> array, in bytes. If the array is not large enough to store the load addresses, the <i>lpcbNeeded</i> parameter receives the required size of the array.
     * @param {Pointer<Integer>} lpcbNeeded The number of bytes returned in the <i>lpImageBase</i> array.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-enumdevicedrivers
     * @since windows5.1.2600
     */
    static EnumDeviceDrivers(lpImageBase, cb, lpcbNeeded) {
        lpcbNeededMarshal := lpcbNeeded is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("PSAPI.dll\EnumDeviceDrivers", "ptr", lpImageBase, "uint", cb, lpcbNeededMarshal, lpcbNeeded, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the base name of the specified device driver. (ANSI)
     * @remarks
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes version numbers for the PSAPI functions. The PSAPI version number affects  the name used to call the function and the library that a program must load.
     * 
     * If PSAPI_VERSION is 2 or greater, this function is defined as <b>K32GetDeviceDriverBaseName</b> in Psapi.h and exported in Kernel32.lib and Kernel32.dll. If PSAPI_VERSION is 1, this function is defined as <b>GetDeviceDriverBaseName</b> in Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls <b>K32GetDeviceDriverBaseName</b>.
     * 
     * Programs that must run on earlier versions of Windows as well as Windows 7 and later versions should always call this function as <b>GetDeviceDriverBaseName</b>. To ensure correct resolution of symbols, add Psapi.lib to the TARGETLIBS macro and compile the program with –DPSAPI_VERSION=1. To use run-time dynamic linking, load Psapi.dll.
     * @param {Pointer<Void>} ImageBase The load address of the device driver. This value can be retrieved using the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-enumdevicedrivers">EnumDeviceDrivers</a> 
     *       function.
     * @param {PSTR} lpFilename TBD
     * @param {Integer} nSize The size of the <i>lpBaseName</i> buffer, in characters. If the buffer is not large enough to store the base name plus the terminating null character, the string is truncated.
     * @returns {Integer} If the function succeeds, the return value specifies the length of the string copied to the buffer, not including any terminating null character.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-getdevicedriverbasenamea
     * @since windows5.1.2600
     */
    static GetDeviceDriverBaseNameA(ImageBase, lpFilename, nSize) {
        lpFilename := lpFilename is String ? StrPtr(lpFilename) : lpFilename

        ImageBaseMarshal := ImageBase is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("PSAPI.dll\GetDeviceDriverBaseNameA", ImageBaseMarshal, ImageBase, "ptr", lpFilename, "uint", nSize, "uint")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the base name of the specified device driver. (Unicode)
     * @remarks
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes version numbers for the PSAPI functions. The PSAPI version number affects  the name used to call the function and the library that a program must load.
     * 
     * If PSAPI_VERSION is 2 or greater, this function is defined as <b>K32GetDeviceDriverBaseName</b> in Psapi.h and exported in Kernel32.lib and Kernel32.dll. If PSAPI_VERSION is 1, this function is defined as <b>GetDeviceDriverBaseName</b> in Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls <b>K32GetDeviceDriverBaseName</b>.
     * 
     * Programs that must run on earlier versions of Windows as well as Windows 7 and later versions should always call this function as <b>GetDeviceDriverBaseName</b>. To ensure correct resolution of symbols, add Psapi.lib to the TARGETLIBS macro and compile the program with –DPSAPI_VERSION=1. To use run-time dynamic linking, load Psapi.dll.
     * @param {Pointer<Void>} ImageBase The load address of the device driver. This value can be retrieved using the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-enumdevicedrivers">EnumDeviceDrivers</a> 
     *       function.
     * @param {PWSTR} lpBaseName A pointer to the buffer that receives the base name of the device driver.
     * @param {Integer} nSize The size of the <i>lpBaseName</i> buffer, in characters. If the buffer is not large enough to store the base name plus the terminating null character, the string is truncated.
     * @returns {Integer} If the function succeeds, the return value specifies the length of the string copied to the buffer, not including any terminating null character.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-getdevicedriverbasenamew
     * @since windows5.1.2600
     */
    static GetDeviceDriverBaseNameW(ImageBase, lpBaseName, nSize) {
        lpBaseName := lpBaseName is String ? StrPtr(lpBaseName) : lpBaseName

        ImageBaseMarshal := ImageBase is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("PSAPI.dll\GetDeviceDriverBaseNameW", ImageBaseMarshal, ImageBase, "ptr", lpBaseName, "uint", nSize, "uint")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the path available for the specified device driver. (ANSI)
     * @remarks
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes version numbers for the PSAPI functions. The PSAPI version number affects  the name used to call the function and the library that a program must load. 
     * 
     * If PSAPI_VERSION is 2 or greater, this function is defined as <b>K32GetDeviceDriverFileName</b> in Psapi.h and exported in Kernel32.lib and Kernel32.dll. If PSAPI_VERSION is 1, this function is defined as <b>GetDeviceDriverFileName</b> in Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls <b>K32GetDeviceDriverFileName</b>. 
     * 
     * Programs that must run on earlier versions of Windows as well as Windows 7 and later versions should always call this function as <b>GetDeviceDriverFileName</b>. To ensure correct resolution of symbols, add Psapi.lib to the TARGETLIBS macro and compile the program with –DPSAPI_VERSION=1. To use run-time dynamic linking, load Psapi.dll.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The psapi.h header defines GetDeviceDriverFileName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} ImageBase The load address of the device driver.
     * @param {PSTR} lpFilename A pointer to the buffer that receives the path to the device driver.
     * @param {Integer} nSize The size of the <i>lpFilename</i> buffer, in characters. If the buffer is not large enough to store the path plus the terminating null character, the string is truncated.
     * @returns {Integer} If the function succeeds, the return value specifies the length of the string copied to the buffer, not including any terminating null character.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-getdevicedriverfilenamea
     * @since windows5.1.2600
     */
    static GetDeviceDriverFileNameA(ImageBase, lpFilename, nSize) {
        lpFilename := lpFilename is String ? StrPtr(lpFilename) : lpFilename

        ImageBaseMarshal := ImageBase is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("PSAPI.dll\GetDeviceDriverFileNameA", ImageBaseMarshal, ImageBase, "ptr", lpFilename, "uint", nSize, "uint")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the path available for the specified device driver. (Unicode)
     * @remarks
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes version numbers for the PSAPI functions. The PSAPI version number affects  the name used to call the function and the library that a program must load. 
     * 
     * If PSAPI_VERSION is 2 or greater, this function is defined as <b>K32GetDeviceDriverFileName</b> in Psapi.h and exported in Kernel32.lib and Kernel32.dll. If PSAPI_VERSION is 1, this function is defined as <b>GetDeviceDriverFileName</b> in Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls <b>K32GetDeviceDriverFileName</b>. 
     * 
     * Programs that must run on earlier versions of Windows as well as Windows 7 and later versions should always call this function as <b>GetDeviceDriverFileName</b>. To ensure correct resolution of symbols, add Psapi.lib to the TARGETLIBS macro and compile the program with –DPSAPI_VERSION=1. To use run-time dynamic linking, load Psapi.dll.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The psapi.h header defines GetDeviceDriverFileName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} ImageBase The load address of the device driver.
     * @param {PWSTR} lpFilename A pointer to the buffer that receives the path to the device driver.
     * @param {Integer} nSize The size of the <i>lpFilename</i> buffer, in characters. If the buffer is not large enough to store the path plus the terminating null character, the string is truncated.
     * @returns {Integer} If the function succeeds, the return value specifies the length of the string copied to the buffer, not including any terminating null character.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-getdevicedriverfilenamew
     * @since windows5.1.2600
     */
    static GetDeviceDriverFileNameW(ImageBase, lpFilename, nSize) {
        lpFilename := lpFilename is String ? StrPtr(lpFilename) : lpFilename

        ImageBaseMarshal := ImageBase is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("PSAPI.dll\GetDeviceDriverFileNameW", ImageBaseMarshal, ImageBase, "ptr", lpFilename, "uint", nSize, "uint")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves information about the pages currently added to the working set of the specified process.
     * @remarks
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes 
     *     version numbers for the PSAPI functions. The PSAPI version number affects the name used to call the function and 
     *     the library that a program must load.
     * 
     * If <b>PSAPI_VERSION</b> is 2 or greater, this function is defined as 
     *     <b>K32QueryWorkingSet</b> in Psapi.h and exported in 
     *     Kernel32.lib and Kernel32.dll. If <b>PSAPI_VERSION</b> is 1, this 
     *     function is defined as <b>QueryWorkingSet</b> in 
     *     Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls 
     *     <b>K32QueryWorkingSet</b>.
     * 
     * Programs that must run on earlier versions of Windows as well as Windows 7 and later versions 
     *     should always call this function as <b>QueryWorkingSet</b>. 
     *     To ensure correct resolution of symbols, add Psapi.lib to the 
     *     <b>TARGETLIBS</b> macro and compile the program with 
     *     <b>-DPSAPI_VERSION=1</b>. To use run-time dynamic linking, load 
     *     Psapi.dll.
     * @param {HANDLE} hProcess A handle to the process. The handle must have the <b>PROCESS_QUERY_INFORMATION</b> and 
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
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-queryworkingset
     * @since windows5.1.2600
     */
    static QueryWorkingSet(hProcess, pv, cb) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        A_LastError := 0

        result := DllCall("PSAPI.dll\QueryWorkingSet", "ptr", hProcess, "ptr", pv, "uint", cb, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves extended information about the pages at specific virtual addresses in the address space of the specified process.
     * @remarks
     * Unlike the <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-queryworkingset">QueryWorkingSet</a> function, which is limited to the working set of the target process, the <b>QueryWorkingSetEx</b> function can be used to query addresses that are not in the process working set but are still part of the process, such as AWE and large pages.
     * 
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes version numbers for the PSAPI functions. The PSAPI version number affects the name used to call the function and the library that a program must load.
     * 
     * If <b>PSAPI_VERSION</b> is 2 or greater, this function is defined as <b>K32QueryWorkingSetEx</b> in Psapi.h and exported in Kernel32.lib and Kernel32.dll. If <b>PSAPI_VERSION</b> is 1, this function is defined as <b>QueryWorkingSetEx</b> in Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls <b>K32QueryWorkingSetEx</b>.
     * 
     * Programs that must run on earlier versions of Windows as well as Windows 7 and later versions should always call this function as <b>QueryWorkingSetEx</b>. To ensure correct resolution of symbols, add Psapi.lib to the <b>TARGETLIBS</b> macro and compile the program with "–DPSAPI_VERSION=1". To use run-time dynamic linking, load Psapi.dll.
     * @param {HANDLE} hProcess A handle to the process. The handle must have the <b>PROCESS_QUERY_INFORMATION</b> access right. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Pointer} pv A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/psapi/ns-psapi-psapi_working_set_ex_information">PSAPI_WORKING_SET_EX_INFORMATION</a> structures. On input, each item in the array specifies a virtual address of interest. On output, each item in the array receives information about the corresponding virtual page.
     * @param {Integer} cb The size of the <i>pv</i> buffer, in bytes.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-queryworkingsetex
     * @since windows6.0.6000
     */
    static QueryWorkingSetEx(hProcess, pv, cb) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        A_LastError := 0

        result := DllCall("PSAPI.dll\QueryWorkingSetEx", "ptr", hProcess, "ptr", pv, "uint", cb, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves information about the memory usage of the specified process.
     * @remarks
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes 
     *     version numbers for the PSAPI functions. The PSAPI version number affects the name used to call the function and 
     *     the library that a program must load.
     * 
     * If **PSAPI_VERSION** is 2 or greater, this function is defined as 
     *     **K32GetProcessMemoryInfo** in Psapi.h and exported in 
     *     Kernel32.lib and Kernel32.dll. If **PSAPI_VERSION** is 1, this 
     *     function is defined as **GetProcessMemoryInfo** in 
     *     Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls 
     *     **K32GetProcessMemoryInfo**. 
     * 
     * Programs that must run on earlier versions of Windows as 
     *     well as Windows 7 and later versions should always call this function as 
     *     **GetProcessMemoryInfo**. To ensure correct resolution of symbols, 
     *     add Psapi.lib to the **TARGETLIBS** macro and compile the program with 
     *     **-DPSAPI_VERSION=1**. To use run-time dynamic linking, load Psapi.dll.
     * @param {HANDLE} Process A handle to the process. The handle must have the **PROCESS_QUERY_INFORMATION** or **PROCESS_QUERY_LIMITED_INFORMATION** access right. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * 
     * **Windows Server 2003 and Windows XP:** The handle must have the **PROCESS_QUERY_INFORMATION** and **PROCESS_VM_READ** access rights.
     * @param {Pointer} ppsmemCounters A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/psapi/ns-psapi-process_memory_counters">PROCESS_MEMORY_COUNTERS</a> or <a href="https://docs.microsoft.com/windows/desktop/api/psapi/ns-psapi-process_memory_counters_ex">PROCESS_MEMORY_COUNTERS_EX</a> structure that receives information about the memory usage of the process.
     * @param {Integer} cb The size of the 
     * <i>ppsmemCounters</i> structure, in bytes.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-getprocessmemoryinfo
     * @since windows5.1.2600
     */
    static GetProcessMemoryInfo(Process, ppsmemCounters, cb) {
        Process := Process is Win32Handle ? NumGet(Process, "ptr") : Process

        A_LastError := 0

        result := DllCall("PSAPI.dll\GetProcessMemoryInfo", "ptr", Process, "ptr", ppsmemCounters, "uint", cb, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the performance values contained in the PERFORMANCE_INFORMATION structure.
     * @remarks
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes version numbers for 
     *     the PSAPI functions. The PSAPI version number affects the name used to call the function and the library that a 
     *     program must load.
     * 
     * If PSAPI_VERSION is 2 or greater, this function is defined as 
     *     <b>K32GetPerformanceInfo</b> in Psapi.h and exported in Kernel32.lib and Kernel32.dll. If 
     *     PSAPI_VERSION is 1, this function is defined as 
     *     <b>GetPerformanceInfo</b> in Psapi.h and exported in 
     *     Psapi.lib and Psapi.dll as a wrapper that calls <b>K32GetPerformanceInfo</b>.
     * 
     * Programs that must run on earlier versions of Windows as well as Windows 7 and later versions 
     *     should always call this function as 
     *     <b>GetPerformanceInfo</b>. To ensure correct resolution 
     *     of symbols, add Psapi.lib to the TARGETLIBS macro and compile the program with 
     *     –DPSAPI_VERSION=1. To use run-time dynamic linking, load Psapi.dll.
     * @param {Pointer<PERFORMANCE_INFORMATION>} pPerformanceInformation A pointer to a 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/psapi/ns-psapi-performance_information">PERFORMANCE_INFORMATION</a> 
     *       structure that receives the performance information.
     * @param {Integer} cb The size of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/psapi/ns-psapi-performance_information">PERFORMANCE_INFORMATION</a> structure, in 
     *       bytes.
     * @returns {BOOL} If the function succeeds, the return value is TRUE. If the function fails, the return value is FALSE. To get 
     *        extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-getperformanceinfo
     * @since windows5.1.2600
     */
    static GetPerformanceInfo(pPerformanceInformation, cb) {
        A_LastError := 0

        result := DllCall("PSAPI.dll\GetPerformanceInfo", "ptr", pPerformanceInformation, "uint", cb, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Calls the callback routine for each installed pagefile in the system. (Unicode)
     * @remarks
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes 
     *     version numbers for the PSAPI functions. The PSAPI version number affects  the name used to call the function and 
     *     the library that a program must load.
     * 
     * If <b>PSAPI_VERSION</b> is 2 or greater, this function is defined as 
     *     <b>K32EnumPageFiles</b> in Psapi.h and exported in Kernel32.lib and 
     *     Kernel32.dll. If <b>PSAPI_VERSION</b> is 1, this function is defined as 
     *     <b>EnumPageFiles</b> in Psapi.h and exported in 
     *     Psapi.lib and Psapi.dll as a wrapper that calls 
     *     <b>K32EnumPageFiles</b>.
     * 
     * Programs that must run on earlier versions of Windows as well as Windows 7 and later versions 
     *     should always call this function as <b>EnumPageFiles</b>. To 
     *     ensure correct resolution of symbols, add Psapi.lib to the <b>TARGETLIBS</b> 
     *     macro and compile the program with –DPSAPI_VERSION=1. To use run-time dynamic linking, load 
     *     Psapi.dll.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The psapi.h header defines EnumPageFiles as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PENUM_PAGE_FILE_CALLBACKW>} pCallBackRoutine A pointer to the routine called for each pagefile. For more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nc-psapi-penum_page_file_callbacka">EnumPageFilesProc</a>.
     * @param {Pointer<Void>} pContext The user-defined data passed to the callback routine.
     * @returns {BOOL} If the function succeeds, the return value is <b>TRUE</b>. If the function fails, the 
     *        return value is <b>FALSE</b>. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-enumpagefilesw
     * @since windows5.1.2600
     */
    static EnumPageFilesW(pCallBackRoutine, pContext) {
        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("PSAPI.dll\EnumPageFilesW", "ptr", pCallBackRoutine, pContextMarshal, pContext, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Calls the callback routine for each installed pagefile in the system. (ANSI)
     * @remarks
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes 
     *     version numbers for the PSAPI functions. The PSAPI version number affects  the name used to call the function and 
     *     the library that a program must load.
     * 
     * If <b>PSAPI_VERSION</b> is 2 or greater, this function is defined as 
     *     <b>K32EnumPageFiles</b> in Psapi.h and exported in Kernel32.lib and 
     *     Kernel32.dll. If <b>PSAPI_VERSION</b> is 1, this function is defined as 
     *     <b>EnumPageFiles</b> in Psapi.h and exported in 
     *     Psapi.lib and Psapi.dll as a wrapper that calls 
     *     <b>K32EnumPageFiles</b>.
     * 
     * Programs that must run on earlier versions of Windows as well as Windows 7 and later versions 
     *     should always call this function as <b>EnumPageFiles</b>. To 
     *     ensure correct resolution of symbols, add Psapi.lib to the <b>TARGETLIBS</b> 
     *     macro and compile the program with –DPSAPI_VERSION=1. To use run-time dynamic linking, load 
     *     Psapi.dll.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The psapi.h header defines EnumPageFiles as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PENUM_PAGE_FILE_CALLBACKA>} pCallBackRoutine A pointer to the routine called for each pagefile. For more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nc-psapi-penum_page_file_callbacka">EnumPageFilesProc</a>.
     * @param {Pointer<Void>} pContext The user-defined data passed to the callback routine.
     * @returns {BOOL} If the function succeeds, the return value is <b>TRUE</b>. If the function fails, the 
     *        return value is <b>FALSE</b>. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-enumpagefilesa
     * @since windows5.1.2600
     */
    static EnumPageFilesA(pCallBackRoutine, pContext) {
        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("PSAPI.dll\EnumPageFilesA", "ptr", pCallBackRoutine, pContextMarshal, pContext, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the name of the executable file for the specified process. (ANSI)
     * @remarks
     * The file Psapi.dll is installed in the %windir%\System32 directory. If there is another copy of this DLL on your computer, it can lead to the following error when running applications on your system: "The procedure entry point GetProcessImageFileName could not be located in the dynamic link library PSAPI.DLL." To work around this problem, locate any versions that are not in the %windir%\System32 directory and delete or rename them, then restart.
     * 
     * The <b>GetProcessImageFileName</b> function returns the path in device form, rather than drive letters. For example, the file name C:\Windows\System32\Ctype.nls would look as follows in device form:
     * 
     * 
     * 
     * \Device\Harddisk0\Partition1\Windows\System32\Ctype.nls
     * 
     * To retrieve the module name of the current process, use the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulefilenamea">GetModuleFileName</a> function with a NULL module handle. This is more efficient than calling the <b>GetProcessImageFileName</b> function with a handle to the current process.
     * 
     * To retrieve the name of the main executable module for a remote process in win32 path format, use the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-queryfullprocessimagenamea">QueryFullProcessImageName</a> function.
     * 
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes 
     *     version numbers for the PSAPI functions. The PSAPI version number affects the name used to call the function and 
     *     the library that a program must load.
     * 
     * If <b>PSAPI_VERSION</b> is 2 or greater, this function is defined as 
     *     <b>K32GetProcessImageFileName</b> in Psapi.h and exported in 
     *     Kernel32.lib and Kernel32.dll. If <b>PSAPI_VERSION</b> is 1, this 
     *     function is defined as <b>GetProcessImageFileName</b> in 
     *     Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls 
     *     <b>K32GetProcessImageFileName</b>. 
     * 
     * Programs that must run on earlier versions of Windows as 
     *     well as Windows 7 and later versions should always call this function as 
     *     <b>GetProcessImageFileName</b>. To ensure correct resolution of symbols, 
     *     add Psapi.lib to the <b>TARGETLIBS</b> macro and compile the program with 
     *     <b>-DPSAPI_VERSION=1</b>. To use run-time dynamic linking, load Psapi.dll.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The psapi.h header defines GetProcessImageFileName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {HANDLE} hProcess A handle to the process. The handle must have the <b>PROCESS_QUERY_INFORMATION</b>  or <b>PROCESS_QUERY_LIMITED_INFORMATION</b> access right. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>The handle must have the <b>PROCESS_QUERY_INFORMATION</b> access right.
     * @param {PSTR} lpImageFileName A pointer to a buffer that receives the full path to the executable file.
     * @param {Integer} nSize The size of the <i>lpImageFileName</i> buffer, in characters.
     * @returns {Integer} If the function succeeds, the return value specifies the length of the string copied to the buffer.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-getprocessimagefilenamea
     * @since windows5.1.2600
     */
    static GetProcessImageFileNameA(hProcess, lpImageFileName, nSize) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess
        lpImageFileName := lpImageFileName is String ? StrPtr(lpImageFileName) : lpImageFileName

        A_LastError := 0

        result := DllCall("PSAPI.dll\GetProcessImageFileNameA", "ptr", hProcess, "ptr", lpImageFileName, "uint", nSize, "uint")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the name of the executable file for the specified process. (Unicode)
     * @remarks
     * The file Psapi.dll is installed in the %windir%\System32 directory. If there is another copy of this DLL on your computer, it can lead to the following error when running applications on your system: "The procedure entry point GetProcessImageFileName could not be located in the dynamic link library PSAPI.DLL." To work around this problem, locate any versions that are not in the %windir%\System32 directory and delete or rename them, then restart.
     * 
     * The <b>GetProcessImageFileName</b> function returns the path in device form, rather than drive letters. For example, the file name C:\Windows\System32\Ctype.nls would look as follows in device form:
     * 
     * 
     * 
     * \Device\Harddisk0\Partition1\Windows\System32\Ctype.nls
     * 
     * To retrieve the module name of the current process, use the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulefilenamea">GetModuleFileName</a> function with a NULL module handle. This is more efficient than calling the <b>GetProcessImageFileName</b> function with a handle to the current process.
     * 
     * To retrieve the name of the main executable module for a remote process in win32 path format, use the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-queryfullprocessimagenamea">QueryFullProcessImageName</a> function.
     * 
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes 
     *     version numbers for the PSAPI functions. The PSAPI version number affects the name used to call the function and 
     *     the library that a program must load.
     * 
     * If <b>PSAPI_VERSION</b> is 2 or greater, this function is defined as 
     *     <b>K32GetProcessImageFileName</b> in Psapi.h and exported in 
     *     Kernel32.lib and Kernel32.dll. If <b>PSAPI_VERSION</b> is 1, this 
     *     function is defined as <b>GetProcessImageFileName</b> in 
     *     Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls 
     *     <b>K32GetProcessImageFileName</b>. 
     * 
     * Programs that must run on earlier versions of Windows as 
     *     well as Windows 7 and later versions should always call this function as 
     *     <b>GetProcessImageFileName</b>. To ensure correct resolution of symbols, 
     *     add Psapi.lib to the <b>TARGETLIBS</b> macro and compile the program with 
     *     <b>-DPSAPI_VERSION=1</b>. To use run-time dynamic linking, load Psapi.dll.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The psapi.h header defines GetProcessImageFileName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {HANDLE} hProcess A handle to the process. The handle must have the <b>PROCESS_QUERY_INFORMATION</b>  or <b>PROCESS_QUERY_LIMITED_INFORMATION</b> access right. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>The handle must have the <b>PROCESS_QUERY_INFORMATION</b> access right.
     * @param {PWSTR} lpImageFileName A pointer to a buffer that receives the full path to the executable file.
     * @param {Integer} nSize The size of the <i>lpImageFileName</i> buffer, in characters.
     * @returns {Integer} If the function succeeds, the return value specifies the length of the string copied to the buffer.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-getprocessimagefilenamew
     * @since windows5.1.2600
     */
    static GetProcessImageFileNameW(hProcess, lpImageFileName, nSize) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess
        lpImageFileName := lpImageFileName is String ? StrPtr(lpImageFileName) : lpImageFileName

        A_LastError := 0

        result := DllCall("PSAPI.dll\GetProcessImageFileNameW", "ptr", hProcess, "ptr", lpImageFileName, "uint", nSize, "uint")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the process identifier for each process object in the system.
     * @remarks
     * It is a good idea to use a large array, because it is hard to predict how many processes there will be at the time you call 
     * <b>EnumProcesses</b>. 
     * 
     * To determine how many processes were enumerated, divide the <i>lpcbNeeded</i> value by sizeof(DWORD). There is no indication given when the buffer is too small to store all process identifiers. Therefore, if <i>lpcbNeeded</i> equals <i>cb</i>, consider retrying the call with a larger array.
     * 
     * To obtain process handles for the processes whose identifiers you have just obtained, call the <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-openprocess">OpenProcess</a> function.
     * 
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes version numbers for the PSAPI functions. The PSAPI version number affects  the name used to call the function and the library that a program must load. 
     * 
     * If PSAPI_VERSION is 2 or greater, this function is defined as <b>K32EnumProcesses</b> in Psapi.h and exported in Kernel32.lib and Kernel32.dll. If PSAPI_VERSION is 1, this function is defined as <b>EnumProcesses</b> in Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls <b>K32EnumProcesses</b>. 
     * 
     * Programs that must run on earlier versions of Windows as well as Windows 7 and later versions should always call this function as <b>EnumProcesses</b>. To ensure correct resolution of symbols, add Psapi.lib to the TARGETLIBS macro and compile the program with –DPSAPI_VERSION=1. To use run-time dynamic linking, load Psapi.dll.
     * @param {Pointer} lpidProcess A pointer to an array that receives the list of process identifiers.
     * @param {Integer} cb The size of the <i>pProcessIds</i> array, in bytes.
     * @param {Pointer<Integer>} lpcbNeeded The number of bytes returned in the <i>pProcessIds</i> array.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-enumprocesses
     */
    static K32EnumProcesses(lpidProcess, cb, lpcbNeeded) {
        lpcbNeededMarshal := lpcbNeeded is VarRef ? "uint*" : "ptr"

        result := DllCall("KERNEL32.dll\K32EnumProcesses", "ptr", lpidProcess, "uint", cb, lpcbNeededMarshal, lpcbNeeded, "int")
        return result
    }

    /**
     * Retrieves a handle for each module in the specified process.
     * @remarks
     * The <b>EnumProcessModules</b> function is primarily 
     *     designed for use by debuggers and similar applications that must extract module information from another process. 
     *     If the module list in the target process is corrupted or not yet initialized, or if the module list changes during 
     *     the function call as a result of DLLs being loaded or unloaded, 
     *     <b>EnumProcessModules</b> may fail or return incorrect 
     *     information.
     * 
     * It is a good idea to specify a large array of <b>HMODULE</b> values, because it is hard 
     *     to predict how many modules there will be in the process at the time you call 
     *     <b>EnumProcessModules</b>. To determine if the 
     *     <i>lphModule</i> array is too small to hold all module handles for the process, compare the 
     *     value returned in <i>lpcbNeeded</i> with the value specified in <i>cb</i>. 
     *     If <i>lpcbNeeded</i> is greater than <i>cb</i>, increase the size of the 
     *     array and call <b>EnumProcessModules</b> again.
     * 
     * To determine how many modules were enumerated by the call to 
     *     <b>EnumProcessModules</b>, divide the resulting value in 
     *     the <i>lpcbNeeded</i> parameter by 
     *     <c>sizeof(HMODULE)</c>.
     * 
     * The <b>EnumProcessModules</b> function does not 
     *     retrieve handles for modules that were loaded with the <b>LOAD_LIBRARY_AS_DATAFILE</b> or similar  flags. 
     *     For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a>.
     * 
     * Do not call <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> on any of the handles returned 
     *     by this function. The information comes from a snapshot, so there are no resources to be freed.
     * 
     * If this function is called from a 32-bit application running on WOW64, it can only enumerate the modules of a 
     *     32-bit process. If the process is a 64-bit process, this function fails and the last error code is 
     *     <b>ERROR_PARTIAL_COPY</b> (299).
     * 
     * To take a snapshot of specified processes and the heaps, modules, and threads used by these processes, use the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-createtoolhelp32snapshot">CreateToolhelp32Snapshot</a> function.
     * 
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes 
     *     version numbers for the PSAPI functions. The PSAPI version number affects the name used to call the function and 
     *     the library that a program must load.
     * 
     * If <b>PSAPI_VERSION</b> is 2 or greater, this function is defined as 
     *     <b>K32EnumProcessModules</b> in Psapi.h and exported in 
     *     Kernel32.lib and Kernel32.dll. If <b>PSAPI_VERSION</b> is 1, this 
     *     function is defined as <b>EnumProcessModules</b> in 
     *     Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls 
     *     <b>K32EnumProcessModules</b>.
     * 
     * Programs that must run on earlier versions of Windows as well as Windows 7 and later versions 
     *     should always call this function as 
     *     <b>EnumProcessModules</b>. To ensure correct resolution 
     *     of symbols, add Psapi.lib to the <b>TARGETLIBS</b> macro and compile the 
     *     program with <b>-DPSAPI_VERSION=1</b>. To use run-time dynamic linking, load 
     *     Psapi.dll.
     * @param {HANDLE} hProcess A handle to the process.
     * @param {Pointer} lphModule An array that receives the list of module handles.
     * @param {Integer} cb The size of the <i>lphModule</i> array, in bytes.
     * @param {Pointer<Integer>} lpcbNeeded The number of bytes required to store all module handles in the <i>lphModule</i> 
     *       array.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-enumprocessmodules
     */
    static K32EnumProcessModules(hProcess, lphModule, cb, lpcbNeeded) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        lpcbNeededMarshal := lpcbNeeded is VarRef ? "uint*" : "ptr"

        result := DllCall("KERNEL32.dll\K32EnumProcessModules", "ptr", hProcess, "ptr", lphModule, "uint", cb, lpcbNeededMarshal, lpcbNeeded, "int")
        return result
    }

    /**
     * Retrieves a handle for each module in the specified process that meets the specified filter criteria.
     * @remarks
     * The <b>EnumProcessModulesEx</b> function is primarily designed for use by debuggers and similar applications that must extract module information from another process. If the module list in the target process is corrupted or not yet initialized, or if the module list changes during the function call as a result of DLLs being loaded or unloaded, <b>EnumProcessModulesEx</b> may fail or return incorrect information.
     * 
     * This function is intended primarily for 64-bit applications. If the function is called by a 32-bit application running under WOW64, the <i>dwFilterFlag</i> option is ignored and the function provides the same results as the <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-enumprocessmodules">EnumProcessModules</a> function.
     * 
     * It is a good idea to specify a large array of <b>HMODULE</b> values, because it is hard to predict how many modules there will be in the process at the time you call 
     * <b>EnumProcessModulesEx</b>. To determine if the <i>lphModule</i> array is too small to hold all module handles for the process, compare the value returned in <i>lpcbNeeded</i> with the value specified in <i>cb</i>. If <i>lpcbNeeded</i> is greater than <i>cb</i>, increase the size of the array and call 
     * <b>EnumProcessModulesEx</b> again.
     * 
     * To determine how many modules were enumerated by the call to 
     * <b>EnumProcessModulesEx</b>, divide the resulting value in the <i>lpcbNeeded</i> parameter by <c>sizeof(HMODULE)</c>.
     * 
     * The <b>EnumProcessModulesEx</b> function does not retrieve handles for modules that were loaded with the <b>LOAD_LIBRARY_AS_DATAFILE</b> flag. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a>.
     * 
     * Do not call <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> on any of the handles returned by this function. The information comes from a snapshot, so there are no resources to be freed.
     * 
     * To take a snapshot of specified processes and the heaps, modules, and threads used by these processes, use the <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-createtoolhelp32snapshot">CreateToolhelp32Snapshot</a> function.
     * 
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes version numbers for the PSAPI functions. The PSAPI version number affects  the name used to call the function and the library that a program must load. 
     * 
     * If PSAPI_VERSION is 2 or greater, this function is defined as <b>K32EnumProcessModulesEx</b> in Psapi.h and exported in Kernel32.lib and Kernel32.dll. If PSAPI_VERSION is 1, this function is defined as <b>EnumProcessModulesEx</b> in Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls <b>K32EnumProcessModulesEx</b>. 
     * 
     * Programs that must run on earlier versions of Windows as well as Windows 7 and later versions should always call this function as <b>EnumProcessModulesEx</b>. To ensure correct resolution of symbols, add Psapi.lib to the TARGETLIBS macro and compile the program with –DPSAPI_VERSION=1. To use run-time dynamic linking, load Psapi.dll.
     * @param {HANDLE} hProcess A handle to the process.
     * @param {Pointer} lphModule An array that receives the list of module handles.
     * @param {Integer} cb The size of the <i>lphModule</i> array, in bytes.
     * @param {Pointer<Integer>} lpcbNeeded The number of bytes required to store all module handles in the <i>lphModule</i> array.
     * @param {Integer} dwFilterFlag 
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-enumprocessmodulesex
     */
    static K32EnumProcessModulesEx(hProcess, lphModule, cb, lpcbNeeded, dwFilterFlag) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        lpcbNeededMarshal := lpcbNeeded is VarRef ? "uint*" : "ptr"

        result := DllCall("KERNEL32.dll\K32EnumProcessModulesEx", "ptr", hProcess, "ptr", lphModule, "uint", cb, lpcbNeededMarshal, lpcbNeeded, "uint", dwFilterFlag, "int")
        return result
    }

    /**
     * Retrieves the base name of the specified module. (Unicode)
     * @remarks
     * The <b>GetModuleBaseName</b> function is primarily designed for use by debuggers and similar applications that must extract module information from another process. If the module list in the target process is corrupted or is not yet initialized, or if the module list changes during the function call as a result of DLLs being loaded or unloaded, <b>GetModuleBaseName</b> may fail or return incorrect information.
     * 
     * 
     * 
     * To retrieve the base name of a module in the current process, use the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulefilenamea">GetModuleFileName</a> function to retrieve the full module name and then use a function call such as <c>strrchr(szmodulename, '\\')</c> to scan to the beginning of the base name within the module name string. This is more efficient and more reliable than calling  <b>GetModuleBaseName</b>  with a handle to the current process.
     * 
     * 
     * 
     * To retrieve the base name of the main executable module for a remote process, use the <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-getprocessimagefilenamea">GetProcessImageFileName</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-queryfullprocessimagenamea">QueryFullProcessImageName</a> function to retrieve the module name and then use the <c>strrchr</c> function as described in the previous paragraph. This is more efficient and more reliable than calling  <b>GetModuleBaseName</b>  with a NULL module handle.
     * 
     * 
     * The <b>GetModuleBaseName</b> function does not retrieve the base name for modules that were loaded with the <b>LOAD_LIBRARY_AS_DATAFILE</b> flag. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a>.
     * 
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes 
     *     version numbers for the PSAPI functions. The PSAPI version number affects the name used to call the function and 
     *     the library that a program must load.
     * 
     * If <b>PSAPI_VERSION</b> is 2 or greater, this function is defined as 
     *     <b>K32GetModuleBaseName</b> in Psapi.h and exported in 
     *     Kernel32.lib and Kernel32.dll. If <b>PSAPI_VERSION</b> is 1, this 
     *     function is defined as <b>GetModuleBaseName</b> in 
     *     Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls 
     *     <b>K32GetModuleBaseName</b>. 
     * 
     * Programs that must run on earlier versions of Windows as 
     *     well as Windows 7 and later versions should always call this function as 
     *     <b>GetModuleBaseName</b>. To ensure correct resolution of symbols, 
     *     add Psapi.lib to the <b>TARGETLIBS</b> macro and compile the program with 
     *     <b>-DPSAPI_VERSION=1</b>. To use run-time dynamic linking, load Psapi.dll.
     * @param {HANDLE} hProcess A handle to the process that contains the module. 
     * 
     * The handle must have the <b>PROCESS_QUERY_INFORMATION</b> and <b>PROCESS_VM_READ</b> access rights. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {HMODULE} hModule A handle to the module. If this parameter is NULL, this function  returns the name of the file used to create the calling process.
     * @param {PSTR} lpBaseName A pointer to the buffer that receives the base name of the module. If the base name is longer than maximum number of characters specified by the <i>nSize</i> parameter, the base name is truncated.
     * @param {Integer} nSize The size of the <i>lpBaseName</i> buffer, in characters.
     * @returns {Integer} If the function succeeds, the return value specifies the length of the string copied to the buffer, in characters.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-getmodulebasenamew
     */
    static K32GetModuleBaseNameA(hProcess, hModule, lpBaseName, nSize) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess
        hModule := hModule is Win32Handle ? NumGet(hModule, "ptr") : hModule
        lpBaseName := lpBaseName is String ? StrPtr(lpBaseName) : lpBaseName

        result := DllCall("KERNEL32.dll\K32GetModuleBaseNameA", "ptr", hProcess, "ptr", hModule, "ptr", lpBaseName, "uint", nSize, "uint")
        return result
    }

    /**
     * Retrieves the base name of the specified module. (Unicode)
     * @remarks
     * The <b>GetModuleBaseName</b> function is primarily designed for use by debuggers and similar applications that must extract module information from another process. If the module list in the target process is corrupted or is not yet initialized, or if the module list changes during the function call as a result of DLLs being loaded or unloaded, <b>GetModuleBaseName</b> may fail or return incorrect information.
     * 
     * 
     * 
     * To retrieve the base name of a module in the current process, use the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulefilenamea">GetModuleFileName</a> function to retrieve the full module name and then use a function call such as <c>strrchr(szmodulename, '\\')</c> to scan to the beginning of the base name within the module name string. This is more efficient and more reliable than calling  <b>GetModuleBaseName</b>  with a handle to the current process.
     * 
     * 
     * 
     * To retrieve the base name of the main executable module for a remote process, use the <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-getprocessimagefilenamea">GetProcessImageFileName</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-queryfullprocessimagenamea">QueryFullProcessImageName</a> function to retrieve the module name and then use the <c>strrchr</c> function as described in the previous paragraph. This is more efficient and more reliable than calling  <b>GetModuleBaseName</b>  with a NULL module handle.
     * 
     * 
     * The <b>GetModuleBaseName</b> function does not retrieve the base name for modules that were loaded with the <b>LOAD_LIBRARY_AS_DATAFILE</b> flag. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a>.
     * 
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes 
     *     version numbers for the PSAPI functions. The PSAPI version number affects the name used to call the function and 
     *     the library that a program must load.
     * 
     * If <b>PSAPI_VERSION</b> is 2 or greater, this function is defined as 
     *     <b>K32GetModuleBaseName</b> in Psapi.h and exported in 
     *     Kernel32.lib and Kernel32.dll. If <b>PSAPI_VERSION</b> is 1, this 
     *     function is defined as <b>GetModuleBaseName</b> in 
     *     Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls 
     *     <b>K32GetModuleBaseName</b>. 
     * 
     * Programs that must run on earlier versions of Windows as 
     *     well as Windows 7 and later versions should always call this function as 
     *     <b>GetModuleBaseName</b>. To ensure correct resolution of symbols, 
     *     add Psapi.lib to the <b>TARGETLIBS</b> macro and compile the program with 
     *     <b>-DPSAPI_VERSION=1</b>. To use run-time dynamic linking, load Psapi.dll.
     * @param {HANDLE} hProcess A handle to the process that contains the module. 
     * 
     * The handle must have the <b>PROCESS_QUERY_INFORMATION</b> and <b>PROCESS_VM_READ</b> access rights. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {HMODULE} hModule A handle to the module. If this parameter is NULL, this function  returns the name of the file used to create the calling process.
     * @param {PWSTR} lpBaseName A pointer to the buffer that receives the base name of the module. If the base name is longer than maximum number of characters specified by the <i>nSize</i> parameter, the base name is truncated.
     * @param {Integer} nSize The size of the <i>lpBaseName</i> buffer, in characters.
     * @returns {Integer} If the function succeeds, the return value specifies the length of the string copied to the buffer, in characters.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-getmodulebasenamew
     */
    static K32GetModuleBaseNameW(hProcess, hModule, lpBaseName, nSize) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess
        hModule := hModule is Win32Handle ? NumGet(hModule, "ptr") : hModule
        lpBaseName := lpBaseName is String ? StrPtr(lpBaseName) : lpBaseName

        result := DllCall("KERNEL32.dll\K32GetModuleBaseNameW", "ptr", hProcess, "ptr", hModule, "ptr", lpBaseName, "uint", nSize, "uint")
        return result
    }

    /**
     * Retrieves the fully qualified path for the file containing the specified module. (Unicode)
     * @remarks
     * The <b>GetModuleFileNameEx</b> function is primarily designed for use by debuggers and similar applications that must extract module information from another process. If the module list in the target process is corrupted or is not yet initialized, or if the module list changes during the function call as a result of DLLs being loaded or unloaded, <b>GetModuleFileNameEx</b> may fail or return incorrect information.
     * 
     * To retrieve the name of a module in the current process, use the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulefilenamew">GetModuleFileName</a> function. This is more efficient and more reliable than calling <b>GetModuleFileNameEx</b> with a handle to the current process.
     * 
     * To retrieve the name of the main executable module for a remote process, use the <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-getprocessimagefilenamew">GetProcessImageFileName</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-queryfullprocessimagenamew">QueryFullProcessImageName</a> function. This is more efficient and more reliable than calling the <b>GetModuleFileNameEx</b> function with a NULL module handle.
     * 
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes 
     *     version numbers for the PSAPI functions. The PSAPI version number affects the name used to call the function and 
     *     the library that a program must load.
     * 
     * If <b>PSAPI_VERSION</b> is 2 or greater, this function is defined as 
     *     <b>K32GetModuleFileNameEx</b> in Psapi.h and exported in 
     *     Kernel32.lib and Kernel32.dll. If <b>PSAPI_VERSION</b> is 1, this 
     *     function is defined as <b>GetModuleFileNameEx</b> in 
     *     Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls 
     *     <b>K32GetModuleFileNameEx</b>. 
     * 
     * Programs that must run on earlier versions of Windows as 
     *     well as Windows 7 and later versions should always call this function as 
     *     <b>GetModuleFileNameEx</b>. To ensure correct resolution of symbols, 
     *     add Psapi.lib to the <b>TARGETLIBS</b> macro and compile the program with 
     *     <b>-DPSAPI_VERSION=1</b>. To use run-time dynamic linking, load Psapi.dll.
     * @param {HANDLE} hProcess A handle to the process that contains the module.  
     * 
     * The handle must have the <b>PROCESS_QUERY_INFORMATION</b> and <b>PROCESS_VM_READ</b> access rights. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * 
     * <b>Windows 10 and later, Windows Server 2016 and later</b>: If the <i>hModule</i> parameter is NULL, then the handle requires only <b>PROCESS_QUERY_LIMITED_INFORMATION</b> access rights.
     * 
     * The <b>GetModuleFileNameEx</b> function does not retrieve the path for modules  that were loaded using the <b>LOAD_LIBRARY_AS_DATAFILE</b> flag. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexw">LoadLibraryEx</a>.
     * @param {HMODULE} hModule A handle to the module. If this parameter is NULL, <b>GetModuleFileNameEx</b> returns the path of the executable file of the process specified in <i>hProcess</i>.
     * @param {PSTR} lpFilename A pointer to a buffer that receives the fully qualified path to the module. If the size of the file name is larger than the value of the <i>nSize</i> parameter, the function succeeds but the file name is truncated and null-terminated.
     * @param {Integer} nSize The size of the <i>lpFilename</i> buffer, in characters.
     * @returns {Integer} If the function succeeds, the return value specifies the length of the string copied to the buffer.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-getmodulefilenameexw
     */
    static K32GetModuleFileNameExA(hProcess, hModule, lpFilename, nSize) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess
        hModule := hModule is Win32Handle ? NumGet(hModule, "ptr") : hModule
        lpFilename := lpFilename is String ? StrPtr(lpFilename) : lpFilename

        result := DllCall("KERNEL32.dll\K32GetModuleFileNameExA", "ptr", hProcess, "ptr", hModule, "ptr", lpFilename, "uint", nSize, "uint")
        return result
    }

    /**
     * Retrieves the fully qualified path for the file containing the specified module. (Unicode)
     * @remarks
     * The <b>GetModuleFileNameEx</b> function is primarily designed for use by debuggers and similar applications that must extract module information from another process. If the module list in the target process is corrupted or is not yet initialized, or if the module list changes during the function call as a result of DLLs being loaded or unloaded, <b>GetModuleFileNameEx</b> may fail or return incorrect information.
     * 
     * To retrieve the name of a module in the current process, use the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulefilenamew">GetModuleFileName</a> function. This is more efficient and more reliable than calling <b>GetModuleFileNameEx</b> with a handle to the current process.
     * 
     * To retrieve the name of the main executable module for a remote process, use the <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-getprocessimagefilenamew">GetProcessImageFileName</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-queryfullprocessimagenamew">QueryFullProcessImageName</a> function. This is more efficient and more reliable than calling the <b>GetModuleFileNameEx</b> function with a NULL module handle.
     * 
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes 
     *     version numbers for the PSAPI functions. The PSAPI version number affects the name used to call the function and 
     *     the library that a program must load.
     * 
     * If <b>PSAPI_VERSION</b> is 2 or greater, this function is defined as 
     *     <b>K32GetModuleFileNameEx</b> in Psapi.h and exported in 
     *     Kernel32.lib and Kernel32.dll. If <b>PSAPI_VERSION</b> is 1, this 
     *     function is defined as <b>GetModuleFileNameEx</b> in 
     *     Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls 
     *     <b>K32GetModuleFileNameEx</b>. 
     * 
     * Programs that must run on earlier versions of Windows as 
     *     well as Windows 7 and later versions should always call this function as 
     *     <b>GetModuleFileNameEx</b>. To ensure correct resolution of symbols, 
     *     add Psapi.lib to the <b>TARGETLIBS</b> macro and compile the program with 
     *     <b>-DPSAPI_VERSION=1</b>. To use run-time dynamic linking, load Psapi.dll.
     * @param {HANDLE} hProcess A handle to the process that contains the module.  
     * 
     * The handle must have the <b>PROCESS_QUERY_INFORMATION</b> and <b>PROCESS_VM_READ</b> access rights. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * 
     * <b>Windows 10 and later, Windows Server 2016 and later</b>: If the <i>hModule</i> parameter is NULL, then the handle requires only <b>PROCESS_QUERY_LIMITED_INFORMATION</b> access rights.
     * 
     * The <b>GetModuleFileNameEx</b> function does not retrieve the path for modules  that were loaded using the <b>LOAD_LIBRARY_AS_DATAFILE</b> flag. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexw">LoadLibraryEx</a>.
     * @param {HMODULE} hModule A handle to the module. If this parameter is NULL, <b>GetModuleFileNameEx</b> returns the path of the executable file of the process specified in <i>hProcess</i>.
     * @param {PWSTR} lpFilename A pointer to a buffer that receives the fully qualified path to the module. If the size of the file name is larger than the value of the <i>nSize</i> parameter, the function succeeds but the file name is truncated and null-terminated.
     * @param {Integer} nSize The size of the <i>lpFilename</i> buffer, in characters.
     * @returns {Integer} If the function succeeds, the return value specifies the length of the string copied to the buffer.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-getmodulefilenameexw
     */
    static K32GetModuleFileNameExW(hProcess, hModule, lpFilename, nSize) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess
        hModule := hModule is Win32Handle ? NumGet(hModule, "ptr") : hModule
        lpFilename := lpFilename is String ? StrPtr(lpFilename) : lpFilename

        result := DllCall("KERNEL32.dll\K32GetModuleFileNameExW", "ptr", hProcess, "ptr", hModule, "ptr", lpFilename, "uint", nSize, "uint")
        return result
    }

    /**
     * Retrieves information about the specified module in the MODULEINFO structure.
     * @remarks
     * To get information for the calling process, pass the handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getcurrentprocess">GetCurrentProcess</a>.
     * 
     * The <b>GetModuleInformation</b> function does not retrieve information for modules that were loaded with the <b>LOAD_LIBRARY_AS_DATAFILE</b> flag. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a>.
     * 
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes 
     *     version numbers for the PSAPI functions. The PSAPI version number affects the name used to call the function and 
     *     the library that a program must load.
     * 
     * If <b>PSAPI_VERSION</b> is 2 or greater, this function is defined as 
     *     <b>K32GetModuleInformation</b> in Psapi.h and exported in 
     *     Kernel32.lib and Kernel32.dll. If <b>PSAPI_VERSION</b> is 1, this 
     *     function is defined as K32GetModuleInformation in 
     *     Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls 
     *     <b>K32GetModuleInformation</b>. 
     * 
     * Programs that must run on earlier versions of Windows as 
     *     well as Windows 7 and later versions should always call this function as 
     *     K32GetModuleInformation. To ensure correct resolution of symbols, 
     *     add Psapi.lib to the <b>TARGETLIBS</b> macro and compile the program with 
     *     <b>-DPSAPI_VERSION=1</b>. To use run-time dynamic linking, load Psapi.dll.
     * @param {HANDLE} hProcess A handle to the process that contains the module.
     * 
     * The handle must have the <b>PROCESS_QUERY_INFORMATION</b> and <b>PROCESS_VM_READ</b> access rights. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {HMODULE} hModule A handle to the module.
     * @param {Pointer<MODULEINFO>} lpmodinfo A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/psapi/ns-psapi-moduleinfo">MODULEINFO</a> structure that receives information about the module.
     * @param {Integer} cb The size of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/psapi/ns-psapi-moduleinfo">MODULEINFO</a> structure, in bytes.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-getmoduleinformation
     */
    static K32GetModuleInformation(hProcess, hModule, lpmodinfo, cb) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess
        hModule := hModule is Win32Handle ? NumGet(hModule, "ptr") : hModule

        result := DllCall("KERNEL32.dll\K32GetModuleInformation", "ptr", hProcess, "ptr", hModule, "ptr", lpmodinfo, "uint", cb, "int")
        return result
    }

    /**
     * Removes as many pages as possible from the working set of the specified process.
     * @remarks
     * You can also empty the working set by calling  the <a href="https://docs.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-setprocessworkingsetsize">SetProcessWorkingSetSize</a> or <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-setprocessworkingsetsizeex">SetProcessWorkingSetSizeEx</a> function with the <i>dwMinimumWorkingSetSize</i> and <i>dwMaximumWorkingSetSize</i> parameters set to the value <c>(SIZE_T)(-1)</c>.
     * 
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes 
     *     version numbers for the PSAPI functions. The PSAPI version number affects the name used to call the function and 
     *     the library that a program must load.
     * 
     * If <b>PSAPI_VERSION</b> is 2 or greater, this function is defined as 
     *     <b>K32EmptyWorkingSet</b> in Psapi.h and exported in 
     *     Kernel32.lib and Kernel32.dll. If <b>PSAPI_VERSION</b> is 1, this 
     *     function is defined as K32EmptyWorkingSet in 
     *     Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls 
     *     <b>K32EmptyWorkingSet</b>. 
     * 
     * Programs that must run on earlier versions of Windows as 
     *     well as Windows 7 and later versions should always call this function as 
     *     K32EmptyWorkingSet. To ensure correct resolution of symbols, 
     *     add Psapi.lib to the <b>TARGETLIBS</b> macro and compile the program with 
     *     <b>-DPSAPI_VERSION=1</b>. To use run-time dynamic linking, load Psapi.dll.
     * @param {HANDLE} hProcess A handle to the process. The handle must have the <b>PROCESS_QUERY_INFORMATION</b> or <b>PROCESS_QUERY_LIMITED_INFORMATION</b> access right and the <b>PROCESS_SET_QUOTA</b> access right. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-emptyworkingset
     */
    static K32EmptyWorkingSet(hProcess) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        result := DllCall("KERNEL32.dll\K32EmptyWorkingSet", "ptr", hProcess, "int")
        return result
    }

    /**
     * Initiates monitoring of the working set of the specified process.
     * @remarks
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes 
     *     version numbers for the PSAPI functions. The PSAPI version number affects the name used to call the function and 
     *     the library that a program must load.
     * 
     * If <b>PSAPI_VERSION</b> is 2 or greater, this function is defined as 
     *     <b>K32InitializeProcessForWsWatch</b> in Psapi.h and exported in 
     *     Kernel32.lib and Kernel32.dll. If <b>PSAPI_VERSION</b> is 1, this 
     *     function is defined as <b>InitializeProcessForWsWatch</b> in 
     *     Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls 
     *     <b>K32InitializeProcessForWsWatch</b>. 
     * 
     * Programs that must run on earlier versions of Windows as 
     *     well as Windows 7 and later versions should always call this function as 
     *     <b>InitializeProcessForWsWatch</b>. To ensure correct resolution of symbols, 
     *     add Psapi.lib to the <b>TARGETLIBS</b> macro and compile the program with 
     *     <b>-DPSAPI_VERSION=1</b>. To use run-time dynamic linking, load Psapi.dll.
     * @param {HANDLE} hProcess A handle to the process. The handle must have the PROCESS_QUERY_INFORMATION access right. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-initializeprocessforwswatch
     */
    static K32InitializeProcessForWsWatch(hProcess) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        result := DllCall("KERNEL32.dll\K32InitializeProcessForWsWatch", "ptr", hProcess, "int")
        return result
    }

    /**
     * Retrieves information about the pages that have been added to the working set of the specified process since the last time this function or the InitializeProcessForWsWatch function was called.
     * @remarks
     * The operating system uses one buffer per process to maintain working set change records. If more than one 
     *     application (or multiple threads in the same application) calls this function with the same process handle, 
     *     neither application will have a complete accounting of the working set changes because each call empties the 
     *     buffer.
     * 
     * The operating system does not record new change records while it is processing the query (and emptying the 
     *     buffer). The function sets the error code to <b>NO_MORE_ENTRIES</b> if a concurrent query is 
     *     received while it is processing another query.
     * 
     * If the buffer becomes full, no new records are added to the buffer until this function or the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-initializeprocessforwswatch">InitializeProcessForWsWatch</a> function is 
     *     called. You should call this method with enough frequency to prevent possible data loss. If records are lost, the 
     *     array is terminated with a structure whose <b>FaultingPc</b> member is NULL and whose 
     *     <b>FaultingVa</b> member is set to the number of records that were lost.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>If records are lost, the array is terminated with a structure whose <b>FaultingPc</b> 
     *       member is NULL and whose <b>FaultingVa</b> member is 1.
     * 
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes 
     *     version numbers for the PSAPI functions. The PSAPI version number affects the name used to call the function and 
     *     the library that a program must load.
     * 
     * If <b>PSAPI_VERSION</b> is 2 or greater, this function is defined as 
     *     <b>K32GetWsChanges</b> in Psapi.h and exported in 
     *     Kernel32.lib and Kernel32.dll. If <b>PSAPI_VERSION</b> is 1, this 
     *     function is defined as <b>GetWsChanges</b> in 
     *     Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls 
     *     <b>K32GetWsChanges</b>. 
     * 
     * Programs that must run on earlier versions of Windows as 
     *     well as Windows 7 and later versions should always call this function as 
     *     <b>GetWsChanges</b>. To ensure correct resolution of symbols, 
     *     add Psapi.lib to the <b>TARGETLIBS</b> macro and compile the program with 
     *     <b>-DPSAPI_VERSION=1</b>. To use run-time dynamic linking, load Psapi.dll.
     * @param {HANDLE} hProcess A handle to the process. The handle must have the <b>PROCESS_QUERY_INFORMATION</b> 
     *       access right. For more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Pointer} lpWatchInfo A pointer to a user-allocated buffer that receives an array of 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/psapi/ns-psapi-psapi_ws_watch_information">PSAPI_WS_WATCH_INFORMATION</a> structures. 
     *       The array is terminated with a structure whose <b>FaultingPc</b> member is NULL.
     * @param {Integer} cb The size of the <i>lpWatchInfo</i> buffer, in bytes.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns 
     *        <b>ERROR_INSUFFICIENT_BUFFER</b> if the <i>lpWatchInfo</i> buffer is not 
     *        large enough to contain all the working set change records; the buffer is returned empty. Reallocate a larger 
     *        block of memory for the buffer and call again.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-getwschanges
     */
    static K32GetWsChanges(hProcess, lpWatchInfo, cb) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        result := DllCall("KERNEL32.dll\K32GetWsChanges", "ptr", hProcess, "ptr", lpWatchInfo, "uint", cb, "int")
        return result
    }

    /**
     * Retrieves extended information about the pages that have been added to the working set of the specified process since the last time this function or the InitializeProcessForWsWatch function was called.
     * @remarks
     * The operating system uses one buffer per process to maintain working set change records. If more than one application (or multiple threads in the same application) calls this function with the same process handle, neither application will have a complete accounting of the working set changes because each call empties the buffer.
     * 
     * The operating system does not record new change records while it is processing the query (and emptying the buffer). This function sets the error code to <b>NO_MORE_ENTRIES</b> if a concurrent query is received while it is processing another query.
     * 
     * If the buffer becomes full, no new records are added to the buffer until this function or the <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-initializeprocessforwswatch">InitializeProcessForWsWatch</a> function is called. You should call <b>GetWsChangesEx</b> with enough frequency to prevent possible data loss. If records are lost, the array is terminated with a structure whose <b>FaultingPc</b> member is NULL and whose <b>FaultingVa</b> member is set to the number of records that were lost.
     * 
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes 
     *     version numbers for the PSAPI functions. The PSAPI version number affects the name used to call the function and 
     *     the library that a program must load.
     * 
     * If <b>PSAPI_VERSION</b> is 2 or greater, this function is defined as 
     *     <b>K32GetWsChangesEx</b> in Psapi.h and exported in 
     *     Kernel32.lib and Kernel32.dll. If <b>PSAPI_VERSION</b> is 1, this 
     *     function is defined as <b>GetWsChangesEx</b> in 
     *     Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls 
     *     <b>K32GetWsChangesEx</b>. 
     * 
     * Programs that must run on earlier versions of Windows as 
     *     well as Windows 7 and later versions should always call this function as 
     *     <b>GetWsChangesEx</b>. To ensure correct resolution of symbols, 
     *     add Psapi.lib to the <b>TARGETLIBS</b> macro and compile the program with 
     *     <b>-DPSAPI_VERSION=1</b>. To use run-time dynamic linking, load Psapi.dll.
     * @param {HANDLE} hProcess A handle to the process. The handle must have the <b>PROCESS_QUERY_INFORMATION</b> access right. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Pointer} lpWatchInfoEx A pointer to a user-allocated buffer that receives an array of  
     * <a href="https://docs.microsoft.com/windows/desktop/api/psapi/ns-psapi-psapi_ws_watch_information_ex">PSAPI_WS_WATCH_INFORMATION_EX</a> structures. The array is terminated with a structure whose <b>FaultingPc</b> member is NULL.
     * @param {Pointer<Integer>} cb The size of the 
     * <i>lpWatchInfoEx</i> buffer, in bytes.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 						
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns <b>ERROR_INSUFFICIENT_BUFFER</b> if the <i>lpWatchInfoEx</i> buffer is not large enough to contain all the working set change records; the buffer is returned empty. Reallocate a larger block of memory for the buffer and call again.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-getwschangesex
     */
    static K32GetWsChangesEx(hProcess, lpWatchInfoEx, cb) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        cbMarshal := cb is VarRef ? "uint*" : "ptr"

        result := DllCall("KERNEL32.dll\K32GetWsChangesEx", "ptr", hProcess, "ptr", lpWatchInfoEx, cbMarshal, cb, "int")
        return result
    }

    /**
     * Checks whether the specified address is within a memory-mapped file in the address space of the specified process. If so, the function returns the name of the memory-mapped file. (Unicode)
     * @remarks
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes 
     *     version numbers for the PSAPI functions. The PSAPI version number affects the name used to call the function and 
     *     the library that a program must load.
     * 
     * If <b>PSAPI_VERSION</b> is 2 or greater, this function is defined as 
     *     <b>K32GetMappedFileName</b> in Psapi.h and exported in 
     *     Kernel32.lib and Kernel32.dll. If <b>PSAPI_VERSION</b> is 1, this 
     *     function is defined as <b>GetMappedFileName</b> in 
     *     Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls 
     *     <b>K32GetMappedFileName</b>. 
     * 
     * Programs that must run on earlier versions of Windows as 
     *     well as Windows 7 and later versions should always call this function as 
     *     <b>GetMappedFileName</b>. To ensure correct resolution of symbols, 
     *     add Psapi.lib to the <b>TARGETLIBS</b> macro and compile the program with 
     *     <b>-DPSAPI_VERSION=1</b>. To use run-time dynamic linking, load Psapi.dll.
     * 
     * In Windows Server 2012, this function is supported by the following technologies.
     * 
     * <table>
     * <tr>
     * <th>Technology</th>
     * <th>Supported</th>
     * </tr>
     * <tr>
     * <td>
     * Server Message Block (SMB) 3.0 protocol
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 Transparent Failover (TFO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 with Scale-out File Shares (SO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Cluster Shared Volume File System (CsvFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Resilient File System (ReFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * </table>
     * @param {HANDLE} hProcess A handle to the process. The handle must have the <b>PROCESS_QUERY_INFORMATION</b> access rightF. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Pointer<Void>} lpv The address to be verified.
     * @param {PWSTR} lpFilename A pointer to the buffer that receives the name of the memory-mapped file to which the address specified by <i>lpv</i> belongs.
     * @param {Integer} nSize The size of the <i>lpFilename</i> buffer, in characters.
     * @returns {Integer} If the function succeeds, the return value specifies the length of the string copied to the buffer, in characters.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-getmappedfilenamew
     */
    static K32GetMappedFileNameW(hProcess, lpv, lpFilename, nSize) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess
        lpFilename := lpFilename is String ? StrPtr(lpFilename) : lpFilename

        lpvMarshal := lpv is VarRef ? "ptr" : "ptr"

        result := DllCall("KERNEL32.dll\K32GetMappedFileNameW", "ptr", hProcess, lpvMarshal, lpv, "ptr", lpFilename, "uint", nSize, "uint")
        return result
    }

    /**
     * Checks whether the specified address is within a memory-mapped file in the address space of the specified process. If so, the function returns the name of the memory-mapped file. (Unicode)
     * @remarks
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes 
     *     version numbers for the PSAPI functions. The PSAPI version number affects the name used to call the function and 
     *     the library that a program must load.
     * 
     * If <b>PSAPI_VERSION</b> is 2 or greater, this function is defined as 
     *     <b>K32GetMappedFileName</b> in Psapi.h and exported in 
     *     Kernel32.lib and Kernel32.dll. If <b>PSAPI_VERSION</b> is 1, this 
     *     function is defined as <b>GetMappedFileName</b> in 
     *     Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls 
     *     <b>K32GetMappedFileName</b>. 
     * 
     * Programs that must run on earlier versions of Windows as 
     *     well as Windows 7 and later versions should always call this function as 
     *     <b>GetMappedFileName</b>. To ensure correct resolution of symbols, 
     *     add Psapi.lib to the <b>TARGETLIBS</b> macro and compile the program with 
     *     <b>-DPSAPI_VERSION=1</b>. To use run-time dynamic linking, load Psapi.dll.
     * 
     * In Windows Server 2012, this function is supported by the following technologies.
     * 
     * <table>
     * <tr>
     * <th>Technology</th>
     * <th>Supported</th>
     * </tr>
     * <tr>
     * <td>
     * Server Message Block (SMB) 3.0 protocol
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 Transparent Failover (TFO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 with Scale-out File Shares (SO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Cluster Shared Volume File System (CsvFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Resilient File System (ReFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * </table>
     * @param {HANDLE} hProcess A handle to the process. The handle must have the <b>PROCESS_QUERY_INFORMATION</b> access rightF. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Pointer<Void>} lpv The address to be verified.
     * @param {PSTR} lpFilename A pointer to the buffer that receives the name of the memory-mapped file to which the address specified by <i>lpv</i> belongs.
     * @param {Integer} nSize The size of the <i>lpFilename</i> buffer, in characters.
     * @returns {Integer} If the function succeeds, the return value specifies the length of the string copied to the buffer, in characters.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-getmappedfilenamew
     */
    static K32GetMappedFileNameA(hProcess, lpv, lpFilename, nSize) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess
        lpFilename := lpFilename is String ? StrPtr(lpFilename) : lpFilename

        lpvMarshal := lpv is VarRef ? "ptr" : "ptr"

        result := DllCall("KERNEL32.dll\K32GetMappedFileNameA", "ptr", hProcess, lpvMarshal, lpv, "ptr", lpFilename, "uint", nSize, "uint")
        return result
    }

    /**
     * Retrieves the load address for each device driver in the system.
     * @remarks
     * To determine how many device drivers were enumerated by the call to 
     * <b>EnumDeviceDrivers</b>, divide the resulting value in the <i>lpcbNeeded</i> parameter by <c>sizeof(LPVOID)</c>.
     * 
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes version numbers for the PSAPI functions. The PSAPI version number affects  the name used to call the function and the library that a program must load. 
     * 
     * If PSAPI_VERSION is 2 or greater, this function is defined as <b>K32EnumDeviceDrivers</b> in Psapi.h and exported in Kernel32.lib and Kernel32.dll. If PSAPI_VERSION is 1, this function is defined as <b>EnumDeviceDrivers</b> in Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls <b>K32EnumDeviceDrivers</b>. 
     * 
     * Programs that must run on earlier versions of Windows as well as Windows 7 and later versions should always call this function as <b>EnumDeviceDrivers</b>. To ensure correct resolution of symbols, add Psapi.lib to the TARGETLIBS macro and compile the program with –DPSAPI_VERSION=1. To use run-time dynamic linking, load Psapi.dll.
     * @param {Pointer} lpImageBase An array that receives the list of load addresses for the device drivers.
     * @param {Integer} cb The size of the <i>lpImageBase</i> array, in bytes. If the array is not large enough to store the load addresses, the <i>lpcbNeeded</i> parameter receives the required size of the array.
     * @param {Pointer<Integer>} lpcbNeeded The number of bytes returned in the <i>lpImageBase</i> array.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-enumdevicedrivers
     */
    static K32EnumDeviceDrivers(lpImageBase, cb, lpcbNeeded) {
        lpcbNeededMarshal := lpcbNeeded is VarRef ? "uint*" : "ptr"

        result := DllCall("KERNEL32.dll\K32EnumDeviceDrivers", "ptr", lpImageBase, "uint", cb, lpcbNeededMarshal, lpcbNeeded, "int")
        return result
    }

    /**
     * Retrieves the base name of the specified device driver. (ANSI)
     * @remarks
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes version numbers for the PSAPI functions. The PSAPI version number affects  the name used to call the function and the library that a program must load.
     * 
     * If PSAPI_VERSION is 2 or greater, this function is defined as <b>K32GetDeviceDriverBaseName</b> in Psapi.h and exported in Kernel32.lib and Kernel32.dll. If PSAPI_VERSION is 1, this function is defined as <b>GetDeviceDriverBaseName</b> in Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls <b>K32GetDeviceDriverBaseName</b>.
     * 
     * Programs that must run on earlier versions of Windows as well as Windows 7 and later versions should always call this function as <b>GetDeviceDriverBaseName</b>. To ensure correct resolution of symbols, add Psapi.lib to the TARGETLIBS macro and compile the program with –DPSAPI_VERSION=1. To use run-time dynamic linking, load Psapi.dll.
     * @param {Pointer<Void>} ImageBase The load address of the device driver. This value can be retrieved using the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-enumdevicedrivers">EnumDeviceDrivers</a> 
     *       function.
     * @param {PSTR} lpFilename TBD
     * @param {Integer} nSize The size of the <i>lpBaseName</i> buffer, in characters. If the buffer is not large enough to store the base name plus the terminating null character, the string is truncated.
     * @returns {Integer} If the function succeeds, the return value specifies the length of the string copied to the buffer, not including any terminating null character.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-getdevicedriverbasenamea
     */
    static K32GetDeviceDriverBaseNameA(ImageBase, lpFilename, nSize) {
        lpFilename := lpFilename is String ? StrPtr(lpFilename) : lpFilename

        ImageBaseMarshal := ImageBase is VarRef ? "ptr" : "ptr"

        result := DllCall("KERNEL32.dll\K32GetDeviceDriverBaseNameA", ImageBaseMarshal, ImageBase, "ptr", lpFilename, "uint", nSize, "uint")
        return result
    }

    /**
     * Retrieves the base name of the specified device driver. (ANSI)
     * @remarks
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes version numbers for the PSAPI functions. The PSAPI version number affects  the name used to call the function and the library that a program must load.
     * 
     * If PSAPI_VERSION is 2 or greater, this function is defined as <b>K32GetDeviceDriverBaseName</b> in Psapi.h and exported in Kernel32.lib and Kernel32.dll. If PSAPI_VERSION is 1, this function is defined as <b>GetDeviceDriverBaseName</b> in Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls <b>K32GetDeviceDriverBaseName</b>.
     * 
     * Programs that must run on earlier versions of Windows as well as Windows 7 and later versions should always call this function as <b>GetDeviceDriverBaseName</b>. To ensure correct resolution of symbols, add Psapi.lib to the TARGETLIBS macro and compile the program with –DPSAPI_VERSION=1. To use run-time dynamic linking, load Psapi.dll.
     * @param {Pointer<Void>} ImageBase The load address of the device driver. This value can be retrieved using the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-enumdevicedrivers">EnumDeviceDrivers</a> 
     *       function.
     * @param {PWSTR} lpBaseName 
     * @param {Integer} nSize The size of the <i>lpBaseName</i> buffer, in characters. If the buffer is not large enough to store the base name plus the terminating null character, the string is truncated.
     * @returns {Integer} If the function succeeds, the return value specifies the length of the string copied to the buffer, not including any terminating null character.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-getdevicedriverbasenamea
     */
    static K32GetDeviceDriverBaseNameW(ImageBase, lpBaseName, nSize) {
        lpBaseName := lpBaseName is String ? StrPtr(lpBaseName) : lpBaseName

        ImageBaseMarshal := ImageBase is VarRef ? "ptr" : "ptr"

        result := DllCall("KERNEL32.dll\K32GetDeviceDriverBaseNameW", ImageBaseMarshal, ImageBase, "ptr", lpBaseName, "uint", nSize, "uint")
        return result
    }

    /**
     * Retrieves the path available for the specified device driver. (Unicode)
     * @remarks
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes version numbers for the PSAPI functions. The PSAPI version number affects  the name used to call the function and the library that a program must load. 
     * 
     * If PSAPI_VERSION is 2 or greater, this function is defined as <b>K32GetDeviceDriverFileName</b> in Psapi.h and exported in Kernel32.lib and Kernel32.dll. If PSAPI_VERSION is 1, this function is defined as <b>GetDeviceDriverFileName</b> in Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls <b>K32GetDeviceDriverFileName</b>. 
     * 
     * Programs that must run on earlier versions of Windows as well as Windows 7 and later versions should always call this function as <b>GetDeviceDriverFileName</b>. To ensure correct resolution of symbols, add Psapi.lib to the TARGETLIBS macro and compile the program with –DPSAPI_VERSION=1. To use run-time dynamic linking, load Psapi.dll.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The psapi.h header defines GetDeviceDriverFileName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} ImageBase The load address of the device driver.
     * @param {PSTR} lpFilename A pointer to the buffer that receives the path to the device driver.
     * @param {Integer} nSize The size of the <i>lpFilename</i> buffer, in characters. If the buffer is not large enough to store the path plus the terminating null character, the string is truncated.
     * @returns {Integer} If the function succeeds, the return value specifies the length of the string copied to the buffer, not including any terminating null character.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-getdevicedriverfilenamew
     */
    static K32GetDeviceDriverFileNameA(ImageBase, lpFilename, nSize) {
        lpFilename := lpFilename is String ? StrPtr(lpFilename) : lpFilename

        ImageBaseMarshal := ImageBase is VarRef ? "ptr" : "ptr"

        result := DllCall("KERNEL32.dll\K32GetDeviceDriverFileNameA", ImageBaseMarshal, ImageBase, "ptr", lpFilename, "uint", nSize, "uint")
        return result
    }

    /**
     * Retrieves the path available for the specified device driver. (Unicode)
     * @remarks
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes version numbers for the PSAPI functions. The PSAPI version number affects  the name used to call the function and the library that a program must load. 
     * 
     * If PSAPI_VERSION is 2 or greater, this function is defined as <b>K32GetDeviceDriverFileName</b> in Psapi.h and exported in Kernel32.lib and Kernel32.dll. If PSAPI_VERSION is 1, this function is defined as <b>GetDeviceDriverFileName</b> in Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls <b>K32GetDeviceDriverFileName</b>. 
     * 
     * Programs that must run on earlier versions of Windows as well as Windows 7 and later versions should always call this function as <b>GetDeviceDriverFileName</b>. To ensure correct resolution of symbols, add Psapi.lib to the TARGETLIBS macro and compile the program with –DPSAPI_VERSION=1. To use run-time dynamic linking, load Psapi.dll.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The psapi.h header defines GetDeviceDriverFileName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} ImageBase The load address of the device driver.
     * @param {PWSTR} lpFilename A pointer to the buffer that receives the path to the device driver.
     * @param {Integer} nSize The size of the <i>lpFilename</i> buffer, in characters. If the buffer is not large enough to store the path plus the terminating null character, the string is truncated.
     * @returns {Integer} If the function succeeds, the return value specifies the length of the string copied to the buffer, not including any terminating null character.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-getdevicedriverfilenamew
     */
    static K32GetDeviceDriverFileNameW(ImageBase, lpFilename, nSize) {
        lpFilename := lpFilename is String ? StrPtr(lpFilename) : lpFilename

        ImageBaseMarshal := ImageBase is VarRef ? "ptr" : "ptr"

        result := DllCall("KERNEL32.dll\K32GetDeviceDriverFileNameW", ImageBaseMarshal, ImageBase, "ptr", lpFilename, "uint", nSize, "uint")
        return result
    }

    /**
     * Retrieves information about the pages currently added to the working set of the specified process.
     * @remarks
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes 
     *     version numbers for the PSAPI functions. The PSAPI version number affects the name used to call the function and 
     *     the library that a program must load.
     * 
     * If <b>PSAPI_VERSION</b> is 2 or greater, this function is defined as 
     *     <b>K32QueryWorkingSet</b> in Psapi.h and exported in 
     *     Kernel32.lib and Kernel32.dll. If <b>PSAPI_VERSION</b> is 1, this 
     *     function is defined as <b>QueryWorkingSet</b> in 
     *     Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls 
     *     <b>K32QueryWorkingSet</b>.
     * 
     * Programs that must run on earlier versions of Windows as well as Windows 7 and later versions 
     *     should always call this function as <b>QueryWorkingSet</b>. 
     *     To ensure correct resolution of symbols, add Psapi.lib to the 
     *     <b>TARGETLIBS</b> macro and compile the program with 
     *     <b>-DPSAPI_VERSION=1</b>. To use run-time dynamic linking, load 
     *     Psapi.dll.
     * @param {HANDLE} hProcess A handle to the process. The handle must have the <b>PROCESS_QUERY_INFORMATION</b> and 
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
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-queryworkingset
     */
    static K32QueryWorkingSet(hProcess, pv, cb) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        result := DllCall("KERNEL32.dll\K32QueryWorkingSet", "ptr", hProcess, "ptr", pv, "uint", cb, "int")
        return result
    }

    /**
     * Retrieves extended information about the pages at specific virtual addresses in the address space of the specified process.
     * @remarks
     * Unlike the <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-queryworkingset">QueryWorkingSet</a> function, which is limited to the working set of the target process, the <b>QueryWorkingSetEx</b> function can be used to query addresses that are not in the process working set but are still part of the process, such as AWE and large pages.
     * 
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes version numbers for the PSAPI functions. The PSAPI version number affects the name used to call the function and the library that a program must load.
     * 
     * If <b>PSAPI_VERSION</b> is 2 or greater, this function is defined as <b>K32QueryWorkingSetEx</b> in Psapi.h and exported in Kernel32.lib and Kernel32.dll. If <b>PSAPI_VERSION</b> is 1, this function is defined as <b>QueryWorkingSetEx</b> in Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls <b>K32QueryWorkingSetEx</b>.
     * 
     * Programs that must run on earlier versions of Windows as well as Windows 7 and later versions should always call this function as <b>QueryWorkingSetEx</b>. To ensure correct resolution of symbols, add Psapi.lib to the <b>TARGETLIBS</b> macro and compile the program with "–DPSAPI_VERSION=1". To use run-time dynamic linking, load Psapi.dll.
     * @param {HANDLE} hProcess A handle to the process. The handle must have the <b>PROCESS_QUERY_INFORMATION</b> access right. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Pointer} pv A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/psapi/ns-psapi-psapi_working_set_ex_information">PSAPI_WORKING_SET_EX_INFORMATION</a> structures. On input, each item in the array specifies a virtual address of interest. On output, each item in the array receives information about the corresponding virtual page.
     * @param {Integer} cb The size of the <i>pv</i> buffer, in bytes.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-queryworkingsetex
     */
    static K32QueryWorkingSetEx(hProcess, pv, cb) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        result := DllCall("KERNEL32.dll\K32QueryWorkingSetEx", "ptr", hProcess, "ptr", pv, "uint", cb, "int")
        return result
    }

    /**
     * Retrieves information about the memory usage of the specified process.
     * @remarks
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes 
     *     version numbers for the PSAPI functions. The PSAPI version number affects the name used to call the function and 
     *     the library that a program must load.
     * 
     * If **PSAPI_VERSION** is 2 or greater, this function is defined as 
     *     **K32GetProcessMemoryInfo** in Psapi.h and exported in 
     *     Kernel32.lib and Kernel32.dll. If **PSAPI_VERSION** is 1, this 
     *     function is defined as **GetProcessMemoryInfo** in 
     *     Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that calls 
     *     **K32GetProcessMemoryInfo**. 
     * 
     * Programs that must run on earlier versions of Windows as 
     *     well as Windows 7 and later versions should always call this function as 
     *     **GetProcessMemoryInfo**. To ensure correct resolution of symbols, 
     *     add Psapi.lib to the **TARGETLIBS** macro and compile the program with 
     *     **-DPSAPI_VERSION=1**. To use run-time dynamic linking, load Psapi.dll.
     * @param {HANDLE} Process A handle to the process. The handle must have the **PROCESS_QUERY_INFORMATION** or **PROCESS_QUERY_LIMITED_INFORMATION** access right. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * 
     * **Windows Server 2003 and Windows XP:** The handle must have the **PROCESS_QUERY_INFORMATION** and **PROCESS_VM_READ** access rights.
     * @param {Pointer} ppsmemCounters A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/psapi/ns-psapi-process_memory_counters">PROCESS_MEMORY_COUNTERS</a> or <a href="https://docs.microsoft.com/windows/desktop/api/psapi/ns-psapi-process_memory_counters_ex">PROCESS_MEMORY_COUNTERS_EX</a> structure that receives information about the memory usage of the process.
     * @param {Integer} cb The size of the 
     * <i>ppsmemCounters</i> structure, in bytes.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-getprocessmemoryinfo
     */
    static K32GetProcessMemoryInfo(Process, ppsmemCounters, cb) {
        Process := Process is Win32Handle ? NumGet(Process, "ptr") : Process

        result := DllCall("KERNEL32.dll\K32GetProcessMemoryInfo", "ptr", Process, "ptr", ppsmemCounters, "uint", cb, "int")
        return result
    }

    /**
     * Retrieves the performance values contained in the PERFORMANCE_INFORMATION structure.
     * @remarks
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes version numbers for 
     *     the PSAPI functions. The PSAPI version number affects the name used to call the function and the library that a 
     *     program must load.
     * 
     * If PSAPI_VERSION is 2 or greater, this function is defined as 
     *     <b>K32GetPerformanceInfo</b> in Psapi.h and exported in Kernel32.lib and Kernel32.dll. If 
     *     PSAPI_VERSION is 1, this function is defined as 
     *     <b>GetPerformanceInfo</b> in Psapi.h and exported in 
     *     Psapi.lib and Psapi.dll as a wrapper that calls <b>K32GetPerformanceInfo</b>.
     * 
     * Programs that must run on earlier versions of Windows as well as Windows 7 and later versions 
     *     should always call this function as 
     *     <b>GetPerformanceInfo</b>. To ensure correct resolution 
     *     of symbols, add Psapi.lib to the TARGETLIBS macro and compile the program with 
     *     –DPSAPI_VERSION=1. To use run-time dynamic linking, load Psapi.dll.
     * @param {Pointer<PERFORMANCE_INFORMATION>} pPerformanceInformation A pointer to a 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/psapi/ns-psapi-performance_information">PERFORMANCE_INFORMATION</a> 
     *       structure that receives the performance information.
     * @param {Integer} cb The size of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/psapi/ns-psapi-performance_information">PERFORMANCE_INFORMATION</a> structure, in 
     *       bytes.
     * @returns {BOOL} If the function succeeds, the return value is TRUE. If the function fails, the return value is FALSE. To get 
     *        extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-getperformanceinfo
     */
    static K32GetPerformanceInfo(pPerformanceInformation, cb) {
        result := DllCall("KERNEL32.dll\K32GetPerformanceInfo", "ptr", pPerformanceInformation, "uint", cb, "int")
        return result
    }

    /**
     * Calls the callback routine for each installed pagefile in the system. (ANSI)
     * @remarks
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes 
     *     version numbers for the PSAPI functions. The PSAPI version number affects  the name used to call the function and 
     *     the library that a program must load.
     * 
     * If <b>PSAPI_VERSION</b> is 2 or greater, this function is defined as 
     *     <b>K32EnumPageFiles</b> in Psapi.h and exported in Kernel32.lib and 
     *     Kernel32.dll. If <b>PSAPI_VERSION</b> is 1, this function is defined as 
     *     <b>EnumPageFiles</b> in Psapi.h and exported in 
     *     Psapi.lib and Psapi.dll as a wrapper that calls 
     *     <b>K32EnumPageFiles</b>.
     * 
     * Programs that must run on earlier versions of Windows as well as Windows 7 and later versions 
     *     should always call this function as <b>EnumPageFiles</b>. To 
     *     ensure correct resolution of symbols, add Psapi.lib to the <b>TARGETLIBS</b> 
     *     macro and compile the program with –DPSAPI_VERSION=1. To use run-time dynamic linking, load 
     *     Psapi.dll.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The psapi.h header defines EnumPageFiles as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PENUM_PAGE_FILE_CALLBACKW>} pCallBackRoutine A pointer to the routine called for each pagefile. For more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nc-psapi-penum_page_file_callbacka">EnumPageFilesProc</a>.
     * @param {Pointer<Void>} pContext The user-defined data passed to the callback routine.
     * @returns {BOOL} If the function succeeds, the return value is <b>TRUE</b>. If the function fails, the 
     *        return value is <b>FALSE</b>. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-enumpagefilesa
     */
    static K32EnumPageFilesW(pCallBackRoutine, pContext) {
        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        result := DllCall("KERNEL32.dll\K32EnumPageFilesW", "ptr", pCallBackRoutine, pContextMarshal, pContext, "int")
        return result
    }

    /**
     * Calls the callback routine for each installed pagefile in the system. (ANSI)
     * @remarks
     * Starting with Windows 7 and Windows Server 2008 R2, Psapi.h establishes 
     *     version numbers for the PSAPI functions. The PSAPI version number affects  the name used to call the function and 
     *     the library that a program must load.
     * 
     * If <b>PSAPI_VERSION</b> is 2 or greater, this function is defined as 
     *     <b>K32EnumPageFiles</b> in Psapi.h and exported in Kernel32.lib and 
     *     Kernel32.dll. If <b>PSAPI_VERSION</b> is 1, this function is defined as 
     *     <b>EnumPageFiles</b> in Psapi.h and exported in 
     *     Psapi.lib and Psapi.dll as a wrapper that calls 
     *     <b>K32EnumPageFiles</b>.
     * 
     * Programs that must run on earlier versions of Windows as well as Windows 7 and later versions 
     *     should always call this function as <b>EnumPageFiles</b>. To 
     *     ensure correct resolution of symbols, add Psapi.lib to the <b>TARGETLIBS</b> 
     *     macro and compile the program with –DPSAPI_VERSION=1. To use run-time dynamic linking, load 
     *     Psapi.dll.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The psapi.h header defines EnumPageFiles as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PENUM_PAGE_FILE_CALLBACKA>} pCallBackRoutine A pointer to the routine called for each pagefile. For more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nc-psapi-penum_page_file_callbacka">EnumPageFilesProc</a>.
     * @param {Pointer<Void>} pContext The user-defined data passed to the callback routine.
     * @returns {BOOL} If the function succeeds, the return value is <b>TRUE</b>. If the function fails, the 
     *        return value is <b>FALSE</b>. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-enumpagefilesa
     */
    static K32EnumPageFilesA(pCallBackRoutine, pContext) {
        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        result := DllCall("KERNEL32.dll\K32EnumPageFilesA", "ptr", pCallBackRoutine, pContextMarshal, pContext, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} hProcess 
     * @param {PSTR} lpImageFileName 
     * @param {Integer} nSize 
     * @returns {Integer} 
     */
    static K32GetProcessImageFileNameA(hProcess, lpImageFileName, nSize) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess
        lpImageFileName := lpImageFileName is String ? StrPtr(lpImageFileName) : lpImageFileName

        result := DllCall("KERNEL32.dll\K32GetProcessImageFileNameA", "ptr", hProcess, "ptr", lpImageFileName, "uint", nSize, "uint")
        return result
    }

    /**
     * 
     * @param {HANDLE} hProcess 
     * @param {PWSTR} lpImageFileName 
     * @param {Integer} nSize 
     * @returns {Integer} 
     */
    static K32GetProcessImageFileNameW(hProcess, lpImageFileName, nSize) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess
        lpImageFileName := lpImageFileName is String ? StrPtr(lpImageFileName) : lpImageFileName

        result := DllCall("KERNEL32.dll\K32GetProcessImageFileNameW", "ptr", hProcess, "ptr", lpImageFileName, "uint", nSize, "uint")
        return result
    }

;@endregion Methods
}
