#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.System.Mailslots
 * @version v4.0.30319
 */
class Mailslots {

;@region Constants
;@endregion Constants

;@region Methods
    /**
     * Creates a mailslot with the specified name and returns a handle that a mailslot server can use to perform operations on the mailslot.
     * @param {PSTR} lpName The name of the mailslot. This name must have the following form:
     * 
     * \\\\.\mailslot\\[<i>path</i>]<i>name</i>
     * 
     * The name field must be unique. The name may include multiple levels of pseudo directories separated by backslashes. For example, both \\\\.\mailslot\example_mailslot_name and \\\\.\mailslot\abc\def\ghi are valid names.
     * @param {Integer} nMaxMessageSize The maximum size of a single message that can be written to the mailslot, in bytes. To specify that the message can be of any size, set this value to zero.
     * @param {Integer} lReadTimeout The time a read operation can wait for a message to be written to the mailslot before a time-out occurs, in milliseconds. The following values have special meanings.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns immediately if no message is present. (The system does not treat an immediate return as an error.)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MAILSLOT_WAIT_FOREVER"></a><a id="mailslot_wait_forever"></a><dl>
     * <dt><b>MAILSLOT_WAIT_FOREVER</b></dt>
     * <dt>((DWORD)-1)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Waits forever for a message.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * This time-out value applies to all subsequent read operations and all inherited mailslot handles.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpSecurityAttributes A pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure. The <b>bInheritHandle</b> member of the structure determines whether the returned handle can be inherited by child processes. If <i>lpSecurityAttributes</i> is <b>NULL</b>, the handle cannot be inherited.
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the mailslot, for use in server mailslot operations.  The handle returned by this function is asynchronous, or overlapped.
     * 
     * If the function fails, the return value is <b>INVALID_HANDLE_VALUE</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-createmailslota
     * @since windows5.0
     */
    static CreateMailslotA(lpName, nMaxMessageSize, lReadTimeout, lpSecurityAttributes) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateMailslotA", "ptr", lpName, "uint", nMaxMessageSize, "uint", lReadTimeout, "ptr", lpSecurityAttributes, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Creates a mailslot with the specified name and returns a handle that a mailslot server can use to perform operations on the mailslot.
     * @param {PWSTR} lpName The name of the mailslot. This name must have the following form:
     * 
     * \\\\.\mailslot\\[<i>path</i>]<i>name</i>
     * 
     * The name field must be unique. The name may include multiple levels of pseudo directories separated by backslashes. For example, both \\\\.\mailslot\example_mailslot_name and \\\\.\mailslot\abc\def\ghi are valid names.
     * @param {Integer} nMaxMessageSize The maximum size of a single message that can be written to the mailslot, in bytes. To specify that the message can be of any size, set this value to zero.
     * @param {Integer} lReadTimeout The time a read operation can wait for a message to be written to the mailslot before a time-out occurs, in milliseconds. The following values have special meanings.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns immediately if no message is present. (The system does not treat an immediate return as an error.)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MAILSLOT_WAIT_FOREVER"></a><a id="mailslot_wait_forever"></a><dl>
     * <dt><b>MAILSLOT_WAIT_FOREVER</b></dt>
     * <dt>((DWORD)-1)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Waits forever for a message.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * This time-out value applies to all subsequent read operations and all inherited mailslot handles.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpSecurityAttributes A pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure. The <b>bInheritHandle</b> member of the structure determines whether the returned handle can be inherited by child processes. If <i>lpSecurityAttributes</i> is <b>NULL</b>, the handle cannot be inherited.
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the mailslot, for use in server mailslot operations.  The handle returned by this function is asynchronous, or overlapped.
     * 
     * If the function fails, the return value is <b>INVALID_HANDLE_VALUE</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-createmailslotw
     * @since windows5.0
     */
    static CreateMailslotW(lpName, nMaxMessageSize, lReadTimeout, lpSecurityAttributes) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateMailslotW", "ptr", lpName, "uint", nMaxMessageSize, "uint", lReadTimeout, "ptr", lpSecurityAttributes, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Retrieves information about the specified mailslot.
     * @param {HANDLE} hMailslot A handle to a mailslot. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createmailslota">CreateMailslot</a> function must create this handle.
     * @param {Pointer<Integer>} lpMaxMessageSize The maximum message size, in bytes, allowed for this mailslot. This value can be greater than or equal to the value specified in the <i>cbMaxMsg</i> parameter of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createmailslota">CreateMailslot</a> function that created the mailslot. This parameter can be <b>NULL</b>.
     * @param {Pointer<Integer>} lpNextSize The size of the next message, in bytes. The following value has special meaning.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MAILSLOT_NO_MESSAGE"></a><a id="mailslot_no_message"></a><dl>
     * <dt><b>MAILSLOT_NO_MESSAGE</b></dt>
     * <dt>((DWORD)-1)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is no next message.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * This parameter can be <b>NULL</b>.
     * @param {Pointer<Integer>} lpMessageCount The total number of messages waiting to be read, when the function returns. This parameter can be <b>NULL</b>.
     * @param {Pointer<Integer>} lpReadTimeout The amount of time, in milliseconds, a read operation can wait for a message to be written to the mailslot before a time-out occurs. This parameter is filled in when the function returns. This parameter can be <b>NULL</b>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getmailslotinfo
     * @since windows5.0
     */
    static GetMailslotInfo(hMailslot, lpMaxMessageSize, lpNextSize, lpMessageCount, lpReadTimeout) {
        hMailslot := hMailslot is Win32Handle ? NumGet(hMailslot, "ptr") : hMailslot

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetMailslotInfo", "ptr", hMailslot, "uint*", lpMaxMessageSize, "uint*", lpNextSize, "uint*", lpMessageCount, "uint*", lpReadTimeout, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the time-out value used by the specified mailslot for a read operation.
     * @param {HANDLE} hMailslot A handle to a mailslot. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createmailslota">CreateMailslot</a> function must create this handle.
     * @param {Integer} lReadTimeout The time a read operation can wait for a message to be written to the mailslot before a time-out occurs, in milliseconds. The following values have special meanings.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns immediately if no message is present. (The system does not treat an immediate return as an error.)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MAILSLOT_WAIT_FOREVER"></a><a id="mailslot_wait_forever"></a><dl>
     * <dt><b>MAILSLOT_WAIT_FOREVER</b></dt>
     * <dt>((DWORD)-1)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Waits forever for a message.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * This time-out value applies to all subsequent read operations and to all inherited mailslot handles.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-setmailslotinfo
     * @since windows5.0
     */
    static SetMailslotInfo(hMailslot, lReadTimeout) {
        hMailslot := hMailslot is Win32Handle ? NumGet(hMailslot, "ptr") : hMailslot

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetMailslotInfo", "ptr", hMailslot, "uint", lReadTimeout, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

;@endregion Methods
}
