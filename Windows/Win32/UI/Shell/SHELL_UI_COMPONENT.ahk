#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies the type of UI component that is needed in the shell.
 * @see https://docs.microsoft.com/windows/win32/api//shellscalingapi/ne-shellscalingapi-shell_ui_component
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SHELL_UI_COMPONENT{

    /**
     * This UI component is a taskbar icon.
     * @type {Integer (Int32)}
     */
    static SHELL_UI_COMPONENT_TASKBARS => 0

    /**
     * This UI component is an icon in the notification area.
     * @type {Integer (Int32)}
     */
    static SHELL_UI_COMPONENT_NOTIFICATIONAREA => 1

    /**
     * This UI component is a deskband icon.
     * @type {Integer (Int32)}
     */
    static SHELL_UI_COMPONENT_DESKBAND => 2
}
