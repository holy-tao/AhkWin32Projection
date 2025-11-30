#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Wdk.Foundation
 * @version v4.0.30319
 */
class Foundation {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static NTSTRSAFE_UNICODE_STRING_MAX_CCH => 32767

    /**
     * @type {Integer (UInt32)}
     */
    static NTSTRSAFE_USE_SECURE_CRT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NTSTRSAFE_MAX_CCH => 2147483647

    /**
     * @type {Integer (UInt32)}
     */
    static NTSTRSAFE_MAX_LENGTH => 2147483646

    /**
     * @type {Integer (UInt32)}
     */
    static STRSAFE_IGNORE_NULLS => 256

    /**
     * @type {Integer (UInt32)}
     */
    static STRSAFE_FILL_BEHIND_NULL => 512

    /**
     * @type {Integer (UInt32)}
     */
    static STRSAFE_FILL_ON_FAILURE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static STRSAFE_NULL_ON_FAILURE => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static STRSAFE_NO_TRUNCATION => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static STRSAFE_FILL_BEHIND => 512

    /**
     * @type {Integer (UInt32)}
     */
    static STRSAFE_ZERO_LENGTH_ON_FAILURE => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static __WARNING_CYCLOMATIC_COMPLEXITY => 28734

    /**
     * @type {Integer (UInt32)}
     */
    static __WARNING_USING_UNINIT_VAR => 6001

    /**
     * @type {Integer (UInt32)}
     */
    static __WARNING_RETURN_UNINIT_VAR => 6101

    /**
     * @type {Integer (UInt32)}
     */
    static __WARNING_DEREF_NULL_PTR => 6011

    /**
     * @type {Integer (UInt32)}
     */
    static __WARNING_MISSING_ZERO_TERMINATION2 => 6054

    /**
     * @type {Integer (UInt32)}
     */
    static __WARNING_INVALID_PARAM_VALUE_1 => 6387

    /**
     * @type {Integer (UInt32)}
     */
    static __WARNING_INCORRECT_ANNOTATION => 26007

    /**
     * @type {Integer (UInt32)}
     */
    static __WARNING_POTENTIAL_BUFFER_OVERFLOW_HIGH_PRIORITY => 26015

    /**
     * @type {Integer (UInt32)}
     */
    static __WARNING_PRECONDITION_NULLTERMINATION_VIOLATION => 26035

    /**
     * @type {Integer (UInt32)}
     */
    static __WARNING_POSTCONDITION_NULLTERMINATION_VIOLATION => 26036

    /**
     * @type {Integer (UInt32)}
     */
    static __WARNING_HIGH_PRIORITY_OVERFLOW_POSTCONDITION => 26045

    /**
     * @type {Integer (UInt32)}
     */
    static __WARNING_RANGE_POSTCONDITION_VIOLATION => 26061

    /**
     * @type {Integer (UInt32)}
     */
    static __WARNING_POTENTIAL_RANGE_POSTCONDITION_VIOLATION => 26071

    /**
     * @type {Integer (UInt32)}
     */
    static __WARNING_INVALID_PARAM_VALUE_3 => 28183

    /**
     * @type {Integer (UInt32)}
     */
    static __WARNING_RETURNING_BAD_RESULT => 28196

    /**
     * @type {Integer (UInt32)}
     */
    static __WARNING_BANNED_API_USAGE => 28719

    /**
     * @type {Integer (UInt32)}
     */
    static __WARNING_POST_EXPECTED => 28210
;@endregion Constants

;@region Methods
    /**
     * Retrieves various kinds of object information.
     * @param {HANDLE} Handle The handle of the object for which information is being queried.
     * @param {Integer} ObjectInformationClass 
     * @param {Pointer} ObjectInformation An optional pointer to a buffer where the requested information is to be returned. The size and structure of this information varies depending on the value of the <i>ObjectInformationClass</i> parameter.
     * @param {Integer} ObjectInformationLength The size of the buffer pointed to by the <i>ObjectInformation</i> parameter, in bytes.
     * @param {Pointer<Integer>} ReturnLength An optional pointer to a location where the function writes the actual size of the information requested. If that size is less than or equal to the <i>ObjectInformationLength</i> parameter, the function copies the information into the <i>ObjectInformation</i> buffer; otherwise, it returns an NTSTATUS error code and returns in <i>ReturnLength</i> the size of the buffer required to receive the requested information.
     * @returns {NTSTATUS} Returns an NTSTATUS or error code.
     * 
     * The forms and significance of NTSTATUS error codes are listed in the Ntstatus.h header file available in the WDK, and are described in the WDK documentation.
     * @see https://docs.microsoft.com/windows/win32/api//winternl/nf-winternl-ntqueryobject
     */
    static NtQueryObject(Handle, ObjectInformationClass, ObjectInformation, ObjectInformationLength, ReturnLength) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle

        ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\NtQueryObject", "ptr", Handle, "int", ObjectInformationClass, "ptr", ObjectInformation, "uint", ObjectInformationLength, ReturnLengthMarshal, ReturnLength, "int")
        return result
    }

    /**
     * Deprecated. Closes the specified handle. NtClose is superseded by CloseHandle.
     * @param {HANDLE} Handle The handle being closed.
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
     * @see https://docs.microsoft.com/windows/win32/api//winternl/nf-winternl-ntclose
     */
    static NtClose(Handle) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle

        result := DllCall("ntdll.dll\NtClose", "ptr", Handle, "int")
        return result
    }

;@endregion Methods
}
