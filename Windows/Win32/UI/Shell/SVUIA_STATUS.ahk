#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used with the IBrowserService2::_UIActivateView method to set the state of a browser view.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-svuia_status
 * @namespace Windows.Win32.UI.Shell
 */
class SVUIA_STATUS extends Win32Enum {

    /**
     * The browser view has been deactivated.
     * Native name: SVUIA_DEACTIVATE
     * @type {Integer (Int32)}
     */
    static DEACTIVATE => 0

    /**
     * The browser view is activated and does not have focus.
     * Native name: SVUIA_ACTIVATE_NOFOCUS
     * @type {Integer (Int32)}
     */
    static ACTIVATE_NOFOCUS => 1

    /**
     * The browser view is activated and has focus.
     * Native name: SVUIA_ACTIVATE_FOCUS
     * @type {Integer (Int32)}
     */
    static ACTIVATE_FOCUS => 2

    /**
     * The browser view is activated in place.
     * Native name: SVUIA_INPLACEACTIVATE
     * @type {Integer (Int32)}
     */
    static INPLACEACTIVATE => 3
}
