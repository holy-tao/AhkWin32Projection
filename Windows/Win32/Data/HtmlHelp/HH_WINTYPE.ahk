#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * Use this structure to specify or modify the attributes of a window type.
 * @remarks
 * Window types can be defined by an author in a project (.hhp) file, or they can be defined programmatically using the HTML Help API.
  * 
  * When a <b>HH_WINTYPE</b> structure is passed to <b>HtmlHelp()</b> using the <b>HH_SET_WIN_TYPE</b> command, the HTML Help API makes a private copy of the contents of the structure. The help developer is therefore responsible for freeing memory used by the <b>HH_WINTYPE</b> structure or character arrays within it. The help developer can free memory after calling <b>HH_SET_WIN_TYPE</b>.
  * 
  * <h3><a id="Used_by"></a><a id="used_by"></a><a id="USED_BY"></a>Used by</h3>
  * <ul>
  * <li>
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/htmlhelp/hh-set-win-type-command">HH_SET_WIN_TYPE</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/htmlhelp/hh-get-win-type-command">HH_GET_WIN_TYPE</a>
  * </li>
  * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/htmlhelp/ns-htmlhelp-hh_wintype
 * @namespace Windows.Win32.Data.HtmlHelp
 * @version v4.0.30319
 */
class HH_WINTYPE extends Win32Struct
{
    static sizeof => 280

    static packingSize => 8

    /**
     * Specifies the size of the structure. This value must always be filled in before passing the structure to HtmlHelp().
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Specifies whether the strings used in this structure are UNICODE.
     * @type {Integer}
     */
    fUniCodeStrings {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A null-terminated string that specifies the name of the window type.
     * @type {Pointer<SByte>}
     */
    pszType {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Specifies which members in the structure are valid.
     * @type {Integer}
     */
    fsValidMembers {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies the properties of the window, such as whether it is the standard HTML Help Viewer or whether it includes a Search tab.
     * @type {Integer}
     */
    fsWinProperties {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * A null-terminated string that specifies the caption to display in the title bar of the window.
     * @type {Pointer<SByte>}
     */
    pszCaption {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Specifies the styles used to create the window. These styles can be ignored, combined with extended styles, or used exclusively depending on the value of the <i>fsValidMembers</i> and <i>fsWinProperties</i> parameters.
     * @type {Integer}
     */
    dwStyles {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Specifies the extended styles used to create the window. These styles can be ignored, combined with default styles, or used exclusively depending on the value of the <i>fsValidMembers</i> and <i>fsWinProperties</i> parameters.
     * @type {Integer}
     */
    dwExStyles {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Specifies the coordinates of the window in pixels. The values are read in the following order: 
     * 
     * 
     * <i>rcWindowPos</i> = {left, top, right, bottom};
     * @type {RECT}
     */
    rcWindowPos{
        get {
            if(!this.HasProp("__rcWindowPos"))
                this.__rcWindowPos := RECT(this.ptr + 40)
            return this.__rcWindowPos
        }
    }

    /**
     * Specifies the initial display state of the window. Valid values are the same as those for the Win32 API <b>ShowWindow</b> function.
     * @type {Integer}
     */
    nShowState {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * Specifies the handle of the window if the window has been created.
     * @type {Pointer<HWND>}
     */
    hwndHelp {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Specifies the window that will receive HTML Help notification messages. <a href="https://docs.microsoft.com/previous-versions/windows/desktop/htmlhelp/about-notification-messages">Notification messages</a> are sent via Windows <b>WM_NOTIFY</b> messages.
     * @type {Pointer<HWND>}
     */
    hwndCaller {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Pointer to an array of Information Types.
     * @type {Pointer<UInt32>}
     */
    paInfoTypes {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Specifies the handle of the toolbar.
     * @type {Pointer<HWND>}
     */
    hwndToolBar {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Specifies the handle of the Navigation pane.
     * @type {Pointer<HWND>}
     */
    hwndNavigation {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * Specifies the handle of the Topic pane, which hosts Shdocvw.dll.
     * @type {Pointer<HWND>}
     */
    hwndHTML {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * Specifies the width of the Navigation pane when the Help Viewer is expanded.
     * @type {Integer}
     */
    iNavWidth {
        get => NumGet(this, 112, "int")
        set => NumPut("int", value, this, 112)
    }

    /**
     * Specifies the coordinates of the Topic pane.
     * @type {RECT}
     */
    rcHTML{
        get {
            if(!this.HasProp("__rcHTML"))
                this.__rcHTML := RECT(this.ptr + 120)
            return this.__rcHTML
        }
    }

    /**
     * Specifies the contents (.hhc) file to display in the Navigation pane.
     * @type {Pointer<SByte>}
     */
    pszToc {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * Specifies the index (.hhk) file to display in the Navigation pane.
     * @type {Pointer<SByte>}
     */
    pszIndex {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }

    /**
     * Specifies the default HTML file to display in the Topic pane.
     * @type {Pointer<SByte>}
     */
    pszFile {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * Specifies the file or URL to display in the Topic pane when the Home button is clicked. 
     * 
     * 
     * Specifies which buttons to include on the toolbar.
     * @type {Pointer<SByte>}
     */
    pszHome {
        get => NumGet(this, 160, "ptr")
        set => NumPut("ptr", value, this, 160)
    }

    /**
     * Specifies which buttons to include on the Toolbar pane of a three-pane Help Viewer.
     * @type {Integer}
     */
    fsToolBarFlags {
        get => NumGet(this, 168, "uint")
        set => NumPut("uint", value, this, 168)
    }

    /**
     * Specifies that the Help Viewer open with the Navigation pane closed.
     * @type {Integer}
     */
    fNotExpanded {
        get => NumGet(this, 172, "int")
        set => NumPut("int", value, this, 172)
    }

    /**
     * Specifies the default tab to display on the Navigation pane.
     * @type {Integer}
     */
    curNavType {
        get => NumGet(this, 176, "int")
        set => NumPut("int", value, this, 176)
    }

    /**
     * Specifies where to place the tabs on the Navigation pane of the HTML Help Viewer.
     * @type {Integer}
     */
    tabpos {
        get => NumGet(this, 180, "int")
        set => NumPut("int", value, this, 180)
    }

    /**
     * Specifies a non-zero ID for enabling HTML Help notification messages. This ID is passed as the wParam value of Windows <b>WM_NOTIFY</b> messages.
     * @type {Integer}
     */
    idNotify {
        get => NumGet(this, 184, "int")
        set => NumPut("int", value, this, 184)
    }

    /**
     * Tab order: Contents, Index, Search, History, Favorites, Reserved 1-5, Custom tabs
     * @type {Array<Byte>}
     */
    tabOrder{
        get {
            if(!this.HasProp("__tabOrderProxyArray"))
                this.__tabOrderProxyArray := Win32FixedArray(this.ptr + 188, 20, Primitive, "char")
            return this.__tabOrderProxyArray
        }
    }

    /**
     * Number of history items to keep.  (Default: 30)
     * @type {Integer}
     */
    cHistory {
        get => NumGet(this, 208, "int")
        set => NumPut("int", value, this, 208)
    }

    /**
     * Specifies the text to display underneath the Jump1 button.
     * @type {Pointer<SByte>}
     */
    pszJump1 {
        get => NumGet(this, 216, "ptr")
        set => NumPut("ptr", value, this, 216)
    }

    /**
     * Specifies the text to display underneath the Jump2 button.
     * @type {Pointer<SByte>}
     */
    pszJump2 {
        get => NumGet(this, 224, "ptr")
        set => NumPut("ptr", value, this, 224)
    }

    /**
     * Specifies the URL to jump to when the Jump1 button is clicked.
     * @type {Pointer<SByte>}
     */
    pszUrlJump1 {
        get => NumGet(this, 232, "ptr")
        set => NumPut("ptr", value, this, 232)
    }

    /**
     * Specifies the URL to jump to when the Jump2 button is clicked.
     * @type {Pointer<SByte>}
     */
    pszUrlJump2 {
        get => NumGet(this, 240, "ptr")
        set => NumPut("ptr", value, this, 240)
    }

    /**
     * Minimum size for window (ignored in version 1).
     * @type {RECT}
     */
    rcMinSize{
        get {
            if(!this.HasProp("__rcMinSize"))
                this.__rcMinSize := RECT(this.ptr + 248)
            return this.__rcMinSize
        }
    }

    /**
     * Size of <i>paInfoTypes</i>
     * @type {Integer}
     */
    cbInfoTypes {
        get => NumGet(this, 264, "int")
        set => NumPut("int", value, this, 264)
    }

    /**
     * Series of zero-terminated strings to be used as tab labels.
     * @type {Pointer<SByte>}
     */
    pszCustomTabs {
        get => NumGet(this, 272, "ptr")
        set => NumPut("ptr", value, this, 272)
    }
}
