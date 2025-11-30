#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Flags used by INewWindowManager::EvaluateNewWindow. These values are factors in the decision of whether to display a pop-up window.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/ne-shobjidl_core-nwmf
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class NWMF extends Win32BitflagEnum{

    /**
     * The page is unloading. This flag is set in response to the <a href="https://docs.microsoft.com/previous-versions/aa741480(v=vs.85)">onbeforeunload</a> and <a href="https://docs.microsoft.com/previous-versions/aa741488(v=vs.85)">onunload</a> events. Some pages load pop-up windows when you leave them, not when you enter. This flag is used to identify those situations.
     * @type {Integer (Int32)}
     */
    static NWMF_UNLOADING => 1

    /**
     * The call to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-inewwindowmanager-evaluatenewwindow">INewWindowManager::EvaluateNewWindow</a> is the result of a user-initiated action (a mouse click or key press). Use this flag in conjunction with the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-nwmf">NWMF_FIRST_USERINITED</a> flag to determine whether the call is a direct or indirect result of the user-initiated action.
     * @type {Integer (Int32)}
     */
    static NWMF_USERINITED => 2

    /**
     * When <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-nwmf">NWMF_USERINITED</a> is present, this flag indicates that the call to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-inewwindowmanager-evaluatenewwindow">INewWindowManager::EvaluateNewWindow</a> is the first query that results from this user-initiated action. Always use this flag in conjunction with <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-nwmf">NWMF_USERINITED</a>.
     * @type {Integer (Int32)}
     */
    static NWMF_FIRST => 4

    /**
     * The override key (ALT) was pressed. The override key is used to bypass the pop-up manager—allowing all pop-up windows to display—and must be held down at the time that <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-inewwindowmanager-evaluatenewwindow">INewWindowManager::EvaluateNewWindow</a> is called. 
     *             
     *                 
     * 
     * <div class="alert"><b>Note</b>  When <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-inewwindowmanager-evaluatenewwindow">INewWindowManager::EvaluateNewWindow</a> is implemented for a <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa752040(v=vs.85)">WebBrowser</a> control host, the implementer can choose to ignore the override key.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static NWMF_OVERRIDEKEY => 8

    /**
     * The new window attempting to load is the result of a call to the <a href="https://developer.mozilla.org/en-US/docs/Web/API/Window">showHelp</a> method. Help is sometimes displayed in a separate window, and this flag is valuable in those cases.
     * @type {Integer (Int32)}
     */
    static NWMF_SHOWHELP => 16

    /**
     * The new window is a dialog box that displays HTML content.
     * @type {Integer (Int32)}
     */
    static NWMF_HTMLDIALOG => 32

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-inewwindowmanager-evaluatenewwindow">EvaluateNewWindow</a> method is being called from an HTML dialog. The new window should not show the UI in the parent window.
     * @type {Integer (Int32)}
     */
    static NWMF_FROMDIALOGCHILD => 64

    /**
     * The new windows was definitely requested by the user, either by selecting Open in New Window from a context menu or pressing Shift and clicking a link.
     * @type {Integer (Int32)}
     */
    static NWMF_USERREQUESTED => 128

    /**
     * The call to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-inewwindowmanager-evaluatenewwindow">EvaluateNewWindow</a> method is the result of the user requesting a replay that resulted in a refresh.
     * @type {Integer (Int32)}
     */
    static NWMF_USERALLOWED => 256

    /**
     * The new window should be forced to open in a new window rather than a tab.
     * @type {Integer (Int32)}
     */
    static NWMF_FORCEWINDOW => 65536

    /**
     * The new window should be forced to open in a new tab.
     * @type {Integer (Int32)}
     */
    static NWMF_FORCETAB => 131072

    /**
     * The new window should open in a new tab unless <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-nwmf">NWMF_FORCEtab</a> is also present, indicating that user wants the window to open as a window.
     * @type {Integer (Int32)}
     */
    static NWMF_SUGGESTWINDOW => 262144

    /**
     * The new window should open in a new tab unless <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-nwmf">NWMF_FORCEWINDOW</a> is also present, indicating that user wants the window to open as a window.
     * @type {Integer (Int32)}
     */
    static NWMF_SUGGESTTAB => 524288

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-inewwindowmanager-evaluatenewwindow">EvaluateNewWindow</a> method is being called from an inactive tab.
     * @type {Integer (Int32)}
     */
    static NWMF_INACTIVETAB => 1048576
}
