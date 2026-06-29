#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the format of the Winlogon version 1.1 function dispatch passed to your GINA DLL in the WlxInitialize call.
 * @see https://learn.microsoft.com/windows/win32/api/winwlx/ns-winwlx-wlx_dispatch_version_1_1
 * @namespace Windows.Win32.Security.WinWlx
 */
export default struct WLX_DISPATCH_VERSION_1_1 {
    #StructPack 8

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_use_ctrl_alt_del">WlxUseCtrlAltDel</a> function.
     */
    WlxUseCtrlAltDel : IntPtr

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_set_context_pointer">WlxSetContextPointer</a> function.
     */
    WlxSetContextPointer : IntPtr

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_sas_notify">WlxSasNotify</a> function.
     */
    WlxSasNotify : IntPtr

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_set_timeout">WlxSetTimeout</a> function.
     */
    WlxSetTimeout : IntPtr

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_assign_shell_protection">WlxAssignShellProtection</a> function.
     */
    WlxAssignShellProtection : IntPtr

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_message_box">WlxMessageBox</a> function.
     */
    WlxMessageBox : IntPtr

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_dialog_box">WlxDialogBox</a> function.
     */
    WlxDialogBox : IntPtr

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_dialog_box_param">WlxDialogBoxParam</a> function.
     */
    WlxDialogBoxParam : IntPtr

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_dialog_box_indirect">WlxDialogBoxIndirect</a> function.
     */
    WlxDialogBoxIndirect : IntPtr

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_dialog_box_indirect_param">WlxDialogBoxIndirectParam</a> function.
     */
    WlxDialogBoxIndirectParam : IntPtr

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_switch_desktop_to_user">WlxSwitchDesktopToUser</a> function.
     */
    WlxSwitchDesktopToUser : IntPtr

    /**
     * Pointer to a  <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_switch_desktop_to_winlogon">WlxSwitchDesktopToWinlogon</a> function.
     */
    WlxSwitchDesktopToWinlogon : IntPtr

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_change_password_notify">WlxChangePasswordNotify</a> function.
     */
    WlxChangePasswordNotify : IntPtr

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_get_source_desktop">WlxGetSourceDesktop</a> function.
     */
    WlxGetSourceDesktop : IntPtr

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_set_return_desktop">WlxSetReturnDesktop</a> function.
     */
    WlxSetReturnDesktop : IntPtr

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_create_user_desktop">WlxCreateUserDesktop</a> function.
     */
    WlxCreateUserDesktop : IntPtr

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_change_password_notify_ex">WlxChangePasswordNotifyEx</a> function.
     */
    WlxChangePasswordNotifyEx : IntPtr

}
