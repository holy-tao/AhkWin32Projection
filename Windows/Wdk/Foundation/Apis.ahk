#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\OBJECT_INFORMATION_CLASS.ahk" { OBJECT_INFORMATION_CLASS }

/**
 * @namespace Windows.Wdk.Foundation
 */

;@region Functions
/**
 * Retrieves various kinds of object information.
 * @remarks
 * This function has no associated header file or import library. You must use the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> or <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> function to dynamically link to Ntdll.dll.
 * 
 * If the <i>ObjectInformationClass</i> parameter is <b>ObjectBasicInformation</b>, the information is contained in the following structure.
 * 
 * 
 * ``` syntax
 * typedef struct _PUBLIC_OBJECT_BASIC_INFORMATION {
 *     ULONG Attributes;
 *     ACCESS_MASK GrantedAccess;
 *     ULONG HandleCount;
 *     ULONG PointerCount;
 *     ULONG Reserved[10];    // reserved for internal use
 *  } PUBLIC_OBJECT_BASIC_INFORMATION, *PPUBLIC_OBJECT_BASIC_INFORMATION;
 * 
 * ```
 * 
 * Available members for this structure include object attributes for the handle (<b>Attributes</b>), the access granted for the handle (<b>GrantedAccess</b>), the number of open handles to the object (<b>HandleCount</b>), and the number of kernel references to the object (<b>PointerCount</b>).
 * 
 * If the <i>ObjectInformationClass</i> parameter is <b>ObjectTypeInformation</b>, the information is contained in the following structure.
 * 
 * 
 * ``` syntax
 * typedef struct __PUBLIC_OBJECT_TYPE_INFORMATION {
 *     UNICODE_STRING TypeName;
 *     ULONG Reserved [22];    // reserved for internal use
 * } PUBLIC_OBJECT_TYPE_INFORMATION, *PPUBLIC_OBJECT_TYPE_INFORMATION;
 * 
 * ```
 * 
 * The only available member of this structure is the object-type name string (<b>TypeName</b>).
 * @param {HANDLE} _Handle The handle of the object for which information is being queried.
 * @param {OBJECT_INFORMATION_CLASS} ObjectInformationClass 
 * @param {Integer} ObjectInformation An optional pointer to a buffer where the requested information is to be returned. The size and structure of this information varies depending on the value of the <i>ObjectInformationClass</i> parameter.
 * @param {Integer} ObjectInformationLength The size of the buffer pointed to by the <i>ObjectInformation</i> parameter, in bytes.
 * @param {Pointer<Integer>} ReturnLength An optional pointer to a location where the function writes the actual size of the information requested. If that size is less than or equal to the <i>ObjectInformationLength</i> parameter, the function copies the information into the <i>ObjectInformation</i> buffer; otherwise, it returns an NTSTATUS error code and returns in <i>ReturnLength</i> the size of the buffer required to receive the requested information.
 * @returns {NTSTATUS} Returns an NTSTATUS or error code.
 * 
 * The forms and significance of NTSTATUS error codes are listed in the Ntstatus.h header file available in the WDK, and are described in the WDK documentation.
 * @see https://learn.microsoft.com/windows/win32/api/winternl/nf-winternl-ntqueryobject
 */
export NtQueryObject(_Handle, ObjectInformationClass, ObjectInformation, ObjectInformationLength, ReturnLength) {
    ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\NtQueryObject", HANDLE, _Handle, OBJECT_INFORMATION_CLASS, ObjectInformationClass, "ptr", ObjectInformation, "uint", ObjectInformationLength, ReturnLengthMarshal, ReturnLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Deprecated. Closes the specified handle. NtClose is superseded by CloseHandle.
 * @remarks
 * The <b>NtClose</b> function closes handles to the following objects. 
 * 
 * 
 * 
 * <ul>
 * <li>Access token</li>
 * <li>Communications device </li>
 * <li>Console input </li>
 * <li>Console screen buffer </li>
 * <li>Event </li>
 * <li>File </li>
 * <li>File mapping </li>
 * <li>Job </li>
 * <li>Mailslot </li>
 * <li>Mutex </li>
 * <li>Named pipe </li>
 * <li>Process </li>
 * <li>Semaphore </li>
 * <li>Socket </li>
 * <li>Thread </li>
 * </ul>
 * Because there is no import library for this function, you must use <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>.
 * @param {HANDLE} _Handle The handle being closed.
 * @returns {NTSTATUS} The various NTSTATUS values are defined in NTSTATUS.H, which is distributed with the Windows DDK.
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
 * The handle was closed.  
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winternl/nf-winternl-ntclose
 */
export NtClose(_Handle) {
    result := DllCall("ntdll.dll\NtClose", HANDLE, _Handle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

;@endregion Functions
