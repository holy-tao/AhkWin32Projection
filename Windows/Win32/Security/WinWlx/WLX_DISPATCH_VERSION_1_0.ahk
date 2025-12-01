#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the format of the Winlogon version 1.0 function dispatch table passed to your GINA DLL in the WlxInitialize call.
 * @see https://learn.microsoft.com/windows/win32/api/winwlx/ns-winwlx-wlx_dispatch_version_1_0
 * @namespace Windows.Win32.Security.WinWlx
 * @version v4.0.30319
 */
class WLX_DISPATCH_VERSION_1_0 extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_use_ctrl_alt_del">WlxUseCtrlAltDel</a> function.
     * @type {Pointer<PWLX_USE_CTRL_ALT_DEL>}
     */
    WlxUseCtrlAltDel {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_set_context_pointer">WlxSetContextPointer</a> function.
     * @type {Pointer<PWLX_SET_CONTEXT_POINTER>}
     */
    WlxSetContextPointer {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_sas_notify">WlxSasNotify</a> function.
     * @type {Pointer<PWLX_SAS_NOTIFY>}
     */
    WlxSasNotify {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_set_timeout">WlxSetTimeout</a> function.
     * @type {Pointer<PWLX_SET_TIMEOUT>}
     */
    WlxSetTimeout {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_assign_shell_protection">WlxAssignShellProtection</a> function.
     * @type {Pointer<PWLX_ASSIGN_SHELL_PROTECTION>}
     */
    WlxAssignShellProtection {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_message_box">WlxMessageBox</a> function.
     * @type {Pointer<PWLX_MESSAGE_BOX>}
     */
    WlxMessageBox {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_dialog_box">WlxDialogBox</a> function.
     * @type {Pointer<PWLX_DIALOG_BOX>}
     */
    WlxDialogBox {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_dialog_box_param">WlxDialogBoxParam</a> function.
     * @type {Pointer<PWLX_DIALOG_BOX_PARAM>}
     */
    WlxDialogBoxParam {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_dialog_box_indirect">WlxDialogBoxIndirect</a> function.
     * @type {Pointer<PWLX_DIALOG_BOX_INDIRECT>}
     */
    WlxDialogBoxIndirect {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_dialog_box_indirect_param">WlxDialogBoxIndirectParam</a> function.
     * @type {Pointer<PWLX_DIALOG_BOX_INDIRECT_PARAM>}
     */
    WlxDialogBoxIndirectParam {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_switch_desktop_to_user">WlxSwitchDesktopToUser</a> function.
     * @type {Pointer<PWLX_SWITCH_DESKTOP_TO_USER>}
     */
    WlxSwitchDesktopToUser {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Pointer to a  <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_switch_desktop_to_winlogon">WlxSwitchDesktopToWinlogon</a> function.
     * @type {Pointer<PWLX_SWITCH_DESKTOP_TO_WINLOGON>}
     */
    WlxSwitchDesktopToWinlogon {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_change_password_notify">WlxChangePasswordNotify</a> function.
     * @type {Pointer<PWLX_CHANGE_PASSWORD_NOTIFY>}
     */
    WlxChangePasswordNotify {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }
}
