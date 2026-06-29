#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used with the IBrowserService2::_UIActivateView method to set the state of a browser view.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-svuia_status
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SVUIA_STATUS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The browser view has been deactivated.
     * @type {Integer (Int32)}
     */
    static SVUIA_DEACTIVATE => 0

    /**
     * The browser view is activated and does not have focus.
     * @type {Integer (Int32)}
     */
    static SVUIA_ACTIVATE_NOFOCUS => 1

    /**
     * The browser view is activated and has focus.
     * @type {Integer (Int32)}
     */
    static SVUIA_ACTIVATE_FOCUS => 2

    /**
     * The browser view is activated in place.
     * @type {Integer (Int32)}
     */
    static SVUIA_INPLACEACTIVATE => 3
}
