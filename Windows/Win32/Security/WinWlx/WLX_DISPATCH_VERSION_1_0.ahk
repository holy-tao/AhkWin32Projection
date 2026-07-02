#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PWLX_SWITCH_DESKTOP_TO_USER.ahk" { PWLX_SWITCH_DESKTOP_TO_USER }
#Import ".\PWLX_USE_CTRL_ALT_DEL.ahk" { PWLX_USE_CTRL_ALT_DEL }
#Import ".\PWLX_SET_TIMEOUT.ahk" { PWLX_SET_TIMEOUT }
#Import ".\PWLX_CHANGE_PASSWORD_NOTIFY.ahk" { PWLX_CHANGE_PASSWORD_NOTIFY }
#Import ".\PWLX_MESSAGE_BOX.ahk" { PWLX_MESSAGE_BOX }
#Import ".\PWLX_DIALOG_BOX_PARAM.ahk" { PWLX_DIALOG_BOX_PARAM }
#Import ".\PWLX_SAS_NOTIFY.ahk" { PWLX_SAS_NOTIFY }
#Import ".\PWLX_SWITCH_DESKTOP_TO_WINLOGON.ahk" { PWLX_SWITCH_DESKTOP_TO_WINLOGON }
#Import ".\PWLX_DIALOG_BOX.ahk" { PWLX_DIALOG_BOX }
#Import ".\PWLX_DIALOG_BOX_INDIRECT_PARAM.ahk" { PWLX_DIALOG_BOX_INDIRECT_PARAM }
#Import ".\PWLX_DIALOG_BOX_INDIRECT.ahk" { PWLX_DIALOG_BOX_INDIRECT }
#Import ".\PWLX_SET_CONTEXT_POINTER.ahk" { PWLX_SET_CONTEXT_POINTER }
#Import ".\PWLX_ASSIGN_SHELL_PROTECTION.ahk" { PWLX_ASSIGN_SHELL_PROTECTION }

/**
 * Defines the format of the Winlogon version 1.0 function dispatch table passed to your GINA DLL in the WlxInitialize call.
 * @see https://learn.microsoft.com/windows/win32/api/winwlx/ns-winwlx-wlx_dispatch_version_1_0
 * @namespace Windows.Win32.Security.WinWlx
 */
export default struct WLX_DISPATCH_VERSION_1_0 {
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

}
