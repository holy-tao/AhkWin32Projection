#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include .\HDESK.ahk
#Include .\HWINSTA.ahk

/**
 * @namespace Windows.Win32.System.StationsAndDesktops
 * @version v4.0.30319
 */
class StationsAndDesktops {

;@region Constants
;@endregion Constants

;@region Methods
    /**
     * Creates a new desktop, associates it with the current window station of the calling process, and assigns it to the calling thread.
     * @param {PSTR} lpszDesktop The name of the desktop to be created. Desktop names are case-insensitive and may not contain backslash characters (\\).
     * @param {Integer} dwFlags This parameter can be zero or the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DF_ALLOWOTHERACCOUNTHOOK"></a><a id="df_allowotheraccounthook"></a><dl>
     * <dt><b>DF_ALLOWOTHERACCOUNTHOOK</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enables processes running in other accounts on the desktop to set hooks in this process.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwDesiredAccess The access to the desktop. For a list of values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/winstation/desktop-security-and-access-rights">Desktop Security and Access Rights</a>.
     * 
     * This parameter must include the <b>DESKTOP_CREATEWINDOW</b> access right, because internally 
     * <b>CreateDesktop</b> uses the handle to create a window.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpsa A pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure that determines whether the returned handle can be inherited by child processes. If <i>lpsa</i> is NULL, the handle cannot be inherited.
     * 
     * The <b>lpSecurityDescriptor</b> member of the structure specifies a security descriptor for the new desktop. If this parameter is NULL, the desktop inherits its security descriptor from the parent window station.
     * @returns {HDESK} If the function succeeds, the return value is a handle to the newly created desktop. If the specified desktop already exists, the function succeeds and returns a handle to the existing desktop. When you are finished using the handle, call the 
     * <a href="/windows/desktop/api/winuser/nf-winuser-closedesktop">CloseDesktop</a> function to close it.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-createdesktopa
     * @since windows5.0
     */
    static CreateDesktopA(lpszDesktop, dwFlags, dwDesiredAccess, lpsa) {
        static lpszDevice := 0, pDevmode := 0 ;Reserved parameters must always be NULL

        lpszDesktop := lpszDesktop is String ? StrPtr(lpszDesktop) : lpszDesktop
        lpszDevice := lpszDevice is String ? StrPtr(lpszDevice) : lpszDevice

        A_LastError := 0

        result := DllCall("USER32.dll\CreateDesktopA", "ptr", lpszDesktop, "ptr", lpszDevice, "ptr", pDevmode, "uint", dwFlags, "uint", dwDesiredAccess, "ptr", lpsa, "ptr")
        if(A_LastError)
            throw OSError()

        return HDESK({Value: result}, True)
    }

    /**
     * Creates a new desktop, associates it with the current window station of the calling process, and assigns it to the calling thread.
     * @param {PWSTR} lpszDesktop The name of the desktop to be created. Desktop names are case-insensitive and may not contain backslash characters (\\).
     * @param {Integer} dwFlags This parameter can be zero or the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DF_ALLOWOTHERACCOUNTHOOK"></a><a id="df_allowotheraccounthook"></a><dl>
     * <dt><b>DF_ALLOWOTHERACCOUNTHOOK</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enables processes running in other accounts on the desktop to set hooks in this process.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwDesiredAccess The access to the desktop. For a list of values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/winstation/desktop-security-and-access-rights">Desktop Security and Access Rights</a>.
     * 
     * This parameter must include the <b>DESKTOP_CREATEWINDOW</b> access right, because internally 
     * <b>CreateDesktop</b> uses the handle to create a window.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpsa A pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure that determines whether the returned handle can be inherited by child processes. If <i>lpsa</i> is NULL, the handle cannot be inherited.
     * 
     * The <b>lpSecurityDescriptor</b> member of the structure specifies a security descriptor for the new desktop. If this parameter is NULL, the desktop inherits its security descriptor from the parent window station.
     * @returns {HDESK} If the function succeeds, the return value is a handle to the newly created desktop. If the specified desktop already exists, the function succeeds and returns a handle to the existing desktop. When you are finished using the handle, call the 
     * <a href="/windows/desktop/api/winuser/nf-winuser-closedesktop">CloseDesktop</a> function to close it.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-createdesktopw
     * @since windows5.0
     */
    static CreateDesktopW(lpszDesktop, dwFlags, dwDesiredAccess, lpsa) {
        static lpszDevice := 0, pDevmode := 0 ;Reserved parameters must always be NULL

        lpszDesktop := lpszDesktop is String ? StrPtr(lpszDesktop) : lpszDesktop
        lpszDevice := lpszDevice is String ? StrPtr(lpszDevice) : lpszDevice

        A_LastError := 0

        result := DllCall("USER32.dll\CreateDesktopW", "ptr", lpszDesktop, "ptr", lpszDevice, "ptr", pDevmode, "uint", dwFlags, "uint", dwDesiredAccess, "ptr", lpsa, "ptr")
        if(A_LastError)
            throw OSError()

        return HDESK({Value: result}, True)
    }

    /**
     * Creates a new desktop with the specified heap, associates it with the current window station of the calling process, and assigns it to the calling thread.
     * @param {PSTR} lpszDesktop The name of the desktop to be created. Desktop names are case-insensitive and may not contain backslash characters (\\).
     * @param {Integer} dwFlags This parameter can be zero or the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DF_ALLOWOTHERACCOUNTHOOK"></a><a id="df_allowotheraccounthook"></a><dl>
     * <dt><b>DF_ALLOWOTHERACCOUNTHOOK</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enables processes running in other accounts on the desktop to set hooks in this process.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwDesiredAccess The requested access to the desktop. For a list of values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/winstation/desktop-security-and-access-rights">Desktop Security and Access Rights</a>. 
     * 
     * 
     * 
     * 
     * This parameter must include the DESKTOP_CREATEWINDOW access right, because internally 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createdesktopa">CreateDesktop</a> uses the handle to create a window.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpsa A pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure that determines whether the returned handle can be inherited by child processes. If <i>lpsa</i> is NULL, the handle cannot be inherited. 
     * 
     * 
     * 
     * 
     * The <b>lpSecurityDescriptor</b> member of the structure specifies a security descriptor for the new desktop. If this parameter is NULL, the desktop inherits its security descriptor from the parent window station.
     * @param {Integer} ulHeapSize The size of the desktop heap, in kilobytes.
     * @returns {HDESK} If the function succeeds, the return value is a handle to the newly created desktop. If the specified desktop already exists, the function succeeds and returns a handle to the existing desktop. When you are finished using the handle, call the 
     * <a href="/windows/desktop/api/winuser/nf-winuser-closedesktop">CloseDesktop</a> function to close it.
     * 
     * If the function fails, the return value is NULL. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-createdesktopexa
     * @since windows6.0.6000
     */
    static CreateDesktopExA(lpszDesktop, dwFlags, dwDesiredAccess, lpsa, ulHeapSize) {
        static lpszDevice := 0, pDevmode := 0, pvoid := 0 ;Reserved parameters must always be NULL

        lpszDesktop := lpszDesktop is String ? StrPtr(lpszDesktop) : lpszDesktop
        lpszDevice := lpszDevice is String ? StrPtr(lpszDevice) : lpszDevice

        A_LastError := 0

        result := DllCall("USER32.dll\CreateDesktopExA", "ptr", lpszDesktop, "ptr", lpszDevice, "ptr", pDevmode, "uint", dwFlags, "uint", dwDesiredAccess, "ptr", lpsa, "uint", ulHeapSize, "ptr", pvoid, "ptr")
        if(A_LastError)
            throw OSError()

        return HDESK({Value: result}, True)
    }

    /**
     * Creates a new desktop with the specified heap, associates it with the current window station of the calling process, and assigns it to the calling thread.
     * @param {PWSTR} lpszDesktop The name of the desktop to be created. Desktop names are case-insensitive and may not contain backslash characters (\\).
     * @param {Integer} dwFlags This parameter can be zero or the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DF_ALLOWOTHERACCOUNTHOOK"></a><a id="df_allowotheraccounthook"></a><dl>
     * <dt><b>DF_ALLOWOTHERACCOUNTHOOK</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enables processes running in other accounts on the desktop to set hooks in this process.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwDesiredAccess The requested access to the desktop. For a list of values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/winstation/desktop-security-and-access-rights">Desktop Security and Access Rights</a>. 
     * 
     * 
     * 
     * 
     * This parameter must include the DESKTOP_CREATEWINDOW access right, because internally 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createdesktopa">CreateDesktop</a> uses the handle to create a window.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpsa A pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure that determines whether the returned handle can be inherited by child processes. If <i>lpsa</i> is NULL, the handle cannot be inherited. 
     * 
     * 
     * 
     * 
     * The <b>lpSecurityDescriptor</b> member of the structure specifies a security descriptor for the new desktop. If this parameter is NULL, the desktop inherits its security descriptor from the parent window station.
     * @param {Integer} ulHeapSize The size of the desktop heap, in kilobytes.
     * @returns {HDESK} If the function succeeds, the return value is a handle to the newly created desktop. If the specified desktop already exists, the function succeeds and returns a handle to the existing desktop. When you are finished using the handle, call the 
     * <a href="/windows/desktop/api/winuser/nf-winuser-closedesktop">CloseDesktop</a> function to close it.
     * 
     * If the function fails, the return value is NULL. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-createdesktopexw
     * @since windows6.0.6000
     */
    static CreateDesktopExW(lpszDesktop, dwFlags, dwDesiredAccess, lpsa, ulHeapSize) {
        static lpszDevice := 0, pDevmode := 0, pvoid := 0 ;Reserved parameters must always be NULL

        lpszDesktop := lpszDesktop is String ? StrPtr(lpszDesktop) : lpszDesktop
        lpszDevice := lpszDevice is String ? StrPtr(lpszDevice) : lpszDevice

        A_LastError := 0

        result := DllCall("USER32.dll\CreateDesktopExW", "ptr", lpszDesktop, "ptr", lpszDevice, "ptr", pDevmode, "uint", dwFlags, "uint", dwDesiredAccess, "ptr", lpsa, "uint", ulHeapSize, "ptr", pvoid, "ptr")
        if(A_LastError)
            throw OSError()

        return HDESK({Value: result}, True)
    }

    /**
     * Opens the specified desktop object.
     * @param {PSTR} lpszDesktop The name of the desktop to be opened. Desktop names are case-insensitive.
     * 
     * This desktop must belong to the current window station.
     * @param {Integer} dwFlags This parameter can be zero or the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DF_ALLOWOTHERACCOUNTHOOK"></a><a id="df_allowotheraccounthook"></a><dl>
     * <dt><b>DF_ALLOWOTHERACCOUNTHOOK</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Allows processes running in other accounts on the desktop to set hooks in this process.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {BOOL} fInherit If this value is <b>TRUE</b>, processes created by this process will inherit the handle. Otherwise, the processes do not inherit this handle.
     * @param {Integer} dwDesiredAccess The access to the desktop. For a list of access rights, see 
     * <a href="https://docs.microsoft.com/windows/desktop/winstation/desktop-security-and-access-rights">Desktop Security and Access Rights</a>.
     * @returns {HDESK} If the function succeeds, the return value is a handle to the opened desktop. When you are finished using the handle, call the 
     * <a href="/windows/desktop/api/winuser/nf-winuser-closedesktop">CloseDesktop</a> function to close it.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-opendesktopa
     * @since windows5.0
     */
    static OpenDesktopA(lpszDesktop, dwFlags, fInherit, dwDesiredAccess) {
        lpszDesktop := lpszDesktop is String ? StrPtr(lpszDesktop) : lpszDesktop

        A_LastError := 0

        result := DllCall("USER32.dll\OpenDesktopA", "ptr", lpszDesktop, "uint", dwFlags, "int", fInherit, "uint", dwDesiredAccess, "ptr")
        if(A_LastError)
            throw OSError()

        return HDESK({Value: result}, True)
    }

    /**
     * Opens the specified desktop object.
     * @param {PWSTR} lpszDesktop The name of the desktop to be opened. Desktop names are case-insensitive.
     * 
     * This desktop must belong to the current window station.
     * @param {Integer} dwFlags This parameter can be zero or the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DF_ALLOWOTHERACCOUNTHOOK"></a><a id="df_allowotheraccounthook"></a><dl>
     * <dt><b>DF_ALLOWOTHERACCOUNTHOOK</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Allows processes running in other accounts on the desktop to set hooks in this process.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {BOOL} fInherit If this value is <b>TRUE</b>, processes created by this process will inherit the handle. Otherwise, the processes do not inherit this handle.
     * @param {Integer} dwDesiredAccess The access to the desktop. For a list of access rights, see 
     * <a href="https://docs.microsoft.com/windows/desktop/winstation/desktop-security-and-access-rights">Desktop Security and Access Rights</a>.
     * @returns {HDESK} If the function succeeds, the return value is a handle to the opened desktop. When you are finished using the handle, call the 
     * <a href="/windows/desktop/api/winuser/nf-winuser-closedesktop">CloseDesktop</a> function to close it.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-opendesktopw
     * @since windows5.0
     */
    static OpenDesktopW(lpszDesktop, dwFlags, fInherit, dwDesiredAccess) {
        lpszDesktop := lpszDesktop is String ? StrPtr(lpszDesktop) : lpszDesktop

        A_LastError := 0

        result := DllCall("USER32.dll\OpenDesktopW", "ptr", lpszDesktop, "uint", dwFlags, "int", fInherit, "uint", dwDesiredAccess, "ptr")
        if(A_LastError)
            throw OSError()

        return HDESK({Value: result}, True)
    }

    /**
     * Opens the desktop that receives user input.
     * @param {Integer} dwFlags This parameter can be zero or the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DF_ALLOWOTHERACCOUNTHOOK"></a><a id="df_allowotheraccounthook"></a><dl>
     * <dt><b>DF_ALLOWOTHERACCOUNTHOOK</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Allows processes running in other accounts on the desktop to set hooks in this process.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {BOOL} fInherit If this value is <b>TRUE</b>, processes created by this process will inherit the handle. Otherwise, the processes do not inherit this handle.
     * @param {Integer} dwDesiredAccess The access to the desktop. For a list of access rights, see 
     * <a href="https://docs.microsoft.com/windows/desktop/winstation/desktop-security-and-access-rights">Desktop Security and Access Rights</a>.
     * @returns {HDESK} If the function succeeds, the return value is a handle to the desktop that receives user input. When you are finished using the handle, call the 
     * <a href="/windows/desktop/api/winuser/nf-winuser-closedesktop">CloseDesktop</a> function to close it.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-openinputdesktop
     * @since windows5.0
     */
    static OpenInputDesktop(dwFlags, fInherit, dwDesiredAccess) {
        A_LastError := 0

        result := DllCall("USER32.dll\OpenInputDesktop", "uint", dwFlags, "int", fInherit, "uint", dwDesiredAccess, "ptr")
        if(A_LastError)
            throw OSError()

        return HDESK({Value: result}, True)
    }

    /**
     * Enumerates all desktops associated with the specified window station of the calling process. The function passes the name of each desktop, in turn, to an application-defined callback function.
     * @param {HWINSTA} hwinsta A handle to the window station whose desktops are to be enumerated. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createwindowstationa">CreateWindowStation</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getprocesswindowstation">GetProcessWindowStation</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-openwindowstationa">OpenWindowStation</a> function, and must have the WINSTA_ENUMDESKTOPS access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/winstation/window-station-security-and-access-rights">Window Station Security and Access Rights</a>.
     * 
     * If this parameter is NULL, the current window station is used.
     * @param {Pointer<DESKTOPENUMPROCA>} lpEnumFunc A pointer to an application-defined 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms682612(v=vs.85)">EnumDesktopProc</a> callback function.
     * @param {LPARAM} lParam An application-defined value to be passed to the callback function.
     * @returns {BOOL} If the function succeeds, it returns the  nonzero value returned by the callback function that was pointed to by <i>lpEnumFunc</i>.
     * 
     * If the function is unable to perform the enumeration, the return value is zero. Call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to get extended error information.
     * 
     * If the callback function fails, the return value is zero. The callback function can  call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-setlasterror">SetLastError</a> to set an error code for the caller to retrieve by calling <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-enumdesktopsa
     * @since windows5.0
     */
    static EnumDesktopsA(hwinsta, lpEnumFunc, lParam) {
        hwinsta := hwinsta is Win32Handle ? NumGet(hwinsta, "ptr") : hwinsta

        A_LastError := 0

        result := DllCall("USER32.dll\EnumDesktopsA", "ptr", hwinsta, "ptr", lpEnumFunc, "ptr", lParam, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enumerates all desktops associated with the specified window station of the calling process. The function passes the name of each desktop, in turn, to an application-defined callback function.
     * @param {HWINSTA} hwinsta A handle to the window station whose desktops are to be enumerated. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createwindowstationa">CreateWindowStation</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getprocesswindowstation">GetProcessWindowStation</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-openwindowstationa">OpenWindowStation</a> function, and must have the WINSTA_ENUMDESKTOPS access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/winstation/window-station-security-and-access-rights">Window Station Security and Access Rights</a>.
     * 
     * If this parameter is NULL, the current window station is used.
     * @param {Pointer<DESKTOPENUMPROCW>} lpEnumFunc A pointer to an application-defined 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms682612(v=vs.85)">EnumDesktopProc</a> callback function.
     * @param {LPARAM} lParam An application-defined value to be passed to the callback function.
     * @returns {BOOL} If the function succeeds, it returns the  nonzero value returned by the callback function that was pointed to by <i>lpEnumFunc</i>.
     * 
     * If the function is unable to perform the enumeration, the return value is zero. Call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to get extended error information.
     * 
     * If the callback function fails, the return value is zero. The callback function can  call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-setlasterror">SetLastError</a> to set an error code for the caller to retrieve by calling <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-enumdesktopsw
     * @since windows5.0
     */
    static EnumDesktopsW(hwinsta, lpEnumFunc, lParam) {
        hwinsta := hwinsta is Win32Handle ? NumGet(hwinsta, "ptr") : hwinsta

        A_LastError := 0

        result := DllCall("USER32.dll\EnumDesktopsW", "ptr", hwinsta, "ptr", lpEnumFunc, "ptr", lParam, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enumerates all top-level windows associated with the specified desktop. It passes the handle to each window, in turn, to an application-defined callback function.
     * @param {HDESK} hDesktop A handle to the desktop whose top-level windows are to be enumerated. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createdesktopa">CreateDesktop</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getthreaddesktop">GetThreadDesktop</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-opendesktopa">OpenDesktop</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-openinputdesktop">OpenInputDesktop</a> function, and must have the <b>DESKTOP_READOBJECTS</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/winstation/desktop-security-and-access-rights">Desktop Security and Access Rights</a>.
     * 
     * If this parameter is NULL, the current desktop is used.
     * @param {Pointer<WNDENUMPROC>} lpfn A pointer to an application-defined 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms633498(v=vs.85)">EnumWindowsProc</a> callback function.
     * @param {LPARAM} lParam An application-defined value to be passed to the callback function.
     * @returns {BOOL} If the function fails or is unable to perform the enumeration, the return value is zero.
     * 
     * To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * You must ensure that the callback function sets <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-setlasterror">SetLastError</a> if it fails.
     * 
     * <b>Windows Server 2003 and Windows XP/2000:  </b>If there are no windows on the desktop, <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_INVALID_HANDLE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-enumdesktopwindows
     * @since windows5.0
     */
    static EnumDesktopWindows(hDesktop, lpfn, lParam) {
        hDesktop := hDesktop is Win32Handle ? NumGet(hDesktop, "ptr") : hDesktop

        A_LastError := 0

        result := DllCall("USER32.dll\EnumDesktopWindows", "ptr", hDesktop, "ptr", lpfn, "ptr", lParam, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Makes the specified desktop visible and activates it. This enables the desktop to receive input from the user.
     * @param {HDESK} hDesktop A handle to the desktop. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createdesktopa">CreateDesktop</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-opendesktopa">OpenDesktop</a> functions.
     * 
     * This desktop must be associated with the current window station for the process.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. However, 
     * <b>SwitchDesktop</b> only sets the last error for the following cases:
     * 
     * <ul>
     * <li>When the desktop belongs to an invisible window station</li>
     * <li>When <i>hDesktop</i> is an invalid handle, refers to a destroyed desktop, or belongs to a different session than that of the calling process</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-switchdesktop
     * @since windows5.0
     */
    static SwitchDesktop(hDesktop) {
        hDesktop := hDesktop is Win32Handle ? NumGet(hDesktop, "ptr") : hDesktop

        A_LastError := 0

        result := DllCall("USER32.dll\SwitchDesktop", "ptr", hDesktop, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Assigns the specified desktop to the calling thread. All subsequent operations on the desktop use the access rights granted to the desktop.
     * @param {HDESK} hDesktop A handle to the desktop to be assigned to the calling thread. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createdesktopa">CreateDesktop</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getthreaddesktop">GetThreadDesktop</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-opendesktopa">OpenDesktop</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-openinputdesktop">OpenInputDesktop</a> function.
     * 
     * This desktop must be associated with the current window station for the process.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-setthreaddesktop
     * @since windows5.0
     */
    static SetThreadDesktop(hDesktop) {
        hDesktop := hDesktop is Win32Handle ? NumGet(hDesktop, "ptr") : hDesktop

        A_LastError := 0

        result := DllCall("USER32.dll\SetThreadDesktop", "ptr", hDesktop, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Closes an open handle to a desktop object.
     * @param {HDESK} hDesktop A handle to the desktop to be closed. This can be a handle returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createdesktopa">CreateDesktop</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-opendesktopa">OpenDesktop</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-openinputdesktop">OpenInputDesktop</a> functions. Do not specify the handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getthreaddesktop">GetThreadDesktop</a> function.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-closedesktop
     * @since windows5.0
     */
    static CloseDesktop(hDesktop) {
        hDesktop := hDesktop is Win32Handle ? NumGet(hDesktop, "ptr") : hDesktop

        A_LastError := 0

        result := DllCall("USER32.dll\CloseDesktop", "ptr", hDesktop, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves a handle to the desktop assigned to the specified thread.
     * @param {Integer} dwThreadId The thread identifier. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getcurrentthreadid">GetCurrentThreadId</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a> functions return thread identifiers.
     * @returns {HDESK} If the function succeeds, the return value is a handle to the desktop associated with the specified thread. You do not need to call the 
     * <a href="/windows/desktop/api/winuser/nf-winuser-closedesktop">CloseDesktop</a> function to close the returned handle.
     * 
     * If the function fails, the return value is NULL. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getthreaddesktop
     * @since windows5.0
     */
    static GetThreadDesktop(dwThreadId) {
        A_LastError := 0

        result := DllCall("USER32.dll\GetThreadDesktop", "uint", dwThreadId, "ptr")
        if(A_LastError)
            throw OSError()

        return HDESK({Value: result}, True)
    }

    /**
     * Creates a window station object, associates it with the calling process, and assigns it to the current session.
     * @param {PSTR} lpwinsta The name of the window station to be created. Window station names are case-insensitive and cannot contain backslash characters (\\). Only members of the Administrators group are allowed to specify a name. If <i>lpwinsta</i> is <b>NULL</b> or an empty string, the system forms a window station name using the logon session identifier for the calling process. To get this name, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getuserobjectinformationa">GetUserObjectInformation</a> function.
     * @param {Integer} dwFlags If this parameter is <b>CWF_CREATE_ONLY</b> and the window station already exists, the call fails. If this flag is not specified and the window station already exists, the function succeeds and returns a new handle to the existing window station.
     * 
     * <b>Windows XP/2000:  </b>This parameter is reserved and must be zero.
     * @param {Integer} dwDesiredAccess The type of access the returned handle has to the window station. In addition, you can specify any of the standard access rights, such as <b>READ_CONTROL</b> or <b>WRITE_DAC</b>, and a combination of the window station-specific access rights. For more information, see <a href="https://docs.microsoft.com/windows/desktop/winstation/window-station-security-and-access-rights">Window Station Security and Access Rights</a>.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpsa A pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure that determines whether the returned handle can be inherited by child processes. If <i>lpsa</i> is <b>NULL</b>, the handle cannot be inherited.
     * 
     * The <b>lpSecurityDescriptor</b> member of the structure specifies a security descriptor for the new window station. If <i>lpsa</i> is <b>NULL</b>, the window station (and any desktops created within the window) gets a security descriptor that grants <b>GENERIC_ALL</b> access to all users.
     * @returns {HWINSTA} If the function succeeds, the return value is a handle to the newly created window station. If the specified window station already exists, the function succeeds and returns a handle to the existing window station.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-createwindowstationa
     * @since windows5.0
     */
    static CreateWindowStationA(lpwinsta, dwFlags, dwDesiredAccess, lpsa) {
        lpwinsta := lpwinsta is String ? StrPtr(lpwinsta) : lpwinsta

        A_LastError := 0

        result := DllCall("USER32.dll\CreateWindowStationA", "ptr", lpwinsta, "uint", dwFlags, "uint", dwDesiredAccess, "ptr", lpsa, "ptr")
        if(A_LastError)
            throw OSError()

        return HWINSTA({Value: result}, True)
    }

    /**
     * Creates a window station object, associates it with the calling process, and assigns it to the current session.
     * @param {PWSTR} lpwinsta The name of the window station to be created. Window station names are case-insensitive and cannot contain backslash characters (\\). Only members of the Administrators group are allowed to specify a name. If <i>lpwinsta</i> is <b>NULL</b> or an empty string, the system forms a window station name using the logon session identifier for the calling process. To get this name, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getuserobjectinformationa">GetUserObjectInformation</a> function.
     * @param {Integer} dwFlags If this parameter is <b>CWF_CREATE_ONLY</b> and the window station already exists, the call fails. If this flag is not specified and the window station already exists, the function succeeds and returns a new handle to the existing window station.
     * 
     * <b>Windows XP/2000:  </b>This parameter is reserved and must be zero.
     * @param {Integer} dwDesiredAccess The type of access the returned handle has to the window station. In addition, you can specify any of the standard access rights, such as <b>READ_CONTROL</b> or <b>WRITE_DAC</b>, and a combination of the window station-specific access rights. For more information, see <a href="https://docs.microsoft.com/windows/desktop/winstation/window-station-security-and-access-rights">Window Station Security and Access Rights</a>.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpsa A pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure that determines whether the returned handle can be inherited by child processes. If <i>lpsa</i> is <b>NULL</b>, the handle cannot be inherited.
     * 
     * The <b>lpSecurityDescriptor</b> member of the structure specifies a security descriptor for the new window station. If <i>lpsa</i> is <b>NULL</b>, the window station (and any desktops created within the window) gets a security descriptor that grants <b>GENERIC_ALL</b> access to all users.
     * @returns {HWINSTA} If the function succeeds, the return value is a handle to the newly created window station. If the specified window station already exists, the function succeeds and returns a handle to the existing window station.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-createwindowstationw
     * @since windows5.0
     */
    static CreateWindowStationW(lpwinsta, dwFlags, dwDesiredAccess, lpsa) {
        lpwinsta := lpwinsta is String ? StrPtr(lpwinsta) : lpwinsta

        A_LastError := 0

        result := DllCall("USER32.dll\CreateWindowStationW", "ptr", lpwinsta, "uint", dwFlags, "uint", dwDesiredAccess, "ptr", lpsa, "ptr")
        if(A_LastError)
            throw OSError()

        return HWINSTA({Value: result}, True)
    }

    /**
     * Opens the specified window station.
     * @param {PSTR} lpszWinSta The name of the window station to be opened. Window station names are case-insensitive.
     * 
     * This window station must belong to the current session.
     * @param {BOOL} fInherit If this value is <b>TRUE</b>, processes created by this process will inherit the handle. Otherwise, the processes do not inherit this handle.
     * @param {Integer} dwDesiredAccess The access to the window station. For a list of access rights, see 
     * <a href="https://docs.microsoft.com/windows/desktop/winstation/window-station-security-and-access-rights">Window Station Security and Access Rights</a>.
     * @returns {HWINSTA} If the function succeeds, the return value is the handle to the specified window station.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-openwindowstationa
     * @since windows5.0
     */
    static OpenWindowStationA(lpszWinSta, fInherit, dwDesiredAccess) {
        lpszWinSta := lpszWinSta is String ? StrPtr(lpszWinSta) : lpszWinSta

        A_LastError := 0

        result := DllCall("USER32.dll\OpenWindowStationA", "ptr", lpszWinSta, "int", fInherit, "uint", dwDesiredAccess, "ptr")
        if(A_LastError)
            throw OSError()

        return HWINSTA({Value: result}, True)
    }

    /**
     * Opens the specified window station.
     * @param {PWSTR} lpszWinSta The name of the window station to be opened. Window station names are case-insensitive.
     * 
     * This window station must belong to the current session.
     * @param {BOOL} fInherit If this value is <b>TRUE</b>, processes created by this process will inherit the handle. Otherwise, the processes do not inherit this handle.
     * @param {Integer} dwDesiredAccess The access to the window station. For a list of access rights, see 
     * <a href="https://docs.microsoft.com/windows/desktop/winstation/window-station-security-and-access-rights">Window Station Security and Access Rights</a>.
     * @returns {HWINSTA} If the function succeeds, the return value is the handle to the specified window station.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-openwindowstationw
     * @since windows5.0
     */
    static OpenWindowStationW(lpszWinSta, fInherit, dwDesiredAccess) {
        lpszWinSta := lpszWinSta is String ? StrPtr(lpszWinSta) : lpszWinSta

        A_LastError := 0

        result := DllCall("USER32.dll\OpenWindowStationW", "ptr", lpszWinSta, "int", fInherit, "uint", dwDesiredAccess, "ptr")
        if(A_LastError)
            throw OSError()

        return HWINSTA({Value: result}, True)
    }

    /**
     * Enumerates all window stations in the current session. The function passes the name of each window station, in turn, to an application-defined callback function.
     * @param {Pointer<WINSTAENUMPROCA>} lpEnumFunc A pointer to an application-defined 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms682643(v=vs.85)">EnumWindowStationProc</a> callback function.
     * @param {LPARAM} lParam An application-defined value to be passed to the callback function.
     * @returns {BOOL} If the function succeeds, it returns the  nonzero value returned by the callback function that was pointed to by <i>lpEnumFunc</i>.
     * 
     * If the function is unable to perform the enumeration, the return value is zero. Call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to get extended error information.
     * 
     * If the callback function fails, the return value is zero. The callback function can  call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-setlasterror">SetLastError</a> to set an error code for the caller to retrieve by calling <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-enumwindowstationsa
     * @since windows5.0
     */
    static EnumWindowStationsA(lpEnumFunc, lParam) {
        A_LastError := 0

        result := DllCall("USER32.dll\EnumWindowStationsA", "ptr", lpEnumFunc, "ptr", lParam, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enumerates all window stations in the current session. The function passes the name of each window station, in turn, to an application-defined callback function.
     * @param {Pointer<WINSTAENUMPROCW>} lpEnumFunc A pointer to an application-defined 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms682643(v=vs.85)">EnumWindowStationProc</a> callback function.
     * @param {LPARAM} lParam An application-defined value to be passed to the callback function.
     * @returns {BOOL} If the function succeeds, it returns the  nonzero value returned by the callback function that was pointed to by <i>lpEnumFunc</i>.
     * 
     * If the function is unable to perform the enumeration, the return value is zero. Call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to get extended error information.
     * 
     * If the callback function fails, the return value is zero. The callback function can  call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-setlasterror">SetLastError</a> to set an error code for the caller to retrieve by calling <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-enumwindowstationsw
     * @since windows5.0
     */
    static EnumWindowStationsW(lpEnumFunc, lParam) {
        A_LastError := 0

        result := DllCall("USER32.dll\EnumWindowStationsW", "ptr", lpEnumFunc, "ptr", lParam, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Closes an open window station handle.
     * @param {HWINSTA} hWinSta A handle to the window station to be closed. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createwindowstationa">CreateWindowStation</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-openwindowstationa">OpenWindowStation</a> function. Do not specify the handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getprocesswindowstation">GetProcessWindowStation</a> function.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * <b>Windows Server 2003 and Windows XP/2000:  </b>This function does not set the last error code on failure.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-closewindowstation
     * @since windows5.0
     */
    static CloseWindowStation(hWinSta) {
        hWinSta := hWinSta is Win32Handle ? NumGet(hWinSta, "ptr") : hWinSta

        A_LastError := 0

        result := DllCall("USER32.dll\CloseWindowStation", "ptr", hWinSta, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Assigns the specified window station to the calling process.
     * @param {HWINSTA} hWinSta A handle to the window station. This can be a handle returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createwindowstationa">CreateWindowStation</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-openwindowstationa">OpenWindowStation</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getprocesswindowstation">GetProcessWindowStation</a> function.
     * 
     * This window station must be associated with the current session.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-setprocesswindowstation
     * @since windows5.0
     */
    static SetProcessWindowStation(hWinSta) {
        hWinSta := hWinSta is Win32Handle ? NumGet(hWinSta, "ptr") : hWinSta

        A_LastError := 0

        result := DllCall("USER32.dll\SetProcessWindowStation", "ptr", hWinSta, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves a handle to the current window station for the calling process.
     * @returns {HWINSTA} If the function succeeds, the return value is a handle to the window station.
     * 
     * If the function fails, the return value is NULL. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getprocesswindowstation
     * @since windows5.0
     */
    static GetProcessWindowStation() {
        A_LastError := 0

        result := DllCall("USER32.dll\GetProcessWindowStation", "ptr")
        if(A_LastError)
            throw OSError()

        return HWINSTA({Value: result}, True)
    }

    /**
     * Retrieves information about the specified window station or desktop object.
     * @param {HANDLE} hObj A handle to the window station or desktop object. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createwindowstationa">CreateWindowStation</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-openwindowstationa">OpenWindowStation</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createdesktopa">CreateDesktop</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-opendesktopa">OpenDesktop</a> function.
     * @param {Integer} nIndex 
     * @param {Pointer} pvInfo A pointer to a buffer to receive the object information.
     * @param {Integer} nLength The size of the buffer pointed to by the <i>pvInfo</i> parameter, in bytes.
     * @param {Pointer<Integer>} lpnLengthNeeded A pointer to a variable receiving the number of bytes required to store the requested information. If this variable's value is greater than the value of the <i>nLength</i> parameter when the function returns, the function returns FALSE, and none of the information is copied to the <i>pvInfo</i> buffer. If the value of the variable pointed to by <i>lpnLengthNeeded</i> is less than or equal to the value of <i>nLength</i>, the entire information block is copied.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getuserobjectinformationa
     * @since windows5.0
     */
    static GetUserObjectInformationA(hObj, nIndex, pvInfo, nLength, lpnLengthNeeded) {
        hObj := hObj is Win32Handle ? NumGet(hObj, "ptr") : hObj

        lpnLengthNeededMarshal := lpnLengthNeeded is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\GetUserObjectInformationA", "ptr", hObj, "int", nIndex, "ptr", pvInfo, "uint", nLength, lpnLengthNeededMarshal, lpnLengthNeeded, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the specified window station or desktop object.
     * @param {HANDLE} hObj A handle to the window station or desktop object. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createwindowstationa">CreateWindowStation</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-openwindowstationa">OpenWindowStation</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createdesktopa">CreateDesktop</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-opendesktopa">OpenDesktop</a> function.
     * @param {Integer} nIndex 
     * @param {Pointer} pvInfo A pointer to a buffer to receive the object information.
     * @param {Integer} nLength The size of the buffer pointed to by the <i>pvInfo</i> parameter, in bytes.
     * @param {Pointer<Integer>} lpnLengthNeeded A pointer to a variable receiving the number of bytes required to store the requested information. If this variable's value is greater than the value of the <i>nLength</i> parameter when the function returns, the function returns FALSE, and none of the information is copied to the <i>pvInfo</i> buffer. If the value of the variable pointed to by <i>lpnLengthNeeded</i> is less than or equal to the value of <i>nLength</i>, the entire information block is copied.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getuserobjectinformationw
     * @since windows5.0
     */
    static GetUserObjectInformationW(hObj, nIndex, pvInfo, nLength, lpnLengthNeeded) {
        hObj := hObj is Win32Handle ? NumGet(hObj, "ptr") : hObj

        lpnLengthNeededMarshal := lpnLengthNeeded is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\GetUserObjectInformationW", "ptr", hObj, "int", nIndex, "ptr", pvInfo, "uint", nLength, lpnLengthNeededMarshal, lpnLengthNeeded, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets information about the specified window station or desktop object.
     * @param {HANDLE} hObj A handle to the window station, desktop object or a current process pseudo handle. This handle can be returned by the  <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createwindowstationa">CreateWindowStation</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-openwindowstationa">OpenWindowStation</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createdesktopa">CreateDesktop</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-opendesktopa">OpenDesktop</a> or  <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getcurrentprocess">GetCurrentProcess</a> function.
     * @param {Integer} nIndex The object information to be set. This parameter can be the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UOI_FLAGS"></a><a id="uoi_flags"></a><dl>
     * <dt><b>UOI_FLAGS</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sets the object's handle flags. The <i>pvInfo</i> parameter must point to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-userobjectflags">USEROBJECTFLAGS</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UOI_TIMERPROC_EXCEPTION_SUPPRESSION"></a><a id="uoi_timerproc_exception_suppression"></a><dl>
     * <dt><b>UOI_TIMERPROC_EXCEPTION_SUPPRESSION</b></dt>
     * <dt>7</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sets the exception handling behavior when calling <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nc-winuser-timerproc">TimerProc</a>.
     *  <i>hObj</i> must be the process handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getcurrentprocess">GetCurrentProcess</a> function.
     *  
     * 
     * The <i>pvInfo</i> parameter must point to a BOOL.  If TRUE, Windows will enclose its calls to <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nc-winuser-timerproc">TimerProc</a> with an exception handler that consumes and discards all exceptions. This has been the default behavior since Windows 2000, although that may change in future versions of Windows.  
     * 
     * If <i>pvInfo</i>  points to FALSE, Windows will not enclose its calls to <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nc-winuser-timerproc">TimerProc</a> with an exception handler. A setting of FALSE is recommended.  Otherwise, the application could behave unpredictably, and could be more vulnerable to security exploits.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer} pvInfo A pointer to a buffer containing the object information, or a BOOL.
     * @param {Integer} nLength The size of the information contained in the buffer pointed to by <i>pvInfo</i>, in bytes.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-setuserobjectinformationa
     * @since windows5.0
     */
    static SetUserObjectInformationA(hObj, nIndex, pvInfo, nLength) {
        hObj := hObj is Win32Handle ? NumGet(hObj, "ptr") : hObj

        A_LastError := 0

        result := DllCall("USER32.dll\SetUserObjectInformationA", "ptr", hObj, "int", nIndex, "ptr", pvInfo, "uint", nLength, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets information about the specified window station or desktop object.
     * @param {HANDLE} hObj A handle to the window station, desktop object or a current process pseudo handle. This handle can be returned by the  <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createwindowstationa">CreateWindowStation</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-openwindowstationa">OpenWindowStation</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createdesktopa">CreateDesktop</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-opendesktopa">OpenDesktop</a> or  <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getcurrentprocess">GetCurrentProcess</a> function.
     * @param {Integer} nIndex The object information to be set. This parameter can be the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UOI_FLAGS"></a><a id="uoi_flags"></a><dl>
     * <dt><b>UOI_FLAGS</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sets the object's handle flags. The <i>pvInfo</i> parameter must point to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-userobjectflags">USEROBJECTFLAGS</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UOI_TIMERPROC_EXCEPTION_SUPPRESSION"></a><a id="uoi_timerproc_exception_suppression"></a><dl>
     * <dt><b>UOI_TIMERPROC_EXCEPTION_SUPPRESSION</b></dt>
     * <dt>7</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sets the exception handling behavior when calling <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nc-winuser-timerproc">TimerProc</a>.
     *  <i>hObj</i> must be the process handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getcurrentprocess">GetCurrentProcess</a> function.
     *  
     * 
     * The <i>pvInfo</i> parameter must point to a BOOL.  If TRUE, Windows will enclose its calls to <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nc-winuser-timerproc">TimerProc</a> with an exception handler that consumes and discards all exceptions. This has been the default behavior since Windows 2000, although that may change in future versions of Windows.  
     * 
     * If <i>pvInfo</i>  points to FALSE, Windows will not enclose its calls to <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nc-winuser-timerproc">TimerProc</a> with an exception handler. A setting of FALSE is recommended.  Otherwise, the application could behave unpredictably, and could be more vulnerable to security exploits.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer} pvInfo A pointer to a buffer containing the object information, or a BOOL.
     * @param {Integer} nLength The size of the information contained in the buffer pointed to by <i>pvInfo</i>, in bytes.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-setuserobjectinformationw
     * @since windows5.0
     */
    static SetUserObjectInformationW(hObj, nIndex, pvInfo, nLength) {
        hObj := hObj is Win32Handle ? NumGet(hObj, "ptr") : hObj

        A_LastError := 0

        result := DllCall("USER32.dll\SetUserObjectInformationW", "ptr", hObj, "int", nIndex, "ptr", pvInfo, "uint", nLength, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sends a message to the specified recipients.
     * @param {Integer} flags Type: <b>DWORD</b>
     * @param {Pointer<Integer>} lpInfo Type: <b>LPDWORD</b>
     * 
     * A pointer to a variable that contains and receives information about the recipients of the message.  
     * 					
     * 
     * When the function returns, this variable receives a combination of these values identifying which recipients actually received the message.
     * 
     * If this parameter is <b>NULL</b>, the function broadcasts to all components.
     * @param {Integer} Msg Type: <b>UINT</b>
     * 
     * The message to be sent. 
     * 
     * For lists of the system-provided messages, see <a href="https://docs.microsoft.com/windows/desktop/winmsg/about-messages-and-message-queues">System-Defined Messages</a>.
     * @param {WPARAM} wParam Type: <b>WPARAM</b>
     * 
     * Additional message-specific information.
     * @param {LPARAM} lParam Type: <b>LPARAM</b>
     * 
     * Additional message-specific information.
     * @param {Pointer<BSMINFO>} pbsmInfo Type: <b>PBSMINFO</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-bsminfo">BSMINFO</a> structure that contains additional information if the request is denied and <i>dwFlags</i> is set to <b>BSF_QUERY</b>.
     * @returns {Integer} Type: <b>long</b>
     * 
     * If the function succeeds, the return value is a positive value.
     * 
     * If the function is unable to broadcast the message, the return value is –1. 
     * 
     * If the <i>dwFlags</i> parameter is <b>BSF_QUERY</b> and at least one recipient returned <b>BROADCAST_QUERY_DENY</b> to the corresponding message, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-broadcastsystemmessageexa
     * @since windows5.1.2600
     */
    static BroadcastSystemMessageExA(flags, lpInfo, Msg, wParam, lParam, pbsmInfo) {
        lpInfoMarshal := lpInfo is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\BroadcastSystemMessageExA", "uint", flags, lpInfoMarshal, lpInfo, "uint", Msg, "ptr", wParam, "ptr", lParam, "ptr", pbsmInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sends a message to the specified recipients.
     * @param {Integer} flags Type: <b>DWORD</b>
     * @param {Pointer<Integer>} lpInfo Type: <b>LPDWORD</b>
     * 
     * A pointer to a variable that contains and receives information about the recipients of the message.  
     * 					
     * 
     * When the function returns, this variable receives a combination of these values identifying which recipients actually received the message.
     * 
     * If this parameter is <b>NULL</b>, the function broadcasts to all components.
     * @param {Integer} Msg Type: <b>UINT</b>
     * 
     * The message to be sent. 
     * 
     * For lists of the system-provided messages, see <a href="https://docs.microsoft.com/windows/desktop/winmsg/about-messages-and-message-queues">System-Defined Messages</a>.
     * @param {WPARAM} wParam Type: <b>WPARAM</b>
     * 
     * Additional message-specific information.
     * @param {LPARAM} lParam Type: <b>LPARAM</b>
     * 
     * Additional message-specific information.
     * @param {Pointer<BSMINFO>} pbsmInfo Type: <b>PBSMINFO</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-bsminfo">BSMINFO</a> structure that contains additional information if the request is denied and <i>dwFlags</i> is set to <b>BSF_QUERY</b>.
     * @returns {Integer} Type: <b>long</b>
     * 
     * If the function succeeds, the return value is a positive value.
     * 
     * If the function is unable to broadcast the message, the return value is –1. 
     * 
     * If the <i>dwFlags</i> parameter is <b>BSF_QUERY</b> and at least one recipient returned <b>BROADCAST_QUERY_DENY</b> to the corresponding message, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-broadcastsystemmessageexw
     * @since windows5.1.2600
     */
    static BroadcastSystemMessageExW(flags, lpInfo, Msg, wParam, lParam, pbsmInfo) {
        lpInfoMarshal := lpInfo is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\BroadcastSystemMessageExW", "uint", flags, lpInfoMarshal, lpInfo, "uint", Msg, "ptr", wParam, "ptr", lParam, "ptr", pbsmInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sends a message to the specified recipients.
     * @param {Integer} flags Type: <b>DWORD</b>
     * @param {Pointer<Integer>} lpInfo Type: <b>LPDWORD</b>
     * 
     * A pointer to a variable that contains and receives information about the recipients of the message.
     * 
     * When the function returns, this variable receives a combination of these values identifying which recipients actually received the message.
     * 
     * If this parameter is <b>NULL</b>, the function broadcasts to all components.
     * @param {Integer} Msg Type: <b>UINT</b>
     * 
     * The message to be sent.
     * 
     * For lists of the system-provided messages, see <a href="https://docs.microsoft.com/windows/desktop/winmsg/about-messages-and-message-queues">System-Defined Messages</a>.
     * @param {WPARAM} wParam Type: <b>WPARAM</b>
     * 
     * Additional message-specific information.
     * @param {LPARAM} lParam Type: <b>LPARAM</b>
     * 
     * Additional message-specific information.
     * @returns {Integer} Type: <b>long</b>
     * 
     * If the function succeeds, the return value is a positive value.
     * 
     * If the function is unable to broadcast the message, the return value is –1.
     * 
     * If the <i>dwFlags</i> parameter is <b>BSF_QUERY</b> and at least one recipient returned <b>BROADCAST_QUERY_DENY</b> to the corresponding message, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-broadcastsystemmessagea
     */
    static BroadcastSystemMessageA(flags, lpInfo, Msg, wParam, lParam) {
        lpInfoMarshal := lpInfo is VarRef ? "uint*" : "ptr"

        result := DllCall("USER32.dll\BroadcastSystemMessageA", "uint", flags, lpInfoMarshal, lpInfo, "uint", Msg, "ptr", wParam, "ptr", lParam, "int")
        return result
    }

    /**
     * Sends a message to the specified recipients.
     * @param {Integer} flags Type: <b>DWORD</b>
     * @param {Pointer<Integer>} lpInfo Type: <b>LPDWORD</b>
     * 
     * A pointer to a variable that contains and receives information about the recipients of the message. 
     *                     
     * 
     * When the function returns, this variable receives a combination of these values identifying which recipients actually received the message. 
     * 
     * If this parameter is <b>NULL</b>, the function broadcasts to all components.
     * @param {Integer} Msg Type: <b>UINT</b>
     * 
     * The message to be sent. 
     * 
     * For lists of the system-provided messages, see <a href="https://docs.microsoft.com/windows/desktop/winmsg/about-messages-and-message-queues">System-Defined Messages</a>.
     * @param {WPARAM} wParam Type: <b>WPARAM</b>
     * 
     * Additional message-specific information.
     * @param {LPARAM} lParam Type: <b>LPARAM</b>
     * 
     * Additional message-specific information.
     * @returns {Integer} Type: <b>long</b>
     * 
     * If the function succeeds, the return value is a positive value.
     * 
     * If the function is unable to broadcast the message, the return value is –1. 
     * 
     * If the <i>dwFlags</i> parameter is <b>BSF_QUERY</b> and at least one recipient returned <b>BROADCAST_QUERY_DENY</b> to the corresponding message, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-broadcastsystemmessagew
     * @since windows5.0
     */
    static BroadcastSystemMessageW(flags, lpInfo, Msg, wParam, lParam) {
        lpInfoMarshal := lpInfo is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\BroadcastSystemMessageW", "uint", flags, lpInfoMarshal, lpInfo, "uint", Msg, "ptr", wParam, "ptr", lParam, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

;@endregion Methods
}
