#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\HLOCAL.ahk" { HLOCAL }
#Import ".\HRESULT.ahk" { HRESULT }
#Import ".\BSTR.ahk" { BSTR }
#Import ".\WIN32_ERROR.ahk" { WIN32_ERROR }
#Import ".\HANDLE.ahk" { HANDLE }
#Import ".\BOOL.ahk" { BOOL }
#Import ".\DUPLICATE_HANDLE_OPTIONS.ahk" { DUPLICATE_HANDLE_OPTIONS }
#Import ".\HGLOBAL.ahk" { HGLOBAL }
#Import ".\PSTR.ahk" { PSTR }
#Import ".\HANDLE_FLAGS.ahk" { HANDLE_FLAGS }
#Import ".\PWSTR.ahk" { PWSTR }
#Import ".\NTSTATUS.ahk" { NTSTATUS }
#Import ".\HMODULE.ahk" { HMODULE }

/**
 * @namespace Windows.Win32.Foundation
 */

;@region Functions
/**
 * Allocates a new string and copies the passed string into it.
 * @remarks
 * You can free strings created with <b>SysAllocString</b> using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
 * @param {PWSTR} psz The string to copy.
 * @returns {BSTR} If successful, returns the string. If <i>psz</i> is a zero-length string, returns a zero-length <b>BSTR</b>. If <i>psz</i> is NULL or insufficient memory exists, returns NULL.
 * @see https://learn.microsoft.com/windows/win32/api/oleauto/nf-oleauto-sysallocstring
 */
export SysAllocString(psz) {
    psz := psz is String ? StrPtr(psz) : psz

    result := DllCall("OLEAUT32.dll\SysAllocString", "ptr", psz, BSTR.Owned)
    return result
}

/**
 * Reallocates a previously allocated string to be the size of a second string and copies the second string into the reallocated memory.
 * @remarks
 * The address passed in psz cannot be part of the string passed in pbstr, or unexpected results may occur.
 * 
 * If pbstr is NULL, there will be an access violation and the program will crash. It is your responsibility to protect this function against NULL pointers.
 * @param {Pointer<BSTR>} pbstr The previously allocated string.
 * @param {PWSTR} psz The string to copy.
 * @returns {Integer} <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>TRUE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The string is reallocated successfully.
 * 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FALSE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Insufficient memory exists.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/oleauto/nf-oleauto-sysreallocstring
 */
export SysReAllocString(pbstr, psz) {
    psz := psz is String ? StrPtr(psz) : psz

    result := DllCall("OLEAUT32.dll\SysReAllocString", BSTR.Ptr, pbstr, "ptr", psz, Int32)
    return result
}

/**
 * Allocates a new string, copies the specified number of characters from the passed string, and appends a null-terminating character.
 * @remarks
 * The string can contain embedded null characters and does not need to end with a <b>NULL</b>. Free the returned string later with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>. If <i>strIn</i> is not <b>NULL</b>, then the memory allocated to <i>strIn</i> must be at least <i>ui</i> characters long.
 * 
 * <div class="alert"><b>Note</b>  This function does not convert a <b>char *</b> string into a Unicode <b>BSTR</b>.</div>
 * <div> </div>
 * @param {PWSTR} strIn The input string.
 * @param {Integer} ui The number of characters to copy. A null character is placed afterwards, allocating a total of <i>ui</i> plus one characters.
 * @returns {BSTR} A copy of the string, or <b>NULL</b> if there is insufficient memory to complete the operation.
 * @see https://learn.microsoft.com/windows/win32/api/oleauto/nf-oleauto-sysallocstringlen
 */
export SysAllocStringLen(strIn, ui) {
    strIn := strIn is String ? StrPtr(strIn) : strIn

    result := DllCall("OLEAUT32.dll\SysAllocStringLen", "ptr", strIn, "uint", ui, BSTR.Owned)
    return result
}

/**
 * Creates a new BSTR containing a specified number of characters from an old BSTR, and frees the old BSTR.
 * @remarks
 * Allocates a new string, copies <i>len</i> characters from the passed string into it, and then appends a null character. Frees the BSTR referenced currently by <i>pbstr</i>, and resets <i>pbstr</i> to point to the new BSTR. If <i>psz</i> is null, a string of length <i>len</i> is allocated but not initialized.
 * 
 * The <i>psz</i> string can contain embedded null characters and does not need to end with a null.
 * 
 * If this function is passed a NULL pointer, there will be an access violation and the program will crash. It is your responsibility to protect this function against NULL pointers.
 * @param {Pointer<BSTR>} pbstr The previously allocated string.
 * @param {PWSTR} psz The string from which to copy <i>len</i> characters, or NULL to keep the string uninitialized.
 * @param {Integer} len The number of characters to copy. A null character is placed afterward, allocating a total of <i>len</i> plus one characters.
 * @returns {Integer} <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>TRUE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The string is reallocated successfully.
 * 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FALSE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Insufficient memory exists.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/oleauto/nf-oleauto-sysreallocstringlen
 */
export SysReAllocStringLen(pbstr, psz, len) {
    psz := psz is String ? StrPtr(psz) : psz

    result := DllCall("OLEAUT32.dll\SysReAllocStringLen", BSTR.Ptr, pbstr, "ptr", psz, "uint", len, Int32)
    return result
}

/**
 * Increases the pinning reference count for the specified string by one.
 * @remarks
 * Strings with the <b>BSTR</b> data type have not traditionally had a reference count. All existing usage of these strings will continue to work with no changes. The <b>SysAddRefString</b> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysreleasestring">SysReleaseString</a> functions add the ability to use reference counting to pin the string into memory before calling from an untrusted script into an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> method that may not expect the script to free that memory before the method returns, so that the script cannot force the code for that method into accessing memory that has been freed. After such a method safely returns, the pinning references should be released by calling <b>SysReleaseString</b>.
 * @param {BSTR} bstrString The string for which the pinning reference count should increase. While that count remains greater than 0, the memory for the string is prevented from being freed by calls to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function.
 * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/oleauto/nf-oleauto-sysaddrefstring
 * @since windows5.1.2600
 */
export SysAddRefString(bstrString) {
    result := DllCall("OLEAUT32.dll\SysAddRefString", BSTR, bstrString, "HRESULT")
    return result
}

/**
 * Decreases the pinning reference count for the specified string by one. When that count reaches 0, the memory for that string is no longer prevented from being freed.
 * @remarks
 * A call to the <b>SysReleaseString</b> function should match every previous call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysaddrefstring">SysAddRefString</a> function.
 * @param {BSTR} bstrString The string for which the  pinning reference count should decrease.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/oleauto/nf-oleauto-sysreleasestring
 * @since windows5.1.2600
 */
export SysReleaseString(bstrString) {
    DllCall("OLEAUT32.dll\SysReleaseString", BSTR, bstrString)
}

/**
 * Deallocates a string allocated previously by SysAllocString, SysAllocStringByteLen, SysReAllocString, SysAllocStringLen, or SysReAllocStringLen.
 * @param {BSTR} bstrString The previously allocated string. If this parameter is <b>NULL</b>, the function simply returns.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/oleauto/nf-oleauto-sysfreestring
 */
export SysFreeString(bstrString) {
    DllCall("OLEAUT32.dll\SysFreeString", BSTR, bstrString)
}

/**
 * Returns the length of a BSTR.
 * @remarks
 * The returned value may be different from <b>strlen</b>(bstr) if the BSTR contains embedded Null characters. This function always returns the number of characters specified in the cch parameter of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstringlen">SysAllocStringLen</a> function used to allocate the BSTR.
 * @param {BSTR} pbstr A previously allocated string.
 * @returns {Integer} The number of characters in <i>bstr</i>, not including the terminating null character. If <i>bstr</i> is null the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/api/oleauto/nf-oleauto-sysstringlen
 */
export SysStringLen(pbstr) {
    result := DllCall("OLEAUT32.dll\SysStringLen", BSTR, pbstr, UInt32)
    return result
}

/**
 * Returns the length (in bytes) of a BSTR.
 * @remarks
 * The returned value may be different from <b>strlen</b>(bstr) if the BSTR contains embedded null characters. This function always returns the number of bytes specified in the len parameter of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstringbytelen">SysAllocStringByteLen</a> function used to allocate the BSTR.
 * @param {BSTR} _bstr A previously allocated string.
 * @returns {Integer} The number of bytes in <i>bstr</i>, not including the terminating null character. If <i>bstr</i> is null the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/api/oleauto/nf-oleauto-sysstringbytelen
 */
export SysStringByteLen(_bstr) {
    result := DllCall("OLEAUT32.dll\SysStringByteLen", BSTR, _bstr, UInt32)
    return result
}

/**
 * Takes an ANSI string as input, and returns a BSTR that contains an ANSI string. Does not perform any ANSI-to-Unicode translation.
 * @remarks
 * This function is provided to create BSTRs that contain binary data. You can use this type of BSTR only in situations where it will not be translated from ANSI to Unicode, or vice versa. 
 * 
 * For example, do not use these BSTRs between a 16-bit and a 32-bit application running on a 32-bit Windows system. The OLE 16-bit to 32-bit (and 32-bit to 16-bit) interoperability layer will translate the BSTR and corrupt the binary data. The preferred method of passing binary data is to use a SAFEARRAY of VT_UI1, which will not be translated by OLE.
 * 
 * If psz is Null, a string of the requested length is allocated, but not initialized. The string psz can contain embedded null characters, and does not need to end with a Null. Free the returned string later with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
 * @param {PSTR} psz The string to copy, or NULL to keep the string uninitialized.
 * @param {Integer} len The number of bytes to copy. A null character is placed afterwards, allocating a total of <i>len</i> plus the size of <b>OLECHAR</b> bytes.
 * @returns {BSTR} A copy of the string, or NULL if there is insufficient memory to complete the operation.
 * @see https://learn.microsoft.com/windows/win32/api/oleauto/nf-oleauto-sysallocstringbytelen
 */
export SysAllocStringByteLen(psz, len) {
    psz := psz is String ? StrPtr(psz) : psz

    result := DllCall("OLEAUT32.dll\SysAllocStringByteLen", "ptr", psz, "uint", len, BSTR.Owned)
    return result
}

/**
 * Closes an open object handle.
 * @remarks
 * The 
 * <b>CloseHandle</b> function closes handles to the following objects:
 * 
 * <ul>
 * <li>Access token</li>
 * <li>Communications device</li>
 * <li>Console input</li>
 * <li>Console screen buffer</li>
 * <li>Event</li>
 * <li>File</li>
 * <li>File mapping</li>
 * <li>I/O completion port</li>
 * <li>Job</li>
 * <li>Mailslot</li>
 * <li>Memory resource notification</li>
 * <li>Mutex</li>
 * <li>Named pipe</li>
 * <li>Pipe</li>
 * <li>Process</li>
 * <li>Semaphore</li>
 * <li>Thread</li>
 * <li>Transaction</li>
 * <li>Waitable timer</li>
 * </ul>
 * The documentation for the functions that create these objects indicates that <b>CloseHandle</b> should be used when you are finished with the object, and what happens to pending operations on the object after the handle is closed. In general, <b>CloseHandle</b> invalidates the specified object handle, decrements the object's handle count, and performs object retention checks. After the last handle to an object is closed, the object is removed from the system. For a summary of the creator functions for these objects, see <a href="https://docs.microsoft.com/windows/desktop/SysInfo/kernel-objects">Kernel Objects</a>.
 * 
 * Generally, an application should call <b>CloseHandle</b> once for each handle it opens. It is usually not necessary to call <b>CloseHandle</b> if a function that uses a handle fails with ERROR_INVALID_HANDLE, because this error usually indicates that the handle is already invalidated. However, some functions use ERROR_INVALID_HANDLE to indicate that the object itself is no longer valid. For example, a function that attempts to use a handle to a file on a network might fail with ERROR_INVALID_HANDLE if the network connection is severed, because the file object is no longer available. In this case, the application should close the handle.
 * 
 * If a handle is transacted, all handles bound to a transaction should be closed before the transaction is committed. If a transacted handle was opened by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createfiletransacteda">CreateFileTransacted</a> with the FILE_FLAG_DELETE_ON_CLOSE flag, the file is not deleted until the application closes the handle and calls <a href="https://docs.microsoft.com/windows/desktop/api/ktmw32/nf-ktmw32-committransaction">CommitTransaction</a>. For more information about transacted objects, see <a href="https://docs.microsoft.com/windows/desktop/Ktm/programming-model">Working With Transactions</a>.
 * 
 * Closing a thread handle does not terminate the associated thread or remove the thread object. Closing a process handle does not terminate the associated process or remove the process object. To remove a thread object, you must terminate the thread, then close all handles to the thread. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/terminating-a-thread">Terminating a Thread</a>. To remove a process object, you must terminate the process, then close all handles to the process. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/terminating-a-process">Terminating a Process</a>.
 * 
 * Closing a handle to a file mapping can succeed even when there are file views that are still open. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Memory/closing-a-file-mapping-object">Closing a File Mapping Object</a>.
 * 
 * Do not use the <b>CloseHandle</b>  function to close a socket. Instead, use  the <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-closesocket">closesocket</a> function, which releases all resources associated with the socket including the handle to the socket object. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinSock/graceful-shutdown-linger-options-and-socket-closure-2">Socket Closure</a>.
 * 
 * Do not use the <b>CloseHandle</b>  function to close a handle to an open registry key. Instead, use  the <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regclosekey">RegCloseKey</a> function. <b>CloseHandle</b> does not close the handle to the registry key, but does not return an error to indicate this failure.
 * @param {HANDLE} hObject A valid handle to an open object.
 * @returns {BOOL} If the function succeeds, the return value is nonzero.
 * 
 * If the function fails, the return value is zero. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * 
 * If the application is running under a debugger,  the function will throw an exception if it receives either a  handle value that is not valid  or a pseudo-handle value. This can happen if you close a handle twice, or if you  call 
 * <b>CloseHandle</b> on a handle returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-findfirstfilea">FindFirstFile</a> function instead of calling the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-findclose">FindClose</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/handleapi/nf-handleapi-closehandle
 * @since windows5.0
 */
export CloseHandle(hObject) {
    A_LastError := 0

    result := DllCall("KERNEL32.dll\CloseHandle", HANDLE, hObject, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Duplicates an object handle.
 * @remarks
 * The duplicate handle refers to the same object as the original handle. Therefore, any changes to the object are reflected through both handles. For example, if you duplicate a file handle, the current file position is always the same for both handles. For  file handles to have different file positions, use the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function to create file handles that share access to the same file.
 * 
 * <b>DuplicateHandle</b> can be called by either the source process or the target process (or a process that is both the source and target process). For example, a process can use 
 * <b>DuplicateHandle</b> to create a noninheritable duplicate of an inheritable handle, or a handle with different access than the original handle.
 * 
 * The source process uses the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getcurrentprocess">GetCurrentProcess</a> function to get a handle to itself. This handle is a pseudo handle, but <b>DuplicateHandle</b> converts it to a real process handle. To get the target process handle, it may be necessary to use some form of interprocess communication (for example, a named pipe or shared memory) to communicate the process identifier to the source process. The source process can use this identifier in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-openprocess">OpenProcess</a> function to obtain a handle to the target process.
 * 
 * If the process that calls 
 * <b>DuplicateHandle</b> is not also the target process, the source process must use interprocess communication to pass the value of the duplicate handle to the target process.
 * 
 * <b>DuplicateHandle</b> can be used to duplicate a handle between a 32-bit process and a 64-bit process. The resulting handle is appropriately sized to work in the target process. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinProg64/process-interoperability">Process Interoperability</a>.
 * 
 * <b>DuplicateHandle</b> can duplicate handles to the following types of objects.
 * 
 * <table>
 * <tr>
 * <th>Object</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>Access token</td>
 * <td>The handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-createrestrictedtoken">CreateRestrictedToken</a>, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-duplicatetoken">DuplicateToken</a>, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-duplicatetokenex">DuplicateTokenEx</a>, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-openprocesstoken">OpenProcessToken</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-openthreadtoken">OpenThreadToken</a> function.</td>
 * </tr>
 * <tr>
 * <td>Change notification</td>
 * <td>The handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-findfirstchangenotificationa">FindFirstChangeNotification</a> function.</td>
 * </tr>
 * <tr>
 * <td>Communications device</td>
 * <td>The handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function.</td>
 * </tr>
 * <tr>
 * <td>Console input</td>
 * <td>The handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function when CONIN$ is specified, or by the 
 * <a href="https://docs.microsoft.com/windows/console/getstdhandle">GetStdHandle</a> function when STD_INPUT_HANDLE is specified. Console handles can be duplicated for use only in the same process.</td>
 * </tr>
 * <tr>
 * <td>Console screen buffer</td>
 * <td>The handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function when CONOUT$ is specified, or by the <a href="https://docs.microsoft.com/windows/console/getstdhandle">GetStdHandle</a> function when STD_OUTPUT_HANDLE is specified. Console handles can be duplicated for use only in the same process.</td>
 * </tr>
 * <tr>
 * <td>Desktop</td>
 * <td>The handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getthreaddesktop">GetThreadDesktop</a> function.</td>
 * </tr>
 * <tr>
 * <td>Event</td>
 * <td>The handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventa">CreateEvent</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-openeventa">OpenEvent</a> function.</td>
 * </tr>
 * <tr>
 * <td>File</td>
 * <td>The handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function.</td>
 * </tr>
 * <tr>
 * <td>File mapping</td>
 * <td>The handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createfilemappinga">CreateFileMapping</a> function.</td>
 * </tr>
 * <tr>
 * <td>Job</td>
 * <td>The handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createjobobjecta">CreateJobObject</a> function.</td>
 * </tr>
 * <tr>
 * <td>Mailslot</td>
 * <td>The handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createmailslota">CreateMailslot</a> function.</td>
 * </tr>
 * <tr>
 * <td>Mutex</td>
 * <td>The handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createmutexa">CreateMutex</a> or 
 * [OpenMutex](../synchapi/nf-synchapi-openmutexw.md) function.</td>
 * </tr>
 * <tr>
 * <td>Pipe</td>
 * <td>A named pipe handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createnamedpipea">CreateNamedPipe</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function. An anonymous pipe handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/namedpipeapi/nf-namedpipeapi-createpipe">CreatePipe</a> function.</td>
 * </tr>
 * <tr>
 * <td>Process</td>
 * <td>The handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a>, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getcurrentprocess">GetCurrentProcess</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-openprocess">OpenProcess</a> function.</td>
 * </tr>
 * <tr>
 * <td>Registry key</td>
 * <td>The handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeya">RegCreateKey</a>, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeya">RegOpenKey</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function. Note that registry key handles returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regconnectregistrya">RegConnectRegistry</a> function cannot be used in a call to 
 * <b>DuplicateHandle</b>. </td>
 * </tr>
 * <tr>
 * <td>Semaphore</td>
 * <td>The handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createsemaphorea">CreateSemaphore</a> or 
 * <a href="https://docs.microsoft.com/windows/win32/api/synchapi/nf-synchapi-opensemaphorew">OpenSemaphore</a> function.</td>
 * </tr>
 * <tr>
 * <td>Thread</td>
 * <td>The handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a>, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createthread">CreateThread</a>, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createremotethread">CreateRemoteThread</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getcurrentthread">GetCurrentThread</a> function</td>
 * </tr>
 * <tr>
 * <td>Timer</td>
 * <td>The handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/win32/api/synchapi/nf-synchapi-createwaitabletimerw">CreateWaitableTimerW</a> or <a href="https://docs.microsoft.com/windows/win32/api/synchapi/nf-synchapi-openwaitabletimerw">OpenWaitableTimerW</a> function.</td>
 * </tr>
 * <tr>
 * <td>Transaction</td>
 * <td>The handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/ktmw32/nf-ktmw32-createtransaction">CreateTransaction</a> function.</td>
 * </tr>
 * <tr>
 * <td>Window station</td>
 * <td>The handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getprocesswindowstation">GetProcessWindowStation</a> function.</td>
 * </tr>
 * </table>
 *  
 * 
 * You should not use 
 * <b>DuplicateHandle</b> to duplicate handles to the following objects:
 * 
 * <ul>
 * <li>I/O completion ports. No error is returned, but the duplicate handle cannot be used.</li>
 * <li>Sockets. No error is returned, but the duplicate handle may not be recognized by Winsock at the target process. Also, using <b>DuplicateHandle</b> interferes with internal reference counting on the underlying object. To duplicate a socket handle, use the <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsaduplicatesocketa">WSADuplicateSocket</a> function.</li>
 * <li>Pseudo-handles other than the ones returned by the <a href="https://docs.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getcurrentprocess">GetCurrentProcess</a> or <a href="https://docs.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getcurrentthread">GetCurrentThread</a> functions.</li>
 * </ul>
 * The <i>dwDesiredAccess</i> parameter specifies the new handle's access rights. All objects support the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/standard-access-rights">standard access rights</a>. Objects may also support additional access rights depending on the object type. For more information, see the following topics:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/winstation/desktop-security-and-access-rights">Desktop Security and Access Rights</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/FileIO/file-security-and-access-rights">File Security and Access Rights</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/Memory/file-mapping-security-and-access-rights">File-Mapping Security and Access Rights</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/job-object-security-and-access-rights">Job Object Security and Access Rights</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-object-security-and-access-rights">Synchronization Object Security and Access Rights</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/thread-security-and-access-rights">Thread Security and Access Rights</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/winstation/window-station-security-and-access-rights">Window-Station Security and Access Rights</a>
 * </li>
 * </ul>
 * In some cases, the new handle can have more access rights than the original handle. However, in other cases, 
 * <b>DuplicateHandle</b> cannot create a handle with more access rights than the original. For example, a file handle created with the GENERIC_READ access right cannot be duplicated so that it has both the GENERIC_READ and GENERIC_WRITE access right.
 * 
 * Normally the target process closes a duplicated handle when that process is finished using the handle. To close a duplicated handle from the source process,  call <b>DuplicateHandle</b> with the following parameters: 
 * 
 * <ul>
 * <li>Set <i>hSourceProcessHandle</i> to the target process from the <b>DuplicateHandle</b> call that created the handle.</li>
 * <li>Set <i>hSourceHandle</i> to the duplicated handle to close.</li>
 * <li>Set <i>hTargetProcessHandle</i> to <b>NULL</b>.</li>
 * <li>Set <i>dwOptions</i> to DUPLICATE_CLOSE_SOURCE.</li>
 * </ul>
 * @param {HANDLE} hSourceProcessHandle A handle to the process with the handle to be duplicated. 
 * 
 * 
 * 
 * 
 * The handle must have the PROCESS_DUP_HANDLE access right. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
 * @param {HANDLE} hSourceHandle The handle to be duplicated. This is an open object handle that is valid in the context of the source process. For a list of objects whose handles can be duplicated, see the following Remarks section.
 * @param {HANDLE} hTargetProcessHandle A handle to the process that is to receive the duplicated handle. The handle must have the PROCESS_DUP_HANDLE access right.
 * 
 * This parameter is optional and can be specified as NULL if the **DUPLICATE_CLOSE_SOURCE** flag is set in _Options_.
 * @param {Pointer<HANDLE>} lpTargetHandle A pointer to a variable that receives the duplicate handle. This handle value is valid in the context of the target process. 
 * 
 * If <i>hSourceHandle</i> is a pseudo handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getcurrentprocess">GetCurrentProcess</a> or <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getcurrentthread">GetCurrentThread</a>, <b>DuplicateHandle</b> converts it to a real handle to a process or thread, respectively.
 * 
 * If <i>lpTargetHandle</i> is <b>NULL</b>, the function duplicates the handle, but does not return the duplicate handle value to the caller. This behavior exists only for backward compatibility with previous versions of this function. You should not use this feature, as you will lose system resources until the target process terminates.
 * 
 * This parameter is ignored if _hTargetProcessHandle_ is **NULL**.
 * @param {Integer} dwDesiredAccess The access requested for the new handle. For the flags that can be specified for each object type, see the following Remarks section. 
 * 
 * This parameter is ignored if the <i>dwOptions</i> parameter specifies the DUPLICATE_SAME_ACCESS flag. Otherwise, the flags that can be specified depend on the type of object whose handle is to be duplicated.
 * 
 * This parameter is ignored if _hTargetProcessHandle_ is **NULL**.
 * @param {BOOL} bInheritHandle A variable that indicates whether the handle is inheritable. If <b>TRUE</b>, the duplicate handle can be inherited by new processes created by the target process. If <b>FALSE</b>, the new handle cannot be inherited.
 * 
 * This parameter is ignored if _hTargetProcessHandle_ is **NULL**.
 * @param {DUPLICATE_HANDLE_OPTIONS} dwOptions 
 * @returns {BOOL} If the function succeeds, the return value is nonzero.
 * 
 * If the function fails, the return value is zero. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/handleapi/nf-handleapi-duplicatehandle
 * @since windows5.0
 */
export DuplicateHandle(hSourceProcessHandle, hSourceHandle, hTargetProcessHandle, lpTargetHandle, dwDesiredAccess, bInheritHandle, dwOptions) {
    A_LastError := 0

    result := DllCall("KERNEL32.dll\DuplicateHandle", HANDLE, hSourceProcessHandle, HANDLE, hSourceHandle, HANDLE, hTargetProcessHandle, HANDLE.Ptr, lpTargetHandle, "uint", dwDesiredAccess, BOOL, bInheritHandle, DUPLICATE_HANDLE_OPTIONS, dwOptions, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Compares two object handles to determine if they refer to the same underlying kernel object.
 * @remarks
 * The <b>CompareObjectHandles</b> function is useful to determine if two kernel handles refer to the same kernel object without imposing a requirement that specific access rights be granted to either handle in order to perform the comparison.  For example, if a process desires to determine whether a process handle is a handle to the current process, a call to <b>CompareObjectHandles</b> (GetCurrentProcess (), hProcess) can be used to determine if hProcess refers to the current process.  Notably, this does not require the use of object-specific access rights, whereas in this example, calling <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getprocessid">GetProcessId</a> to check the process IDs of two process handles imposes a requirement that the handles grant PROCESS_QUERY_LIMITED_INFORMATION access. However it is legal for a process handle to not have that access right granted depending on how the handle is intended to be used.
 * @param {HANDLE} hFirstObjectHandle The first object handle to compare.
 * @param {HANDLE} hSecondObjectHandle The second object handle to compare.
 * @returns {BOOL} A Boolean value that indicates if the two handles refer to the same underlying kernel object. TRUE if the same, otherwise FALSE.
 * @see https://learn.microsoft.com/windows/win32/api/handleapi/nf-handleapi-compareobjecthandles
 * @since windows10.0.10240
 */
export CompareObjectHandles(hFirstObjectHandle, hSecondObjectHandle) {
    result := DllCall("api-ms-win-core-handle-l1-1-0.dll\CompareObjectHandles", HANDLE, hFirstObjectHandle, HANDLE, hSecondObjectHandle, BOOL)
    return result
}

/**
 * Retrieves certain properties of an object handle.
 * @param {HANDLE} hObject A handle to an object whose information is to be retrieved. 
 * 
 * 
 * 
 * 
 * You can specify a handle to one of the following types of objects: access token, console input buffer, console screen buffer, event, file, file mapping, job, mailslot, mutex, pipe, printer, process, registry key, semaphore, serial communication device, socket, thread, or waitable timer.
 * @param {Pointer<Integer>} lpdwFlags A pointer to a variable that receives a set of bit flags that specify properties of the object handle or 0. The following values are defined. 
 * 
 * 
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="HANDLE_FLAG_INHERIT"></a><a id="handle_flag_inherit"></a><dl>
 * <dt><b>HANDLE_FLAG_INHERIT</b></dt>
 * <dt>0x00000001</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * If this flag is set, a child process created with the <i>bInheritHandles</i> parameter of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a> set to <b>TRUE</b> will inherit the object handle.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="HANDLE_FLAG_PROTECT_FROM_CLOSE"></a><a id="handle_flag_protect_from_close"></a><dl>
 * <dt><b>HANDLE_FLAG_PROTECT_FROM_CLOSE</b></dt>
 * <dt>0x00000002</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * If this flag is set, calling the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function will not close the object handle.
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {BOOL} If the function succeeds, the return value is nonzero.
 * 
 * If the function fails, the return value is zero. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/handleapi/nf-handleapi-gethandleinformation
 * @since windows5.0
 */
export GetHandleInformation(hObject, lpdwFlags) {
    lpdwFlagsMarshal := lpdwFlags is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("KERNEL32.dll\GetHandleInformation", HANDLE, hObject, lpdwFlagsMarshal, lpdwFlags, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Sets certain properties of an object handle.
 * @remarks
 * To set or clear the associated bit flag in <i>dwFlags</i>, you must set a change mask bit flag in <i>dwMask</i>.
 * @param {HANDLE} hObject A handle to an object whose information is to be set. 
 * 
 * 
 * 
 * 
 * You can specify a handle to one of the following types of objects: access token, console input buffer, console screen buffer, event, file, file mapping, job, mailslot, mutex, pipe, printer, process, registry key, semaphore, serial communication device, socket, thread, or waitable timer.
 * @param {Integer} dwMask A mask that specifies the bit flags to be changed. Use the same constants shown in the description of <i>dwFlags</i>.
 * @param {HANDLE_FLAGS} dwFlags 
 * @returns {BOOL} If the function succeeds, the return value is nonzero.
 * 
 * If the function fails, the return value is zero. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/handleapi/nf-handleapi-sethandleinformation
 * @since windows5.0
 */
export SetHandleInformation(hObject, dwMask, dwFlags) {
    A_LastError := 0

    result := DllCall("KERNEL32.dll\SetHandleInformation", HANDLE, hObject, "uint", dwMask, HANDLE_FLAGS, dwFlags, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Frees the loaded dynamic-link library (DLL) module and, if necessary, decrements its reference count.
 * @remarks
 * The system maintains a per-process reference count for each loaded module. A  module that was loaded at process initialization due to load-time dynamic linking has a reference count of one. The reference count for a module is incremented each time the  module is loaded by a call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a>. The reference count is also incremented by a call to <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a> unless the  module  is being loaded for the first time and is being loaded as   a data or image file. 
 * 
 * The reference count is decremented each time 
 * the <b>FreeLibrary</b> or <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-freelibraryandexitthread">FreeLibraryAndExitThread</a> function is called for the module. When a  module's reference count reaches zero or the process terminates, the system unloads the module from the address space of the  process. Before unloading a library module, the system enables the module to detach from the process by calling the module's 
 * <a href="https://docs.microsoft.com/windows/desktop/Dlls/dllmain">DllMain</a> function, if it has one, with the DLL_PROCESS_DETACH value. Doing so gives the library module an opportunity to clean up resources allocated on behalf of the current process. After the entry-point function returns, the library module is removed from the address space of the current process.
 * 
 * It is not safe to call 
 * <b>FreeLibrary</b> from 
 * <a href="https://docs.microsoft.com/windows/desktop/Dlls/dllmain">DllMain</a>. For more information, see the Remarks section in 
 * <a href="https://docs.microsoft.com/windows/desktop/Dlls/dllmain">DllMain</a>.
 * 
 * Calling 
 * <b>FreeLibrary</b> does not affect other processes that are using the same module.
 * 
 * Use caution when calling <b>FreeLibrary</b> with a handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulehandlea">GetModuleHandle</a>. The <b>GetModuleHandle</b> function does not increment a module's reference count, so passing this handle to <b>FreeLibrary</b> can cause a module to be unloaded prematurely.
 * 
 * A thread that must unload the DLL in which it is executing and then terminate itself should call <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-freelibraryandexitthread">FreeLibraryAndExitThread</a> instead of calling <b>FreeLibrary</b> and <b>ExitThread</b> separately. Otherwise, a race condition can occur. For details, see the Remarks section of <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-freelibraryandexitthread">FreeLibraryAndExitThread</a>.
 * @param {HMODULE} hLibModule A handle to the loaded library module. The 
 * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a>, <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a>,  
 * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulehandlea">GetModuleHandle</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulehandleexa">GetModuleHandleEx</a> function returns this handle.
 * @returns {BOOL} If the function succeeds, the return value is nonzero.
 * 
 * If the function fails, the return value is zero. To get extended error information, call 
 * the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-freelibrary
 * @since windows5.1.2600
 */
export FreeLibrary(hLibModule) {
    A_LastError := 0

    result := DllCall("KERNEL32.dll\FreeLibrary", HMODULE, hLibModule, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves the calling thread's last-error code value.
 * @remarks
 * Functions executed by the calling thread set this value by calling the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-setlasterror">SetLastError</a> function. You should call the 
 * <b>GetLastError</b> function immediately when a function's return value indicates that such a call will return useful data. That is because some functions call 
 * <b>SetLastError</b> with a zero when they succeed, wiping out the error code set by the most recently failed function.
 * 
 * To obtain an error string for system error codes, use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function. For a complete list of error codes provided by the operating system, see 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
 * 
 * The error codes returned by a function are not part of the Windows API specification and can vary by operating system or device driver. For this reason, we cannot provide the complete list of error codes that can be returned by each function. There are also many functions whose documentation does not include even a partial list of error codes that can be returned.
 * 
 * Error codes are 32-bit values (bit 31 is the most significant bit). Bit 29 is reserved for application-defined error codes; no system error code has this bit set. If you are defining an error code for your application, set this bit to one. That indicates that the error code has been defined by an application, and ensures that your error code does not conflict with any error codes defined by the system.
 * 
 * To convert a system error into an <b>HRESULT</b> value, use the 
 * <a href="https://docs.microsoft.com/windows/win32/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro.
 * @returns {WIN32_ERROR} The return value is the calling thread's last-error code.
 * 
 * The Return Value section of the documentation for each function that sets the last-error code notes the conditions under which the function sets the last-error code. Most functions that set the thread's last-error code set it when they fail. However, some functions also set the last-error code when they succeed. If the function is not documented to set the last-error code, the value returned by this function is simply the most recent last-error code to have been set; some functions set the last-error code to 0 on success and others do not.
 * @see https://learn.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror
 * @since windows5.1.2600
 */
export GetLastError() {
    result := DllCall("KERNEL32.dll\GetLastError", WIN32_ERROR)
    return result
}

/**
 * Sets the last-error code for the calling thread.
 * @remarks
 * The last-error code is kept in thread local storage so that multiple threads do not overwrite each other's values.
 * 
 * Most functions call 
 * <b>SetLastError</b> or <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setlasterrorex">SetLastErrorEx</a> only when they fail. However, some system functions call 
 * <b>SetLastError</b> or <b>SetLastErrorEx</b> under conditions of success; those cases are noted in each function's documentation.
 * 
 * Applications can optionally retrieve the value set by this function by using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function immediately after a function fails.
 * 
 * Error codes are 32-bit values (bit 31 is the most significant bit). Bit 29 is reserved for application-defined error codes; no system error code has this bit set. If you are defining an error code for your application, set this bit to indicate that the error code has been defined by your application and to ensure that your error code does not conflict with any system-defined error codes.
 * @param {WIN32_ERROR} dwErrCode The last-error code for the thread.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-setlasterror
 * @since windows5.1.2600
 */
export SetLastError(dwErrCode) {
    A_LastError := 0

    DllCall("KERNEL32.dll\SetLastError", WIN32_ERROR, dwErrCode)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

}

/**
 * Sets the last-error code.
 * @remarks
 * The last-error code is kept in thread local storage so that multiple threads do not overwrite each other's values.
 * 
 * Most functions call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-setlasterror">SetLastError</a> or <b>SetLastErrorEx</b> only when they fail. However, some system functions call 
 * <b>SetLastError</b> or <b>SetLastErrorEx</b> under conditions of success; those cases are noted in each function's documentation.
 * 
 * Applications can optionally retrieve the value set by this function by using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function immediately after a function fails.
 * 
 * Error codes are 32-bit values (bit 31 is the most significant bit). Bit 29 is reserved for application-defined error codes; no system error code has this bit set. If you are defining an error code for your application, set this bit to indicate that the error code has been defined by the application and to ensure that your error code does not conflict with any system-defined error codes.
 * @param {WIN32_ERROR} dwErrCode The last-error code for the thread.
 * @param {Integer} dwType This parameter is ignored.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-setlasterrorex
 * @since windows5.1.2600
 */
export SetLastErrorEx(dwErrCode, dwType) {
    A_LastError := 0

    DllCall("USER32.dll\SetLastErrorEx", WIN32_ERROR, dwErrCode, "uint", dwType)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

}

/**
 * Frees the specified global memory object and invalidates its handle.
 * @remarks
 * If the process examines or modifies the memory after it has been freed, heap corruption may occur or an access violation exception (EXCEPTION_ACCESS_VIOLATION) may be generated.
 * 
 * The 
 * <b>GlobalFree</b> function will free a locked memory object. A locked memory object has a lock count greater than zero. The 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globallock">GlobalLock</a> function locks a global memory object and increments the lock count by one. The 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalunlock">GlobalUnlock</a> function unlocks it and decrements the lock count by one. To get the lock count of a global memory object, use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalflags">GlobalFlags</a> function.
 * 
 * If an application is running under a debug version of the system, 
 * <b>GlobalFree</b> will issue a message that tells you that a locked object is being freed. If you are debugging the application, 
 * <b>GlobalFree</b> will enter a breakpoint just before freeing a locked object. This allows you to verify the intended behavior, then continue execution.
 * @param {HGLOBAL} hMem A handle to the global memory object. This handle is returned by either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalrealloc">GlobalReAlloc</a> function. It is not safe to free memory allocated with <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a>.
 * @returns {HGLOBAL} If the function succeeds, the return value is <b>NULL</b>.
 * 
 * If the function fails, the return value is equal to a handle to the global memory object. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-globalfree
 * @since windows5.1.2600
 */
export GlobalFree(hMem) {
    A_LastError := 0

    result := DllCall("KERNEL32.dll\GlobalFree", HGLOBAL, hMem, HGLOBAL.Owned)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Frees the specified local memory object and invalidates its handle.
 * @remarks
 * If the process tries to examine or modify the memory after it has been freed, heap corruption may occur or an access violation exception (EXCEPTION_ACCESS_VIOLATION) may be generated.
 * 
 * If the <i>hMem</i> parameter is <b>NULL</b>, 
 * <b>LocalFree</b> ignores the parameter and returns <b>NULL</b>.
 * 
 * The 
 * <b>LocalFree</b> function will free a locked memory object. A locked memory object has a lock count greater than zero. The 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-locallock">LocalLock</a> function locks a local memory object and increments the lock count by one. The 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localunlock">LocalUnlock</a> function unlocks it and decrements the lock count by one. To get the lock count of a local memory object, use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localflags">LocalFlags</a> function.
 * 
 * If an application is running under a debug version of the system, 
 * <b>LocalFree</b> will issue a message that tells you that a locked object is being freed. If you are debugging the application, 
 * <b>LocalFree</b> will enter a breakpoint just before freeing a locked object. This allows you to verify the intended behavior, then continue execution.
 * @param {HLOCAL} hMem A handle to the local memory object. This handle is returned by either the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localrealloc">LocalReAlloc</a> function. It is not safe to free memory allocated with <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a>.
 * @returns {HLOCAL} If the function succeeds, the return value is <b>NULL</b>.
 * 
 * If the function fails, the return value is equal to a handle to the local memory object. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-localfree
 * @since windows5.1.2600
 */
export LocalFree(hMem) {
    A_LastError := 0

    result := DllCall("KERNEL32.dll\LocalFree", HLOCAL, hMem, HLOCAL.Owned)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Converts the specified NTSTATUS code to its equivalent system error code.
 * @remarks
 * There is no function that provides the inverse functionality of <b>RtlNtStatusToDosError</b>, which would convert a system error code to its corresponding NTSTATUS code.
 * 
 * ERROR_MR_MID_NOT_FOUND is returned when the specified NTSTATUS code does not have a corresponding system error code.
 * 
 * This function has no associated import library. You must use the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> and <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> functions to dynamically link to Ntdll.dll.
 * @param {NTSTATUS} _Status The NTSTATUS code to be converted.
 * @returns {Integer} The function returns the corresponding <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winternl/nf-winternl-rtlntstatustodoserror
 * @since windows5.1.2600
 */
export RtlNtStatusToDosError(_Status) {
    result := DllCall("ntdll.dll\RtlNtStatusToDosError", NTSTATUS, _Status, UInt32)
    return result
}

;@endregion Functions
