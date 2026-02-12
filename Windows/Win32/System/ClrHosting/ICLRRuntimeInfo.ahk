#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HMODULE.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLRRuntimeInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICLRRuntimeInfo
     * @type {Guid}
     */
    static IID => Guid("{bd39d1d2-ba2f-486a-89b0-b4b0cb466891}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetVersionString", "GetRuntimeDirectory", "IsLoaded", "LoadErrorString", "LoadLibraryA", "GetProcAddress", "GetInterface", "IsLoadable", "SetDefaultStartupFlags", "GetDefaultStartupFlags", "BindAsLegacyV2Runtime", "IsStarted"]

    /**
     * 
     * @param {PWSTR} pwzBuffer 
     * @param {Pointer<Integer>} pcchBuffer 
     * @returns {HRESULT} 
     */
    GetVersionString(pwzBuffer, pcchBuffer) {
        pwzBuffer := pwzBuffer is String ? StrPtr(pwzBuffer) : pwzBuffer

        pcchBufferMarshal := pcchBuffer is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pwzBuffer, pcchBufferMarshal, pcchBuffer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} pwzBuffer 
     * @param {Pointer<Integer>} pcchBuffer 
     * @returns {HRESULT} 
     */
    GetRuntimeDirectory(pwzBuffer, pcchBuffer) {
        pwzBuffer := pwzBuffer is String ? StrPtr(pwzBuffer) : pwzBuffer

        pcchBufferMarshal := pcchBuffer is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pwzBuffer, pcchBufferMarshal, pcchBuffer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HANDLE} hndProcess 
     * @returns {BOOL} 
     */
    IsLoaded(hndProcess) {
        hndProcess := hndProcess is Win32Handle ? NumGet(hndProcess, "ptr") : hndProcess

        result := ComCall(5, this, "ptr", hndProcess, "int*", &pbLoaded := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbLoaded
    }

    /**
     * 
     * @param {Integer} iResourceID 
     * @param {PWSTR} pwzBuffer 
     * @param {Pointer<Integer>} pcchBuffer 
     * @param {Integer} iLocaleID 
     * @returns {HRESULT} 
     */
    LoadErrorString(iResourceID, pwzBuffer, pcchBuffer, iLocaleID) {
        pwzBuffer := pwzBuffer is String ? StrPtr(pwzBuffer) : pwzBuffer

        pcchBufferMarshal := pcchBuffer is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", iResourceID, "ptr", pwzBuffer, pcchBufferMarshal, pcchBuffer, "int", iLocaleID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Loads the specified module into the address space of the calling process. (LoadLibraryA)
     * @remarks
     * To enable or disable error messages displayed by the loader during DLL loads, use the
     *     <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-seterrormode">SetErrorMode</a> function.
     * 
     * <b>LoadLibrary</b> can be used to load a library module into
     *     the address space of the process and return a handle that can be used in
     *     <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> to get the address of a DLL function.
     *     <b>LoadLibrary</b> can also be used to load other executable
     *     modules. For example, the function can specify an .exe file to get a handle that can be used in
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-findresourcea">FindResource</a> or
     *     <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadresource">LoadResource</a>. However, do not use
     *     <b>LoadLibrary</b> to run an .exe file. Instead, use
     *     the <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a> function.
     * 
     * If the specified module is a DLL that is not already loaded for the calling process, the system calls the
     *     DLL's <a href="https://docs.microsoft.com/windows/desktop/Dlls/dllmain">DllMain</a> function with the
     *     <b>DLL_PROCESS_ATTACH</b> value. If
     *     <b>DllMain</b> returns <b>TRUE</b>,
     *     <b>LoadLibrary</b> returns a handle to the module. If
     *     <b>DllMain</b> returns <b>FALSE</b>,
     *     the system unloads the DLL from the process address space and
     *     <b>LoadLibrary</b> returns <b>NULL</b>. It is
     *     not safe to call <b>LoadLibrary</b> from
     *     <b>DllMain</b>. For more information, see the Remarks section in
     *     <b>DllMain</b>.
     * 
     * Module handles are not global or inheritable. A call to
     *     <b>LoadLibrary</b> by one process does not produce a handle that
     *     another process can use — for example, in calling
     *     <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>. The other process must make its own
     *     call to <b>LoadLibrary</b> for the module before calling
     *     <b>GetProcAddress</b>.
     * 
     * If <i>lpFileName</i> does not include a path and there is more than one loaded module with
     *     the same base name and extension, the function returns a handle to the module that was loaded first.
     * 
     * If no file name extension is specified in the <i>lpFileName</i> parameter, the default
     *     library extension .dll is appended. However, the file name string can include a trailing point character (.) to
     *     indicate that the module name has no extension. When no path is specified, the function searches for loaded
     *     modules whose base name matches the base name of the module to be loaded. If the name matches, the load succeeds.
     *     Otherwise, the function searches for the file.
     * 
     * The first directory searched is the directory containing the image file used to create the calling process
     *     (for more information, see the
     *     <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a> function). Doing this allows
     *     private dynamic-link library (DLL) files associated with a process to be found without adding the process's
     *     installed directory to the PATH environment variable. If a relative path is
     *     specified, the entire relative path is appended to every token in the DLL search path list. To load a module from
     *     a relative path without searching any other path, use
     *     <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-getfullpathnamea">GetFullPathName</a> to get a nonrelative path and call
     *     <b>LoadLibrary</b> with the nonrelative path. For more
     *     information on the DLL search order, see
     *     <a href="https://docs.microsoft.com/windows/desktop/Dlls/dynamic-link-library-search-order">Dynamic-Link Library Search Order</a>.
     * 
     * The search path can be altered using the
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setdlldirectorya">SetDllDirectory</a> function. This solution is recommended
     *     instead of using <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setcurrentdirectory">SetCurrentDirectory</a> or
     *     hard-coding the full path to the DLL.
     * 
     * If a path is specified and there is a redirection file for the application, the function searches for the
     *     module in the application's directory. If the module exists in the application's directory,
     *     <b>LoadLibrary</b> ignores the specified path and loads the
     *     module from the application's directory. If the module does not exist in the application's directory,
     *     <b>LoadLibrary</b> loads the module from the specified
     *     directory. For more information, see
     *     <a href="https://docs.microsoft.com/windows/desktop/Dlls/dynamic-link-library-redirection">Dynamic Link Library Redirection</a>.
     * 
     *  If you call <b>LoadLibrary</b> with the name of an assembly
     *     without a path specification and the assembly is listed in the system compatible manifest, the call is
     *     automatically redirected to the side-by-side assembly.
     * 
     * The system maintains a per-process reference
     *     count on all loaded modules. Calling <b>LoadLibrary</b>
     *     increments the reference count. Calling the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-freelibrary">FreeLibrary</a> or
     *     <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-freelibraryandexitthread">FreeLibraryAndExitThread</a> function decrements
     *     the reference count. The system unloads a module when its reference count reaches zero or when the process
     *     terminates (regardless of the reference count).
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>The Visual C++ compiler supports a syntax that enables you to declare thread-local variables:
     *       <b>_declspec(thread)</b>. If you use this syntax in a DLL, you will not be able to load the
     *       DLL explicitly using <b>LoadLibrary</b> on versions of Windows
     *       prior to Windows Vista. If your DLL will be loaded explicitly, you must use the thread local
     *       storage functions instead of <b>_declspec(thread)</b>. For an example, see
     *       <a href="https://docs.microsoft.com/windows/desktop/Dlls/using-thread-local-storage-in-a-dynamic-link-library">Using Thread Local Storage
     *       in a Dynamic Link Library</a>.
     * 
     * <h3><a id="Security_Remarks"></a><a id="security_remarks"></a><a id="SECURITY_REMARKS"></a>Security Remarks</h3>
     * Do not use the <a href="https://docs.microsoft.com/windows/desktop/api/processenv/nf-processenv-searchpathw">SearchPath</a> function to retrieve a path to
     *       a DLL for a subsequent <b>LoadLibrary</b> call. The
     *       <b>SearchPath</b> function uses a different search order than
     *       <b>LoadLibrary</b> and it does not use safe process search mode
     *       unless this is explicitly enabled by calling
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setsearchpathmode">SetSearchPathMode</a> with
     *       <b>BASE_SEARCH_PATH_ENABLE_SAFE_SEARCHMODE</b>. Therefore,
     *       <b>SearchPath</b> is likely to first search the user’s current
     *       working directory for the specified DLL. If an attacker has copied a malicious version of a DLL into the current
     *       working directory, the path retrieved by <b>SearchPath</b> will
     *       point to the malicious DLL, which <b>LoadLibrary</b> will then
     *       load.
     * 
     * Do not make assumptions about the operating system version based on a
     *       <b>LoadLibrary</b> call that searches for a DLL. If the
     *       application is running in an environment where the DLL is legitimately not present but a malicious version of
     *       the DLL is in the search path, the malicious version of the DLL may be loaded. Instead, use the recommended
     *       techniques described in
     *       <a href="https://docs.microsoft.com/windows/desktop/SysInfo/getting-the-system-version">Getting the System Version</a>.
     * @param {PWSTR} pwzDllName 
     * @returns {HMODULE} 
     * @see https://learn.microsoft.com/windows/win32/api//content/libloaderapi/nf-libloaderapi-loadlibrarya
     */
    LoadLibraryA(pwzDllName) {
        pwzDllName := pwzDllName is String ? StrPtr(pwzDllName) : pwzDllName

        phndModule := HMODULE()
        result := ComCall(7, this, "ptr", pwzDllName, "ptr", phndModule, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phndModule
    }

    /**
     * Retrieves the address of an exported function or variable from the specified dynamic-link library (DLL).
     * @remarks
     * The spelling and case of a function name pointed to by <i>lpProcName</i> must be identical to that in the <b>EXPORTS</b> statement of the source DLL's module-definition (.def) file. The exported names of functions may differ from the names you use when calling these functions in your code. This difference is hidden by macros used in the SDK header files. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Intl/conventions-for-function-prototypes">Conventions for Function Prototypes</a>.
     * 
     * The <i>lpProcName</i> parameter can identify the DLL function by specifying an ordinal value associated with the function in the <b>EXPORTS</b> statement. 
     * <b>GetProcAddress</b> verifies that the specified ordinal is in the range 1 through the highest ordinal value exported in the .def file. The function then uses the ordinal as an index to read the function's address from a function table. 
     * 
     * If the .def file does not number the functions consecutively from 1 to <i>N</i> (where <i>N</i> is the number of exported functions), an error can occur where 
     * <b>GetProcAddress</b> returns an invalid, non-NULL address, even though there is no function with the specified ordinal.
     * 
     * If the function might not exist in the DLL module—for example, if the function  is available only on Windows Vista but the application  might be running on Windows XP—specify the function by name rather than by ordinal value and design your application to handle the case when the function is not available, as shown in the following code fragment.
     * 
     * 
     * ```cpp
     * 
     * typedef void (WINAPI *PGNSI)(LPSYSTEM_INFO);
     * 
     * // Call GetNativeSystemInfo if supported or GetSystemInfo otherwise.
     * 
     *    PGNSI pGNSI;
     *    SYSTEM_INFO si;
     * 
     *    ZeroMemory(&si, sizeof(SYSTEM_INFO));
     *    
     *    pGNSI = (PGNSI) GetProcAddress(
     *       GetModuleHandle(TEXT("kernel32.dll")), 
     *       "GetNativeSystemInfo");
     *    if(NULL != pGNSI)
     *    {
     *       pGNSI(&si);
     *    }
     *    else 
     *    {
     *        GetSystemInfo(&si);
     *    }
     * 
     * 
     * ```
     * 
     * 
     * For the complete example that contains this code fragment, see <a href="https://docs.microsoft.com/windows/desktop/SysInfo/getting-the-system-version">Getting the System Version</a>.
     * @param {PSTR} pszProcName 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api//content/libloaderapi/nf-libloaderapi-getprocaddress
     */
    GetProcAddress(pszProcName) {
        pszProcName := pszProcName is String ? StrPtr(pszProcName) : pszProcName

        result := ComCall(8, this, "ptr", pszProcName, "ptr*", &ppProc := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppProc
    }

    /**
     * The GetInterface function retrieves an interface pointer.
     * @remarks
     * This member function performs a thread-safe increment of the reference count. To retrieve the interface and add a reference, call this function from your overriding implementation of the **INonDelegatingUnknown::NonDelegatingQueryInterface** method.
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Pointer<Void>>} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/getinterface
     */
    GetInterface(rclsid, riid) {
        result := ComCall(9, this, "ptr", rclsid, "ptr", riid, "ptr*", &ppUnk := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppUnk
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsLoadable() {
        result := ComCall(10, this, "int*", &pbLoadable := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbLoadable
    }

    /**
     * 
     * @param {Integer} dwStartupFlags 
     * @param {PWSTR} pwzHostConfigFile 
     * @returns {HRESULT} 
     */
    SetDefaultStartupFlags(dwStartupFlags, pwzHostConfigFile) {
        pwzHostConfigFile := pwzHostConfigFile is String ? StrPtr(pwzHostConfigFile) : pwzHostConfigFile

        result := ComCall(11, this, "uint", dwStartupFlags, "ptr", pwzHostConfigFile, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} pwzHostConfigFile 
     * @param {Pointer<Integer>} pcchHostConfigFile 
     * @returns {Integer} 
     */
    GetDefaultStartupFlags(pwzHostConfigFile, pcchHostConfigFile) {
        pwzHostConfigFile := pwzHostConfigFile is String ? StrPtr(pwzHostConfigFile) : pwzHostConfigFile

        pcchHostConfigFileMarshal := pcchHostConfigFile is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "uint*", &pdwStartupFlags := 0, "ptr", pwzHostConfigFile, pcchHostConfigFileMarshal, pcchHostConfigFile, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwStartupFlags
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    BindAsLegacyV2Runtime() {
        result := ComCall(13, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbStarted 
     * @param {Pointer<Integer>} pdwStartupFlags 
     * @returns {HRESULT} 
     */
    IsStarted(pbStarted, pdwStartupFlags) {
        pbStartedMarshal := pbStarted is VarRef ? "int*" : "ptr"
        pdwStartupFlagsMarshal := pdwStartupFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, pbStartedMarshal, pbStarted, pdwStartupFlagsMarshal, pdwStartupFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
