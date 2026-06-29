#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicate flags used by IExplorerPaneVisibility::GetPaneState to get the current state of the given Windows Explorer pane.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_explorerpanestate
 * @namespace Windows.Win32.UI.Shell
 */
export default struct _EXPLORERPANESTATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Do not make any modifications to the pane.
     * @type {Integer (Int32)}
     */
    static EPS_DONTCARE => 0

    /**
     * Set the default state of the pane to "on", but respect any user-modified persisted state.
     * @type {Integer (Int32)}
     */
    static EPS_DEFAULT_ON => 1

    /**
     * Set the default state of the pane to "off".
     * @type {Integer (Int32)}
     */
    static EPS_DEFAULT_OFF => 2

    /**
     * Unused.
     * @type {Integer (Int32)}
     */
    static EPS_STATEMASK => 65535

    /**
     * Ignore any persisted state from the user, but the user can still modify the state.
     * @type {Integer (Int32)}
     */
    static EPS_INITIALSTATE => 65536

    /**
     * Users cannot modify the state, that is, they do not have the ability to show or hide the given pane. This option implies EPS_INITIALSTATE.
     * @type {Integer (Int32)}
     */
    static EPS_FORCE => 131072
}
