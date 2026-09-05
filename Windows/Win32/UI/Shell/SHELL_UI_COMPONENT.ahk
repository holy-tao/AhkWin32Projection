#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies the type of UI component that is needed in the shell.
 * @see https://learn.microsoft.com/windows/win32/api/shellscalingapi/ne-shellscalingapi-shell_ui_component
 * @namespace Windows.Win32.UI.Shell
 */
class SHELL_UI_COMPONENT extends Win32Enum {

    /**
     * This UI component is a taskbar icon.
     * Native name: SHELL_UI_COMPONENT_TASKBARS
     * @type {Integer (Int32)}
     */
    static TASKBARS => 0

    /**
     * This UI component is an icon in the notification area.
     * Native name: SHELL_UI_COMPONENT_NOTIFICATIONAREA
     * @type {Integer (Int32)}
     */
    static NOTIFICATIONAREA => 1

    /**
     * This UI component is a deskband icon.
     * Native name: SHELL_UI_COMPONENT_DESKBAND
     * @type {Integer (Int32)}
     */
    static DESKBAND => 2
}
