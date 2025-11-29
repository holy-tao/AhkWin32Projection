#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\Foundation\HRSRC.ahk
#Include ..\..\Foundation\HMODULE.ahk
#Include ..\..\Foundation\HGLOBAL.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.System.LibraryLoader
 * @version v4.0.30319
 */
class LibraryLoader {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static FIND_RESOURCE_DIRECTORY_TYPES => 256

    /**
     * @type {Integer (UInt32)}
     */
    static FIND_RESOURCE_DIRECTORY_NAMES => 512

    /**
     * @type {Integer (UInt32)}
     */
    static FIND_RESOURCE_DIRECTORY_LANGUAGES => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCE_ENUM_LN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCE_ENUM_MUI => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCE_ENUM_MUI_SYSTEM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCE_ENUM_VALIDATE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCE_ENUM_MODULE_EXACT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SUPPORT_LANG_NUMBER => 32

    /**
     * @type {Integer (UInt32)}
     */
    static GET_MODULE_HANDLE_EX_FLAG_PIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CURRENT_IMPORT_REDIRECTION_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LOAD_LIBRARY_OS_INTEGRITY_CONTINUITY => 32768
;@endregion Constants

;@region Methods
    /**
     * Disables the DLL_THREAD_ATTACH and DLL_THREAD_DETACH notifications for the specified dynamic-link library (DLL).
     * @param {HMODULE} hLibModule A handle to the DLL module for which the DLL_THREAD_ATTACH and DLL_THREAD_DETACH notifications are to be disabled. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a>, <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a>,  or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulehandlea">GetModuleHandle</a> function returns this handle. Note that you cannot call <b>GetModuleHandle</b> with NULL because this returns the base address of the executable image, not the DLL image.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. The 
     * <b>DisableThreadLibraryCalls</b> function fails if the DLL specified by <i>hModule</i> has active static thread local storage, or if <i>hModule</i> is an invalid module handle. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//libloaderapi/nf-libloaderapi-disablethreadlibrarycalls
     * @since windows5.1.2600
     */
    static DisableThreadLibraryCalls(hLibModule) {
        hLibModule := hLibModule is Win32Handle ? NumGet(hLibModule, "ptr") : hLibModule

        A_LastError := 0

        result := DllCall("KERNEL32.dll\DisableThreadLibraryCalls", "ptr", hLibModule, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Determines the location of the resource with the specified type, name, and language in the specified module.
     * @param {HMODULE} hModule Type: <b>HMODULE</b>
     * 
     * A handle to the module whose portable executable file or an accompanying MUI file contains the resource. If this parameter is <b>NULL</b>, the function searches the module used to create the current process.
     * @param {PWSTR} lpType Type: <b>LPCTSTR</b>
     * 
     * The resource type. Alternately, rather than a pointer, this parameter can be <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcew">MAKEINTRESOURCE</a>(ID), where ID is the integer identifier of the given resource type. For standard resource types, see <a href="https://docs.microsoft.com/windows/desktop/menurc/resource-types">Resource Types</a>. For more information, see the Remarks section below.
     * @param {PWSTR} lpName Type: <b>LPCTSTR</b>
     * 
     * The name of the resource. Alternately, rather than a pointer, this parameter can be <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcew">MAKEINTRESOURCE</a>(ID), where ID is the integer identifier of the resource. For more information, see the Remarks section below.
     * @param {Integer} wLanguage Type: <b>WORD</b>
     * 
     * The language of the resource. If this parameter is <c>MAKELANGID(LANG_NEUTRAL, SUBLANG_NEUTRAL)</c>, the current language associated with the calling thread is used.
     * 
     * To specify a language other than the current language, use the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/nf-winnt-makelangid">MAKELANGID</a> macro to create this parameter. For more information, see <b>MAKELANGID</b>.
     * @returns {HRSRC} Type: <b>HRSRC</b>
     * 
     * If the function succeeds, the return value is a handle to the specified resource's information block. To obtain a handle to the resource, pass this handle to the <a href="/windows/desktop/api/libloaderapi/nf-libloaderapi-loadresource">LoadResource</a> function.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//libloaderapi/nf-libloaderapi-findresourceexw
     */
    static FindResourceExW(hModule, lpType, lpName, wLanguage) {
        hModule := hModule is Win32Handle ? NumGet(hModule, "ptr") : hModule
        lpType := lpType is String ? StrPtr(lpType) : lpType
        lpName := lpName is String ? StrPtr(lpName) : lpName

        result := DllCall("KERNEL32.dll\FindResourceExW", "ptr", hModule, "ptr", lpType, "ptr", lpName, "ushort", wLanguage, "ptr")
        resultHandle := HRSRC({Value: result}, True)
        return resultHandle
    }

    /**
     * Decrements the reference count of a loaded dynamic-link library (DLL) by one, then calls ExitThread to terminate the calling thread.
     * @remarks
     * 
     * The 
     * <b>FreeLibraryAndExitThread</b> function allows threads that are executing within a DLL to safely free the DLL in which they are executing and terminate themselves. If they were to call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-freelibrary">FreeLibrary</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-exitthread">ExitThread</a> separately, a race condition would exist. The library could be unloaded before 
     * <b>ExitThread</b> is called.
     * 
     * 
     * @param {HMODULE} hLibModule A handle to the DLL module whose reference count the function decrements. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulehandleexa">GetModuleHandleEx</a> function returns this handle.
     * 
     * Do not call this function with a handle returned by either the <b>GetModuleHandleEx</b> function (with the GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT flag) or the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulehandlea">GetModuleHandle</a> function, as they do not maintain a reference count for the module.
     * @param {Integer} dwExitCode The exit code for the calling thread.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//libloaderapi/nf-libloaderapi-freelibraryandexitthread
     * @since windows5.1.2600
     */
    static FreeLibraryAndExitThread(hLibModule, dwExitCode) {
        hLibModule := hLibModule is Win32Handle ? NumGet(hLibModule, "ptr") : hLibModule

        DllCall("KERNEL32.dll\FreeLibraryAndExitThread", "ptr", hLibModule, "uint", dwExitCode)
    }

    /**
     * Decrements (decreases by one) the reference count of a loaded resource. When the reference count reaches zero, the memory occupied by the resource is freed.
     * @param {HGLOBAL} hResData Type: <b>HGLOBAL</b>
     * 
     * A handle of the resource. It is assumed that <i>hglbResource</i> was created by <a href="https://docs.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-loadresource">LoadResource</a>.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is zero.
     * 
     * If the function fails, the return value is nonzero, which indicates that the resource has not been freed.
     * @see https://docs.microsoft.com/windows/win32/api//libloaderapi/nf-libloaderapi-freeresource
     * @since windows5.0
     */
    static FreeResource(hResData) {
        hResData := hResData is Win32Handle ? NumGet(hResData, "ptr") : hResData

        result := DllCall("KERNEL32.dll\FreeResource", "ptr", hResData, "int")
        return result
    }

    /**
     * Retrieves the fully qualified path for the file that contains the specified module. The module must have been loaded by the current process.
     * @param {HMODULE} hModule A handle to the loaded module whose path is being requested. If this parameter is <b>NULL</b>, 
     * <b>GetModuleFileName</b> retrieves the path of the executable file of the current process.
     * 
     * The <b>GetModuleFileName</b> function does not retrieve the path for modules  that were loaded using the <b>LOAD_LIBRARY_AS_DATAFILE</b> flag. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a>.
     * @param {PSTR} lpFilename A pointer to a buffer that receives the fully qualified path of the module. If the length of the path is less than the size that the <i>nSize</i> parameter specifies, the function succeeds and the path is returned as a null-terminated string. 
     * 
     * If the length of the path exceeds the size that  the <i>nSize</i> parameter specifies, the function succeeds and the string is truncated to <i>nSize</i>  characters including the terminating null character.
     * 
     * <b>Windows XP:  </b>The string is truncated to <i>nSize</i> characters and is not null-terminated.
     * 
     * The string returned will use the same format that was specified when the module was loaded. Therefore, the path can be a long or short file name, and can use the prefix `\\?\`. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/FileIO/naming-a-file">Naming a File</a>.
     * @param {Integer} nSize The size of the <i>lpFilename</i> buffer, in <b>TCHARs</b>.
     * @returns {Integer} If the function succeeds, the return value is the length of the string that is copied to the buffer, in characters, not including the terminating null character. If the buffer is too small to hold the module name, the string is truncated to <i>nSize</i> characters including the terminating null character, the function returns <i>nSize</i>, and the function sets the last error to <b>ERROR_INSUFFICIENT_BUFFER</b>.
     * 
     * <b>Windows XP:  </b>If the buffer is too small to hold the module name, the function returns <i>nSize</i>. The last error code remains <b>ERROR_SUCCESS</b>. If <i>nSize</i> is zero, the return value is zero and the last error code is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is 0 (zero). To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//libloaderapi/nf-libloaderapi-getmodulefilenamea
     * @since windows5.1.2600
     */
    static GetModuleFileNameA(hModule, lpFilename, nSize) {
        hModule := hModule is Win32Handle ? NumGet(hModule, "ptr") : hModule
        lpFilename := lpFilename is String ? StrPtr(lpFilename) : lpFilename

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetModuleFileNameA", "ptr", hModule, "ptr", lpFilename, "uint", nSize, "uint")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the fully qualified path for the file that contains the specified module. The module must have been loaded by the current process.
     * @param {HMODULE} hModule A handle to the loaded module whose path is being requested. If this parameter is <b>NULL</b>, 
     * <b>GetModuleFileName</b> retrieves the path of the executable file of the current process.
     * 
     * The <b>GetModuleFileName</b> function does not retrieve the path for modules  that were loaded using the <b>LOAD_LIBRARY_AS_DATAFILE</b> flag. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a>.
     * @param {PWSTR} lpFilename A pointer to a buffer that receives the fully qualified path of the module. If the length of the path is less than the size that the <i>nSize</i> parameter specifies, the function succeeds and the path is returned as a null-terminated string. 
     * 
     * If the length of the path exceeds the size that  the <i>nSize</i> parameter specifies, the function succeeds and the string is truncated to <i>nSize</i>  characters including the terminating null character.
     * 
     * <b>Windows XP:  </b>The string is truncated to <i>nSize</i> characters and is not null-terminated.
     * 
     * The string returned will use the same format that was specified when the module was loaded. Therefore, the path can be a long or short file name, and can use the prefix "\\?\". For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/FileIO/naming-a-file">Naming a File</a>.
     * @param {Integer} nSize The size of the <i>lpFilename</i> buffer, in <b>TCHARs</b>.
     * @returns {Integer} If the function succeeds, the return value is the length of the string that is copied to the buffer, in characters, not including the terminating null character. If the buffer is too small to hold the module name, the string is truncated to <i>nSize</i> characters including the terminating null character, the function returns <i>nSize</i>, and the function sets the last error to <b>ERROR_INSUFFICIENT_BUFFER</b>.
     * 
     * <b>Windows XP:  </b>If the buffer is too small to hold the module name, the function returns <i>nSize</i>. The last error code remains <b>ERROR_SUCCESS</b>. If <i>nSize</i> is zero, the return value is zero and the last error code is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is 0 (zero). To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//libloaderapi/nf-libloaderapi-getmodulefilenamew
     * @since windows5.1.2600
     */
    static GetModuleFileNameW(hModule, lpFilename, nSize) {
        hModule := hModule is Win32Handle ? NumGet(hModule, "ptr") : hModule
        lpFilename := lpFilename is String ? StrPtr(lpFilename) : lpFilename

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetModuleFileNameW", "ptr", hModule, "ptr", lpFilename, "uint", nSize, "uint")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves a module handle for the specified module. The module must have been loaded by the calling process.
     * @param {PSTR} lpModuleName The name of the loaded module (either a .dll or .exe file). If the file name extension is omitted, the default library extension .dll is appended. The file name string can include a trailing point character (.) to indicate that the module name has no extension. The string does not have to specify a path. When specifying a path, be sure to use backslashes (\\), not forward slashes (/). The name is compared (case independently) to the names of modules currently mapped into the address space of the calling process. 
     * 
     * 
     * 
     * 
     * If this parameter is NULL, 
     * <b>GetModuleHandle</b> returns a handle to the file used to create the calling process (.exe file).
     * 
     * The <b>GetModuleHandle</b> function does not retrieve handles for modules that were loaded using the <b>LOAD_LIBRARY_AS_DATAFILE</b> flag. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a>.
     * @returns {HMODULE} If the function succeeds, the return value is a handle to the specified module.
     * 
     * If the function fails, the return value is NULL. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//libloaderapi/nf-libloaderapi-getmodulehandlea
     * @since windows5.1.2600
     */
    static GetModuleHandleA(lpModuleName) {
        lpModuleName := lpModuleName is String ? StrPtr(lpModuleName) : lpModuleName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetModuleHandleA", "ptr", lpModuleName, "ptr")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        resultHandle := HMODULE({Value: result}, False)
        return resultHandle
    }

    /**
     * Retrieves a module handle for the specified module. The module must have been loaded by the calling process.
     * @param {PWSTR} lpModuleName The name of the loaded module (either a .dll or .exe file). If the file name extension is omitted, the default library extension .dll is appended. The file name string can include a trailing point character (.) to indicate that the module name has no extension. The string does not have to specify a path. When specifying a path, be sure to use backslashes (\\), not forward slashes (/). The name is compared (case independently) to the names of modules currently mapped into the address space of the calling process. 
     * 
     * 
     * 
     * 
     * If this parameter is NULL, 
     * <b>GetModuleHandle</b> returns a handle to the file used to create the calling process (.exe file).
     * 
     * The <b>GetModuleHandle</b> function does not retrieve handles for modules that were loaded using the <b>LOAD_LIBRARY_AS_DATAFILE</b> flag. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a>.
     * @returns {HMODULE} If the function succeeds, the return value is a handle to the specified module.
     * 
     * If the function fails, the return value is NULL. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//libloaderapi/nf-libloaderapi-getmodulehandlew
     * @since windows5.1.2600
     */
    static GetModuleHandleW(lpModuleName) {
        lpModuleName := lpModuleName is String ? StrPtr(lpModuleName) : lpModuleName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetModuleHandleW", "ptr", lpModuleName, "ptr")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        resultHandle := HMODULE({Value: result}, False)
        return resultHandle
    }

    /**
     * Retrieves a module handle for the specified module and increments the module's reference count unless GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT is specified. The module must have been loaded by the calling process.
     * @param {Integer} dwFlags 
     * @param {PSTR} lpModuleName The name of the loaded module (either a .dll or .exe file), or an address in the module (if <i>dwFlags</i> is GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS). 
     * 
     * 
     * 
     * 
     * For a module name, if the file name extension is omitted, the default library extension .dll is appended. The file name string can include a trailing point character (.) to indicate that the module name has no extension. The string does not have to specify a path. When specifying a path, be sure to use backslashes (\\), not forward slashes (/). The name is compared (case independently) to the names of modules currently mapped into the address space of the calling process.
     * 
     * If this parameter is NULL, the function returns a handle to the file used to create the calling process (.exe file).
     * @param {Pointer<HMODULE>} phModule A handle to the specified module. If the function fails, this parameter is NULL.
     * 
     * The <b>GetModuleHandleEx</b> function does not retrieve handles for modules that were loaded using the <b>LOAD_LIBRARY_AS_DATAFILE</b> flag. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, see 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//libloaderapi/nf-libloaderapi-getmodulehandleexa
     * @since windows5.1.2600
     */
    static GetModuleHandleExA(dwFlags, lpModuleName, phModule) {
        lpModuleName := lpModuleName is String ? StrPtr(lpModuleName) : lpModuleName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetModuleHandleExA", "uint", dwFlags, "ptr", lpModuleName, "ptr", phModule, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves a module handle for the specified module and increments the module's reference count unless GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT is specified. The module must have been loaded by the calling process.
     * @param {Integer} dwFlags 
     * @param {PWSTR} lpModuleName The name of the loaded module (either a .dll or .exe file), or an address in the module (if <i>dwFlags</i> is GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS). 
     * 
     * 
     * 
     * 
     * For a module name, if the file name extension is omitted, the default library extension .dll is appended. The file name string can include a trailing point character (.) to indicate that the module name has no extension. The string does not have to specify a path. When specifying a path, be sure to use backslashes (\\), not forward slashes (/). The name is compared (case independently) to the names of modules currently mapped into the address space of the calling process.
     * 
     * If this parameter is NULL, the function returns a handle to the file used to create the calling process (.exe file).
     * @param {Pointer<HMODULE>} phModule A handle to the specified module. If the function fails, this parameter is NULL.
     * 
     * The <b>GetModuleHandleEx</b> function does not retrieve handles for modules that were loaded using the <b>LOAD_LIBRARY_AS_DATAFILE</b> flag. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, see 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//libloaderapi/nf-libloaderapi-getmodulehandleexw
     * @since windows5.1.2600
     */
    static GetModuleHandleExW(dwFlags, lpModuleName, phModule) {
        lpModuleName := lpModuleName is String ? StrPtr(lpModuleName) : lpModuleName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetModuleHandleExW", "uint", dwFlags, "ptr", lpModuleName, "ptr", phModule, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the address of an exported function or variable from the specified dynamic-link library (DLL).
     * @param {HMODULE} hModule A handle to the DLL module that contains the function or variable. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a>, <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-loadpackagedlibrary">LoadPackagedLibrary</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulehandlea">GetModuleHandle</a> function returns this handle. 
     * 
     * The <b>GetProcAddress</b> function does not retrieve addresses from modules that were loaded using the <b>LOAD_LIBRARY_AS_DATAFILE</b> flag. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a>.
     * @param {PSTR} lpProcName The function or variable name, or the function's ordinal value. If this parameter is an ordinal value, it must be in the low-order word; the high-order word must be zero.
     * @returns {Pointer<FARPROC>} If the function succeeds, the return value is the address of the exported function or variable.
     * 
     * If the function fails, the return value is NULL. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//libloaderapi/nf-libloaderapi-getprocaddress
     * @since windows5.1.2600
     */
    static GetProcAddress(hModule, lpProcName) {
        hModule := hModule is Win32Handle ? NumGet(hModule, "ptr") : hModule
        lpProcName := lpProcName is String ? StrPtr(lpProcName) : lpProcName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetProcAddress", "ptr", hModule, "ptr", lpProcName, "ptr")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Loads the specified module into the address space of the calling process.
     * @param {PSTR} lpLibFileName A string that specifies the file name of the module to load. This name is not related to the name stored in a 
     *        library module itself, as specified by the <b>LIBRARY</b> keyword in the module-definition 
     *        (.def) file.
     * 
     * The module can be a library module (a .dll file) or an executable module (an .exe file). If the 
     *        specified module is an executable module, static imports are not loaded; instead, the module is loaded as if 
     *        <b>DONT_RESOLVE_DLL_REFERENCES</b> was specified. See the <i>dwFlags</i> 
     *        parameter for more information.
     * 
     * If the string specifies a module name without a path and the file name extension is omitted, the function 
     *        appends the default library extension .dll to the module name. To prevent the function from appending 
     *        .dll to the module name, include a trailing point character (.) in the module name string.
     * 
     * If the string specifies a fully qualified path, the function searches only that path for the module. When 
     *        specifying a path, be sure to use backslashes (\\), not forward slashes (/). For more information about paths, 
     *        see <a href="https://docs.microsoft.com/windows/desktop/FileIO/naming-a-file">Naming Files, Paths, and Namespaces</a>.
     * 
     * If the string specifies a module name without a path and more than one loaded module has the same base name 
     *        and extension, the function returns a handle to the module that was loaded first.
     * 
     * If the string specifies a module name without a path and a module of the same name is not already loaded, or 
     *        if the string specifies a module name with a relative path, the function searches for the specified module. The 
     *        function also searches for modules if loading the specified module causes the system to load other associated 
     *        modules (that is, if the module has dependencies). The directories that are searched and the order in which 
     *        they are searched depend on the specified path and the <i>dwFlags</i> parameter. For more 
     *        information, see Remarks.
     * 
     * If the function cannot find the  module or one of its dependencies, the function fails.
     * @param {Integer} dwFlags The action to be taken when loading the module. If no flags are specified, the behavior of this function is 
     *       identical to that of the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> function. This
     * @returns {HMODULE} If the function succeeds, the return value is a handle to the loaded module.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, 
     *        call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//libloaderapi/nf-libloaderapi-loadlibraryexa
     * @since windows5.1.2600
     */
    static LoadLibraryExA(lpLibFileName, dwFlags) {
        static hFile := 0 ;Reserved parameters must always be NULL

        lpLibFileName := lpLibFileName is String ? StrPtr(lpLibFileName) : lpLibFileName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\LoadLibraryExA", "ptr", lpLibFileName, "ptr", hFile, "uint", dwFlags, "ptr")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        resultHandle := HMODULE({Value: result}, True)
        return resultHandle
    }

    /**
     * Loads the specified module into the address space of the calling process.
     * @param {PWSTR} lpLibFileName A string that specifies the file name of the module to load. This name is not related to the name stored in a 
     *        library module itself, as specified by the <b>LIBRARY</b> keyword in the module-definition 
     *        (.def) file.
     * 
     * The module can be a library module (a .dll file) or an executable module (an .exe file). If the 
     *        specified module is an executable module, static imports are not loaded; instead, the module is loaded as if 
     *        <b>DONT_RESOLVE_DLL_REFERENCES</b> was specified. See the <i>dwFlags</i> 
     *        parameter for more information.
     * 
     * If the string specifies a module name without a path and the file name extension is omitted, and the module name does
     *        not contain any point character (.), then the function appends the default library extension .dll to the module name.
     *        To prevent the function from appending .dll to the module name, include a trailing point character (.) in the module
     *        name string.
     * 
     * If the string specifies a fully qualified path, the function searches only that path for the module. When 
     *        specifying a path, be sure to use backslashes (\\), not forward slashes (/). For more information about paths, 
     *        see <a href="https://docs.microsoft.com/windows/desktop/FileIO/naming-a-file">Naming Files, Paths, and Namespaces</a>.
     * 
     * If the string specifies a module name without a path and more than one loaded module has the same base name 
     *        and extension, the function returns a handle to the module that was loaded first.
     * 
     * If the string specifies a module name without a path and a module of the same name is not already loaded, or 
     *        if the string specifies a module name with a relative path, the function searches for the specified module. The 
     *        function also searches for modules if loading the specified module causes the system to load other associated 
     *        modules (that is, if the module has dependencies). The directories that are searched and the order in which 
     *        they are searched depend on the specified path and the <i>dwFlags</i> parameter. For more 
     *        information, see Remarks.
     * 
     * If the function cannot find the  module or one of its dependencies, the function fails.
     * @param {Integer} dwFlags The action to be taken when loading the module. If no flags are specified, the behavior of this function is 
     *       identical to that of the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> function. This
     * @returns {HMODULE} If the function succeeds, the return value is a handle to the loaded module.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, 
     *        call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//libloaderapi/nf-libloaderapi-loadlibraryexw
     * @since windows5.1.2600
     */
    static LoadLibraryExW(lpLibFileName, dwFlags) {
        static hFile := 0 ;Reserved parameters must always be NULL

        lpLibFileName := lpLibFileName is String ? StrPtr(lpLibFileName) : lpLibFileName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\LoadLibraryExW", "ptr", lpLibFileName, "ptr", hFile, "uint", dwFlags, "ptr")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        resultHandle := HMODULE({Value: result}, True)
        return resultHandle
    }

    /**
     * Retrieves a handle that can be used to obtain a pointer to the first byte of the specified resource in memory.
     * @param {HMODULE} hModule Type: <b>HMODULE</b>
     * 
     * A handle to the module whose executable file contains the resource. If <i>hModule</i> is <b>NULL</b>, the system loads the resource from the module that was used to create the current process.
     * @param {HRSRC} hResInfo Type: <b>HRSRC</b>
     * 
     * A handle to the resource to be loaded. This handle is returned by the <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-findresourcea">FindResource</a> or <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-findresourceexa">FindResourceEx</a> function.
     * @returns {HGLOBAL} Type: <b>HGLOBAL</b>
     * 
     * If the function succeeds, the return value is a handle to the data associated with the resource.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//libloaderapi/nf-libloaderapi-loadresource
     * @since windows5.0
     */
    static LoadResource(hModule, hResInfo) {
        hModule := hModule is Win32Handle ? NumGet(hModule, "ptr") : hModule
        hResInfo := hResInfo is Win32Handle ? NumGet(hResInfo, "ptr") : hResInfo

        A_LastError := 0

        result := DllCall("KERNEL32.dll\LoadResource", "ptr", hModule, "ptr", hResInfo, "ptr")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        resultHandle := HGLOBAL({Value: result}, False)
        return resultHandle
    }

    /**
     * Retrieves a pointer to the specified resource in memory.
     * @param {HGLOBAL} hResData Type: **HGLOBAL**
     * 
     * A handle to the resource to be accessed. The [LoadResource function](nf-libloaderapi-loadresource.md) returns this handle. Note that this parameter is listed as an **HGLOBAL** variable only for backward compatibility. Do not pass any value as a parameter other than a successful return value from the **LoadResource** function.
     * @returns {Pointer<Void>} Type: **LPVOID**
     * 
     * If the loaded resource is available, the return value is a pointer to the first byte of the resource; otherwise, it is **NULL**.
     * @see https://docs.microsoft.com/windows/win32/api//libloaderapi/nf-libloaderapi-lockresource
     * @since windows5.0
     */
    static LockResource(hResData) {
        hResData := hResData is Win32Handle ? NumGet(hResData, "ptr") : hResData

        result := DllCall("KERNEL32.dll\LockResource", "ptr", hResData, "ptr")
        return result
    }

    /**
     * Retrieves the size, in bytes, of the specified resource.
     * @param {HMODULE} hModule Type: <b>HMODULE</b>
     * 
     * A handle to the module whose executable file contains the resource.
     * @param {HRSRC} hResInfo Type: <b>HRSRC</b>
     * 
     * A handle to the resource. This handle must be created by using the <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-findresourcea">FindResource</a> or <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-findresourceexa">FindResourceEx</a> function.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * If the function succeeds, the return value is the number of bytes in the resource.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//libloaderapi/nf-libloaderapi-sizeofresource
     * @since windows5.0
     */
    static SizeofResource(hModule, hResInfo) {
        hModule := hModule is Win32Handle ? NumGet(hModule, "ptr") : hModule
        hResInfo := hResInfo is Win32Handle ? NumGet(hResInfo, "ptr") : hResInfo

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SizeofResource", "ptr", hModule, "ptr", hResInfo, "uint")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds a directory to the process DLL search path.
     * @param {PWSTR} NewDirectory An absolute path to the directory to add to the search path. For example, to add the directory 
     *       Dir2 to the process DLL search path, specify \Dir2. For more information about paths, 
     *       see <a href="https://docs.microsoft.com/windows/desktop/FileIO/naming-a-file">Naming Files, Paths, and Namespaces</a>.
     * @returns {Pointer<Void>} If the function succeeds, the return value is an opaque pointer that can be passed to 
     *       <a href="/windows/desktop/api/libloaderapi/nf-libloaderapi-removedlldirectory">RemoveDllDirectory</a> to remove the DLL from the 
     *       process DLL search path.
     * 
     * If the function fails, the return value is zero. To get extended error 
     *       information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//libloaderapi/nf-libloaderapi-adddlldirectory
     * @since windows8.0
     */
    static AddDllDirectory(NewDirectory) {
        NewDirectory := NewDirectory is String ? StrPtr(NewDirectory) : NewDirectory

        A_LastError := 0

        result := DllCall("KERNEL32.dll\AddDllDirectory", "ptr", NewDirectory, "ptr")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes a directory that was added to the process DLL search path by using AddDllDirectory.
     * @param {Pointer<Void>} Cookie The cookie returned by <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-adddlldirectory">AddDllDirectory</a> when the 
     *       directory was added to the search path.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value 
     *       is zero. To get extended error information, call 
     *       <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//libloaderapi/nf-libloaderapi-removedlldirectory
     * @since windows8.0
     */
    static RemoveDllDirectory(Cookie) {
        CookieMarshal := Cookie is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\RemoveDllDirectory", CookieMarshal, Cookie, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Specifies a default set of directories to search when the calling process loads a DLL. This search path is used when LoadLibraryEx is called with no LOAD_LIBRARY_SEARCH flags.
     * @param {Integer} DirectoryFlags 
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//libloaderapi/nf-libloaderapi-setdefaultdlldirectories
     * @since windows8.0
     */
    static SetDefaultDllDirectories(DirectoryFlags) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetDefaultDllDirectories", "uint", DirectoryFlags, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Enumerates language-specific resources, of the specified type and name, associated with a specified binary module. Extends EnumResourceLanguages by allowing more control over the enumeration.
     * @param {HMODULE} hModule Type: <b>HMODULE</b>
     * 
     * The handle to a module to search. Typically this is a <a href="https://docs.microsoft.com/windows/desktop/Intl/mui-resource-management">language-neutral Portable Executable</a> (LN file), and if flag <b>RESOURCE_ENUM_MUI</b> is set, then appropriate .mui files are included in the search. Alternately, this can be a handle to an .mui file or other LN file. If this is a specific .mui file, only that file is searched for resources.
     *     
     *                     
     * 
     * If this parameter is <b>NULL</b>, it is equivalent to passing in a handle to the module used to create the current process.
     * @param {PSTR} lpType Type: <b>LPCTSTR</b>
     * 
     * The type of the resource for which the language is being enumerated. Alternately, rather than a pointer, this parameter can be <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a>(ID), where ID is an integer value representing a predefined resource type. For a list of predefined resource types, see <a href="https://docs.microsoft.com/windows/desktop/menurc/resource-types">Resource Types</a>. For more 
     * 
     * information, see the Remarks section below.
     * @param {PSTR} lpName Type: <b>LPCTSTR</b>
     * 
     * The name of the resource for which the language is being enumerated. Alternately, rather than a pointer, this parameter can be <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a>(ID), where ID is the integer identifier of the resource. For more information, see the Remarks section below.
     * @param {Pointer<ENUMRESLANGPROCA>} lpEnumFunc Type: <b>ENUMRESLANGPROC</b>
     * 
     * A pointer to the callback function to be called for each enumerated resource language. For more information, see <a href="https://msdn.microsoft.com/58c1a42d-15d2-4157-8c57-f9b1d389b917">EnumResLangProc</a>.
     * @param {Pointer} lParam Type: <b>LONG_PTR</b>
     * 
     * An application-defined value passed to the callback function. This parameter can be used in error checking.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * The type of file to be searched. The following values are supported. Note that if <i>dwFlags</i> is zero, then the <b>RESOURCE_ENUM_LN</b> and <b>RESOURCE_ENUM_MUI</b> flags are assumed to be specified.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RESOURCE_ENUM_MUI"></a><a id="resource_enum_mui"></a><dl>
     * <dt><b>RESOURCE_ENUM_MUI</b></dt>
     * <dt>0x0002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Search for language-specific resources in .mui files associated with the LN file specified by <i>hModule</i>. Alternately, if <i>LangId</i> is nonzero, the only .mui file searched will be the one matching the specified <i>LangId</i>. Typically this flag should be used only if <i>hModule</i> references an LN file. If <i>hModule</i> references an .mui file, then that file is actually covered by the <b>RESOURCE_LN</b> flag, despite the name of the flag. See the Remarks section below for sequence of search.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RESOURCE_ENUM_LN"></a><a id="resource_enum_ln"></a><dl>
     * <dt><b>RESOURCE_ENUM_LN</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Searches the file specified by <i>hModule</i>, regardless of whether the file is an LN file, another type of LN file, or an .mui file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RESOURCE_ENUM_MUI_SYSTEM"></a><a id="resource_enum_mui_system"></a><dl>
     * <dt><b>RESOURCE_ENUM_MUI_SYSTEM</b></dt>
     * <dt>0x0004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Restricts the .mui files search to system-installed MUI languages.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RESOURCE_ENUM_VALIDATE"></a><a id="resource_enum_validate"></a><dl>
     * <dt><b>RESOURCE_ENUM_VALIDATE</b></dt>
     * <dt>0x0008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Performs extra validation on the resource section and its reference in the PE header while doing the enumeration to ensure that resources are properly formatted.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} LangId Type: <b>LANGID</b>
     * 
     * The localization language used to filter the search in the .mui file. This parameter is used only when the <b>RESOURCE_ENUM_MUI</b> flag is set in <i>dwFlags</i>. If zero is specified, then all .mui files are included in the search. If a nonzero <i>LangId</i> is specified, then the only .mui file searched will be the one matching the specified <i>LangId</i>.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns <b>TRUE</b> if the function succeeds or <b>FALSE</b> if the function does not find a resource of the type specified, or if the function fails for another reason. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//libloaderapi/nf-libloaderapi-enumresourcelanguagesexa
     * @since windows6.0.6000
     */
    static EnumResourceLanguagesExA(hModule, lpType, lpName, lpEnumFunc, lParam, dwFlags, LangId) {
        hModule := hModule is Win32Handle ? NumGet(hModule, "ptr") : hModule
        lpType := lpType is String ? StrPtr(lpType) : lpType
        lpName := lpName is String ? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\EnumResourceLanguagesExA", "ptr", hModule, "ptr", lpType, "ptr", lpName, "ptr", lpEnumFunc, "ptr", lParam, "uint", dwFlags, "ushort", LangId, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Enumerates language-specific resources, of the specified type and name, associated with a specified binary module. Extends EnumResourceLanguages by allowing more control over the enumeration.
     * @param {HMODULE} hModule Type: <b>HMODULE</b>
     * 
     * The handle to a module to search. Typically this is a <a href="https://docs.microsoft.com/windows/desktop/Intl/mui-resource-management">language-neutral Portable Executable</a> (LN file), and if flag <b>RESOURCE_ENUM_MUI</b> is set, then appropriate .mui files are included in the search. Alternately, this can be a handle to an .mui file or other LN file. If this is a specific .mui file, only that file is searched for resources.
     *     
     *                     
     * 
     * If this parameter is <b>NULL</b>, it is equivalent to passing in a handle to the module used to create the current process.
     * @param {PWSTR} lpType Type: <b>LPCTSTR</b>
     * 
     * The type of the resource for which the language is being enumerated. Alternately, rather than a pointer, this parameter can be <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a>(ID), where ID is an integer value representing a predefined resource type. For a list of predefined resource types, see <a href="https://docs.microsoft.com/windows/desktop/menurc/resource-types">Resource Types</a>. For more 
     * 
     * information, see the Remarks section below.
     * @param {PWSTR} lpName Type: <b>LPCTSTR</b>
     * 
     * The name of the resource for which the language is being enumerated. Alternately, rather than a pointer, this parameter can be <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a>(ID), where ID is the integer identifier of the resource. For more information, see the Remarks section below.
     * @param {Pointer<ENUMRESLANGPROCW>} lpEnumFunc Type: <b>ENUMRESLANGPROC</b>
     * 
     * A pointer to the callback function to be called for each enumerated resource language. For more information, see <a href="https://msdn.microsoft.com/58c1a42d-15d2-4157-8c57-f9b1d389b917">EnumResLangProc</a>.
     * @param {Pointer} lParam Type: <b>LONG_PTR</b>
     * 
     * An application-defined value passed to the callback function. This parameter can be used in error checking.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * The type of file to be searched. The following values are supported. Note that if <i>dwFlags</i> is zero, then the <b>RESOURCE_ENUM_LN</b> and <b>RESOURCE_ENUM_MUI</b> flags are assumed to be specified.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RESOURCE_ENUM_MUI"></a><a id="resource_enum_mui"></a><dl>
     * <dt><b>RESOURCE_ENUM_MUI</b></dt>
     * <dt>0x0002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Search for language-specific resources in .mui files associated with the LN file specified by <i>hModule</i>. Alternately, if <i>LangId</i> is nonzero, the only .mui file searched will be the one matching the specified <i>LangId</i>. Typically this flag should be used only if <i>hModule</i> references an LN file. If <i>hModule</i> references an .mui file, then that file is actually covered by the <b>RESOURCE_LN</b> flag, despite the name of the flag. See the Remarks section below for sequence of search.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RESOURCE_ENUM_LN"></a><a id="resource_enum_ln"></a><dl>
     * <dt><b>RESOURCE_ENUM_LN</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Searches the file specified by <i>hModule</i>, regardless of whether the file is an LN file, another type of LN file, or an .mui file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RESOURCE_ENUM_MUI_SYSTEM"></a><a id="resource_enum_mui_system"></a><dl>
     * <dt><b>RESOURCE_ENUM_MUI_SYSTEM</b></dt>
     * <dt>0x0004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Restricts the .mui files search to system-installed MUI languages.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RESOURCE_ENUM_VALIDATE"></a><a id="resource_enum_validate"></a><dl>
     * <dt><b>RESOURCE_ENUM_VALIDATE</b></dt>
     * <dt>0x0008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Performs extra validation on the resource section and its reference in the PE header while doing the enumeration to ensure that resources are properly formatted.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} LangId Type: <b>LANGID</b>
     * 
     * The localization language used to filter the search in the .mui file. This parameter is used only when the <b>RESOURCE_ENUM_MUI</b> flag is set in <i>dwFlags</i>. If zero is specified, then all .mui files are included in the search. If a nonzero <i>LangId</i> is specified, then the only .mui file searched will be the one matching the specified <i>LangId</i>.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns <b>TRUE</b> if the function succeeds or <b>FALSE</b> if the function does not find a resource of the type specified, or if the function fails for another reason. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//libloaderapi/nf-libloaderapi-enumresourcelanguagesexw
     * @since windows6.0.6000
     */
    static EnumResourceLanguagesExW(hModule, lpType, lpName, lpEnumFunc, lParam, dwFlags, LangId) {
        hModule := hModule is Win32Handle ? NumGet(hModule, "ptr") : hModule
        lpType := lpType is String ? StrPtr(lpType) : lpType
        lpName := lpName is String ? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\EnumResourceLanguagesExW", "ptr", hModule, "ptr", lpType, "ptr", lpName, "ptr", lpEnumFunc, "ptr", lParam, "uint", dwFlags, "ushort", LangId, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Enumerates resources of a specified type that are associated with a specified binary module. The search can include both an LN file and its associated .mui files, or it can be limited in several ways.
     * @param {HMODULE} hModule Type: <b>HMODULE</b>
     * 
     * The handle to a module to search. Typically this is an LN file, and if flag <b>RESOURCE_ENUM_MUI</b> is set, then appropriate .mui files are included in the search. Alternately, this can be a handle to an .mui file or other LN file.
     * 
     * If this parameter is <b>NULL</b>, it is equivalent to passing in a handle to the module used to create the current process.
     * @param {PSTR} lpType Type: <b>LPCSTR</b>
     * 
     * The type of the resource for which the name is being enumerated. Alternately, rather than a pointer, this parameter can be <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a>(ID), where ID is an integer value representing a predefined resource type. For a list of predefined resource types, see <a href="https://msdn.microsoft.com/8d27f79a-8165-4565-a975-f25b2344efdc">Resource Types</a>. For more information, see the Remarks section below.
     * @param {Pointer<ENUMRESNAMEPROCA>} lpEnumFunc Type: <b>ENUMRESNAMEPROC</b>
     * 
     * A pointer to the callback function to be called for each enumerated resource name. For more information, see <a href="https://docs.microsoft.com/windows/win32/api/libloaderapi/nc-libloaderapi-enumresnameproca">EnumResNameProc</a>.
     * @param {Pointer} lParam Type: <b>LONG_PTR</b>
     * 
     * An application-defined value passed to the callback function. This parameter can be used in error checking.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * The type of file to search. The following values are supported. Note that if <i>dwFlags</i> is zero, then the <b>RESOURCE_ENUM_LN</b> and <b>RESOURCE_ENUM_MUI</b>  flags are assumed to be specified.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RESOURCE_ENUM_MUI"></a><a id="resource_enum_mui"></a><dl>
     * <dt><b>RESOURCE_ENUM_MUI</b></dt>
     * <dt>0x0002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Search for resources in .mui files associated with the LN file specified by <i>hModule</i> and with the current language preferences, following the usual Resource Loader strategy (see <a href="https://docs.microsoft.com/windows/desktop/Intl/user-interface-language-management">User Interface Language Management</a>). Alternately, if <i>LangId</i> is nonzero, then only the specified .mui file will be searched. Typically this flag should be used only if <i>hModule</i> references an LN file. If <i>hModule</i> references an .mui file, then that file is actually covered by the <b>RESOURCE_ENUM_LN</b> flag, despite the name of the flag.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RESOURCE_ENUM_LN"></a><a id="resource_enum_ln"></a><dl>
     * <dt><b>RESOURCE_ENUM_LN</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Searches the file specified by <i>hModule</i>, regardless of whether the file is an LN file, another type of LN file, or an .mui file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RESOURCE_ENUM_VALIDATE"></a><a id="resource_enum_validate"></a><dl>
     * <dt><b>RESOURCE_ENUM_VALIDATE</b></dt>
     * <dt>0x0008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Performs extra validation on the resource section and its reference in the PE header while doing the enumeration to ensure that resources are properly formatted. The validation sets a maximum limit of 260 characters for each name that is enumerated.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} LangId Type: <b>LANGID</b>
     * 
     * The localization language used to filter the search in the MUI module. This parameter is used only when the <b>RESOURCE_ENUM_MUI</b> flag is set in <i>dwFlags</i>. If zero is specified, then all .mui files that match current language preferences are included in the search, following the usual Resource Loader strategy (see <a href="https://docs.microsoft.com/windows/desktop/Intl/user-interface-language-management">User Interface Language Management</a>). If a nonzero <i>LangId</i> is specified, then the only .mui file searched will be the one matching the specified <i>LangId</i>.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * The function <b>TRUE</b> if successful, or <b>FALSE</b> if the function does not find a resource of the type specified, or if the function fails for another reason. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//libloaderapi/nf-libloaderapi-enumresourcenamesexa
     * @since windows6.0.6000
     */
    static EnumResourceNamesExA(hModule, lpType, lpEnumFunc, lParam, dwFlags, LangId) {
        hModule := hModule is Win32Handle ? NumGet(hModule, "ptr") : hModule
        lpType := lpType is String ? StrPtr(lpType) : lpType

        A_LastError := 0

        result := DllCall("KERNEL32.dll\EnumResourceNamesExA", "ptr", hModule, "ptr", lpType, "ptr", lpEnumFunc, "ptr", lParam, "uint", dwFlags, "ushort", LangId, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Enumerates resources of a specified type that are associated with a specified binary module. The search can include both an LN file and its associated .mui files, or it can be limited in several ways.
     * @param {HMODULE} hModule Type: <b>HMODULE</b>
     * 
     * The handle to a module to search. Typically this is an LN file, and if flag <b>RESOURCE_ENUM_MUI</b> is set, then appropriate .mui files are included in the search. Alternately, this can be a handle to an .mui file or other LN file.
     * 
     * If this parameter is <b>NULL</b>, it is equivalent to passing in a handle to the module used to create the current process.
     * @param {PWSTR} lpType Type: <b>LPCTSTR</b>
     * 
     * The type of the resource for which the name is being enumerated. Alternately, rather than a pointer, this parameter can be <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a>(ID), where ID is an integer value representing a predefined resource type. For a list of predefined resource types, see <a href="https://msdn.microsoft.com/8d27f79a-8165-4565-a975-f25b2344efdc">Resource Types</a>. For more information, see the Remarks section below.
     * @param {Pointer<ENUMRESNAMEPROCW>} lpEnumFunc Type: <b>ENUMRESNAMEPROC</b>
     * 
     * A pointer to the callback function to be called for each enumerated resource name. For more information, see <a href="https://docs.microsoft.com/windows/win32/api/libloaderapi/nc-libloaderapi-enumresnameproca">EnumResNameProc</a>.
     * @param {Pointer} lParam Type: <b>LONG_PTR</b>
     * 
     * An application-defined value passed to the callback function. This parameter can be used in error checking.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * The type of file to search. The following values are supported. Note that if <i>dwFlags</i> is zero, then the <b>RESOURCE_ENUM_LN</b> and <b>RESOURCE_ENUM_MUI</b>  flags are assumed to be specified.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RESOURCE_ENUM_MUI"></a><a id="resource_enum_mui"></a><dl>
     * <dt><b>RESOURCE_ENUM_MUI</b></dt>
     * <dt>0x0002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Search for resources in .mui files associated with the LN file specified by <i>hModule</i> and with the current language preferences, following the usual Resource Loader strategy (see <a href="https://docs.microsoft.com/windows/desktop/Intl/user-interface-language-management">User Interface Language Management</a>). Alternately, if <i>LangId</i> is nonzero, then only the specified .mui file will be searched. Typically this flag should be used only if <i>hModule</i> references an LN file. If <i>hModule</i> references an .mui file, then that file is actually covered by the <b>RESOURCE_ENUM_LN</b> flag, despite the name of the flag.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RESOURCE_ENUM_LN"></a><a id="resource_enum_ln"></a><dl>
     * <dt><b>RESOURCE_ENUM_LN</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Searches the file specified by <i>hModule</i>, regardless of whether the file is an LN file, another type of LN file, or an .mui file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RESOURCE_ENUM_VALIDATE"></a><a id="resource_enum_validate"></a><dl>
     * <dt><b>RESOURCE_ENUM_VALIDATE</b></dt>
     * <dt>0x0008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Performs extra validation on the resource section and its reference in the PE header while doing the enumeration to ensure that resources are properly formatted. The validation sets a maximum limit of 260 characters for each name that is enumerated.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} LangId Type: <b>LANGID</b>
     * 
     * The localization language used to filter the search in the MUI module. This parameter is used only when the <b>RESOURCE_ENUM_MUI</b> flag is set in <i>dwFlags</i>. If zero is specified, then all .mui files that match current language preferences are included in the search, following the usual Resource Loader strategy (see <a href="https://docs.microsoft.com/windows/desktop/Intl/user-interface-language-management">User Interface Language Management</a>). If a nonzero <i>LangId</i> is specified, then the only .mui file searched will be the one matching the specified <i>LangId</i>.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * The function <b>TRUE</b> if successful, or <b>FALSE</b> if the function does not find a resource of the type specified, or if the function fails for another reason. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//libloaderapi/nf-libloaderapi-enumresourcenamesexw
     * @since windows6.0.6000
     */
    static EnumResourceNamesExW(hModule, lpType, lpEnumFunc, lParam, dwFlags, LangId) {
        hModule := hModule is Win32Handle ? NumGet(hModule, "ptr") : hModule
        lpType := lpType is String ? StrPtr(lpType) : lpType

        A_LastError := 0

        result := DllCall("KERNEL32.dll\EnumResourceNamesExW", "ptr", hModule, "ptr", lpType, "ptr", lpEnumFunc, "ptr", lParam, "uint", dwFlags, "ushort", LangId, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Enumerates resource types associated with a specified binary module.
     * @param {HMODULE} hModule Type: <b>HMODULE</b>
     * 
     * The handle to a module to be searched. Typically this is an LN file, and if flag <b>RESOURCE_ENUM_MUI</b> is set, then appropriate .mui files can be included in the search. Alternately, this can be a handle to an .mui file or other LN file.
     * 
     * If this parameter is <b>NULL</b>, it is equivalent to passing in a handle to the module used to create the current process.
     * @param {Pointer<ENUMRESTYPEPROCA>} lpEnumFunc Type: <b>ENUMRESTYPEPROC</b>
     * 
     * A pointer to the callback function to be called for each enumerated resource type. For more information, see <a href="https://docs.microsoft.com/windows/win32/api/libloaderapi/nc-libloaderapi-enumrestypeproca">EnumResTypeProc</a>.
     * @param {Pointer} lParam Type: <b>LONG_PTR</b>
     * 
     * An application-defined value passed to the callback function.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * The type of file to be searched. The following values are supported. Note that if <i>dwFlags</i> is zero, then the <b>RESOURCE_ENUM_LN</b> and <b>RESOURCE_ENUM_MUI</b>  flags are assumed to be specified.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RESOURCE_ENUM_MUI"></a><a id="resource_enum_mui"></a><dl>
     * <dt><b>RESOURCE_ENUM_MUI</b></dt>
     * <dt>0x0002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Search for resource types in one of the .mui files associated with the file specified by <i>hModule</i> and with the current language preferences, following the usual Resource Loader strategy (see <a href="https://docs.microsoft.com/windows/desktop/Intl/user-interface-language-management">User Interface Language Management</a>). Alternately, if <i>LangId</i> is nonzero, then only the .mui file of the language as specified by <i>LangId</i> will be searched. Typically this flag should be used only if <i>hModule</i> references an LN file. If <i>hModule</i> references an .mui file, then that file is actually covered by the <b>RESOURCE_ENUM_LN</b> flag, despite the name of the flag.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RESOURCE_ENUM_LN"></a><a id="resource_enum_ln"></a><dl>
     * <dt><b>RESOURCE_ENUM_LN</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Searches only the file specified by <i>hModule</i>, regardless of whether the file is an LN file or an .mui file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RESOURCE_ENUM_VALIDATE"></a><a id="resource_enum_validate"></a><dl>
     * <dt><b>RESOURCE_ENUM_VALIDATE</b></dt>
     * <dt>0x0008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Performs extra validation on the resource section and its reference in the PE header while doing the enumeration to ensure that resources are properly formatted. The validation sets a maximum limit of 260 characters for each type that is enumerated.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} LangId Type: <b>LANGID</b>
     * 
     * The language used to filter the search in the MUI module. This parameter is used only when the <b>RESOURCE_ENUM_MUI</b> flag is set in <i>dwFlags</i>. If zero is specified, then all .mui files that match current language preferences are included in the search, following the usual Resource Loader strategy (see <a href="https://docs.microsoft.com/windows/desktop/Intl/user-interface-language-management">User Interface Language Management</a>). If a nonzero <i>LangId</i> is specified, then the only .mui file searched will be the one matching the specified <i>LangId</i>.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns <b>TRUE</b> if successful or <b>FALSE</b> if the function does not find a resource of the type specified, or if the function fails for another reason. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//libloaderapi/nf-libloaderapi-enumresourcetypesexa
     * @since windows6.0.6000
     */
    static EnumResourceTypesExA(hModule, lpEnumFunc, lParam, dwFlags, LangId) {
        hModule := hModule is Win32Handle ? NumGet(hModule, "ptr") : hModule

        A_LastError := 0

        result := DllCall("KERNEL32.dll\EnumResourceTypesExA", "ptr", hModule, "ptr", lpEnumFunc, "ptr", lParam, "uint", dwFlags, "ushort", LangId, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Enumerates resource types associated with a specified binary module.
     * @param {HMODULE} hModule Type: <b>HMODULE</b>
     * 
     * The handle to a module to be searched. Typically this is an LN file, and if flag <b>RESOURCE_ENUM_MUI</b> is set, then appropriate .mui files can be included in the search. Alternately, this can be a handle to an .mui file or other LN file.
     * 
     * If this parameter is <b>NULL</b>, it is equivalent to passing in a handle to the module used to create the current process.
     * @param {Pointer<ENUMRESTYPEPROCW>} lpEnumFunc Type: <b>ENUMRESTYPEPROC</b>
     * 
     * A pointer to the callback function to be called for each enumerated resource type. For more information, see <a href="https://docs.microsoft.com/windows/win32/api/libloaderapi/nc-libloaderapi-enumrestypeproca">EnumResTypeProc</a>.
     * @param {Pointer} lParam Type: <b>LONG_PTR</b>
     * 
     * An application-defined value passed to the callback function.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * The type of file to be searched. The following values are supported. Note that if <i>dwFlags</i> is zero, then the <b>RESOURCE_ENUM_LN</b> and <b>RESOURCE_ENUM_MUI</b>  flags are assumed to be specified.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RESOURCE_ENUM_MUI"></a><a id="resource_enum_mui"></a><dl>
     * <dt><b>RESOURCE_ENUM_MUI</b></dt>
     * <dt>0x0002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Search for resource types in one of the .mui files associated with the file specified by <i>hModule</i> and with the current language preferences, following the usual Resource Loader strategy (see <a href="https://docs.microsoft.com/windows/desktop/Intl/user-interface-language-management">User Interface Language Management</a>). Alternately, if <i>LangId</i> is nonzero, then only the .mui file of the language as specified by <i>LangId</i> will be searched. Typically this flag should be used only if <i>hModule</i> references an LN file. If <i>hModule</i> references an .mui file, then that file is actually covered by the <b>RESOURCE_ENUM_LN</b> flag, despite the name of the flag.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RESOURCE_ENUM_LN"></a><a id="resource_enum_ln"></a><dl>
     * <dt><b>RESOURCE_ENUM_LN</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Searches only the file specified by <i>hModule</i>, regardless of whether the file is an LN file or an .mui file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RESOURCE_ENUM_VALIDATE"></a><a id="resource_enum_validate"></a><dl>
     * <dt><b>RESOURCE_ENUM_VALIDATE</b></dt>
     * <dt>0x0008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Performs extra validation on the resource section and its reference in the PE header while doing the enumeration to ensure that resources are properly formatted. The validation sets a maximum limit of 260 characters for each type that is enumerated.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} LangId Type: <b>LANGID</b>
     * 
     * The language used to filter the search in the MUI module. This parameter is used only when the <b>RESOURCE_ENUM_MUI</b> flag is set in <i>dwFlags</i>. If zero is specified, then all .mui files that match current language preferences are included in the search, following the usual Resource Loader strategy (see <a href="https://docs.microsoft.com/windows/desktop/Intl/user-interface-language-management">User Interface Language Management</a>). If a nonzero <i>LangId</i> is specified, then the only .mui file searched will be the one matching the specified <i>LangId</i>.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns <b>TRUE</b> if successful or <b>FALSE</b> if the function does not find a resource of the type specified, or if the function fails for another reason. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//libloaderapi/nf-libloaderapi-enumresourcetypesexw
     * @since windows6.0.6000
     */
    static EnumResourceTypesExW(hModule, lpEnumFunc, lParam, dwFlags, LangId) {
        hModule := hModule is Win32Handle ? NumGet(hModule, "ptr") : hModule

        A_LastError := 0

        result := DllCall("KERNEL32.dll\EnumResourceTypesExW", "ptr", hModule, "ptr", lpEnumFunc, "ptr", lParam, "uint", dwFlags, "ushort", LangId, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Determines the location of a resource with the specified type and name in the specified module.
     * @param {HMODULE} hModule Type: <b>HMODULE</b>
     * 
     * A handle to the module whose portable executable file or an accompanying MUI file contains the resource. If this parameter is <b>NULL</b>, the function searches the module used to create the current process.
     * @param {PWSTR} lpName Type: <b>LPCTSTR</b>
     * 
     * The name of the resource. Alternately, rather than a pointer, this parameter can be <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a>(ID), where ID is the integer identifier of the resource. For more information, see the Remarks section below.
     * @param {PWSTR} lpType Type: <b>LPCTSTR</b>
     * 
     * The resource type. Alternately, rather than a pointer, this parameter can be <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcew">MAKEINTRESOURCE</a>(ID), where ID is the integer identifier of the given 
     * 
     * resource type. For standard resource types, see <a href="https://docs.microsoft.com/windows/desktop/menurc/resource-types">Resource Types</a>. For more information, see the Remarks section below.
     * @returns {HRSRC} Type: <b>HRSRC</b>
     * 
     * If the function succeeds, the return value is a handle to the specified resource's information block. To obtain a handle to the resource, pass this handle to the <a href="/windows/desktop/api/libloaderapi/nf-libloaderapi-loadresource">LoadResource</a> function.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//libloaderapi/nf-libloaderapi-findresourcew
     */
    static FindResourceW(hModule, lpName, lpType) {
        hModule := hModule is Win32Handle ? NumGet(hModule, "ptr") : hModule
        lpName := lpName is String ? StrPtr(lpName) : lpName
        lpType := lpType is String ? StrPtr(lpType) : lpType

        result := DllCall("KERNEL32.dll\FindResourceW", "ptr", hModule, "ptr", lpName, "ptr", lpType, "ptr")
        resultHandle := HRSRC({Value: result}, True)
        return resultHandle
    }

    /**
     * Loads the specified module into the address space of the calling process.
     * @param {PSTR} lpLibFileName The name of the module. This can be either a library module (a .dll file) or an executable 
     *        module (an .exe file). The name specified is the file name of the module and is not related to the 
     *        name stored in the library module itself, as specified by the <b>LIBRARY</b> keyword in 
     *        the module-definition (.def) file.
     * 
     * If the string specifies a full path, the function searches only that path for the module.
     * 
     * If the string specifies a relative path or a module name without a path, the function uses a standard search 
     *        strategy to find the module; for more information, see the Remarks.
     * 
     * If the function cannot find the  module, the function fails. When specifying a path, be sure to use 
     *        backslashes (\\), not forward slashes (/). For more information about paths, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/FileIO/naming-a-file">Naming a File or Directory</a>.
     * 
     * If the string specifies a module name without a path and the file name extension is omitted, the function 
     *        appends the default library extension .dll to the module name. To prevent the function from appending 
     *        .dll to the module name, include a trailing point character (.) in the module name string.
     * @returns {HMODULE} If the function succeeds, the return value is a handle to the module.
     * 
     * If the function fails, the return value is NULL. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//libloaderapi/nf-libloaderapi-loadlibrarya
     * @since windows5.1.2600
     */
    static LoadLibraryA(lpLibFileName) {
        lpLibFileName := lpLibFileName is String ? StrPtr(lpLibFileName) : lpLibFileName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\LoadLibraryA", "ptr", lpLibFileName, "ptr")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        resultHandle := HMODULE({Value: result}, True)
        return resultHandle
    }

    /**
     * Loads the specified module into the address space of the calling process.
     * @param {PWSTR} lpLibFileName The name of the module. This can be either a library module (a .dll file) or an executable 
     *        module (an .exe file). The name specified is the file name of the module and is not related to the 
     *        name stored in the library module itself, as specified by the <b>LIBRARY</b> keyword in 
     *        the module-definition (.def) file.
     * 
     * If the string specifies a full path, the function searches only that path for the module.
     * 
     * If the string specifies a relative path or a module name without a path, the function uses a standard search 
     *        strategy to find the module; for more information, see the Remarks.
     * 
     * If the function cannot find the  module, the function fails. When specifying a path, be sure to use 
     *        backslashes (\\), not forward slashes (/). For more information about paths, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/FileIO/naming-a-file">Naming a File or Directory</a>.
     * 
     * If the string specifies a module name without a path and the file name extension is omitted, the function 
     *        appends the default library extension .dll to the module name. To prevent the function from appending 
     *        .dll to the module name, include a trailing point character (.) in the module name string.
     * @returns {HMODULE} If the function succeeds, the return value is a handle to the module.
     * 
     * If the function fails, the return value is NULL. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//libloaderapi/nf-libloaderapi-loadlibraryw
     * @since windows5.1.2600
     */
    static LoadLibraryW(lpLibFileName) {
        lpLibFileName := lpLibFileName is String ? StrPtr(lpLibFileName) : lpLibFileName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\LoadLibraryW", "ptr", lpLibFileName, "ptr")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        resultHandle := HMODULE({Value: result}, True)
        return resultHandle
    }

    /**
     * Enumerates resources of a specified type within a binary module.
     * @param {HMODULE} hModule Type: **HMODULE**
     * 
     * A handle to a module to be searched. Starting with Windows Vista, if this is an LN file, then appropriate .mui files (if any exist) are included in the search.
     * 
     * If this parameter is **NULL**, that is equivalent to passing in a handle to the module used to create the current process.
     * @param {PWSTR} lpType Type: **LPCTSTR**
     * 
     * The type of the resource for which the name is being enumerated. Alternately, rather than a pointer, this parameter can be [MAKEINTRESOURCE](/windows/desktop/api/winuser/nf-winuser-makeintresourcea)(ID), where ID is an integer value representing a predefined resource type. For a list of predefined resource types, see [Resource Types](/windows/win32/menurc/resource-types). For more information, see the [Remarks](#remarks) section below.
     * @param {Pointer<ENUMRESNAMEPROCW>} lpEnumFunc Type: **ENUMRESNAMEPROC**
     * 
     * A pointer to the callback function to be called for each enumerated resource name or ID. For more information, see [ENUMRESNAMEPROC](/windows/win32/api/libloaderapi/nc-libloaderapi-enumresnameprocw).
     * @param {Pointer} lParam Type: **LONG_PTR**
     * 
     * An application-defined value passed to the callback function. This parameter can be used in error checking.
     * @returns {BOOL} Type: **BOOL**
     * 
     * The return value is **TRUE** if the function succeeds or **FALSE** if the function does not find a resource of the type specified, or if the function fails for another reason. To get extended error information, call [GetLastError](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://docs.microsoft.com/windows/win32/api//libloaderapi/nf-libloaderapi-enumresourcenamesw
     */
    static EnumResourceNamesW(hModule, lpType, lpEnumFunc, lParam) {
        hModule := hModule is Win32Handle ? NumGet(hModule, "ptr") : hModule
        lpType := lpType is String ? StrPtr(lpType) : lpType

        result := DllCall("KERNEL32.dll\EnumResourceNamesW", "ptr", hModule, "ptr", lpType, "ptr", lpEnumFunc, "ptr", lParam, "int")
        return result
    }

    /**
     * Enumerates resources of a specified type within a binary module.
     * @param {HMODULE} hModule Type: **HMODULE**
     * 
     * A handle to a module to be searched. Starting with Windows Vista, if this is an LN file, then appropriate .mui files (if any exist) are included in the search.
     * 
     * If this parameter is **NULL**, that is equivalent to passing in a handle to the module used to create the current process.
     * @param {PSTR} lpType Type: **LPCTSTR**
     * 
     * The type of the resource for which the name is being enumerated. Alternately, rather than a pointer, this parameter can be [MAKEINTRESOURCE](/windows/desktop/api/winuser/nf-winuser-makeintresourcea)(ID), where ID is an integer value representing a predefined resource type. For a list of predefined resource types, see [Resource Types](/windows/win32/menurc/resource-types). For more information, see the [Remarks](#remarks) section below.
     * @param {Pointer<ENUMRESNAMEPROCA>} lpEnumFunc Type: **ENUMRESNAMEPROC**
     * 
     * A pointer to the callback function to be called for each enumerated resource name or ID. For more information, see [ENUMRESNAMEPROC](/windows/win32/api/libloaderapi/nc-libloaderapi-enumresnameproca).
     * @param {Pointer} lParam Type: **LONG_PTR**
     * 
     * An application-defined value passed to the callback function. This parameter can be used in error checking.
     * @returns {BOOL} Type: **BOOL**
     * 
     * The return value is **TRUE** if the function succeeds or **FALSE** if the function does not find a resource of the type specified, or if the function fails for another reason. To get extended error information, call [GetLastError](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://docs.microsoft.com/windows/win32/api//libloaderapi/nf-libloaderapi-enumresourcenamesa
     * @since windows5.0
     */
    static EnumResourceNamesA(hModule, lpType, lpEnumFunc, lParam) {
        hModule := hModule is Win32Handle ? NumGet(hModule, "ptr") : hModule
        lpType := lpType is String ? StrPtr(lpType) : lpType

        A_LastError := 0

        result := DllCall("KERNEL32.dll\EnumResourceNamesA", "ptr", hModule, "ptr", lpType, "ptr", lpEnumFunc, "ptr", lParam, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Loads the specified packaged module and its dependencies into the address space of the calling process.
     * @param {PWSTR} lpwLibFileName The file name of the packaged module to load. The module can be a library module (a .dll file) or an executable module (an .exe file).  
     * 
     * If this parameter specifies a module name without a path and the file name extension is omitted, the function appends the default library extension .dll to the module name. To prevent the function from appending .dll to the module name, include a trailing point character (.) in the module name string. 
     * 
     * If this parameter specifies a path, the function searches that path for the module. The path cannot be an absolute path or a relative path that contains ".." in the path.   When specifying a path, be sure to use backslashes (\\), not forward slashes (/). For more information about paths, see <a href="https://docs.microsoft.com/windows/desktop/FileIO/naming-a-file">Naming Files, Paths, and Namespaces</a>. 
     * 
     * If the specified module is already loaded in the process, the function returns a handle to the loaded module. The module must have been originally loaded  from the package dependency graph of the process.
     * 
     * If loading the specified module causes the system to load other associated modules, the function first searches loaded modules, then it searches the package dependency graph of the process.  For more information, see Remarks.
     * @returns {HMODULE} If the function succeeds, the return value is a handle to the loaded module.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-loadpackagedlibrary
     * @since windows8.0
     */
    static LoadPackagedLibrary(lpwLibFileName) {
        static Reserved := 0 ;Reserved parameters must always be NULL

        lpwLibFileName := lpwLibFileName is String ? StrPtr(lpwLibFileName) : lpwLibFileName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\LoadPackagedLibrary", "ptr", lpwLibFileName, "uint", Reserved, "ptr")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        resultHandle := HMODULE({Value: result}, True)
        return resultHandle
    }

    /**
     * Determines whether the specified function in a delay-loaded DLL is available on the system.
     * @param {HMODULE} hParentModule A handle to the calling module. Desktop applications can use the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulehandlea">GetModuleHandle</a> or <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulehandleexa">GetModuleHandleEx</a> function to get this handle. Windows Store apps should set this parameter to <c>static_cast&lt;HMODULE&gt;(&amp;__ImageBase)</c>.
     * @param {PSTR} lpDllName The file name of the delay-loaded DLL that exports the specified function. This parameter is case-insensitive.
     * 
     * Windows Store apps should specify API sets, rather than monolithic DLLs. For example,   api-ms-win-core-memory-l1-1-1.dll, rather than kernel32.dll.
     * @param {PSTR} lpProcName The name of the function to query. This parameter is case-sensitive.
     * @returns {BOOL} TRUE if the specified function is available on the system. If the specified function is not available on the system, this function returns FALSE. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//libloaderapi2/nf-libloaderapi2-queryoptionaldelayloadedapi
     * @since windows10.0.10240
     */
    static QueryOptionalDelayLoadedAPI(hParentModule, lpDllName, lpProcName) {
        static Reserved := 0 ;Reserved parameters must always be NULL

        hParentModule := hParentModule is Win32Handle ? NumGet(hParentModule, "ptr") : hParentModule
        lpDllName := lpDllName is String ? StrPtr(lpDllName) : lpDllName
        lpProcName := lpProcName is String ? StrPtr(lpProcName) : lpProcName

        A_LastError := 0

        result := DllCall("api-ms-win-core-libraryloader-l2-1-0.dll\QueryOptionalDelayLoadedAPI", "ptr", hParentModule, "ptr", lpDllName, "ptr", lpProcName, "uint", Reserved, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Loads and executes an application or creates a new instance of an existing application.
     * @param {PSTR} lpModuleName The file name of the application to be run. When specifying a path, be sure to use backslashes (\\), not forward slashes (/). If the <i>lpModuleName</i> parameter does not contain a directory path, the system searches for the executable file in this order: 
     * 
     * 
     * 
     * 
     * <ol>
     * <li>The directory from which the application loaded.</li>
     * <li>The current directory.</li>
     * <li>The system directory. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getsystemdirectorya">GetSystemDirectory</a> function to get the path of this directory. 
     * 
     * 
     * </li>
     * <li> The 16-bit system directory. There is no function that obtains the path of this directory, but it is searched. The name of this directory is System.</li>
     * <li>The Windows directory. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getwindowsdirectorya">GetWindowsDirectory</a> function to get the path of this directory.</li>
     * <li>The directories that are listed in the PATH environment variable.</li>
     * </ol>
     * @param {Pointer<Void>} lpParameterBlock A pointer to an application-defined <b>LOADPARMS32</b> structure that defines the new application's parameter block. 
     * 
     * 
     * Set all unused members to NULL, except for <b>lpCmdLine</b>, which must point to a null-terminated string if it is not used. For more information, see Remarks.
     * @returns {Integer} If the function succeeds, the return value is greater than 31.
     * 
     * If the function fails, the return value is an error value, which may be one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is out of memory or resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_FORMAT</b></dt>
     * <dt>11L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The .exe file is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * <dt>2L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified file was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_PATH_NOT_FOUND</b></dt>
     * <dt>3L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified path was not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-loadmodule
     * @since windows5.1.2600
     */
    static LoadModule(lpModuleName, lpParameterBlock) {
        lpModuleName := lpModuleName is String ? StrPtr(lpModuleName) : lpModuleName

        lpParameterBlockMarshal := lpParameterBlock is VarRef ? "ptr" : "ptr"

        result := DllCall("KERNEL32.dll\LoadModule", "ptr", lpModuleName, lpParameterBlockMarshal, lpParameterBlock, "uint")
        return result
    }

    /**
     * Determines the location of a resource with the specified type and name in the specified module.
     * @param {HMODULE} hModule Type: <b>HMODULE</b>
     * 
     * A handle to the module whose portable executable file or an accompanying MUI file contains the resource. If this parameter is <b>NULL</b>, the function searches the module used to create the current process.
     * @param {PSTR} lpName Type: <b>LPCTSTR</b>
     * 
     * The name of the resource. Alternately, rather than a pointer, this parameter can be <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a>(ID), where ID is the integer identifier of the resource. For more information, see the Remarks section below.
     * @param {PSTR} lpType Type: <b>LPCTSTR</b>
     * 
     * The resource type. Alternately, rather than a pointer, this parameter can be <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a>(ID), where ID is the integer identifier of the given 
     * 
     * resource type. For standard resource types, see <a href="https://docs.microsoft.com/windows/desktop/menurc/resource-types">Resource Types</a>. For more information, see the Remarks section below.
     * @returns {HRSRC} Type: <b>HRSRC</b>
     * 
     * If the function succeeds, the return value is a handle to the specified resource's information block. To obtain a handle to the resource, pass this handle to the <a href="/windows/desktop/api/libloaderapi/nf-libloaderapi-loadresource">LoadResource</a> function.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-findresourcea
     * @since windows5.0
     */
    static FindResourceA(hModule, lpName, lpType) {
        hModule := hModule is Win32Handle ? NumGet(hModule, "ptr") : hModule
        lpName := lpName is String ? StrPtr(lpName) : lpName
        lpType := lpType is String ? StrPtr(lpType) : lpType

        A_LastError := 0

        result := DllCall("KERNEL32.dll\FindResourceA", "ptr", hModule, "ptr", lpName, "ptr", lpType, "ptr")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        resultHandle := HRSRC({Value: result}, True)
        return resultHandle
    }

    /**
     * Determines the location of the resource with the specified type, name, and language in the specified module.
     * @param {HMODULE} hModule Type: <b>HMODULE</b>
     * 
     * A handle to the module whose portable executable file or an accompanying MUI file contains the resource. If this parameter is <b>NULL</b>, the function searches the module used to create the current process.
     * @param {PSTR} lpType Type: <b>LPCTSTR</b>
     * 
     * The resource type. Alternately, rather than a pointer, this parameter can be <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a>(ID), where ID is the integer identifier of the given 
     * 
     * resource type. For standard resource types, see <a href="https://docs.microsoft.com/windows/desktop/menurc/resource-types">Resource Types</a>. For more information, see the Remarks section below.
     * @param {PSTR} lpName Type: <b>LPCTSTR</b>
     * 
     * The name of the resource. Alternately, rather than a pointer, this parameter can be <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a>(ID), where ID is the integer identifier of the resource. For more information, see the Remarks section below.
     * @param {Integer} wLanguage Type: <b>WORD</b>
     * 
     * The language of the resource. If this parameter is <c>MAKELANGID(LANG_NEUTRAL, SUBLANG_NEUTRAL)</c>, the current language associated with the calling thread is used.
     *         
     * 
     * To specify a language other than the current language, use the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/nf-winnt-makelangid">MAKELANGID</a> macro to create this parameter. For more information, see <b>MAKELANGID</b>.
     * @returns {HRSRC} Type: <b>HRSRC</b>
     * 
     * If the function succeeds, the return value is a handle to the specified resource's information block. To obtain a handle to the resource, pass this handle to the <a href="/windows/desktop/api/libloaderapi/nf-libloaderapi-loadresource">LoadResource</a> function.
     *                     
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-findresourceexa
     * @since windows5.0
     */
    static FindResourceExA(hModule, lpType, lpName, wLanguage) {
        hModule := hModule is Win32Handle ? NumGet(hModule, "ptr") : hModule
        lpType := lpType is String ? StrPtr(lpType) : lpType
        lpName := lpName is String ? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\FindResourceExA", "ptr", hModule, "ptr", lpType, "ptr", lpName, "ushort", wLanguage, "ptr")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        resultHandle := HRSRC({Value: result}, True)
        return resultHandle
    }

    /**
     * Enumerates resource types within a binary module.
     * @param {HMODULE} hModule Type: <b>HMODULE</b>
     * 
     * A handle to a module to be searched. This handle must be obtained through <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> or <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a>.
     * 					
     * See Remarks for more information.
     * 
     * If this parameter is <b>NULL</b>, that is equivalent to passing in a handle to the module used to create the current process.
     * @param {Pointer<ENUMRESTYPEPROCA>} lpEnumFunc Type: <b>ENUMRESTYPEPROC</b>
     * 
     * A pointer to the callback function to be called for each enumerated resource type. For more information, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms648041(v=vs.85)">EnumResTypeProc</a> function.
     * @param {Pointer} lParam Type: <b>LONG_PTR</b>
     * 
     * An application-defined value passed to the callback function.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns <b>TRUE</b> if successful; otherwise, <b>FALSE</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-enumresourcetypesa
     * @since windows5.0
     */
    static EnumResourceTypesA(hModule, lpEnumFunc, lParam) {
        hModule := hModule is Win32Handle ? NumGet(hModule, "ptr") : hModule

        A_LastError := 0

        result := DllCall("KERNEL32.dll\EnumResourceTypesA", "ptr", hModule, "ptr", lpEnumFunc, "ptr", lParam, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Enumerates resource types within a binary module.
     * @param {HMODULE} hModule Type: <b>HMODULE</b>
     * 
     * A handle to a module to be searched. This handle must be obtained through <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> or <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a>.
     * 					
     * See Remarks for more information.
     * 
     * If this parameter is <b>NULL</b>, that is equivalent to passing in a handle to the module used to create the current process.
     * @param {Pointer<ENUMRESTYPEPROCW>} lpEnumFunc Type: <b>ENUMRESTYPEPROC</b>
     * 
     * A pointer to the callback function to be called for each enumerated resource type. For more information, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms648041(v=vs.85)">EnumResTypeProc</a> function.
     * @param {Pointer} lParam Type: <b>LONG_PTR</b>
     * 
     * An application-defined value passed to the callback function.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns <b>TRUE</b> if successful; otherwise, <b>FALSE</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-enumresourcetypesw
     * @since windows5.0
     */
    static EnumResourceTypesW(hModule, lpEnumFunc, lParam) {
        hModule := hModule is Win32Handle ? NumGet(hModule, "ptr") : hModule

        A_LastError := 0

        result := DllCall("KERNEL32.dll\EnumResourceTypesW", "ptr", hModule, "ptr", lpEnumFunc, "ptr", lParam, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Enumerates language-specific resources, of the specified type and name, associated with a binary module.
     * @param {HMODULE} hModule Type: <b>HMODULE</b>
     * 
     * The handle to a module to be searched. Starting with Windows Vista, if this is a <a href="https://docs.microsoft.com/windows/desktop/Intl/mui-resource-management">language-neutral Portable Executable</a> (LN file), then appropriate .mui files (if any exist) are included in the search. If this is a specific .mui file, only that file is searched for resources.
     * 				
     *                     
     * 
     * If this parameter is <b>NULL</b>, that is equivalent to passing in a handle to the module used to create the current process.
     * @param {PSTR} lpType Type: <b>LPCTSTR</b>
     * 
     * The type of resource for which the language is being enumerated. Alternately, rather than a pointer, this parameter can be <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a>(ID), where ID is an integer value representing a predefined resource type. For a list of predefined resource types, see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">Resource Types</a>. For more information, see the Remarks section below.
     * @param {PSTR} lpName Type: <b>LPCTSTR</b>
     * 
     * The name of the resource for which the language is being enumerated. Alternately, rather than a pointer, this parameter can be <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a>(ID), where ID is the integer identifier of the resource. For more information, see the Remarks section below.
     * @param {Pointer<ENUMRESLANGPROCA>} lpEnumFunc Type: <b>ENUMRESLANGPROC</b>
     * 
     * A pointer to the callback function to be called for each enumerated resource language. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms648033(v=vs.85)">EnumResLangProc</a>.
     * @param {Pointer} lParam Type: <b>LONG_PTR</b>
     * 
     * An application-defined value passed to the callback function. This parameter can be used in error checking.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-enumresourcelanguagesa
     * @since windows5.0
     */
    static EnumResourceLanguagesA(hModule, lpType, lpName, lpEnumFunc, lParam) {
        hModule := hModule is Win32Handle ? NumGet(hModule, "ptr") : hModule
        lpType := lpType is String ? StrPtr(lpType) : lpType
        lpName := lpName is String ? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\EnumResourceLanguagesA", "ptr", hModule, "ptr", lpType, "ptr", lpName, "ptr", lpEnumFunc, "ptr", lParam, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Enumerates language-specific resources, of the specified type and name, associated with a binary module.
     * @param {HMODULE} hModule Type: <b>HMODULE</b>
     * 
     * The handle to a module to be searched. Starting with Windows Vista, if this is a <a href="https://docs.microsoft.com/windows/desktop/Intl/mui-resource-management">language-neutral Portable Executable</a> (LN file), then appropriate .mui files (if any exist) are included in the search. If this is a specific .mui file, only that file is searched for resources.
     * 				
     *                     
     * 
     * If this parameter is <b>NULL</b>, that is equivalent to passing in a handle to the module used to create the current process.
     * @param {PWSTR} lpType Type: <b>LPCTSTR</b>
     * 
     * The type of resource for which the language is being enumerated. Alternately, rather than a pointer, this parameter can be <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a>(ID), where ID is an integer value representing a predefined resource type. For a list of predefined resource types, see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">Resource Types</a>. For more information, see the Remarks section below.
     * @param {PWSTR} lpName Type: <b>LPCTSTR</b>
     * 
     * The name of the resource for which the language is being enumerated. Alternately, rather than a pointer, this parameter can be <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a>(ID), where ID is the integer identifier of the resource. For more information, see the Remarks section below.
     * @param {Pointer<ENUMRESLANGPROCW>} lpEnumFunc Type: <b>ENUMRESLANGPROC</b>
     * 
     * A pointer to the callback function to be called for each enumerated resource language. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms648033(v=vs.85)">EnumResLangProc</a>.
     * @param {Pointer} lParam Type: <b>LONG_PTR</b>
     * 
     * An application-defined value passed to the callback function. This parameter can be used in error checking.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-enumresourcelanguagesw
     * @since windows5.0
     */
    static EnumResourceLanguagesW(hModule, lpType, lpName, lpEnumFunc, lParam) {
        hModule := hModule is Win32Handle ? NumGet(hModule, "ptr") : hModule
        lpType := lpType is String ? StrPtr(lpType) : lpType
        lpName := lpName is String ? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\EnumResourceLanguagesW", "ptr", hModule, "ptr", lpType, "ptr", lpName, "ptr", lpEnumFunc, "ptr", lParam, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves a handle that can be used by the UpdateResource function to add, delete, or replace resources in a binary module.
     * @param {PSTR} pFileName Type: <b>LPCTSTR</b>
     * 
     * The binary file in which to update resources. An application must be able to obtain write-access to this file; the file referenced by <i>pFileName</i> cannot be currently executing. If <i>pFileName</i> does not specify a full path, the system searches for the file in the current directory.
     * @param {BOOL} bDeleteExistingResources Type: <b>BOOL</b>
     * 
     * Indicates whether to delete the <i>pFileName</i> parameter's existing resources. If this parameter is <b>TRUE</b>, existing resources are deleted and the updated file includes only resources added with the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-updateresourcea">UpdateResource</a> function. If this parameter is <b>FALSE</b>, the updated file includes existing resources unless they are explicitly deleted or replaced by using <b>UpdateResource</b>.
     * @returns {HANDLE} Type: <b>HANDLE</b>
     * 
     * If the function succeeds, the return value is a handle that can be used by the <a href="/windows/desktop/api/winbase/nf-winbase-updateresourcea">UpdateResource</a> and <a href="/windows/desktop/api/winbase/nf-winbase-endupdateresourcea">EndUpdateResource</a> functions. The return value is <b>NULL</b> if the specified file is not a PE, the file does not exist, or the file cannot be opened for writing. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-beginupdateresourcea
     * @since windows5.0
     */
    static BeginUpdateResourceA(pFileName, bDeleteExistingResources) {
        pFileName := pFileName is String ? StrPtr(pFileName) : pFileName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\BeginUpdateResourceA", "ptr", pFileName, "int", bDeleteExistingResources, "ptr")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        resultHandle := HANDLE({Value: result}, True)
        resultHandle.DefineProp("Free", {Call: LibraryLoader.EndUpdateResourceA})
        return resultHandle
    }

    /**
     * Retrieves a handle that can be used by the UpdateResource function to add, delete, or replace resources in a binary module.
     * @param {PWSTR} pFileName Type: <b>LPCTSTR</b>
     * 
     * The binary file in which to update resources. An application must be able to obtain write-access to this file; the file referenced by <i>pFileName</i> cannot be currently executing. If <i>pFileName</i> does not specify a full path, the system searches for the file in the current directory.
     * @param {BOOL} bDeleteExistingResources Type: <b>BOOL</b>
     * 
     * Indicates whether to delete the <i>pFileName</i> parameter's existing resources. If this parameter is <b>TRUE</b>, existing resources are deleted and the updated file includes only resources added with the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-updateresourcea">UpdateResource</a> function. If this parameter is <b>FALSE</b>, the updated file includes existing resources unless they are explicitly deleted or replaced by using <b>UpdateResource</b>.
     * @returns {HANDLE} Type: <b>HANDLE</b>
     * 
     * If the function succeeds, the return value is a handle that can be used by the <a href="/windows/desktop/api/winbase/nf-winbase-updateresourcea">UpdateResource</a> and <a href="/windows/desktop/api/winbase/nf-winbase-endupdateresourcea">EndUpdateResource</a> functions. The return value is <b>NULL</b> if the specified file is not a PE, the file does not exist, or the file cannot be opened for writing. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-beginupdateresourcew
     * @since windows5.0
     */
    static BeginUpdateResourceW(pFileName, bDeleteExistingResources) {
        pFileName := pFileName is String ? StrPtr(pFileName) : pFileName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\BeginUpdateResourceW", "ptr", pFileName, "int", bDeleteExistingResources, "ptr")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        resultHandle := HANDLE({Value: result}, True)
        resultHandle.DefineProp("Free", {Call: LibraryLoader.EndUpdateResourceW})
        return resultHandle
    }

    /**
     * Adds, deletes, or replaces a resource in a portable executable (PE) file.
     * @param {HANDLE} hUpdate Type: <b>HANDLE</b>
     * 
     * A module handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-beginupdateresourcea">BeginUpdateResource</a> function, referencing the file to be updated.
     * @param {PSTR} lpType Type: <b>LPCTSTR</b>
     * 
     * The resource type to be updated. Alternatively, rather than a pointer, this parameter can be <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a>(ID), where ID is an integer value representing a predefined resource type. If the first character of the string is a pound sign (#), then the remaining characters represent a decimal number that specifies the integer identifier of the resource type. For example, the string "#258" represents the identifier 258.
     * 
     * For a list of predefined resource types, see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">Resource Types</a>.
     * @param {PSTR} lpName Type: <b>LPCTSTR</b>
     * 
     * The name of the resource to be updated. Alternatively, rather than a pointer, this parameter can be <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a>(ID), where ID is a resource ID. When creating a new resource do not use a string that begins with a '#' character for this parameter.
     * @param {Integer} wLanguage Type: <b>WORD</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/Intl/language-identifiers">language identifier</a> of the resource to be updated. For a list of the primary language identifiers and sublanguage identifiers that make up a language identifier, see the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/nf-winnt-makelangid">MAKELANGID</a>  macro.
     * @param {Pointer} lpData Type: <b>LPVOID</b>
     * 
     * The resource data to be inserted into the file indicated by <i>hUpdate</i>. If the resource is one of the predefined types, the data must be valid and properly aligned. Note that this is the raw binary data to be stored in the file indicated by <i>hUpdate</i>, not the data provided by <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadicona">LoadIcon</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadstringa">LoadString</a>, or other resource-specific load functions. All data containing strings or text must be in Unicode format. <i>lpData</i> must not point to ANSI data.
     * 
     *     				
     * 
     * If <i>lpData</i> is <b>NULL</b> and <i>cbData</i> is 0, the specified resource is deleted from the file indicated by <i>hUpdate</i>.
     * @param {Integer} cb Type: <b>DWORD</b>
     * 
     * The size, in bytes, of the resource data at <i>lpData</i>.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-updateresourcea
     * @since windows5.0
     */
    static UpdateResourceA(hUpdate, lpType, lpName, wLanguage, lpData, cb) {
        hUpdate := hUpdate is Win32Handle ? NumGet(hUpdate, "ptr") : hUpdate
        lpType := lpType is String ? StrPtr(lpType) : lpType
        lpName := lpName is String ? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\UpdateResourceA", "ptr", hUpdate, "ptr", lpType, "ptr", lpName, "ushort", wLanguage, "ptr", lpData, "uint", cb, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds, deletes, or replaces a resource in a portable executable (PE) file.
     * @param {HANDLE} hUpdate Type: <b>HANDLE</b>
     * 
     * A module handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-beginupdateresourcea">BeginUpdateResource</a> function, referencing the file to be updated.
     * @param {PWSTR} lpType Type: <b>LPCTSTR</b>
     * 
     * The resource type to be updated. Alternatively, rather than a pointer, this parameter can be <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a>(ID), where ID is an integer value representing a predefined resource type. If the first character of the string is a pound sign (#), then the remaining characters represent a decimal number that specifies the integer identifier of the resource type. For example, the string "#258" represents the identifier 258.
     * 
     * For a list of predefined resource types, see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">Resource Types</a>.
     * @param {PWSTR} lpName Type: <b>LPCTSTR</b>
     * 
     * The name of the resource to be updated. Alternatively, rather than a pointer, this parameter can be <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a>(ID), where ID is a resource ID. When creating a new resource do not use a string that begins with a '#' character for this parameter.
     * @param {Integer} wLanguage Type: <b>WORD</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/Intl/language-identifiers">language identifier</a> of the resource to be updated. For a list of the primary language identifiers and sublanguage identifiers that make up a language identifier, see the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/nf-winnt-makelangid">MAKELANGID</a>  macro.
     * @param {Pointer} lpData Type: <b>LPVOID</b>
     * 
     * The resource data to be inserted into the file indicated by <i>hUpdate</i>. If the resource is one of the predefined types, the data must be valid and properly aligned. Note that this is the raw binary data to be stored in the file indicated by <i>hUpdate</i>, not the data provided by <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadicona">LoadIcon</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadstringa">LoadString</a>, or other resource-specific load functions. All data containing strings or text must be in Unicode format. <i>lpData</i> must not point to ANSI data.
     * 
     *     				
     * 
     * If <i>lpData</i> is <b>NULL</b> and <i>cbData</i> is 0, the specified resource is deleted from the file indicated by <i>hUpdate</i>.
     * @param {Integer} cb Type: <b>DWORD</b>
     * 
     * The size, in bytes, of the resource data at <i>lpData</i>.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-updateresourcew
     * @since windows5.0
     */
    static UpdateResourceW(hUpdate, lpType, lpName, wLanguage, lpData, cb) {
        hUpdate := hUpdate is Win32Handle ? NumGet(hUpdate, "ptr") : hUpdate
        lpType := lpType is String ? StrPtr(lpType) : lpType
        lpName := lpName is String ? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\UpdateResourceW", "ptr", hUpdate, "ptr", lpType, "ptr", lpName, "ushort", wLanguage, "ptr", lpData, "uint", cb, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Commits or discards changes made prior to a call to UpdateResource.
     * @param {HANDLE} hUpdate Type: <b>HANDLE</b>
     * 
     * A module handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-beginupdateresourcea">BeginUpdateResource</a> function, and used by <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-updateresourcea">UpdateResource</a>, referencing the file to be updated.
     * @param {BOOL} fDiscard Type: <b>BOOL</b>
     * 
     * Indicates whether to write the resource updates to the file. If this parameter is <b>TRUE</b>, no changes are made. If it is <b>FALSE</b>, the changes are made: the resource updates will take effect.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns <b>TRUE</b> if the function succeeds; <b>FALSE</b> otherwise. If the function succeeds and <i>fDiscard</i> is <b>TRUE</b>, then no resource updates are made to the file; otherwise all successful resource updates are made to the file. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-endupdateresourcea
     * @since windows5.0
     */
    static EndUpdateResourceA(hUpdate, fDiscard) {
        hUpdate := hUpdate is Win32Handle ? NumGet(hUpdate, "ptr") : hUpdate

        A_LastError := 0

        result := DllCall("KERNEL32.dll\EndUpdateResourceA", "ptr", hUpdate, "int", fDiscard, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Commits or discards changes made prior to a call to UpdateResource.
     * @param {HANDLE} hUpdate Type: <b>HANDLE</b>
     * 
     * A module handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-beginupdateresourcea">BeginUpdateResource</a> function, and used by <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-updateresourcea">UpdateResource</a>, referencing the file to be updated.
     * @param {BOOL} fDiscard Type: <b>BOOL</b>
     * 
     * Indicates whether to write the resource updates to the file. If this parameter is <b>TRUE</b>, no changes are made. If it is <b>FALSE</b>, the changes are made: the resource updates will take effect.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns <b>TRUE</b> if the function succeeds; <b>FALSE</b> otherwise. If the function succeeds and <i>fDiscard</i> is <b>TRUE</b>, then no resource updates are made to the file; otherwise all successful resource updates are made to the file. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-endupdateresourcew
     * @since windows5.0
     */
    static EndUpdateResourceW(hUpdate, fDiscard) {
        hUpdate := hUpdate is Win32Handle ? NumGet(hUpdate, "ptr") : hUpdate

        A_LastError := 0

        result := DllCall("KERNEL32.dll\EndUpdateResourceW", "ptr", hUpdate, "int", fDiscard, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds a directory to the search path used to locate DLLs for the application.
     * @param {PSTR} lpPathName The directory to be added to the search path. If this parameter is an empty string (""), the call removes the current directory from the default DLL search order. If this parameter is NULL, the function restores the default search order.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-setdlldirectorya
     * @since windows6.0.6000
     */
    static SetDllDirectoryA(lpPathName) {
        lpPathName := lpPathName is String ? StrPtr(lpPathName) : lpPathName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetDllDirectoryA", "ptr", lpPathName, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds a directory to the search path used to locate DLLs for the application.
     * @param {PWSTR} lpPathName The directory to be added to the search path. If this parameter is an empty string (""), the call removes the current directory from the default DLL search order. If this parameter is NULL, the function restores the default search order.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-setdlldirectoryw
     * @since windows6.0.6000
     */
    static SetDllDirectoryW(lpPathName) {
        lpPathName := lpPathName is String ? StrPtr(lpPathName) : lpPathName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetDllDirectoryW", "ptr", lpPathName, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the application-specific portion of the search path used to locate DLLs for the application.
     * @param {Integer} nBufferLength The size of the output buffer, in characters.
     * @param {PSTR} lpBuffer A pointer to a buffer that receives the application-specific portion of the search path.
     * @returns {Integer} If the function succeeds, the return value is the length of the string copied to 
     *        <i>lpBuffer</i>, in characters, not including the terminating null character. If the return 
     *        value is greater than <i>nBufferLength</i>, it specifies the size of the buffer required for 
     *        the path.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getdlldirectorya
     * @since windows6.0.6000
     */
    static GetDllDirectoryA(nBufferLength, lpBuffer) {
        lpBuffer := lpBuffer is String ? StrPtr(lpBuffer) : lpBuffer

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetDllDirectoryA", "uint", nBufferLength, "ptr", lpBuffer, "uint")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the application-specific portion of the search path used to locate DLLs for the application.
     * @param {Integer} nBufferLength The size of the output buffer, in characters.
     * @param {PWSTR} lpBuffer A pointer to a buffer that receives the application-specific portion of the search path.
     * @returns {Integer} If the function succeeds, the return value is the length of the string copied to 
     *        <i>lpBuffer</i>, in characters, not including the terminating null character. If the return 
     *        value is greater than <i>nBufferLength</i>, it specifies the size of the buffer required for 
     *        the path.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getdlldirectoryw
     * @since windows6.0.6000
     */
    static GetDllDirectoryW(nBufferLength, lpBuffer) {
        lpBuffer := lpBuffer is String ? StrPtr(lpBuffer) : lpBuffer

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetDllDirectoryW", "uint", nBufferLength, "ptr", lpBuffer, "uint")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        return result
    }

;@endregion Methods
}
