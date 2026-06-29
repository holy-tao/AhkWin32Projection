#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Identifies the type of UI component that is needed in the shell.
 * @see https://learn.microsoft.com/windows/win32/api/shellscalingapi/ne-shellscalingapi-shell_ui_component
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SHELL_UI_COMPONENT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
