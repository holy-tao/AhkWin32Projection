#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PWLX_GET_OPTION.ahk" { PWLX_GET_OPTION }
#Import ".\PWLX_QUERY_TERMINAL_SERVICES_DATA.ahk" { PWLX_QUERY_TERMINAL_SERVICES_DATA }
#Import ".\PWLX_SWITCH_DESKTOP_TO_USER.ahk" { PWLX_SWITCH_DESKTOP_TO_USER }
#Import ".\PWLX_ASSIGN_SHELL_PROTECTION.ahk" { PWLX_ASSIGN_SHELL_PROTECTION }
#Import ".\PWLX_DIALOG_BOX_INDIRECT.ahk" { PWLX_DIALOG_BOX_INDIRECT }
#Import ".\PWLX_DISCONNECT.ahk" { PWLX_DISCONNECT }
#Import ".\PWLX_SAS_NOTIFY.ahk" { PWLX_SAS_NOTIFY }
#Import ".\PWLX_GET_SOURCE_DESKTOP.ahk" { PWLX_GET_SOURCE_DESKTOP }
#Import ".\PWLX_DIALOG_BOX.ahk" { PWLX_DIALOG_BOX }
#Import ".\PWLX_CHANGE_PASSWORD_NOTIFY.ahk" { PWLX_CHANGE_PASSWORD_NOTIFY }
#Import ".\PWLX_QUERY_TS_LOGON_CREDENTIALS.ahk" { PWLX_QUERY_TS_LOGON_CREDENTIALS }
#Import ".\PWLX_QUERY_IC_CREDENTIALS.ahk" { PWLX_QUERY_IC_CREDENTIALS }
#Import ".\PWLX_SET_TIMEOUT.ahk" { PWLX_SET_TIMEOUT }
#Import ".\PWLX_CREATE_USER_DESKTOP.ahk" { PWLX_CREATE_USER_DESKTOP }
#Import ".\PWLX_CHANGE_PASSWORD_NOTIFY_EX.ahk" { PWLX_CHANGE_PASSWORD_NOTIFY_EX }
#Import ".\PWLX_MESSAGE_BOX.ahk" { PWLX_MESSAGE_BOX }
#Import ".\PWLX_SET_RETURN_DESKTOP.ahk" { PWLX_SET_RETURN_DESKTOP }
#Import ".\PWLX_DIALOG_BOX_INDIRECT_PARAM.ahk" { PWLX_DIALOG_BOX_INDIRECT_PARAM }
#Import ".\PWLX_CLOSE_USER_DESKTOP.ahk" { PWLX_CLOSE_USER_DESKTOP }
#Import ".\PWLX_QUERY_CONSOLESWITCH_CREDENTIALS.ahk" { PWLX_QUERY_CONSOLESWITCH_CREDENTIALS }
#Import ".\PWLX_WIN31_MIGRATE.ahk" { PWLX_WIN31_MIGRATE }
#Import ".\PWLX_USE_CTRL_ALT_DEL.ahk" { PWLX_USE_CTRL_ALT_DEL }
#Import ".\PWLX_QUERY_CLIENT_CREDENTIALS.ahk" { PWLX_QUERY_CLIENT_CREDENTIALS }
#Import ".\PWLX_SET_CONTEXT_POINTER.ahk" { PWLX_SET_CONTEXT_POINTER }
#Import ".\PWLX_DIALOG_BOX_PARAM.ahk" { PWLX_DIALOG_BOX_PARAM }
#Import ".\PWLX_SWITCH_DESKTOP_TO_WINLOGON.ahk" { PWLX_SWITCH_DESKTOP_TO_WINLOGON }
#Import ".\PWLX_SET_OPTION.ahk" { PWLX_SET_OPTION }

/**
 * Defines the format of the Winlogon version 1.4 function dispatch table passed to the GINA DLL in the WlxInitialize call.
 * @see https://learn.microsoft.com/windows/win32/api/winwlx/ns-winwlx-wlx_dispatch_version_1_4
 * @namespace Windows.Win32.Security.WinWlx
 */
export default struct WLX_DISPATCH_VERSION_1_4 {
    #StructPack 8

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_use_ctrl_alt_del">WlxUseCtrlAltDel</a> function.
     */
    WlxUseCtrlAltDel : PWLX_USE_CTRL_ALT_DEL

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_set_context_pointer">WlxSetContextPointer</a> function.
     */
    WlxSetContextPointer : PWLX_SET_CONTEXT_POINTER

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_sas_notify">WlxSasNotify</a> function.
     */
    WlxSasNotify : PWLX_SAS_NOTIFY

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_set_timeout">WlxSetTimeout</a> function.
     */
    WlxSetTimeout : PWLX_SET_TIMEOUT

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_assign_shell_protection">WlxAssignShellProtection</a> function.
     */
    WlxAssignShellProtection : PWLX_ASSIGN_SHELL_PROTECTION

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_message_box">WlxMessageBox</a> function.
     */
    WlxMessageBox : PWLX_MESSAGE_BOX

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_dialog_box">WlxDialogBox</a> function.
     */
    WlxDialogBox : PWLX_DIALOG_BOX

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_dialog_box_param">WlxDialogBoxParam</a> function.
     */
    WlxDialogBoxParam : PWLX_DIALOG_BOX_PARAM

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_dialog_box_indirect">WlxDialogBoxIndirect</a> function.
     */
    WlxDialogBoxIndirect : PWLX_DIALOG_BOX_INDIRECT

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_dialog_box_indirect_param">WlxDialogBoxIndirectParam</a> function.
     */
    WlxDialogBoxIndirectParam : PWLX_DIALOG_BOX_INDIRECT_PARAM

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_switch_desktop_to_user">WlxSwitchDesktopToUser</a> function.
     */
    WlxSwitchDesktopToUser : PWLX_SWITCH_DESKTOP_TO_USER

    /**
     * Pointer to a  <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_switch_desktop_to_winlogon">WlxSwitchDesktopToWinlogon</a> function.
     */
    WlxSwitchDesktopToWinlogon : PWLX_SWITCH_DESKTOP_TO_WINLOGON

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_change_password_notify">WlxChangePasswordNotify</a> function.
     */
    WlxChangePasswordNotify : PWLX_CHANGE_PASSWORD_NOTIFY

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_get_source_desktop">WlxGetSourceDesktop</a> function.
     */
    WlxGetSourceDesktop : PWLX_GET_SOURCE_DESKTOP

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_set_return_desktop">WlxSetReturnDesktop</a> function.
     */
    WlxSetReturnDesktop : PWLX_SET_RETURN_DESKTOP

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_create_user_desktop">WlxCreateUserDesktop</a> function.
     */
    WlxCreateUserDesktop : PWLX_CREATE_USER_DESKTOP

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_change_password_notify_ex">WlxChangePasswordNotifyEx</a> function.
     */
    WlxChangePasswordNotifyEx : PWLX_CHANGE_PASSWORD_NOTIFY_EX

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_close_user_desktop">WlxCloseUserDesktop</a> function.
     */
    WlxCloseUserDesktop : PWLX_CLOSE_USER_DESKTOP

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_set_option">WlxSetOption</a> function.
     */
    WlxSetOption : PWLX_SET_OPTION

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_get_option">WlxGetOption</a> function.
     */
    WlxGetOption : PWLX_GET_OPTION

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_win31_migrate">WlxWin31Migrate</a> function.
     */
    WlxWin31Migrate : PWLX_WIN31_MIGRATE

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_query_client_credentials">WlxQueryClientCredentials</a> function.
     */
    WlxQueryClientCredentials : PWLX_QUERY_CLIENT_CREDENTIALS

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_query_ic_credentials">WlxQueryInetConnectorCredentials</a> function.
     */
    WlxQueryInetConnectorCredentials : PWLX_QUERY_IC_CREDENTIALS

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_disconnect">WlxDisconnect</a> function.
     */
    WlxDisconnect : PWLX_DISCONNECT

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_query_terminal_services_data">WlxQueryTerminalServicesData</a> function.
     */
    WlxQueryTerminalServicesData : PWLX_QUERY_TERMINAL_SERVICES_DATA

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_query_consoleswitch_credentials">WlxQueryConsoleSwitchCredentials</a> function.
     */
    WlxQueryConsoleSwitchCredentials : PWLX_QUERY_CONSOLESWITCH_CREDENTIALS

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_query_ts_logon_credentials">WlxQueryTsLogonCredentials</a> function.
     */
    WlxQueryTsLogonCredentials : PWLX_QUERY_TS_LOGON_CREDENTIALS

}
