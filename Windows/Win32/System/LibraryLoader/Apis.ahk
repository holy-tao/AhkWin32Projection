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
     * @remarks
     * The 
     * <b>DisableThreadLibraryCalls</b> function lets a DLL disable the DLL_THREAD_ATTACH and DLL_THREAD_DETACH notification calls. This can be a useful optimization for multithreaded applications that have many DLLs, frequently create and delete threads, and whose DLLs do not need these thread-level notifications of attachment/detachment. A remote procedure call (RPC) server application is an example of such an application. In these sorts of applications, DLL initialization routines often remain in memory to service DLL_THREAD_ATTACH and DLL_THREAD_DETACH notifications. By disabling the notifications, the DLL initialization code is not paged in because a thread is created or deleted, thus reducing the size of the application's working code set. To implement the optimization, modify a DLL's DLL_PROCESS_ATTACH code to call 
     * <b>DisableThreadLibraryCalls</b>.
     * 
     * Do not call this function from a DLL that is linked to the static C run-time library (CRT). The static CRT requires DLL_THREAD_ATTACH and DLL_THREAD_DETATCH notifications to function properly.
     * 
     * This function does not perform any optimizations if static [Thread Local Storage (TLS)](/windows/win32/procthread/thread-local-storage) is enabled. Static TLS is enabled when using **thread_local** variables, **__declspec( thread )** variables, or function-local **static**.
     * @param {HMODULE} hLibModule A handle to the DLL module for which the DLL_THREAD_ATTACH and DLL_THREAD_DETACH notifications are to be disabled. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a>, <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a>,  or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulehandlea">GetModuleHandle</a> function returns this handle. Note that you cannot call <b>GetModuleHandle</b> with NULL because this returns the base address of the executable image, not the DLL image.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. The 
     * <b>DisableThreadLibraryCalls</b> function fails if the DLL specified by <i>hModule</i> has active static thread local storage, or if <i>hModule</i> is an invalid module handle. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-disablethreadlibrarycalls
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
     * Determines the location of the resource with the specified type, name, and language in the specified module. (FindResourceExW)
     * @remarks
     * If <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-is_intresource">IS_INTRESOURCE</a> is <b>TRUE</b> for x = <i>lpType</i> or <i>lpName</i>, x specifies the integer identifier of the type or name of the given resource. Otherwise, those parameters are long pointers to null-terminated strings. If the first character of the string is a pound sign (#), the remaining characters represent a decimal number that specifies the integer identifier of the resource's name or type. For example, the string "#258" represents the integer identifier 258.
     * 
     * To reduce the amount of memory required for a resource, an application should refer to it by integer identifier instead of by name.
     * 
     * An application can use <b>FindResourceEx</b> to find any type of resource, but this function should be used only if the application must access the binary resource data by making subsequent calls to <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadresource">LoadResource</a> and then to <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-lockresource">LockResource</a>.
     * 
     * To use a resource immediately, an application should use one of the following resource-specific functions to find the resource and convert the data into a more usable form.
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Function</th>
     * <th>Action</th>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a>
     * </td>
     * <td>Loads and formats a message-table entry.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadacceleratorsw">LoadAccelerators</a>
     * </td>
     * <td>Loads an accelerator table.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadbitmapw">LoadBitmap</a>
     * </td>
     * <td>Loads a bitmap resource.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadcursorw">LoadCursor</a>
     * </td>
     * <td>Loads a cursor resource.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadiconw">LoadIcon</a>
     * </td>
     * <td>Loads an icon resource.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadmenuw">LoadMenu</a>
     * </td>
     * <td>Loads a menu resource.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadstringw">LoadString</a>
     * </td>
     * <td>Loads a string-table entry.</td>
     * </tr>
     * </table>
     * 
     * For example, an application can use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadiconw">LoadIcon</a> function to load an icon for display on the screen. However, the application should use <b>FindResourceEx</b> and <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadresource">LoadResource</a> if it is loading the icon to copy its data to another application.
     * 
     * String resources are stored in sections of up to 16 strings per section. The strings in each section are stored as a sequence of counted (not necessarily null-terminated) Unicode strings. The <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadstringw">LoadString</a> function will extract the string resource from its corresponding section.
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
     * If the function succeeds, the return value is a handle to the specified resource's information block. To obtain a handle to the resource, pass this handle to the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadresource">LoadResource</a> function.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-findresourceexw
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
     * The 
     * <b>FreeLibraryAndExitThread</b> function allows threads that are executing within a DLL to safely free the DLL in which they are executing and terminate themselves. If they were to call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-freelibrary">FreeLibrary</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-exitthread">ExitThread</a> separately, a race condition would exist. The library could be unloaded before 
     * <b>ExitThread</b> is called.
     * @param {HMODULE} hLibModule A handle to the DLL module whose reference count the function decrements. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulehandleexa">GetModuleHandleEx</a> function returns this handle.
     * 
     * Do not call this function with a handle returned by either the <b>GetModuleHandleEx</b> function (with the GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT flag) or the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulehandlea">GetModuleHandle</a> function, as they do not maintain a reference count for the module.
     * @param {Integer} dwExitCode The exit code for the calling thread.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-freelibraryandexitthread
     * @since windows5.1.2600
     */
    static FreeLibraryAndExitThread(hLibModule, dwExitCode) {
        hLibModule := hLibModule is Win32Handle ? NumGet(hLibModule, "ptr") : hLibModule

        DllCall("KERNEL32.dll\FreeLibraryAndExitThread", "ptr", hLibModule, "uint", dwExitCode)
    }

    /**
     * Decrements (decreases by one) the reference count of a loaded resource. When the reference count reaches zero, the memory occupied by the resource is freed.
     * @remarks
     * For resources loaded with other functions, <b>FreeResource</b> has been replaced by the following functions:
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Resource type</th>
     * <th>FreeResource replacement</th>
     * </tr>
     * <tr>
     * <td>Accelerator</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-destroyacceleratortable">DestroyAcceleratorTable</a>
     * </td>
     * </tr>
     * <tr>
     * <td>Bitmap</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-deleteobject">DeleteObject</a>
     * </td>
     * </tr>
     * <tr>
     * <td>Cursor</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-destroycursor">DestroyCursor</a>
     * </td>
     * </tr>
     * <tr>
     * <td>Icon</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-destroyicon">DestroyIcon</a>
     * </td>
     * </tr>
     * <tr>
     * <td>Menu</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-destroymenu">DestroyMenu</a>
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The reference count for a resource is incremented (increased by one) each time an application calls the <a href="https://docs.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-loadresource">LoadResource</a> function for the resource.
     * 
     * The system automatically deletes these resources when the process that created them terminates. However, calling the appropriate function saves memory.  For more information, see <a href="https://docs.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-loadresource">LoadResource</a>.
     * @param {HGLOBAL} hResData Type: <b>HGLOBAL</b>
     * 
     * A handle of the resource. It is assumed that <i>hglbResource</i> was created by <a href="https://docs.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-loadresource">LoadResource</a>.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is zero.
     * 
     * If the function fails, the return value is nonzero, which indicates that the resource has not been freed.
     * @see https://learn.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-freeresource
     * @since windows5.0
     */
    static FreeResource(hResData) {
        hResData := hResData is Win32Handle ? NumGet(hResData, "ptr") : hResData

        result := DllCall("KERNEL32.dll\FreeResource", "ptr", hResData, "int")
        return result
    }

    /**
     * Retrieves the fully qualified path for the file that contains the specified module. The module must have been loaded by the current process. (ANSI)
     * @remarks
     * If a DLL is loaded in two processes, its file name in one process may differ in case from its file name in the other process.
     * 
     * The global variable <c>_pgmptr</c> is automatically initialized to the full path of the executable file, and can be used to retrieve the full path name of an executable file.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-getmodulefilenamea
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
     * Retrieves the fully qualified path for the file that contains the specified module. The module must have been loaded by the current process. (Unicode)
     * @remarks
     * If a DLL is loaded in two processes, its file name in one process may differ in case from its file name in the other process.
     * 
     * The global variable <c>_pgmptr</c> is automatically initialized to the full path of the executable file, and can be used to retrieve the full path name of an executable file.
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
     * <b>Windows XP:  </b>If the buffer is too small to hold the module name, the function returns <i>nSize</i> and the last error code is not modified. If <i>nSize</i> is zero, the return value is zero and the last error code is not modified.
     * 
     * If the function fails, the return value is 0 (zero). To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-getmodulefilenamew
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
     * Retrieves a module handle for the specified module. The module must have been loaded by the calling process. (ANSI)
     * @remarks
     * The returned handle is not global or inheritable. It cannot be duplicated or used by another process.
     * 
     * If <i>lpModuleName</i> does not include a path and there is more than one loaded module with the same base name and extension, you cannot predict which module handle will be returned. To work around this problem, you could specify a path, use <a href="https://docs.microsoft.com/windows/desktop/Msi/side-by-side-assemblies">side-by-side assemblies</a>, or use <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulehandleexa">GetModuleHandleEx</a> to specify a memory location rather than a DLL name. 
     * 
     * The 
     * <b>GetModuleHandle</b> function returns a handle to a mapped module without incrementing its reference count. However, if this handle is passed to the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-freelibrary">FreeLibrary</a> function, the reference count of the mapped module will be decremented. Therefore, do not pass a handle returned by <b>GetModuleHandle</b> to the 
     * <b>FreeLibrary</b> function. Doing so can cause a DLL module to be unmapped prematurely.
     * 
     * This function must be used carefully in a multithreaded application. There is no guarantee that the module handle remains valid between the time this function returns the handle and the time it is used. For example, suppose that a thread retrieves a module handle, but before it uses the handle, a second thread frees the module. If the system loads another module, it could reuse the module handle that was recently freed. Therefore, the first thread would have a handle to a different module  than the one intended.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-getmodulehandlea
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
     * Retrieves a module handle for the specified module. The module must have been loaded by the calling process. (Unicode)
     * @remarks
     * The returned handle is not global or inheritable. It cannot be duplicated or used by another process.
     * 
     * If <i>lpModuleName</i> does not include a path and there is more than one loaded module with the same base name and extension, you cannot predict which module handle will be returned. To work around this problem, you could specify a path, use <a href="https://docs.microsoft.com/windows/desktop/Msi/side-by-side-assemblies">side-by-side assemblies</a>, or use <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulehandleexa">GetModuleHandleEx</a> to specify a memory location rather than a DLL name. 
     * 
     * The 
     * <b>GetModuleHandle</b> function returns a handle to a mapped module without incrementing its reference count. However, if this handle is passed to the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-freelibrary">FreeLibrary</a> function, the reference count of the mapped module will be decremented. Therefore, do not pass a handle returned by <b>GetModuleHandle</b> to the 
     * <b>FreeLibrary</b> function. Doing so can cause a DLL module to be unmapped prematurely.
     * 
     * This function must be used carefully in a multithreaded application. There is no guarantee that the module handle remains valid between the time this function returns the handle and the time it is used. For example, suppose that a thread retrieves a module handle, but before it uses the handle, a second thread frees the module. If the system loads another module, it could reuse the module handle that was recently freed. Therefore, the first thread would have a handle to a different module  than the one intended.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-getmodulehandlew
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
     * Retrieves a module handle for the specified module and increments the module's reference count unless GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT is specified. The module must have been loaded by the calling process. (ANSI)
     * @remarks
     * The handle returned is not global or inheritable. It cannot be duplicated or used by another process.
     * 
     * If <i>lpModuleName</i> does not include a path and there is more than one loaded module with the same base name and extension, you cannot predict which module handle will be returned. To work around this problem, you could specify a path, use <a href="https://docs.microsoft.com/windows/desktop/Msi/side-by-side-assemblies">side-by-side assemblies</a>, or specify a memory location rather than a DLL name in the <i>lpModuleName</i> parameter. 
     * 
     * If <i>dwFlags</i> contains GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT, the <b>GetModuleHandleEx</b> function returns a handle to a mapped module without incrementing its reference count. However, if this handle is passed to the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-freelibrary">FreeLibrary</a> function, the reference count of the mapped module will be decremented. Therefore, do not pass a handle returned by <b>GetModuleHandleEx</b> with GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-freelibrary">FreeLibrary</a> function. Doing so can cause a DLL module to be unmapped prematurely.
     * 
     * If <i>dwFlags</i> contains GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT, this function must be used carefully in a multithreaded application. There is no guarantee that the module handle remains valid between the time this function returns the handle and the time it is used. For example, a thread retrieves a module handle, but before it uses the handle, a second thread frees the module. If the system loads another module, it could reuse the module handle that was recently freed. Therefore, first thread would have a handle to a module different than the one intended.
     * 
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0501 or later. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The libloaderapi.h header defines GetModuleHandleEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that is not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-getmodulehandleexa
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
     * Retrieves a module handle for the specified module and increments the module's reference count unless GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT is specified. The module must have been loaded by the calling process. (Unicode)
     * @remarks
     * The handle returned is not global or inheritable. It cannot be duplicated or used by another process.
     * 
     * If <i>lpModuleName</i> does not include a path and there is more than one loaded module with the same base name and extension, you cannot predict which module handle will be returned. To work around this problem, you could specify a path, use <a href="https://docs.microsoft.com/windows/desktop/Msi/side-by-side-assemblies">side-by-side assemblies</a>, or specify a memory location rather than a DLL name in the <i>lpModuleName</i> parameter. 
     * 
     * If <i>dwFlags</i> contains GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT, the <b>GetModuleHandleEx</b> function returns a handle to a mapped module without incrementing its reference count. However, if this handle is passed to the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-freelibrary">FreeLibrary</a> function, the reference count of the mapped module will be decremented. Therefore, do not pass a handle returned by <b>GetModuleHandleEx</b> with GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-freelibrary">FreeLibrary</a> function. Doing so can cause a DLL module to be unmapped prematurely.
     * 
     * If <i>dwFlags</i> contains GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT, this function must be used carefully in a multithreaded application. There is no guarantee that the module handle remains valid between the time this function returns the handle and the time it is used. For example, a thread retrieves a module handle, but before it uses the handle, a second thread frees the module. If the system loads another module, it could reuse the module handle that was recently freed. Therefore, first thread would have a handle to a module different than the one intended.
     * 
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0501 or later. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The libloaderapi.h header defines GetModuleHandleEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-getmodulehandleexw
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
     * @param {HMODULE} hModule A handle to the DLL module that contains the function or variable. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a>, <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-loadpackagedlibrary">LoadPackagedLibrary</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulehandlea">GetModuleHandle</a> function returns this handle. 
     * 
     * The <b>GetProcAddress</b> function does not retrieve addresses from modules that were loaded using the <b>LOAD_LIBRARY_AS_DATAFILE</b> flag. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a>.
     * @param {PSTR} lpProcName The function or variable name, or the function's ordinal value. If this parameter is an ordinal value, it must be in the low-order word; the high-order word must be zero.
     * @returns {Pointer<FARPROC>} If the function succeeds, the return value is the address of the exported function or variable.
     * 
     * If the function fails, the return value is NULL. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-getprocaddress
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
     * Loads the specified module into the address space of the calling process. (LoadLibraryExA)
     * @remarks
     * The <b>LoadLibraryEx</b> function is very similar to the
     *      <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> function. The differences consist of a set of
     *      optional behaviors that <b>LoadLibraryEx</b> provides:
     * 
     * <ul>
     * <li><b>LoadLibraryEx</b> can load a DLL module without
     *       calling the <a href="https://docs.microsoft.com/windows/desktop/Dlls/dllmain">DllMain</a> function of the DLL.</li>
     * <li><b>LoadLibraryEx</b> can load a module in a way that is
     *       optimized for the case where the module will never be executed, loading the module as if it were a data
     *       file.</li>
     * <li><b>LoadLibraryEx</b> can find modules and their
     *       associated modules by using  either of two search strategies or it can search a process-specific set of
     *       directories.</li>
     * </ul>
     * You select these optional behaviors by setting the <i>dwFlags</i> parameter; if
     *      <i>dwFlags</i> is zero,
     *      <b>LoadLibraryEx</b> behaves identically to
     *      <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a>.
     * 
     * The calling process can use the handle returned by
     *     <b>LoadLibraryEx</b> to identify the module in calls to the
     *     <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>,
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-findresourcea">FindResource</a>, and
     *     <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadresource">LoadResource</a> functions.
     * 
     * To enable or disable error messages displayed by the loader during DLL loads, use the
     *     <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-seterrormode">SetErrorMode</a> function.
     * 
     * It is not safe to call <b>LoadLibraryEx</b> from
     *     <a href="https://docs.microsoft.com/windows/desktop/Dlls/dllmain">DllMain</a>. For more information, see the Remarks section in
     *     <b>DllMain</b>.
     * 
     * <b>Visual C++:  </b>The Visual C++ compiler supports a syntax that enables you to declare thread-local variables:
     *       <b>_declspec(thread)</b>. If you use this syntax in a DLL, you will not be able to load the
     *       DLL explicitly using <b>LoadLibraryEx</b> on versions of
     *       Windows prior to Windows Vista. If your DLL will be loaded explicitly, you must use the thread
     *       local storage functions instead of <b>_declspec(thread)</b>. For an example, see
     *       <a href="https://docs.microsoft.com/windows/desktop/Dlls/using-thread-local-storage-in-a-dynamic-link-library">Using Thread Local Storage in a Dynamic Link Library</a>.
     * 
     * <h3><a id="Loading_a_DLL_as_a_Data_File_or_Image_Resource"></a><a id="loading_a_dll_as_a_data_file_or_image_resource"></a><a id="LOADING_A_DLL_AS_A_DATA_FILE_OR_IMAGE_RESOURCE"></a>Loading a DLL as a Data File or Image Resource</h3>
     * The <b>LOAD_LIBRARY_AS_DATAFILE</b>,
     *       <b>LOAD_LIBRARY_AS_DATAFILE_EXCLUSIVE</b>, and
     *       <b>LOAD_LIBRARY_AS_IMAGE_RESOURCE</b> values affect the per-process reference count and the
     *       loading of the specified module. If any of these values is specified for the <i>dwFlags</i>
     *       parameter, the loader checks whether the module was already loaded by the process as an executable DLL. If so,
     *       this means that the module is already mapped into the virtual address space of the calling process. In this
     *       case, <b>LoadLibraryEx</b> returns a handle to the DLL and
     *       increments the DLL reference count. If the DLL module was not already loaded as a DLL, the system maps the
     *       module as a data or image file and not as an executable DLL. In this case,
     *       <b>LoadLibraryEx</b> returns a handle to the loaded data or
     *       image file but does not increment the reference count for the module and does not make the module visible to functions such as <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-createtoolhelp32snapshot">CreateToolhelp32Snapshot</a> or <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-enumprocessmodules">EnumProcessModules</a>.
     * 
     * If <b>LoadLibraryEx</b> is called twice for the same file
     *       with <b>LOAD_LIBRARY_AS_DATAFILE</b>,
     *       <b>LOAD_LIBRARY_AS_DATAFILE_EXCLUSIVE</b>, or
     *       <b>LOAD_LIBRARY_AS_IMAGE_RESOURCE</b>, two separate mappings are created for the file.
     * 
     * When the <b>LOAD_LIBRARY_AS_IMAGE_RESOURCE</b> value is used, the module is loaded as an
     *       image using portable executable (PE) section alignment expansion. Relative virtual addresses (RVA) do not have
     *       to be mapped to disk addresses, so resources can be more quickly retrieved from the module. Specifying
     *       <b>LOAD_LIBRARY_AS_IMAGE_RESOURCE</b> prevents other processes from modifying the module
     *       while it is loaded.
     * 
     * Unless an application depends on specific image mapping characteristics, the
     *       <b>LOAD_LIBRARY_AS_IMAGE_RESOURCE</b> value should be used with either
     *       <b>LOAD_LIBRARY_AS_DATAFILE_EXCLUSIVE</b> or
     *       <b>LOAD_LIBRARY_AS_DATAFILE</b>. This allows the loader to choose whether to load the module
     *       as an image resource or a data file, selecting whichever option enables the system to share pages more
     *       effectively. Resource  functions such as
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-findresourcea">FindResource</a> can use either mapping.
     * 
     * 
     * 
     * To determine how a module was loaded, use one of the  following macros to test the handle returned by
     *       <b>LoadLibraryEx</b>.
     * 
     * 
     * ```cpp
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
     *        appends the default library extension ".DLL" to the module name. To prevent the function from appending
     *        ".DLL" to the module name, include a trailing point character (.) in the module name string.
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
     *        call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-loadlibraryexa
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
     * Loads the specified module into the address space of the calling process. (LoadLibraryExW)
     * @remarks
     * The <b>LoadLibraryEx</b> function is very similar to the
     *      <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> function. The differences consist of a set of
     *      optional behaviors that <b>LoadLibraryEx</b> provides:
     * 
     * <ul>
     * <li><b>LoadLibraryEx</b> can load a DLL module without
     *       calling the <a href="https://docs.microsoft.com/windows/desktop/Dlls/dllmain">DllMain</a> function of the DLL.</li>
     * <li><b>LoadLibraryEx</b> can load a module in a way that is
     *       optimized for the case where the module will never be executed, loading the module as if it were a data
     *       file.</li>
     * <li><b>LoadLibraryEx</b> can find modules and their
     *       associated modules by using  either of two search strategies or it can search a process-specific set of
     *       directories.</li>
     * </ul>
     * You select these optional behaviors by setting the <i>dwFlags</i> parameter; if
     *      <i>dwFlags</i> is zero,
     *      <b>LoadLibraryEx</b> behaves identically to
     *      <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a>.
     * 
     * The calling process can use the handle returned by
     *     <b>LoadLibraryEx</b> to identify the module in calls to the
     *     <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>,
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-findresourcea">FindResource</a>, and
     *     <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadresource">LoadResource</a> functions.
     * 
     * To enable or disable error messages displayed by the loader during DLL loads, use the
     *     <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-seterrormode">SetErrorMode</a> function.
     * 
     * It is not safe to call <b>LoadLibraryEx</b> from
     *     <a href="https://docs.microsoft.com/windows/desktop/Dlls/dllmain">DllMain</a>. For more information, see the Remarks section in
     *     <b>DllMain</b>.
     * 
     * <b>Visual C++:  </b>The Visual C++ compiler supports a syntax that enables you to declare thread-local variables:
     *       <b>_declspec(thread)</b>. If you use this syntax in a DLL, you will not be able to load the
     *       DLL explicitly using <b>LoadLibraryEx</b> on versions of
     *       Windows prior to Windows Vista. If your DLL will be loaded explicitly, you must use the thread
     *       local storage functions instead of <b>_declspec(thread)</b>. For an example, see
     *       <a href="https://docs.microsoft.com/windows/desktop/Dlls/using-thread-local-storage-in-a-dynamic-link-library">Using Thread Local Storage in a Dynamic Link Library</a>.
     * 
     * <h3><a id="Loading_a_DLL_as_a_Data_File_or_Image_Resource"></a><a id="loading_a_dll_as_a_data_file_or_image_resource"></a><a id="LOADING_A_DLL_AS_A_DATA_FILE_OR_IMAGE_RESOURCE"></a>Loading a DLL as a Data File or Image Resource</h3>
     * The <b>LOAD_LIBRARY_AS_DATAFILE</b>,
     *       <b>LOAD_LIBRARY_AS_DATAFILE_EXCLUSIVE</b>, and
     *       <b>LOAD_LIBRARY_AS_IMAGE_RESOURCE</b> values affect the per-process reference count and the
     *       loading of the specified module. If any of these values is specified for the <i>dwFlags</i>
     *       parameter, the loader checks whether the module was already loaded by the process as an executable DLL. If so,
     *       this means that the module is already mapped into the virtual address space of the calling process. In this
     *       case, <b>LoadLibraryEx</b> returns a handle to the DLL and
     *       increments the DLL reference count. If the DLL module was not already loaded as a DLL, the system maps the
     *       module as a data or image file and not as an executable DLL. In this case,
     *       <b>LoadLibraryEx</b> returns a handle to the loaded data or
     *       image file but does not increment the reference count for the module and does not make the module visible to functions such as <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-createtoolhelp32snapshot">CreateToolhelp32Snapshot</a> or <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-enumprocessmodules">EnumProcessModules</a>.
     * 
     * If <b>LoadLibraryEx</b> is called twice for the same file
     *       with <b>LOAD_LIBRARY_AS_DATAFILE</b>,
     *       <b>LOAD_LIBRARY_AS_DATAFILE_EXCLUSIVE</b>, or
     *       <b>LOAD_LIBRARY_AS_IMAGE_RESOURCE</b>, two separate mappings are created for the file.
     * 
     * When the <b>LOAD_LIBRARY_AS_IMAGE_RESOURCE</b> value is used, the module is loaded as an
     *       image using portable executable (PE) section alignment expansion. Relative virtual addresses (RVA) do not have
     *       to be mapped to disk addresses, so resources can be more quickly retrieved from the module. Specifying
     *       <b>LOAD_LIBRARY_AS_IMAGE_RESOURCE</b> prevents other processes from modifying the module
     *       while it is loaded.
     * 
     * Unless an application depends on specific image mapping characteristics, the
     *       <b>LOAD_LIBRARY_AS_IMAGE_RESOURCE</b> value should be used with either
     *       <b>LOAD_LIBRARY_AS_DATAFILE_EXCLUSIVE</b> or
     *       <b>LOAD_LIBRARY_AS_DATAFILE</b>. This allows the loader to choose whether to load the module
     *       as an image resource or a data file, selecting whichever option enables the system to share pages more
     *       effectively. Resource  functions such as
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-findresourcea">FindResource</a> can use either mapping.
     * 
     * 
     * 
     * To determine how a module was loaded, use one of the  following macros to test the handle returned by
     *       <b>LoadLibraryEx</b>.
     * 
     * 
     * ```cpp
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
     *        not contain any point character (.), then the function appends the default library extension ".DLL" to the module name.
     *        To prevent the function from appending ".DLL" to the module name, include a trailing point character (.) in the module
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
     *        call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-loadlibraryexw
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
     * @remarks
     * The return type of <b>LoadResource</b> is <b>HGLOBAL</b> for backward compatibility, not because the function returns a handle to a global memory block. Do not pass this handle to the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globallock">GlobalLock</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalfree">GlobalFree</a> function. To obtain a pointer to the first byte of the resource data, call the <a href="https://docs.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-lockresource">LockResource</a> function; to obtain the size of the resource, call <a href="https://docs.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-sizeofresource">SizeofResource</a>. 
     * 
     * [GlobalSize](/windows/desktop/api/winbase/nf-winbase-globalsize) returns 0 for a resource HGLOBAL. As a result, any APIs that depend on GlobalSize to determine the size of the HGLOBAL will not function correctly. For example, use [SHCreateMemStream](/windows/win32/api/shlwapi/nf-shlwapi-shcreatememstream) instead of [CreateStreamOnHGlobal](/windows/win32/api/combaseapi/nf-combaseapi-createstreamonhglobal).
     * 
     * To use a resource immediately, an application should use the following resource-specific functions to find and load the resource in one call.
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Function</th>
     * <th>Action</th>
     * <th>To remove resource</th>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a>
     * </td>
     * <td>Loads and formats a message-table entry</td>
     * <td>No action needed</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-loadacceleratorsa">LoadAccelerators</a>
     * </td>
     * <td>Loads an accelerator table</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-destroyacceleratortable">DestroyAcceleratorTable</a>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadbitmapa">LoadBitmap</a>
     * </td>
     * <td>Loads a bitmap resource</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-deleteobject">DeleteObject</a>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-loadcursora">LoadCursor</a>
     * </td>
     * <td>Loads a cursor resource</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-destroycursor">DestroyCursor</a>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-loadicona">LoadIcon</a>
     * </td>
     * <td>Loads an icon resource</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-destroyicon">DestroyIcon</a>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-loadmenua">LoadMenu</a>
     * </td>
     * <td>Loads a menu resource</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-destroymenu">DestroyMenu</a>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-loadstringa">LoadString</a>
     * </td>
     * <td>Loads a string resource</td>
     * <td>No action needed</td>
     * </tr>
     * </table>
     *  
     * 
     * For example, an application can use the <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-loadicona">LoadIcon</a> function to load an icon for display on the screen, followed by <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-destroyicon">DestroyIcon</a> when done.
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
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-loadresource
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
     * @remarks
     * The pointer returned by **LockResource** is valid until the module containing the resource is unloaded. It is not necessary to unlock resources because the system automatically deletes them when the process that created them terminates.
     * 
     * Do not try to lock a resource by using the handle returned by the [FindResourceA function](../winbase/nf-winbase-findresourcea.md) or [FindResourceExA function](../winbase/nf-winbase-findresourceexa.md) function. Such a handle points to random data. 
     * 
     * > [!Note]
     * > **LockResource** does not actually lock memory; it is just used to obtain a pointer to the memory containing the resource data. The name of the function comes from versions prior to Windows XP, when it was used to lock a global memory block allocated by [LoadResource](nf-libloaderapi-loadresource.md).
     * @param {HGLOBAL} hResData Type: **HGLOBAL**
     * 
     * A handle to the resource to be accessed. The [LoadResource function](nf-libloaderapi-loadresource.md) returns this handle. Note that this parameter is listed as an **HGLOBAL** variable only for backward compatibility. Do not pass any value as a parameter other than a successful return value from the **LoadResource** function.
     * @returns {Pointer<Void>} Type: **LPVOID**
     * 
     * If the loaded resource is available, the return value is a pointer to the first byte of the resource; otherwise, it is **NULL**.
     * @see https://learn.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-lockresource
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
     * A handle to the module whose executable file contains the resource. Default is the module used to create the current process.
     * @param {HRSRC} hResInfo Type: <b>HRSRC</b>
     * 
     * A handle to the resource. This handle must be created by using the <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-findresourcea">FindResource</a> or <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-findresourceexa">FindResourceEx</a> function.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * If the function succeeds, the return value is the number of bytes in the resource.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-sizeofresource
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
     * @remarks
     * The <b>AddDllDirectory</b> function can be used to add 
     *     any absolute path to the set of directories that are searched for a DLL. If 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-setdefaultdlldirectories">SetDefaultDllDirectories</a> is first called with 
     *     <b>LOAD_LIBRARY_SEARCH_USER_DIRS</b>, directories specified with 
     *     <b>AddDllDirectory</b> are added to the process DLL search 
     *     path. Otherwise, directories specified with the 
     *     <b>AddDllDirectory</b> function are used only for 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a> function calls that specify 
     *     <b>LOAD_LIBRARY_SEARCH_USER_DIRS</b>.
     * 
     * If <b>AddDllDirectory</b> is used to add more than one 
     *     directory to the process DLL search path, the order in which those directories are searched is unspecified.
     * 
     * To remove a directory added with <b>AddDllDirectory</b>, 
     *     use the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-removedlldirectory">RemoveDllDirectory</a> function.
     * 
     * <b>Windows 7, Windows Server 2008 R2, Windows Vista and Windows Server 2008:  </b>To use this function in an application, call 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> to retrieve the function's address 
     *       from Kernel32.dll. 
     *       <a href="https://support.microsoft.com/kb/2533623">KB2533623</a> must be 
     *       installed on the target platform.
     * @param {PWSTR} NewDirectory An absolute path to the directory to add to the search path. For example, to add the directory 
     *       Dir2 to the process DLL search path, specify \Dir2. For more information about paths, 
     *       see <a href="https://docs.microsoft.com/windows/desktop/FileIO/naming-a-file">Naming Files, Paths, and Namespaces</a>.
     * @returns {Pointer<Void>} If the function succeeds, the return value is an opaque pointer that can be passed to 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-removedlldirectory">RemoveDllDirectory</a> to remove the DLL from the 
     *       process DLL search path.
     * 
     * If the function fails, the return value is zero. To get extended error 
     *       information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-adddlldirectory
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
     * @remarks
     * After <b>RemoveDllDirectory</b> returns, the cookie is 
     *     no longer valid and should not be used.
     * 
     * <b>Windows 7, Windows Server 2008 R2, Windows Vista and Windows Server 2008:  </b>To call this function in an application, use the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> function to retrieve its address from 
     *       Kernel32.dll. 
     *       <a href="https://support.microsoft.com/kb/2533623">KB2533623</a> must be 
     *       installed on the target platform.
     * @param {Pointer<Void>} Cookie The cookie returned by <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-adddlldirectory">AddDllDirectory</a> when the 
     *       directory was added to the search path.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value 
     *       is zero. To get extended error information, call 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-removedlldirectory
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
     * @remarks
     * The DLL search path is the set of directories that are searched for a DLL when a full path is not specified in 
     *     a <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> or 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a> function call, or when a full path to the 
     *     DLL is specified but the system must search for dependent DLLs. For more information about the standard DLL search 
     *     path, see 
     *     <a href="https://docs.microsoft.com/windows/desktop/Dlls/dynamic-link-library-search-order">Dynamic-Link Library Search Order</a>.
     * 
     * The standard DLL search path contains directories that can be vulnerable to a 
     *     <a href="https://docs.microsoft.com/windows/desktop/Dlls/dynamic-link-library-security">DLL pre-loading attack</a>. An application can 
     *     use the <b>SetDefaultDllDirectories</b> function to 
     *     specify  a default DLL search path for the process that eliminates the most vulnerable directories and limits the 
     *     other directories that are searched. The process DLL search path applies only to the calling process and persists 
     *     for the life of the process.
     * 
     * If the <i>DirectoryFlags</i> parameter specifies more than one flag, the directories are 
     *     searched in the following order:
     * 
     * <ul>
     * <li>The directory that contains the DLL (<b>LOAD_LIBRARY_SEARCH_DLL_LOAD_DIR</b>). This 
     *       directory is searched only for dependencies of the DLL being loaded.</li>
     * <li>The application directory (<b>LOAD_LIBRARY_SEARCH_APPLICATION_DIR</b>).</li>
     * <li>Paths explicitly added to the application search path with the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-adddlldirectory">AddDllDirectory</a> function 
     *       (<b>LOAD_LIBRARY_SEARCH_USER_DIRS</b>) or the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setdlldirectorya">SetDllDirectory</a> function. If more than one path has 
     *       been added, the  order in which the paths are searched is unspecified.</li>
     * <li>The System directory (<b>LOAD_LIBRARY_SEARCH_SYSTEM32</b>).</li>
     * </ul>
     * If <b>SetDefaultDllDirectories</b> does not 
     *     specify <b>LOAD_LIBRARY_SEARCH_USER_DIRS</b>, directories specified with the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-adddlldirectory">AddDllDirectory</a> function are used only for 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a> function calls that specify 
     *     <b>LOAD_LIBRARY_SEARCH_USER_DIRS</b>.
     * 
     * It is not possible to revert to the standard DLL search path or remove any directory specified with 
     *     <b>SetDefaultDllDirectories</b> from the search 
     *     path. However, the process DLL search path can be overridden by calling 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a> with one or more 
     *     <b>LOAD_LIBRARY_SEARCH</b> flags, and directories added with 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-adddlldirectory">AddDllDirectory</a> can be removed by calling 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-removedlldirectory">RemoveDllDirectory</a>.
     * 
     * <b>Windows 7, Windows Server 2008 R2, Windows Vista and Windows Server 2008:  </b>To call this function in an application, use the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> function to retrieve its address from 
     *       Kernel32.dll. 
     *       <a href="https://support.microsoft.com/kb/2533623">KB2533623</a> must be 
     *       installed on the target platform.
     * @param {Integer} DirectoryFlags 
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-setdefaultdlldirectories
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
     * Enumerates language-specific resources, of the specified type and name, associated with a specified binary module. Extends EnumResourceLanguages by allowing more control over the enumeration. (ANSI)
     * @remarks
     * If <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-is_intresource">IS_INTRESOURCE</a>(<i>lpType</i>) is <b>TRUE</b>, then <i>lpType</i> specifies the integer identifier of the given resource type. Otherwise, it is a pointer to a null-terminated string. If the first character of the string is a pound sign (#), then the remaining characters represent a decimal number that specifies the 
     * 
     * integer identifier of the resource type. For example, the string "#258" represents the identifier 258.
     * 
     * Similarly, if <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-is_intresource">IS_INTRESOURCE</a>(<i>lpName</i>) is <b>TRUE</b>, then <i>lpName</i> specifies the integer identifier of the given resource. Otherwise, it is a pointer to a null-terminated string. If the first character of the string is a pound sign (#), then the remaining characters represent a decimal number that specifies the 
     * 
     * integer identifier of the resource.
     * 
     * Starting with Windows Vista, the binary module is typically an LN file, and the enumeration will also include resources from the corresponding language-specific resource files (.mui files) that contain localizable language resources.
     * 
     * For each such resource found, <b>EnumResourceLanguagesEx</b> calls an application-defined callback function <i>lpEnumFunc</i>, passing to the callback function the language identifier (see <a href="https://docs.microsoft.com/windows/desktop/Intl/language-identifiers">Language Identifiers</a>) of the language for which a resource was found (as well as the various other parameters that were passed to <b>EnumResourceLanguagesEx</b>).
     * 
     * The search can include both an LN file and its associated .mui files, or it can be limited either to a single binary module of any type, or to the .mui files associated with a single LN file. Also, by specifying an LN file for the <i>hModule</i> parameter and a nonzero <i>LangId</i> parameter, the search can be limited to the unique .mui file associated with that LN file and language.
     * 
     * The <b>EnumResourceLanguagesEx</b> function continues to enumerate resource languages until the callback function returns <b>FALSE</b> or all resource languages have been enumerated.
     * 
     * If <i>hModule</i> specifies an LN file, and both flags are selected, the languages enumerated include all languages whose resources reside either in the LN file or in any .mui files associated with it. If no .mui files are found, only languages from the LN file are returned.
     * 
     * If <i>dwFlags</i> contains <b>RESOURCE_ENUM_MUI</b> or <b>NULL</b> and <i>LangId</i> is 0, then the enumeration first includes the languages associated with all system-installed .mui files, using languages retrieved from <a href="https://docs.microsoft.com/windows/desktop/api/winnls/nf-winnls-enumuilanguagesa">EnumUILanguages</a>.. Finally, if the <b>RESOURCE_ENUM_LN</b> flag is also set, the file designated by <i>hModule</i> is also searched.
     * 
     * If the <i>LangId</i> is nonzero, then only the .mui file corresponding to that language identifier will be searched. Language fallbacks will not be used. If an .mui file for that language does not exist, the enumeration will be empty (unless resources for that language exist in the LN file, and the flag is set to search the LN file as well).
     * 
     * The enumeration never includes duplicates: if resources for a particular language are contained in both the LN file and in an .mui file, the type will only be enumerated once.
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
     * Returns <b>TRUE</b> if the function succeeds or <b>FALSE</b> if the function does not find a resource of the type specified, or if the function fails for another reason. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-enumresourcelanguagesexa
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
     * Enumerates language-specific resources, of the specified type and name, associated with a specified binary module. Extends EnumResourceLanguages by allowing more control over the enumeration. (Unicode)
     * @remarks
     * If <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-is_intresource">IS_INTRESOURCE</a>(<i>lpType</i>) is <b>TRUE</b>, then <i>lpType</i> specifies the integer identifier of the given resource type. Otherwise, it is a pointer to a null-terminated string. If the first character of the string is a pound sign (#), then the remaining characters represent a decimal number that specifies the 
     * 
     * integer identifier of the resource type. For example, the string "#258" represents the identifier 258.
     * 
     * Similarly, if <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-is_intresource">IS_INTRESOURCE</a>(<i>lpName</i>) is <b>TRUE</b>, then <i>lpName</i> specifies the integer identifier of the given resource. Otherwise, it is a pointer to a null-terminated string. If the first character of the string is a pound sign (#), then the remaining characters represent a decimal number that specifies the 
     * 
     * integer identifier of the resource.
     * 
     * Starting with Windows Vista, the binary module is typically an LN file, and the enumeration will also include resources from the corresponding language-specific resource files (.mui files) that contain localizable language resources.
     * 
     * For each such resource found, <b>EnumResourceLanguagesEx</b> calls an application-defined callback function <i>lpEnumFunc</i>, passing to the callback function the language identifier (see <a href="https://docs.microsoft.com/windows/desktop/Intl/language-identifiers">Language Identifiers</a>) of the language for which a resource was found (as well as the various other parameters that were passed to <b>EnumResourceLanguagesEx</b>).
     * 
     * The search can include both an LN file and its associated .mui files, or it can be limited either to a single binary module of any type, or to the .mui files associated with a single LN file. Also, by specifying an LN file for the <i>hModule</i> parameter and a nonzero <i>LangId</i> parameter, the search can be limited to the unique .mui file associated with that LN file and language.
     * 
     * The <b>EnumResourceLanguagesEx</b> function continues to enumerate resource languages until the callback function returns <b>FALSE</b> or all resource languages have been enumerated.
     * 
     * If <i>hModule</i> specifies an LN file, and both flags are selected, the languages enumerated include all languages whose resources reside either in the LN file or in any .mui files associated with it. If no .mui files are found, only languages from the LN file are returned.
     * 
     * If <i>dwFlags</i> contains <b>RESOURCE_ENUM_MUI</b> or <b>NULL</b> and <i>LangId</i> is 0, then the enumeration first includes the languages associated with all system-installed .mui files, using languages retrieved from <a href="https://docs.microsoft.com/windows/desktop/api/winnls/nf-winnls-enumuilanguagesa">EnumUILanguages</a>.. Finally, if the <b>RESOURCE_ENUM_LN</b> flag is also set, the file designated by <i>hModule</i> is also searched.
     * 
     * If the <i>LangId</i> is nonzero, then only the .mui file corresponding to that language identifier will be searched. Language fallbacks will not be used. If an .mui file for that language does not exist, the enumeration will be empty (unless resources for that language exist in the LN file, and the flag is set to search the LN file as well).
     * 
     * The enumeration never includes duplicates: if resources for a particular language are contained in both the LN file and in an .mui file, the type will only be enumerated once.
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
     * Returns <b>TRUE</b> if the function succeeds or <b>FALSE</b> if the function does not find a resource of the type specified, or if the function fails for another reason. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-enumresourcelanguagesexw
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
     * Enumerates resources of a specified type that are associated with a specified binary module. The search can include both an LN file and its associated .mui files, or it can be limited in several ways. (ANSI)
     * @remarks
     * If <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-is_intresource">IS_INTRESOURCE</a>(<i>lpszType</i>) is <b>TRUE</b>, then <i>lpszType</i> specifies the integer identifier of the given resource type. Otherwise, it is a pointer to a null-terminated string. If the first character of the string is a pound sign (#), then the remaining characters represent a decimal number that specifies the 
     * 
     * integer identifier of the resource type. For example, the string "#258" represents the identifier 258.
     * 
     * The enumeration search can include both an LN file and its associated .mui files. It can be limited to a single binary module of any type. It can also be limited to the .mui files associated with a single LN file. By specifying an LN file for the <i>hModule</i> parameter and a nonzero <i>LangId</i> parameter, the search can be limited to the unique .mui file associated with that LN file and language.
     * 
     * For each resource found, <b>EnumResourceNamesEx</b> calls an application-defined callback function <i>lpEnumFunc</i>, passing the name or the ID of each resource it finds, as well as the various other parameters that were passed to <b>EnumResourceNamesEx</b>.
     * 
     * If a resource has an ID, the ID is returned to the callback function; otherwise the resource name is returned to the callback function. For more information, see <a href="https://docs.microsoft.com/windows/win32/api/libloaderapi/nc-libloaderapi-enumresnameproca">EnumResNameProc</a>.
     * 
     * The <b>EnumResourceNamesEx</b> function continues to enumerate resource names until the callback function returns <b>FALSE</b> or all resource names for this type have been enumerated.
     * 
     * If <i>hModule</i> specifies an LN file, and both flags are selected, the names enumerated correspond to resources residing either in that LN file or  the .mui files associated with it. If no .mui files are found, only names from the LN file are returned. After one appropriate .mui file is found the search will not continue further, because all .mui files corresponding to a single LN file have the same resource names.
     * 
     * If <i>dwFlags</i> and <i>LangId</i> are both zero, then the function behaves like <a href="https://docs.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-enumresourcenamesa">EnumResourceNames</a>.
     * 
     * If <i>LangId</i> is nonzero, then only the .mui file corresponding to that Language identifier will be searched. Language fallbacks will not be used. If an .mui file for that language does not exist, the enumeration will be empty (unless resources for that language exist in the LN file, and the flag is set to search the LN file as well).
     * 
     * The enumeration never includes duplicates: if resources for a particular language are contained in both the LN file and in an .mui file, the name will only be enumerated once.
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
     * The function <b>TRUE</b> if successful, or <b>FALSE</b> if the function does not find a resource of the type specified, or if the function fails for another reason. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-enumresourcenamesexa
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
     * Enumerates resources of a specified type that are associated with a specified binary module. The search can include both an LN file and its associated .mui files, or it can be limited in several ways. (Unicode)
     * @remarks
     * If <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-is_intresource">IS_INTRESOURCE</a>(<i>lpszType</i>) is <b>TRUE</b>, then <i>lpszType</i> specifies the integer identifier of the given resource type. Otherwise, it is a pointer to a null-terminated string. If the first character of the string is a pound sign (#), then the remaining characters represent a decimal number that specifies the 
     * 
     * integer identifier of the resource type. For example, the string "#258" represents the identifier 258.
     * 
     * The enumeration search can include both an LN file and its associated .mui files. It can be limited to a single binary module of any type. It can also be limited to the .mui files associated with a single LN file. By specifying an LN file for the <i>hModule</i> parameter and a nonzero <i>LangId</i> parameter, the search can be limited to the unique .mui file associated with that LN file and language.
     * 
     * For each resource found, <b>EnumResourceNamesEx</b> calls an application-defined callback function <i>lpEnumFunc</i>, passing the name or the ID of each resource it finds, as well as the various other parameters that were passed to <b>EnumResourceNamesEx</b>.
     * 
     * If a resource has an ID, the ID is returned to the callback function; otherwise the resource name is returned to the callback function. For more information, see <a href="https://docs.microsoft.com/windows/win32/api/libloaderapi/nc-libloaderapi-enumresnameproca">EnumResNameProc</a>.
     * 
     * The <b>EnumResourceNamesEx</b> function continues to enumerate resource names until the callback function returns <b>FALSE</b> or all resource names for this type have been enumerated.
     * 
     * If <i>hModule</i> specifies an LN file, and both flags are selected, the names enumerated correspond to resources residing either in that LN file or  the .mui files associated with it. If no .mui files are found, only names from the LN file are returned. After one appropriate .mui file is found the search will not continue further, because all .mui files corresponding to a single LN file have the same resource names.
     * 
     * If <i>dwFlags</i> and <i>LangId</i> are both zero, then the function behaves like <a href="https://docs.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-enumresourcenamesa">EnumResourceNames</a>.
     * 
     * If <i>LangId</i> is nonzero, then only the .mui file corresponding to that Language identifier will be searched. Language fallbacks will not be used. If an .mui file for that language does not exist, the enumeration will be empty (unless resources for that language exist in the LN file, and the flag is set to search the LN file as well).
     * 
     * The enumeration never includes duplicates: if resources for a particular language are contained in both the LN file and in an .mui file, the name will only be enumerated once.
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
     * The function <b>TRUE</b> if successful, or <b>FALSE</b> if the function does not find a resource of the type specified, or if the function fails for another reason. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-enumresourcenamesexw
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
     * Enumerates resource types associated with a specified binary module. (ANSI)
     * @remarks
     * The <b>EnumResourceTypesEx</b> function continues to enumerate resource types until the callback function returns <b>FALSE</b> or all resource types have been enumerated.
     * 
     * If <i>hModule</i> specifies an LN file, and both flags are selected, the types enumerated correspond to resources residing either in the LN file or in the .mui files associated with it. If no .mui files are found, only types from the LN file are returned. Once one appropriate .mui file is found the search will not continue further, because all .mui files corresponding to a single LN file have the same resource types.
     * 
     * If <i>dwFlags</i> and <i>LangId</i> are both zero, then the function behaves like <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-enumresourcetypesa">EnumResourceTypes</a>.
     * 
     * If <i>LangId</i> is nonzero, then only the .mui file corresponding to that language identifier will be searched. Language fallbacks will not be used. If an .mui file for that language does not exist, the enumeration will be empty (unless resources for that language exist in the LN file, and the flag is set to search the LN file as well).
     * 
     * The enumeration never includes duplicates: if resources for a particular language are contained in both the LN file and in an .mui file, the type will only be enumerated once.
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
     * Returns <b>TRUE</b> if successful or <b>FALSE</b> if the function does not find a resource of the type specified, or if the function fails for another reason. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-enumresourcetypesexa
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
     * Enumerates resource types associated with a specified binary module. (Unicode)
     * @remarks
     * The <b>EnumResourceTypesEx</b> function continues to enumerate resource types until the callback function returns <b>FALSE</b> or all resource types have been enumerated.
     * 
     * If <i>hModule</i> specifies an LN file, and both flags are selected, the types enumerated correspond to resources residing either in the LN file or in the .mui files associated with it. If no .mui files are found, only types from the LN file are returned. Once one appropriate .mui file is found the search will not continue further, because all .mui files corresponding to a single LN file have the same resource types.
     * 
     * If <i>dwFlags</i> and <i>LangId</i> are both zero, then the function behaves like <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-enumresourcetypesa">EnumResourceTypes</a>.
     * 
     * If <i>LangId</i> is nonzero, then only the .mui file corresponding to that language identifier will be searched. Language fallbacks will not be used. If an .mui file for that language does not exist, the enumeration will be empty (unless resources for that language exist in the LN file, and the flag is set to search the LN file as well).
     * 
     * The enumeration never includes duplicates: if resources for a particular language are contained in both the LN file and in an .mui file, the type will only be enumerated once.
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
     * Returns <b>TRUE</b> if successful or <b>FALSE</b> if the function does not find a resource of the type specified, or if the function fails for another reason. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-enumresourcetypesexw
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
     * Determines the location of a resource with the specified type and name in the specified module. (FindResourceW)
     * @remarks
     * If <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-is_intresource">IS_INTRESOURCE</a> is <b>TRUE</b> for x = <i>lpName</i> or <i>lpType</i>, x specifies the integer identifier of the name or type of the given resource. Otherwise, those parameters are long pointers to null-terminated strings. If the first character of the string is a pound sign (#), the remaining characters represent a decimal number that specifies the integer identifier of the resource's name or type. For example, the string "#258" represents the integer identifier 258.
     * 
     * To reduce the amount of memory required for a resource, an application should refer to it by integer identifier instead of by name.
     * 
     * An application can use <b>FindResource</b> to find any type of resource, but this function should be used only if the application must access the binary resource data by making subsequent calls to <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadresource">LoadResource</a> and then to <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-lockresource">LockResource</a>.
     * 
     * To use a resource immediately, an application should use one of the following resource-specific functions to find the resource and convert the data into a more usable form.
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Function</th>
     * <th>Action</th>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a>
     * </td>
     * <td>Loads and formats a message-table entry.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadacceleratorsw">LoadAccelerators</a>
     * </td>
     * <td>Loads an accelerator table.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadbitmapw">LoadBitmap</a>
     * </td>
     * <td>Loads a bitmap resource.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadcursorw">LoadCursor</a>
     * </td>
     * <td>Loads a cursor resource.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadiconw">LoadIcon</a>
     * </td>
     * <td>Loads an icon resource.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadmenuw">LoadMenu</a>
     * </td>
     * <td>Loads a menu resource.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadstringw">LoadString</a>
     * </td>
     * <td>Loads a string-table entry.</td>
     * </tr>
     * </table>
     * 
     * For example, an application can use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadiconw">LoadIcon</a> function to load an icon for display on the screen. However, the application should use <b>FindResource</b> and <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadresource">LoadResource</a> if it is loading the icon to copy its data to another application.
     * 
     * String resources are stored in sections of up to 16 strings per section. The strings in each section are stored as a sequence of counted (not necessarily null-terminated) Unicode strings. The <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadstringw">LoadString</a> function will extract the string resource from its corresponding section.
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
     * If the function succeeds, the return value is a handle to the specified resource's information block. To obtain a handle to the resource, pass this handle to the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadresource">LoadResource</a> function.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-findresourcew
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
     * @param {PSTR} lpLibFileName The name of the module. This can be either a library module (a .dll file) or an executable
     * module (an .exe file).
     * If the specified module is an executable module, static imports are not loaded;
     * instead, the module is loaded as if by
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a>
     * with the `DONT_RESOLVE_DLL_REFERENCES` flag.
     * 
     * The name specified is the file name of the module and is not related to the
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
     *        appends the default library extension ".DLL" to the module name. To prevent the function from appending
     *        ".DLL" to the module name, include a trailing point character (.) in the module name string.
     * @returns {HMODULE} If the function succeeds, the return value is a handle to the module.
     * 
     * If the function fails, the return value is NULL. To get extended error information, call
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-loadlibrarya
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
     * Loads the specified module into the address space of the calling process. (LoadLibraryW)
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
     * @param {PWSTR} lpLibFileName The name of the module. This can be either a library module (a .dll file) or an executable
     * module (an .exe file).
     * If the specified module is an executable module, static imports are not loaded;
     * instead, the module is loaded as if by
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexw">LoadLibraryEx</a>
     * with the `DONT_RESOLVE_DLL_REFERENCES` flag.
     * 
     * The name specified is the file name of the module and is not related to the
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
     *        appends the default library extension ".DLL" to the module name. To prevent the function from appending
     *        ".DLL" to the module name, include a trailing point character (.) in the module name string.
     * @returns {HMODULE} If the function succeeds, the return value is a handle to the module.
     * 
     * If the function fails, the return value is NULL. To get extended error information, call
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-loadlibraryw
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
     * Enumerates resources of a specified type within a binary module. (Unicode)
     * @remarks
     * If [IS_INTRESOURCE](/windows/desktop/api/winuser/nf-winuser-is_intresource)(*lpszType*) is **TRUE**, then *lpszType* specifies the integer identifier of the given resource type. Otherwise, it is a pointer to a null-terminated string. If the first character of the string is a pound sign (#), then the remaining characters represent a decimal number that specifies the integer identifier of the resource type. For example, the string "#258" represents the identifier 258.
     * 
     * For each resource found, **EnumResourceNames** calls an application-defined callback function *lpEnumFunc*, passing the name or the ID of each resource it finds, as well as the various other parameters that were passed to **EnumResourceNames**.
     * 
     * Alternately, applications can call [EnumResourceNamesEx](/windows/desktop/api/libloaderapi/nf-libloaderapi-enumresourcenamesexw), which provides more precise control of what resources are enumerated.
     * 
     * If a resource has an ID, the ID is passed to the callback function; otherwise the resource name is passed to the callback function. For more information, see [ENUMRESNAMEPROC](/windows/win32/api/libloaderapi/nc-libloaderapi-enumresnameprocw).
     * 
     * The **EnumResourceNames** function continues to enumerate resources until the callback function returns **FALSE** or all resources have been enumerated.
     * 
     * Starting with Windows Vista, if *hModule* specifies an LN file, then the resources enumerated can reside either in the LN file or in a .mui file associated with it. If no .mui files are found, only resources from the LN file are returned. The order in which .mui files are searched is the usual Resource Loader search order; see [User Interface Language Management](/windows/desktop/Intl/user-interface-language-management) for details. Once one appropriate .mui file is found, the .mui file search stops. Because all .mui files that correspond to a single LN file have the same resource types, only the resources in the found .mui file need to be enumerated.
     * 
     * The enumeration never includes duplicates: if resources with the same name are contained in both the LN file and in an .mui file, the resource will only be enumerated once.
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
     * @see https://learn.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-enumresourcenamesw
     */
    static EnumResourceNamesW(hModule, lpType, lpEnumFunc, lParam) {
        hModule := hModule is Win32Handle ? NumGet(hModule, "ptr") : hModule
        lpType := lpType is String ? StrPtr(lpType) : lpType

        result := DllCall("KERNEL32.dll\EnumResourceNamesW", "ptr", hModule, "ptr", lpType, "ptr", lpEnumFunc, "ptr", lParam, "int")
        return result
    }

    /**
     * Enumerates resources of a specified type within a binary module. (ANSI)
     * @remarks
     * If [IS_INTRESOURCE](/windows/desktop/api/winuser/nf-winuser-is_intresource)(*lpszType*) is **TRUE**, then *lpszType* specifies the integer identifier of the given resource type. Otherwise, it is a pointer to a null-terminated string. If the first character of the string is a pound sign (#), then the remaining characters represent a decimal number that specifies the integer identifier of the resource type. For example, the string "#258" represents the identifier 258.
     * 
     * For each resource found, **EnumResourceNames** calls an application-defined callback function *lpEnumFunc*, passing the name or the ID of each resource it finds, as well as the various other parameters that were passed to **EnumResourceNames**.
     * 
     * Alternately, applications can call [EnumResourceNamesEx](/windows/desktop/api/libloaderapi/nf-libloaderapi-enumresourcenamesexw), which provides more precise control of what resources are enumerated.
     * 
     * If a resource has an ID, the ID is passed to the callback function; otherwise the resource name is passed to the callback function. For more information, see [ENUMRESNAMEPROC](/windows/win32/api/libloaderapi/nc-libloaderapi-enumresnameproca).
     * 
     * The **EnumResourceNames** function continues to enumerate resources until the callback function returns **FALSE** or all resources have been enumerated.
     * 
     * Starting with Windows Vista, if *hModule* specifies an LN file, then the resources enumerated can reside either in the LN file or in a .mui file associated with it. If no .mui files are found, only resources from the LN file are returned. The order in which .mui files are searched is the usual Resource Loader search order; see [User Interface Language Management](/windows/desktop/Intl/user-interface-language-management) for details. Once one appropriate .mui file is found, the .mui file search stops. Because all .mui files that correspond to a single LN file have the same resource types, only the resources in the found .mui file need to be enumerated.
     * 
     * The enumeration never includes duplicates: if resources with the same name are contained in both the LN file and in an .mui file, the resource will only be enumerated once.
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
     * @see https://learn.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-enumresourcenamesa
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
     * @remarks
     * The 
     * <b>LoadPackagedLibrary</b> function is a simplified version of <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a>. Packaged apps can use <b>LoadPackagedLibrary</b> to load packaged modules. Unpackaged applications cannot use <b>LoadPackagedLibrary</b>; if a unpackaged application calls this function it fails with <b>APPMODEL_ERROR_NO_PACKAGE</b>.
     * 
     * <b>LoadPackagedLibrary</b> returns a handle to the specified module and increments its reference count. If the module is already loaded, the function returns a handle to the loaded module. The calling process can use the handle returned by <b>LoadPackagedLibrary</b> to identify the module in calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> function. Use the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-freelibrary">FreeLibrary</a> function to free a loaded module and decrement its reference              count.  
     * 
     * If the function must search for the specified module or its dependencies, it searches only the package dependency graph of the process.  This is the application's package plus any dependencies specified as <c>&lt;PackageDependency&gt;</code> in the <code>&lt;Dependencies&gt;</code> section of the application's package manifest. Dependencies are searched in the order they appear in the manifest. The package dependency graph is specified in the <code>&lt;Dependencies&gt;</c> section of the application's package manifest. Dependencies are searched in the order they appear in the manifest. The search proceeds as follows: 
     * 
     * <ol>
     * <li>The function first searches modules that are already loaded. If the specified module was originally loaded from the package dependency graph of the process, the function returns a handle to the loaded module. If the specified module was not loaded from the package dependency graph of the process, the function returns <b>NULL</b>.</li>
     * <li>If the module is not already loaded, the function searches the package dependency graph of the process.</li>
     * <li>If the function cannot find the specified module or one of its dependencies, the function fails.</li>
     * </ol>
     * It is not safe to call 
     * <b>LoadPackagedLibrary</b> from 
     * <a href="https://docs.microsoft.com/windows/desktop/Dlls/dllmain">DllMain</a>. For more information, see the Remarks section in 
     * <b>DllMain</b>.
     * 
     * > [!NOTE]
     * On Windows Phone, **LoadPackagedLibrary** must be called from `PhoneAppModelHost.dll`. Using `Kernel32.dll` is not supported.
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
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-loadpackagedlibrary
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
     * @remarks
     * A delay-loaded DLL is statically linked but not actually loaded into memory until the running application references a symbol exported by that DLL. Applications often delay load DLLs that contain functions the application might call only rarely or not at all, because the DLL is only loaded when it is needed instead of being loaded at application startup like other statically linked DLLs. This helps improve application performance, especially during initialization. A delay-load DLL is specified at link time with the <a href="https://docs.microsoft.com/cpp/build/reference/delayload-delay-load-import">/DELAYLOAD (Delay Load Import)</a> linker option. 
     * 
     * Applications that target multiple versions of Windows or multiple Windows device families also rely on delay-loaded DLLs to make visible extra features when they are available.
     * 
     * A desktop application can use delayed loading as an alternative to runtime dynamic linking that uses  <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> or <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a> to load a DLL and <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> to get a pointer to a function. A Windows Store app cannot use <b>LoadLibrary</b> or <b>LoadLibraryEx</b>, so to get the benefits to runtime dynamic linking, a Windows Store app must use the delayed loading mechanism.
     * 
     * To check whether a function in a delay-loaded DLL is available on the system, the application calls <b>QueryOptionalDelayLoadedAPI</b> with the specified function. If <b>QueryOptionalDelayLoadedAPI</b> succeeds, the application can safely call the specified function.
     * @param {HMODULE} hParentModule A handle to the calling module. Desktop applications can use the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulehandlea">GetModuleHandle</a> or <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulehandleexa">GetModuleHandleEx</a> function to get this handle. Windows Store apps should set this parameter to <c>static_cast&lt;HMODULE&gt;(&amp;__ImageBase)</c>.
     * @param {PSTR} lpDllName The file name of the delay-loaded DLL that exports the specified function. This parameter is case-insensitive.
     * 
     * Windows Store apps should specify API sets, rather than monolithic DLLs. For example,   api-ms-win-core-memory-l1-1-1.dll, rather than kernel32.dll.
     * @param {PSTR} lpProcName The name of the function to query. This parameter is case-sensitive.
     * @returns {BOOL} TRUE if the specified function is available on the system. If the specified function is not available on the system, this function returns FALSE. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/libloaderapi2/nf-libloaderapi2-queryoptionaldelayloadedapi
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
     * @remarks
     * The <b>LOADPARMS32</b> structure has the following form:
     * 						
     * 
     * 
     * ``` syntax
     * typedef struct tagLOADPARMS32 { 
     *   LPSTR lpEnvAddress;  // address of environment strings 
     *   LPSTR lpCmdLine;     // address of command line 
     *   LPSTR lpCmdShow;     // how to show new program 
     *   DWORD dwReserved;    // must be zero 
     * } LOADPARMS32;
     * ```
     * 
     * <table>
     * <tr>
     * <th>Member</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td><b>lpEnvAddress</b></td>
     * <td>Pointer to an array of null-terminated strings that supply the environment strings for the new process. The array has a value of NULL as its last entry. A value of NULL for this parameter causes the new process to start with the same environment as the calling process.</td>
     * </tr>
     * <tr>
     * <td><b>lpCmdLine</b></td>
     * <td>Pointer to a Pascal-style string that contains a correctly formed command line. The first byte of the string contains the number of bytes in the string. The remainder of the string contains the command line arguments, excluding the name of the child process. If there are no command line arguments, this parameter must point to a zero length string; it cannot be NULL.</td>
     * </tr>
     * <tr>
     * <td><b>lpCmdShow</b></td>
     * <td>Pointer to a structure containing two <b>WORD</b> values. The first value must always be set to two. The second value specifies how the application window is to be shown and is used to supply the <b>wShowWindow</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/ns-processthreadsapi-startupinfoa">STARTUPINFO</a> structure to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a> function. See the description of the <i>nCmdShow</i> parameter of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-showwindow">ShowWindow</a> function for a list of acceptable values.</td>
     * </tr>
     * <tr>
     * <td><b>dwReserved</b></td>
     * <td>This parameter is reserved; it must be zero.</td>
     * </tr>
     * </table>
     *  
     * 
     * Applications should use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a> function instead of 
     * <b>LoadModule</b>. The 
     * <b>LoadModule</b> function calls 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a> by forming the parameters as follows.
     * 				
     * 
     * <table>
     * <tr>
     * <th>CreateProcess parameter</th>
     * <th>Argument used</th>
     * </tr>
     * <tr>
     * <td><i>lpszApplicationName</i></td>
     * <td><i>lpModuleName</i></td>
     * </tr>
     * <tr>
     * <td><i>lpszCommandLine</i></td>
     * <td><i>lpParameterBlock</i>.<b>lpCmdLine</b></td>
     * </tr>
     * <tr>
     * <td><i>lpProcessAttributes</i></td>
     * <td>NULL</td>
     * </tr>
     * <tr>
     * <td><i>lpThreadAttributes</i></td>
     * <td>NULL</td>
     * </tr>
     * <tr>
     * <td><i>bInheritHandles</i></td>
     * <td>FALSE</td>
     * </tr>
     * <tr>
     * <td><i>dwCreationFlags</i></td>
     * <td>0</td>
     * </tr>
     * <tr>
     * <td><i>lpEnvironment</i></td>
     * <td><i>lpParameterBlock</i>.<b>lpEnvAddress</b></td>
     * </tr>
     * <tr>
     * <td><i>lpCurrentDirectory</i></td>
     * <td>NULL</td>
     * </tr>
     * <tr>
     * <td><i>lpStartupInfo</i></td>
     * <td>The structure is initialized to zero. The <b>cb</b> member is set to the size of the structure. The <b>wShowWindow</b> member is set to the value of the second word of <i>lpParameterBlock</i>.<b>lpCmdShow</b>.</td>
     * </tr>
     * <tr>
     * <td><i>lpProcessInformation</i><b>.hProcess</b></td>
     * <td>The handle is immediately closed.</td>
     * </tr>
     * <tr>
     * <td><i>lpProcessInformation</i><b>.hThread</b></td>
     * <td>The handle is immediately closed.</td>
     * </tr>
     * </table>
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
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-loadmodule
     * @since windows5.1.2600
     */
    static LoadModule(lpModuleName, lpParameterBlock) {
        lpModuleName := lpModuleName is String ? StrPtr(lpModuleName) : lpModuleName

        lpParameterBlockMarshal := lpParameterBlock is VarRef ? "ptr" : "ptr"

        result := DllCall("KERNEL32.dll\LoadModule", "ptr", lpModuleName, lpParameterBlockMarshal, lpParameterBlock, "uint")
        return result
    }

    /**
     * Determines the location of a resource with the specified type and name in the specified module. (FindResourceA)
     * @remarks
     * If <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-is_intresource">IS_INTRESOURCE</a> is <b>TRUE</b> for x = <i>lpName</i> or <i>lpType</i>, x specifies the integer identifier of the name or type of the given resource. Otherwise, those parameters are long pointers to null-terminated strings. If the first character of the string is a pound sign (#), the remaining characters represent a decimal number that specifies the integer identifier of the resource's name or type. For example, the string "#258" represents the integer identifier 258. 
     * 
     * To reduce the amount of memory required for a resource, an application should refer to it by integer identifier instead of by name. 
     * 
     * An application can use <b>FindResource</b> to find any type of resource, but this function should be used only if the application must access the binary resource data by making subsequent calls to <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadresource">LoadResource</a> and then to <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-lockresource">LockResource</a>. 
     * 
     * To use a resource immediately, an application should use one of the following resource-specific functions to find the resource and convert the data into a more usable form. 
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Function</th>
     * <th>Action</th>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a>
     * </td>
     * <td>Loads and formats a message-table entry.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadacceleratorsa">LoadAccelerators</a>
     * </td>
     * <td>Loads an accelerator table.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadbitmapa">LoadBitmap</a>
     * </td>
     * <td>Loads a bitmap resource.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadcursora">LoadCursor</a>
     * </td>
     * <td>Loads a cursor resource.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadicona">LoadIcon</a>
     * </td>
     * <td>Loads an icon resource.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadmenua">LoadMenu</a>
     * </td>
     * <td>Loads a menu resource.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadstringa">LoadString</a>
     * </td>
     * <td>Loads a string-table entry.</td>
     * </tr>
     * </table>
     *  
     * 
     * For example, an application can use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadicona">LoadIcon</a> function to load an icon for display on the screen. However, the application should use <b>FindResource</b> and <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadresource">LoadResource</a> if it is loading the icon to copy its data to another application. 
     * 
     * String resources are stored in sections of up to 16 strings per section. The strings in each section are stored as a sequence of counted (not necessarily null-terminated) Unicode strings. The <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadstringa">LoadString</a> function will extract the string resource from its corresponding section.
     * @param {HMODULE} hModule Type: <b>HMODULE</b>
     * 
     * A handle to the module whose portable executable file or an accompanying MUI file contains the resource. If this parameter is <b>NULL</b>, the function searches the module used to create the current process.
     * @param {PSTR} lpName Type: <b>LPCTSTR</b>
     * 
     * The name of the resource. Alternately, rather than a pointer, this parameter can be <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a>(ID), where ID is the integer identifier of the resource. For more information, see the Remarks section below.
     * @param {PSTR} lpType Type: <b>LPCTSTR</b>
     * 
     * The resource type. Alternately, rather than a pointer, this parameter can be <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a>(ID), where ID is the integer identifier of the given resource type. For standard resource types, see <a href="https://docs.microsoft.com/windows/desktop/menurc/resource-types">Resource Types</a>. For more information, see the Remarks section below.
     * @returns {HRSRC} Type: <b>HRSRC</b>
     * 
     * If the function succeeds, the return value is a handle to the specified resource's information block. To obtain a handle to the resource, pass this handle to the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadresource">LoadResource</a> function.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-findresourcea
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
     * Determines the location of the resource with the specified type, name, and language in the specified module. (FindResourceExA)
     * @remarks
     * If <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-is_intresource">IS_INTRESOURCE</a> is <b>TRUE</b> for x = <i>lpType</i> or <i>lpName</i>, x specifies the integer identifier of the type or name of the given resource. Otherwise, those parameters are long pointers to null-terminated strings. If the first character of the string is a pound sign (#), the remaining characters represent a decimal number that specifies the integer identifier of the resource's name or type. For example, the string "#258" represents the integer identifier 258. 
     * 
     * To reduce the amount of memory required for a resource, an application should refer to it by integer identifier instead of by name. 
     * 
     * An application can use <b>FindResourceEx</b> to find any type of resource, but this function should be used only if the application must access the binary resource data by making subsequent calls to <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadresource">LoadResource</a> and then to <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-lockresource">LockResource</a>. 
     * 
     * To use a resource immediately, an application should use one of the following resource-specific functions to find the resource and convert the data into a more usable form. 
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Function</th>
     * <th>Action</th>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a>
     * </td>
     * <td>Loads and formats a message-table entry.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadacceleratorsa">LoadAccelerators</a>
     * </td>
     * <td>Loads an accelerator table.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadbitmapa">LoadBitmap</a>
     * </td>
     * <td>Loads a bitmap resource.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadcursora">LoadCursor</a>
     * </td>
     * <td>Loads a cursor resource.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadicona">LoadIcon</a>
     * </td>
     * <td>Loads an icon resource.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadmenua">LoadMenu</a>
     * </td>
     * <td>Loads a menu resource.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadstringa">LoadString</a>
     * </td>
     * <td>Loads a string-table entry.</td>
     * </tr>
     * </table>
     *  
     * 
     * For example, an application can use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadicona">LoadIcon</a> function to load an icon for display on the screen. However, the application should use <b>FindResourceEx</b> and <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadresource">LoadResource</a> if it is loading the icon to copy its data to another application. 
     * 
     * String resources are stored in sections of up to 16 strings per section. The strings in each section are stored as a sequence of counted (not necessarily null-terminated) Unicode strings. The <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadstringa">LoadString</a> function will extract the string resource from its corresponding section.
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
     * If the function succeeds, the return value is a handle to the specified resource's information block. To obtain a handle to the resource, pass this handle to the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadresource">LoadResource</a> function.
     *                     
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-findresourceexa
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
     * Enumerates resource types within a binary module. (ANSI)
     * @remarks
     * For each resource type found, <b>EnumResourceTypes</b> calls an application-defined callback function <i>lpEnumFunc</i>, passing each resource type it finds, as well as the various other parameters that were passed to <b>EnumResourceTypes</b>.
     * 
     * <b>EnumResourceTypes</b> continues to enumerate resource types until the callback function returns <b>FALSE</b> or all resource types have been enumerated.
     * 
     * Starting with Windows Vista, if <i>hModule</i> specifies an LN file, then the types enumerated correspond to resources that reside in the LN file and in the .mui file associated with it. If no .mui files are found, only types from the LN file are returned. The order in which .mui files are searched is the usual Resource Loader search order; see <a href="https://docs.microsoft.com/windows/desktop/Intl/user-interface-language-management">User Interface Language Management</a> for details. After one appropriate .mui file is found, the search does not continue further to other .mui files associated with the LN file, because all .mui files that correspond to a single LN file have the same set of resource types.
     * 
     * The enumeration never includes duplicates: if a given resource type is contained in both the LN file and in an .mui file, the type is enumerated only once.
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
     * Returns <b>TRUE</b> if successful; otherwise, <b>FALSE</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-enumresourcetypesa
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
     * Enumerates resource types within a binary module. (Unicode)
     * @remarks
     * For each resource type found, <b>EnumResourceTypes</b> calls an application-defined callback function <i>lpEnumFunc</i>, passing each resource type it finds, as well as the various other parameters that were passed to <b>EnumResourceTypes</b>.
     * 
     * <b>EnumResourceTypes</b> continues to enumerate resource types until the callback function returns <b>FALSE</b> or all resource types have been enumerated.
     * 
     * Starting with Windows Vista, if <i>hModule</i> specifies an LN file, then the types enumerated correspond to resources that reside in the LN file and in the .mui file associated with it. If no .mui files are found, only types from the LN file are returned. The order in which .mui files are searched is the usual Resource Loader search order; see <a href="https://docs.microsoft.com/windows/desktop/Intl/user-interface-language-management">User Interface Language Management</a> for details. After one appropriate .mui file is found, the search does not continue further to other .mui files associated with the LN file, because all .mui files that correspond to a single LN file have the same set of resource types.
     * 
     * The enumeration never includes duplicates: if a given resource type is contained in both the LN file and in an .mui file, the type is enumerated only once.
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
     * Returns <b>TRUE</b> if successful; otherwise, <b>FALSE</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-enumresourcetypesw
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
     * Enumerates language-specific resources, of the specified type and name, associated with a binary module. (ANSI)
     * @remarks
     * If <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-is_intresource">IS_INTRESOURCE</a>(<i>lpType</i>) is <b>TRUE</b>, then <i>lpType</i> specifies the integer identifier of the given resource type. Otherwise, it is a pointer to a null-terminated string. If the first character of the string is a pound sign (#), then the remaining characters represent a decimal number that specifies the integer identifier of the resource type. For example, the string "#258" represents the identifier 258.
     * 
     * Similarly, if <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-is_intresource">IS_INTRESOURCE</a>(<i>lpName</i>) is <b>TRUE</b>, then <i>lpName</i> specifies the integer identifier of the given resource. Otherwise, it is a pointer to a null-terminated string. If the first character of the string is a pound sign (#), then the remaining characters represent a decimal number that specifies the integer identifier of the resource.
     * 
     * Starting with Windows Vista, the binary module is typically a <a href="https://docs.microsoft.com/windows/desktop/Intl/mui-resource-management">language-neutral Portable Executable</a> (LN file), and the enumeration will also include resources from the corresponding language-specific resource files (.mui files) that contain localizable language resources.
     * 
     * For each resource found, <b>EnumResourceLanguages</b> calls an application-defined callback function <i>lpEnumFunc</i>, passing the language identifier (see <a href="https://docs.microsoft.com/windows/desktop/Intl/language-identifiers">Language Identifiers</a>) of the language for which a resource was found, as well as the various other parameters that were passed to <b>EnumResourceLanguages</b>.
     * 
     * Alternately, applications can call <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nf-rrascfg-ieapproviderconfig-initialize">EnumResourceLanguagesEx</a>, which provides more precise control of what resources are enumerated.
     * 
     * The <b>EnumResourceLanguages</b> function continues to enumerate resource languages until the callback function returns <b>FALSE</b> or all resource languages have been enumerated.
     * 
     * In Windows Vista and later, if  <i>hModule</i> specifies an LN file, then the resources enumerated can reside either in the LN file or in an .mui file associated with it.  If no .mui files are found, only resources from the LN file are returned.  Unlike <a href="https://docs.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-enumresourcenamesa">EnumResourceNames</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-enumresourcetypesa">EnumResourceTypes</a>, this search will look at multiple .mui files. The enumeration begins with .mui files in the folders associated with <a href="https://docs.microsoft.com/windows/desktop/api/winnls/nf-winnls-enumuilanguagesa">EnumUILanguages</a>. These are followed by any other .mui files whose paths conform to the scheme described at <a href="https://docs.microsoft.com/windows/desktop/Intl/mui-resource-management">MUI Resource Management</a>. Finally, the file designated by <i>hModule</i> is also searched.
     * 
     * The enumeration never includes duplicates: if a resource with the same name, type, and language is contained in both the LN file and in an .mui file, the resource will only be enumerated once.
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
     * Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-enumresourcelanguagesa
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
     * Enumerates language-specific resources, of the specified type and name, associated with a binary module. (Unicode)
     * @remarks
     * If <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-is_intresource">IS_INTRESOURCE</a>(<i>lpType</i>) is <b>TRUE</b>, then <i>lpType</i> specifies the integer identifier of the given resource type. Otherwise, it is a pointer to a null-terminated string. If the first character of the string is a pound sign (#), then the remaining characters represent a decimal number that specifies the integer identifier of the resource type. For example, the string "#258" represents the identifier 258.
     * 
     * Similarly, if <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-is_intresource">IS_INTRESOURCE</a>(<i>lpName</i>) is <b>TRUE</b>, then <i>lpName</i> specifies the integer identifier of the given resource. Otherwise, it is a pointer to a null-terminated string. If the first character of the string is a pound sign (#), then the remaining characters represent a decimal number that specifies the integer identifier of the resource.
     * 
     * Starting with Windows Vista, the binary module is typically a <a href="https://docs.microsoft.com/windows/desktop/Intl/mui-resource-management">language-neutral Portable Executable</a> (LN file), and the enumeration will also include resources from the corresponding language-specific resource files (.mui files) that contain localizable language resources.
     * 
     * For each resource found, <b>EnumResourceLanguages</b> calls an application-defined callback function <i>lpEnumFunc</i>, passing the language identifier (see <a href="https://docs.microsoft.com/windows/desktop/Intl/language-identifiers">Language Identifiers</a>) of the language for which a resource was found, as well as the various other parameters that were passed to <b>EnumResourceLanguages</b>.
     * 
     * Alternately, applications can call <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nf-rrascfg-ieapproviderconfig-initialize">EnumResourceLanguagesEx</a>, which provides more precise control of what resources are enumerated.
     * 
     * The <b>EnumResourceLanguages</b> function continues to enumerate resource languages until the callback function returns <b>FALSE</b> or all resource languages have been enumerated.
     * 
     * In Windows Vista and later, if  <i>hModule</i> specifies an LN file, then the resources enumerated can reside either in the LN file or in an .mui file associated with it.  If no .mui files are found, only resources from the LN file are returned.  Unlike <a href="https://docs.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-enumresourcenamesa">EnumResourceNames</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-enumresourcetypesa">EnumResourceTypes</a>, this search will look at multiple .mui files. The enumeration begins with .mui files in the folders associated with <a href="https://docs.microsoft.com/windows/desktop/api/winnls/nf-winnls-enumuilanguagesa">EnumUILanguages</a>. These are followed by any other .mui files whose paths conform to the scheme described at <a href="https://docs.microsoft.com/windows/desktop/Intl/mui-resource-management">MUI Resource Management</a>. Finally, the file designated by <i>hModule</i> is also searched.
     * 
     * The enumeration never includes duplicates: if a resource with the same name, type, and language is contained in both the LN file and in an .mui file, the resource will only be enumerated once.
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
     * Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-enumresourcelanguagesw
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
     * Retrieves a handle that can be used by the UpdateResource function to add, delete, or replace resources in a binary module. (ANSI)
     * @remarks
     * It is recommended that the resource file is not loaded before this function is called. However, if that file is already loaded, it will not cause an error to be returned.
     * 
     * There are some restrictions on resource updates in files that contain  Resource Configuration(RC Config) data: LN files and the associated .mui files. Details on which types of resources are allowed to be updated in these files are in the Remarks section for the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-updateresourcea">UpdateResource</a> function.
     * 
     * This function can update resources within modules that contain both code and resources. As noted above, there are restrictions on resource updates in LN files and .mui files, both of which contain RC Config data; details of the restrictions are in the reference for the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-updateresourcea">UpdateResource</a> function.
     * @param {PSTR} pFileName Type: <b>LPCTSTR</b>
     * 
     * The binary file in which to update resources. An application must be able to obtain write-access to this file; the file referenced by <i>pFileName</i> cannot be currently executing. If <i>pFileName</i> does not specify a full path, the system searches for the file in the current directory.
     * @param {BOOL} bDeleteExistingResources Type: <b>BOOL</b>
     * 
     * Indicates whether to delete the <i>pFileName</i> parameter's existing resources. If this parameter is <b>TRUE</b>, existing resources are deleted and the updated file includes only resources added with the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-updateresourcea">UpdateResource</a> function. If this parameter is <b>FALSE</b>, the updated file includes existing resources unless they are explicitly deleted or replaced by using <b>UpdateResource</b>.
     * @returns {HANDLE} Type: <b>HANDLE</b>
     * 
     * If the function succeeds, the return value is a handle that can be used by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-updateresourcea">UpdateResource</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-endupdateresourcea">EndUpdateResource</a> functions. The return value is <b>NULL</b> if the specified file is not a PE, the file does not exist, or the file cannot be opened for writing. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-beginupdateresourcea
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
        resultHandle.DefineProp("Free", { Call: (self) => LibraryLoader.EndUpdateResourceA(self.Value) })
        return resultHandle
    }

    /**
     * Retrieves a handle that can be used by the UpdateResource function to add, delete, or replace resources in a binary module. (Unicode)
     * @remarks
     * It is recommended that the resource file is not loaded before this function is called. However, if that file is already loaded, it will not cause an error to be returned.
     * 
     * There are some restrictions on resource updates in files that contain  Resource Configuration(RC Config) data: LN files and the associated .mui files. Details on which types of resources are allowed to be updated in these files are in the Remarks section for the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-updateresourcea">UpdateResource</a> function.
     * 
     * This function can update resources within modules that contain both code and resources. As noted above, there are restrictions on resource updates in LN files and .mui files, both of which contain RC Config data; details of the restrictions are in the reference for the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-updateresourcea">UpdateResource</a> function.
     * @param {PWSTR} pFileName Type: <b>LPCTSTR</b>
     * 
     * The binary file in which to update resources. An application must be able to obtain write-access to this file; the file referenced by <i>pFileName</i> cannot be currently executing. If <i>pFileName</i> does not specify a full path, the system searches for the file in the current directory.
     * @param {BOOL} bDeleteExistingResources Type: <b>BOOL</b>
     * 
     * Indicates whether to delete the <i>pFileName</i> parameter's existing resources. If this parameter is <b>TRUE</b>, existing resources are deleted and the updated file includes only resources added with the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-updateresourcea">UpdateResource</a> function. If this parameter is <b>FALSE</b>, the updated file includes existing resources unless they are explicitly deleted or replaced by using <b>UpdateResource</b>.
     * @returns {HANDLE} Type: <b>HANDLE</b>
     * 
     * If the function succeeds, the return value is a handle that can be used by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-updateresourcea">UpdateResource</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-endupdateresourcea">EndUpdateResource</a> functions. The return value is <b>NULL</b> if the specified file is not a PE, the file does not exist, or the file cannot be opened for writing. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-beginupdateresourcew
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
        resultHandle.DefineProp("Free", { Call: (self) => LibraryLoader.EndUpdateResourceW(self.Value) })
        return resultHandle
    }

    /**
     * Adds, deletes, or replaces a resource in a portable executable (PE) file. (ANSI)
     * @remarks
     * It is recommended that the resource file is not loaded before this function is called. However, if that file is already loaded, it will not cause an error to be returned.
     * 
     * An application can use <b>UpdateResource</b> repeatedly to make changes to the resource data. Each call to <b>UpdateResource</b> contributes to an internal list of additions, deletions, and replacements but does not actually write the data to the file indicated by <i>hUpdate</i>. The application must use the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-endupdateresourcea">EndUpdateResource</a> function to write the accumulated changes to the file.
     * 
     * This function can update resources within modules that contain both code and resources.
     * 
     * <b>Prior to Windows 7:</b> If <i>lpData</i> is <b>NULL</b> and <i>cbData</i> is nonzero, the specified resource is NOT deleted and an exception is thrown.
     * 
     * <b>Starting with Windows Vista:</b> As noted above, there are restrictions on resource updates in files that contain RC Config data: LN files and .mui files. The restrictions are as follows:
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Action</th>
     * <th>LN file</th>
     * <th>.mui file</th>
     * </tr>
     * <tr>
     * <td>1. Add a new type that doesn't exist in the LN or .mui files.</td>
     * <td>Add type in the LN file and treat as language-neutral (non-localizable) and add new type or item in the RC Config data</td>
     * <td>The only additions allowed are the following types: file Version, RC Config data, Side-by-side Assembly XML Manifest.</td>
     * </tr>
     * <tr>
     * <td>2. Add a new resource item to an existing type.</td>
     * <td>Uses the RC Config data to check whether the type exists in the .mui files associated with this LN file. If the type doesn't exist in the .mui files, add the item and treat new item as un-localizable. If the type exists in the .mui files, then adding is not allowed.</td>
     * <td>Only items of the following types may be added: File Version, RC Config data, Side-by-side Assembly XML Manifest.</td>
     * </tr>
     * <tr>
     * <td>3. Update a resource item.</td>
     * <td>Uses the RC Config data to check whether the type exists in the .mui files associated with the LN file. If the type doesn't exist in the .mui files, then this resource item update is allowed in the LN file. Otherwise, if the type exists in the .mui files associated with this LN file, then this update is not allowed.</td>
     * <td>The only updates allowed are items of the following types: file Version, RC Config data, Side-by-side Assembly XML Manifest.</td>
     * </tr>
     * <tr>
     * <td>4. Add a type/item for a new language.</td>
     * <td>Not allowed.</td>
     * <td>Not allowed.</td>
     * </tr>
     * <tr>
     * <td>5. Remove an existing type/item.</td>
     * <td>Works similarly to case 3. Uses the RC Config data to check whether the type exists in the .mui files associated with the LN file. If not, then the removal of the type/item from the LN file is allowed.  Otherwise, if the type/item exists in the .mui files associated with this LN file, then the removal is not allowed.</td>
     * <td>The only types allowed to be removed are: file Version, RC Config data, Side-by-side Assembly XML Manifest; also, only items of these types may be removed.</td>
     * </tr>
     * <tr>
     * <td>6. Add/delete/update a type not included in the RC Config data (such as Version, Side-by-side Assembly XML Manifest, or RC Config data itself). </td>
     * <td>Allowed.</td>
     * <td>Allowed.</td>
     * </tr>
     * <tr>
     * <td>7. Other update of non-localizable data, such as TYPELIB, reginst, and so on.</td>
     * <td>Update type or item in the LN file, treat as non-localizable, and add new type or item in the RC Config data.</td>
     * <td>Not applicable.</td>
     * </tr>
     * <tr>
     * <td>8. Add RC Config data.</td>
     * <td>Can be done but the integrity of the RC Config data is not checked.</td>
     * <td>Can be done but the integrity of the RC Config data is not checked.</td>
     * </tr>
     * </table>
     * @param {HANDLE} hUpdate Type: <b>HANDLE</b>
     * 
     * A module handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-beginupdateresourcea">BeginUpdateResource</a> function, referencing the file to be updated.
     * @param {PSTR} lpType Type: <b>LPCTSTR</b>
     * 
     * The resource type to be updated. Alternatively, rather than a pointer, this parameter can be <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a>(ID), where ID is an integer value representing a predefined resource type. If the first character of the string is a pound sign (#), then the remaining characters represent a decimal number that specifies the integer identifier of the resource type. For example, the string "#258" represents the identifier 258.
     * 
     * For a list of predefined resource types, see <a href="https://docs.microsoft.com/windows/win32/menurc/resource-types">Resource Types</a>.
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
     * Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-updateresourcea
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
     * Adds, deletes, or replaces a resource in a portable executable (PE) file. (Unicode)
     * @remarks
     * It is recommended that the resource file is not loaded before this function is called. However, if that file is already loaded, it will not cause an error to be returned.
     * 
     * An application can use <b>UpdateResource</b> repeatedly to make changes to the resource data. Each call to <b>UpdateResource</b> contributes to an internal list of additions, deletions, and replacements but does not actually write the data to the file indicated by <i>hUpdate</i>. The application must use the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-endupdateresourcea">EndUpdateResource</a> function to write the accumulated changes to the file.
     * 
     * This function can update resources within modules that contain both code and resources.
     * 
     * <b>Prior to Windows 7:</b> If <i>lpData</i> is <b>NULL</b> and <i>cbData</i> is nonzero, the specified resource is NOT deleted and an exception is thrown.
     * 
     * <b>Starting with Windows Vista:</b> As noted above, there are restrictions on resource updates in files that contain RC Config data: LN files and .mui files. The restrictions are as follows:
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Action</th>
     * <th>LN file</th>
     * <th>.mui file</th>
     * </tr>
     * <tr>
     * <td>1. Add a new type that doesn't exist in the LN or .mui files.</td>
     * <td>Add type in the LN file and treat as language-neutral (non-localizable) and add new type or item in the RC Config data</td>
     * <td>The only additions allowed are the following types: file Version, RC Config data, Side-by-side Assembly XML Manifest.</td>
     * </tr>
     * <tr>
     * <td>2. Add a new resource item to an existing type.</td>
     * <td>Uses the RC Config data to check whether the type exists in the .mui files associated with this LN file. If the type doesn't exist in the .mui files, add the item and treat new item as un-localizable. If the type exists in the .mui files, then adding is not allowed.</td>
     * <td>Only items of the following types may be added: File Version, RC Config data, Side-by-side Assembly XML Manifest.</td>
     * </tr>
     * <tr>
     * <td>3. Update a resource item.</td>
     * <td>Uses the RC Config data to check whether the type exists in the .mui files associated with the LN file. If the type doesn't exist in the .mui files, then this resource item update is allowed in the LN file. Otherwise, if the type exists in the .mui files associated with this LN file, then this update is not allowed.</td>
     * <td>The only updates allowed are items of the following types: file Version, RC Config data, Side-by-side Assembly XML Manifest.</td>
     * </tr>
     * <tr>
     * <td>4. Add a type/item for a new language.</td>
     * <td>Not allowed.</td>
     * <td>Not allowed.</td>
     * </tr>
     * <tr>
     * <td>5. Remove an existing type/item.</td>
     * <td>Works similarly to case 3. Uses the RC Config data to check whether the type exists in the .mui files associated with the LN file. If not, then the removal of the type/item from the LN file is allowed.  Otherwise, if the type/item exists in the .mui files associated with this LN file, then the removal is not allowed.</td>
     * <td>The only types allowed to be removed are: file Version, RC Config data, Side-by-side Assembly XML Manifest; also, only items of these types may be removed.</td>
     * </tr>
     * <tr>
     * <td>6. Add/delete/update a type not included in the RC Config data (such as Version, Side-by-side Assembly XML Manifest, or RC Config data itself). </td>
     * <td>Allowed.</td>
     * <td>Allowed.</td>
     * </tr>
     * <tr>
     * <td>7. Other update of non-localizable data, such as TYPELIB, reginst, and so on.</td>
     * <td>Update type or item in the LN file, treat as non-localizable, and add new type or item in the RC Config data.</td>
     * <td>Not applicable.</td>
     * </tr>
     * <tr>
     * <td>8. Add RC Config data.</td>
     * <td>Can be done but the integrity of the RC Config data is not checked.</td>
     * <td>Can be done but the integrity of the RC Config data is not checked.</td>
     * </tr>
     * </table>
     * @param {HANDLE} hUpdate Type: <b>HANDLE</b>
     * 
     * A module handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-beginupdateresourcea">BeginUpdateResource</a> function, referencing the file to be updated.
     * @param {PWSTR} lpType Type: <b>LPCTSTR</b>
     * 
     * The resource type to be updated. Alternatively, rather than a pointer, this parameter can be <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a>(ID), where ID is an integer value representing a predefined resource type. If the first character of the string is a pound sign (#), then the remaining characters represent a decimal number that specifies the integer identifier of the resource type. For example, the string "#258" represents the identifier 258.
     * 
     * For a list of predefined resource types, see <a href="https://docs.microsoft.com/windows/win32/menurc/resource-types">Resource Types</a>.
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
     * Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-updateresourcew
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
     * Commits or discards changes made prior to a call to UpdateResource. (ANSI)
     * @remarks
     * Before you call this function, make sure all file handles other than the one returned by <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-beginupdateresourcea">BeginUpdateResource</a> are closed.
     * 
     * This function can update resources within modules that contain both code and resources. There are restrictions on resource updates in LN files and .mui files, both of which contain Resource Configuration data; details of the restrictions are in the reference for the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-updateresourcea">UpdateResource</a> function.
     * @param {HANDLE} hUpdate Type: <b>HANDLE</b>
     * 
     * A module handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-beginupdateresourcea">BeginUpdateResource</a> function, and used by <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-updateresourcea">UpdateResource</a>, referencing the file to be updated.
     * @param {BOOL} fDiscard Type: <b>BOOL</b>
     * 
     * Indicates whether to write the resource updates to the file. If this parameter is <b>TRUE</b>, no changes are made. If it is <b>FALSE</b>, the changes are made: the resource updates will take effect.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns <b>TRUE</b> if the function succeeds; <b>FALSE</b> otherwise. If the function succeeds and <i>fDiscard</i> is <b>TRUE</b>, then no resource updates are made to the file; otherwise all successful resource updates are made to the file. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-endupdateresourcea
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
     * Commits or discards changes made prior to a call to UpdateResource. (Unicode)
     * @remarks
     * Before you call this function, make sure all file handles other than the one returned by <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-beginupdateresourcea">BeginUpdateResource</a> are closed.
     * 
     * This function can update resources within modules that contain both code and resources. There are restrictions on resource updates in LN files and .mui files, both of which contain Resource Configuration data; details of the restrictions are in the reference for the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-updateresourcea">UpdateResource</a> function.
     * @param {HANDLE} hUpdate Type: <b>HANDLE</b>
     * 
     * A module handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-beginupdateresourcea">BeginUpdateResource</a> function, and used by <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-updateresourcea">UpdateResource</a>, referencing the file to be updated.
     * @param {BOOL} fDiscard Type: <b>BOOL</b>
     * 
     * Indicates whether to write the resource updates to the file. If this parameter is <b>TRUE</b>, no changes are made. If it is <b>FALSE</b>, the changes are made: the resource updates will take effect.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns <b>TRUE</b> if the function succeeds; <b>FALSE</b> otherwise. If the function succeeds and <i>fDiscard</i> is <b>TRUE</b>, then no resource updates are made to the file; otherwise all successful resource updates are made to the file. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-endupdateresourcew
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
     * Adds a directory to the search path used to locate DLLs for the application. (ANSI)
     * @remarks
     * The 
     * <b>SetDllDirectory</b> function affects all subsequent calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a> functions. It also effectively disables safe DLL search mode while the specified directory is in the search path. 
     * 
     * > [!NOTE]
     * > For Win32 processes that are **not** running a packaged or protected process, calling this function will also affect the DLL search order of the children processes started from the process that has called the function.
     * 
     * After calling 
     * <b>SetDllDirectory</b>, the standard DLL search path is:
     * 
     * <ol>
     * <li>The directory from which the application loaded.</li>
     * <li>The directory specified by the <i>lpPathName</i> parameter.</li>
     * <li>The system directory. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getsystemdirectorya">GetSystemDirectory</a> function to get the path of this directory. The name of this directory is System32.</li>
     * <li>The 16-bit system directory. There is no function that obtains the path of this directory, but it is searched. The name of this directory is System.</li>
     * <li>The Windows directory. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getwindowsdirectorya">GetWindowsDirectory</a> function to get the path of this directory.</li>
     * <li>The directories that are listed in the PATH environment variable.</li>
     * </ol>
     * Each time the <b>SetDllDirectory</b> function is called, it replaces the directory specified in the previous <b>SetDllDirectory</b> call. To specify more than one directory, use the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-adddlldirectory">AddDllDirectory</a> function and call <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a> with LOAD_LIBRARY_SEARCH_USER_DIRS.
     * 
     * To revert to the standard search path used by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a>, call 
     * <b>SetDllDirectory</b> with NULL. This also restores safe DLL search mode  based on the <b>SafeDllSearchMode</b> registry value.
     * 
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0502 or later. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines SetDllDirectory as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PSTR} lpPathName The directory to be added to the search path. If this parameter is an empty string (""), the call removes the current directory from the default DLL search order. If this parameter is NULL, the function restores the default search order.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-setdlldirectorya
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
     * Adds a directory to the search path used to locate DLLs for the application. (Unicode)
     * @remarks
     * The 
     * <b>SetDllDirectory</b> function affects all subsequent calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a> functions. It also effectively disables safe DLL search mode while the specified directory is in the search path. 
     * 
     * > [!NOTE]
     * > For Win32 processes that are **not** running a packaged or protected process, calling this function will also affect the DLL search order of the children processes started from the process that has called the function.
     * 
     * After calling 
     * <b>SetDllDirectory</b>, the standard DLL search path is:
     * 
     * <ol>
     * <li>The directory from which the application loaded.</li>
     * <li>The directory specified by the <i>lpPathName</i> parameter.</li>
     * <li>The system directory. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getsystemdirectorya">GetSystemDirectory</a> function to get the path of this directory. The name of this directory is System32.</li>
     * <li>The 16-bit system directory. There is no function that obtains the path of this directory, but it is searched. The name of this directory is System.</li>
     * <li>The Windows directory. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getwindowsdirectorya">GetWindowsDirectory</a> function to get the path of this directory.</li>
     * <li>The directories that are listed in the PATH environment variable.</li>
     * </ol>
     * Each time the <b>SetDllDirectory</b> function is called, it replaces the directory specified in the previous <b>SetDllDirectory</b> call. To specify more than one directory, use the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-adddlldirectory">AddDllDirectory</a> function and call <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a> with LOAD_LIBRARY_SEARCH_USER_DIRS.
     * 
     * To revert to the standard search path used by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a>, call 
     * <b>SetDllDirectory</b> with NULL. This also restores safe DLL search mode  based on the <b>SafeDllSearchMode</b> registry value.
     * 
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0502 or later. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines SetDllDirectory as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PWSTR} lpPathName The directory to be added to the search path. If this parameter is an empty string (""), the call removes the current directory from the default DLL search order. If this parameter is NULL, the function restores the default search order.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-setdlldirectoryw
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
     * Retrieves the application-specific portion of the search path used to locate DLLs for the application. (ANSI)
     * @remarks
     * To compile an application that uses this function, define <b>_WIN32_WINNT</b> as 0x0502 
     *     or later. For more information, see 
     *     <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines GetDllDirectory as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} nBufferLength The size of the output buffer, in characters.
     * @param {PSTR} lpBuffer A pointer to a buffer that receives the application-specific portion of the search path.
     * @returns {Integer} If the function succeeds, the return value is the length of the string copied to 
     *        <i>lpBuffer</i>, in characters, not including the terminating null character. If the return 
     *        value is greater than <i>nBufferLength</i>, it specifies the size of the buffer required for 
     *        the path.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getdlldirectorya
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
     * Retrieves the application-specific portion of the search path used to locate DLLs for the application. (Unicode)
     * @remarks
     * To compile an application that uses this function, define <b>_WIN32_WINNT</b> as 0x0502 
     *     or later. For more information, see 
     *     <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines GetDllDirectory as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} nBufferLength The size of the output buffer, in characters.
     * @param {PWSTR} lpBuffer A pointer to a buffer that receives the application-specific portion of the search path.
     * @returns {Integer} If the function succeeds, the return value is the length of the string copied to 
     *        <i>lpBuffer</i>, in characters, not including the terminating null character. If the return 
     *        value is greater than <i>nBufferLength</i>, it specifies the size of the buffer required for 
     *        the path.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getdlldirectoryw
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
