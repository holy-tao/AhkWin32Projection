#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies options for finding window in the Shell windows collection.
 * @see https://docs.microsoft.com/windows/win32/api//exdisp/ne-exdisp-shellwindowfindwindowoptions
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ShellWindowFindWindowOptions{

    /**
     * The window must have an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface.
     * @type {Integer (Int32)}
     */
    static SWFO_NEEDDISPATCH => 1

    /**
     * Include windows that were registered with <a href="https://docs.microsoft.com/windows/desktop/api/exdisp/nf-exdisp-ishellwindows-registerpending">IShellWindows::RegisterPending</a>.
     * @type {Integer (Int32)}
     */
    static SWFO_INCLUDEPENDING => 2

    /**
     * Causes <a href="https://docs.microsoft.com/windows/desktop/api/exdisp/nf-exdisp-ishellwindows-findwindowsw">IShellWindows::FindWindowSW</a> to interpret <i>pvarLoc</i>  as a cookie rather than a PIDL.
     * @type {Integer (Int32)}
     */
    static SWFO_COOKIEPASSED => 4
}
