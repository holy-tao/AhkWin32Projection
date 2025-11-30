#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies which standard command is to be executed. A single value from this enumeration is passed in the nCmdID argument of IOleCommandTarget::Exec.
 * @remarks
 * 
 * In OLE Compound Documents technology, an object that is being edited in-place disables the <b>Zoom</b> control on its toolbar and the <b>Zoom</b> command on its <b>View</b> menu, because, the <b>Zoom</b> command applies logically to the container document, not to the object. The OLECMDID_ZOOM and OLECMDID_GETZOOMRANGE commands notify the container's frame object of the zoom range it should use to display a document object in its user interface. The container frame is the client-side object that implements <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleinplaceframe">IOleInPlaceFrame</a> and, optionally, <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nn-docobj-iolecommandtarget">IOleCommandTarget</a>.
 * 
 * 
 * 
 * The OLECMDID_ZOOM command takes one <b>LONG</b> argument as input and writes one <b>LONG</b> argument on output. This command is used for three purposes: 
 * 
 * 
 * 
 * <ul>
 * <li>To query the current zoom value. The caller of <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-iolecommandtarget-exec">IOleCommandTarget::Exec</a> passes OLECMDEXECOPT_DONTPROMPTUSER as the execute option in <i>nCmdExecOpt</i> and <b>NULL</b> for pvIn. The object returns the current zoom value in <i>pvaOut</i>. When the object goes UI active, it retrieves the current zoom value from the container's frame object using this same mechanism and updates its zoom control with the returned value. 
 * </li>
 * <li>To display the <b>Zoom</b> dialog box. The caller of <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-iolecommandtarget-exec">IOleCommandTarget::Exec</a> passes OLECMDEXECOPT_PROMPTUSER in <i>nCmdExecOpt</i>. The caller can optionally pass the initial value for the dialog box through <i>pvaIn</i>; otherwise <i>pvaIn</i> must be <b>NULL</b>. If the user clicks <b>Cancel</b>, the object returns OLECMDERR_E_CANCELED. If the user clicks <b>OK</b>, the object passes the user-selected value in <i>pvaOut</i>. When user chooses the <b>Zoom</b> command from the <b>View</b> menu, the object calls the container's frame object in the same manner. The container then zooms the document to the user selected value, and the object updates its <b>Zoom</b> control with that value.
 * </li>
 * <li>To set a <b>Zoom</b> value. The caller of <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-iolecommandtarget-exec">IOleCommandTarget::Exec</a> passes OLECMDEXECOPT_DONTPROMPTUSER in <i>nCmdExecOpt</i> and passes the zoom value to apply through <i>pvaIn</i>. The object validates and normalizes the new value and returns the validated value in <i>pvaOut</i>. When the user selects a new zoom value (using the <b>Zoom</b> control on the toolbar, for instance), the object calls the container's frame object in this manner. The container zooms the document to 100 percent, and the object updates the <b>Zoom</b> control with that value.</li>
 * </ul>
 * The OLECMDID_GETZOOMRANGE command is used to determine the range of valid zoom values from an object that implements <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nn-docobj-iolecommandtarget">IOleCommandTarget</a>. The caller passes MSOCMDEXECOPT_DONTPROMPTUSER in nCmdExecOpt and <b>NULL</b> for <i>pvaIn</i>. The object returns its zoom range in <i>pvaOut</i> where the HIWORD contains the maximum zoom value and the LOWORD contains the minimum zoom value. Typically this command is used when the user drops down the <b>Zoom</b> control on the toolbar of the UI-active object. The applications and objects that support this command are required to support all the integral zoom values that are within the (min,max) pair they return.
 * 
 * 
 * 
 * The OLECMDID_ACTIVEXINSTALLSCOPE command notifies Trident to use the indicated Install Scope to install the ActiveX Control specified by the indicated class ID. The Install Scope is passed in a VT_ARRAY in pvaIn of the <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-iolecommandtarget-exec">IOleCommandTarget::Exec</a> method whose elements are as follows.
 * 
 * <table>
 * <tr>
 * <th>Data</th>
 * <th>VARIANT Type</th>
 * <th>Index</th>
 * </tr>
 * <tr>
 * <td>Class ID</td>
 * <td>VT_BSTR</td>
 * <td>0</td>
 * </tr>
 * <tr>
 * <td>Install Scope</td>
 * <td>VT_UI4</td>
 * <td>1</td>
 * </tr>
 * </table>
 *  
 * 
 * The Install Scope must be one of the following values.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>INSTALL_SCOPE_USERS</td>
 * <td>The ActiveX control should register to HKCU and for the instant user only.
 * </td>
 * </tr>
 * <tr>
 * <td>INSTALL_SCOPE_MACHINE</td>
 * <td>The ActiveX control should register to HKLM and across the computer
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * The following is an example use of the OLECMDID_ACTIVEXINSTALLSCOPE command.
 * 
 * 
 * ```cpp
 * IOleCommandTarget::Exec(
 * NULL, // Pointer to command group
 * OLECMDARGINDEX_ACTIVEXINSTALL_INSTALLSCOPE, // ID of command to execute
 * NULL, // Options
 * &varArgs, // pvain pointer to input arguments
 * NULL) // pointer to command output
 * 
 * ```
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//docobj/ne-docobj-olecmdid
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class OLECMDID extends Win32Enum{

    /**
     * <b>File</b> menu, <b>Open</b> command
     * @type {Integer (Int32)}
     */
    static OLECMDID_OPEN => 1

    /**
     * <b>File</b> menu, <b>New</b> command
     * @type {Integer (Int32)}
     */
    static OLECMDID_NEW => 2

    /**
     * <b>File</b> menu, <b>Save</b> command
     * @type {Integer (Int32)}
     */
    static OLECMDID_SAVE => 3

    /**
     * <b>File</b> menu, <b>Save As</b> command
     * @type {Integer (Int32)}
     */
    static OLECMDID_SAVEAS => 4

    /**
     * <b>File</b> menu, <b>Save Copy As</b> command
     * @type {Integer (Int32)}
     */
    static OLECMDID_SAVECOPYAS => 5

    /**
     * <b>File</b> menu, <b>Print</b> command
     * @type {Integer (Int32)}
     */
    static OLECMDID_PRINT => 6

    /**
     * <b>File</b> menu, <b>Print Preview</b> command
     * @type {Integer (Int32)}
     */
    static OLECMDID_PRINTPREVIEW => 7

    /**
     * <b>File</b> menu, <b>Page Setup</b> command
     * @type {Integer (Int32)}
     */
    static OLECMDID_PAGESETUP => 8

    /**
     * <b>Tools</b> menu, <b>Spelling</b> command
     * @type {Integer (Int32)}
     */
    static OLECMDID_SPELL => 9

    /**
     * <b>File</b> menu, <b>Properties</b> command
     * @type {Integer (Int32)}
     */
    static OLECMDID_PROPERTIES => 10

    /**
     * <b>Edit</b> menu, <b>Cut</b> command
     * @type {Integer (Int32)}
     */
    static OLECMDID_CUT => 11

    /**
     * <b>Edit</b> menu, <b>Copy</b> command
     * @type {Integer (Int32)}
     */
    static OLECMDID_COPY => 12

    /**
     * <b>Edit</b> menu, <b>Paste</b> command
     * @type {Integer (Int32)}
     */
    static OLECMDID_PASTE => 13

    /**
     * <b>Edit</b> menu, <b>Paste Special</b> command
     * @type {Integer (Int32)}
     */
    static OLECMDID_PASTESPECIAL => 14

    /**
     * <b>Edit</b> menu, <b>Undo</b> command
     * @type {Integer (Int32)}
     */
    static OLECMDID_UNDO => 15

    /**
     * <b>Edit</b> menu, <b>Redo</b> command
     * @type {Integer (Int32)}
     */
    static OLECMDID_REDO => 16

    /**
     * <b>Edit</b> menu, <b>Select All</b> command
     * @type {Integer (Int32)}
     */
    static OLECMDID_SELECTALL => 17

    /**
     * <b>Edit</b> menu, <b>Clear</b> command
     * @type {Integer (Int32)}
     */
    static OLECMDID_CLEARSELECTION => 18

    /**
     * <b>View</b> menu, <b>Zoom</b> command (see below for details.)
     * @type {Integer (Int32)}
     */
    static OLECMDID_ZOOM => 19

    /**
     * Retrieves zoom range applicable to <b>View Zoom</b> (see below for details.)
     * @type {Integer (Int32)}
     */
    static OLECMDID_GETZOOMRANGE => 20

    /**
     * Informs the receiver, usually a frame, of state changes. The receiver can then query the status of the commands whenever convenient.
     * @type {Integer (Int32)}
     */
    static OLECMDID_UPDATECOMMANDS => 21

    /**
     * Asks the receiver to refresh its display. Implemented by the document/object.
     * @type {Integer (Int32)}
     */
    static OLECMDID_REFRESH => 22

    /**
     * Stops all current processing. Implemented by the document/object.
     * @type {Integer (Int32)}
     */
    static OLECMDID_STOP => 23

    /**
     * <b>View</b> menu, <b>Toolbars</b> command. Implemented by the document/object to hide its toolbars.
     * @type {Integer (Int32)}
     */
    static OLECMDID_HIDETOOLBARS => 24

    /**
     * Sets the maximum value of a progress indicator if one is owned by the receiving object, usually a frame. The minimum value is always zero.
     * @type {Integer (Int32)}
     */
    static OLECMDID_SETPROGRESSMAX => 25

    /**
     * Sets the current value of a progress indicator if one is owned by the receiving object, usually a frame.
     * @type {Integer (Int32)}
     */
    static OLECMDID_SETPROGRESSPOS => 26

    /**
     * Sets the text contained in a progress indicator if one is owned by the receiving object, usually a frame. If the receiver currently has no progress indicator, this text should be displayed in the status bar (if one exists) as with <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplaceframe-setstatustext">IOleInPlaceFrame::SetStatusText</a>.
     * @type {Integer (Int32)}
     */
    static OLECMDID_SETPROGRESSTEXT => 27

    /**
     * Sets the title bar text of the receiving object, usually a frame.
     * @type {Integer (Int32)}
     */
    static OLECMDID_SETTITLE => 28

    /**
     * Called by the object when downloading state changes. Takes a VT_BOOL parameter, which is <b>TRUE</b> if the object is downloading data and <b>FALSE</b> if it not. Primarily implemented by the frame.
     * @type {Integer (Int32)}
     */
    static OLECMDID_SETDOWNLOADSTATE => 29

    /**
     * Stops the download when executed. Typically, this command is propagated to all contained objects. When queried, sets MSOCMDF_ENABLED. Implemented by the document/object.
     * @type {Integer (Int32)}
     */
    static OLECMDID_STOPDOWNLOAD => 30

    /**
     * 
     * @type {Integer (Int32)}
     */
    static OLECMDID_ONTOOLBARACTIVATED => 31

    /**
     * <b>Edit</b> menu, <b>Find</b> command
     * @type {Integer (Int32)}
     */
    static OLECMDID_FIND => 32

    /**
     * <b>Edit</b> menu, <b>Delete</b> command
     * @type {Integer (Int32)}
     */
    static OLECMDID_DELETE => 33

    /**
     * Issued in response to <b>HTTP-EQUIV</b> metatag and results in a call to the deprecated <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nf-shdeprecated-ibrowserservice-onhttpequiv">OnHttpEquiv</a> method with the <i>fDone</i> parameter set to <b>false</b>. This command takes a <b>VT_BSTR</b> parameter which is passed to <b>OnHttpEquiv</b>.
     * @type {Integer (Int32)}
     */
    static OLECMDID_HTTPEQUIV => 34

    /**
     * Issued in response to <b>HTTP-EQUIV</b> metatag and results in a call to the deprecated <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nf-shdeprecated-ibrowserservice-onhttpequiv">OnHttpEquiv</a> method with the <i>fDone</i> parameter set to <b>true</b>. This command takes a <b>VT_BSTR</b> parameter which is passed to <b>OnHttpEquiv</b>.
     * @type {Integer (Int32)}
     */
    static OLECMDID_HTTPEQUIV_DONE => 35

    /**
     * Pauses or resumes receiver interaction. This command takes a <b>VT_BOOL</b> parameter that pauses interaction when set to <b>FALSE</b> and resumes interaction when set to <b>TRUE</b>.
     * @type {Integer (Int32)}
     */
    static OLECMDID_ENABLE_INTERACTION => 36

    /**
     * Notifies the receiver of an intent to close the window imminently. This command takes a <b>VT_BOOL</b> output parameter that returns <b>TRUE</b> if the receiver can close and <b>FALSE</b> if it can't.
     * @type {Integer (Int32)}
     */
    static OLECMDID_ONUNLOAD => 37

    /**
     * This command has no effect.
     * @type {Integer (Int32)}
     */
    static OLECMDID_PROPERTYBAG2 => 38

    /**
     * Notifies the receiver that a refresh is about to start.
     * @type {Integer (Int32)}
     */
    static OLECMDID_PREREFRESH => 39

    /**
     * Tells the receiver to display the script error message.
     * @type {Integer (Int32)}
     */
    static OLECMDID_SHOWSCRIPTERROR => 40

    /**
     * This command takes an <a href="https://docs.microsoft.com/previous-versions/hh773930(v=vs.85)">IHTMLEventObj</a> input parameter that  contains a  message that the receiver shows.
     * @type {Integer (Int32)}
     */
    static OLECMDID_SHOWMESSAGE => 41

    /**
     * Tells the receiver to show the Find dialog box. It takes a <b>VT_DISPATCH</b> input param.
     * @type {Integer (Int32)}
     */
    static OLECMDID_SHOWFIND => 42

    /**
     * Tells the receiver to show the Page Setup dialog box. It takes an <a href="https://docs.microsoft.com/previous-versions/hh773930(v=vs.85)">IHTMLEventObj2</a>  input parameter.
     * @type {Integer (Int32)}
     */
    static OLECMDID_SHOWPAGESETUP => 43

    /**
     * Tells the receiver to show the Print dialog box. It takes an <a href="https://docs.microsoft.com/previous-versions/hh773930(v=vs.85)">IHTMLEventObj2</a>  input parameter.
     * @type {Integer (Int32)}
     */
    static OLECMDID_SHOWPRINT => 44

    /**
     * The exit command for the File menu.
     * @type {Integer (Int32)}
     */
    static OLECMDID_CLOSE => 45

    /**
     * Supports the <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-iolecommandtarget-querystatus">QueryStatus</a> method.
     * @type {Integer (Int32)}
     */
    static OLECMDID_ALLOWUILESSSAVEAS => 46

    /**
     * Notifies the  receiver that CSS files should not be downloaded when in <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iapplicationdesignmodesettings">DesignMode</a>.
     * @type {Integer (Int32)}
     */
    static OLECMDID_DONTDOWNLOADCSS => 47

    /**
     * This command has no effect.
     * @type {Integer (Int32)}
     */
    static OLECMDID_UPDATEPAGESTATUS => 48

    /**
     * <b>File</b> menu, updated <b>Print</b> command
     * @type {Integer (Int32)}
     */
    static OLECMDID_PRINT2 => 49

    /**
     * <b>File</b> menu, updated <b>Print Preview</b> command
     * @type {Integer (Int32)}
     */
    static OLECMDID_PRINTPREVIEW2 => 50

    /**
     * Sets an explicit Print Template value of <b>TRUE</b> or <b>FALSE</b>, based on a <b>VT_BOOL</b> input parameter.
     * @type {Integer (Int32)}
     */
    static OLECMDID_SETPRINTTEMPLATE => 51

    /**
     * Gets a  <b>VT_BOOL</b> output parameter indicating whether the Print Template value is <b>TRUE</b> or <b>FALSE</b>.
     * @type {Integer (Int32)}
     */
    static OLECMDID_GETPRINTTEMPLATE => 52

    /**
     * Indicates that a page action has been blocked. PAGEACTIONBLOCKED is designed for use with applications that host the Internet Explorer WebBrowser control to implement their own UI.
     * @type {Integer (Int32)}
     */
    static OLECMDID_PAGEACTIONBLOCKED => 55

    /**
     * Specifies which actions are displayed in the Internet Explorer notification band.
     * @type {Integer (Int32)}
     */
    static OLECMDID_PAGEACTIONUIQUERY => 56

    /**
     * Causes the Internet Explorer WebBrowser control to focus its default notification band. Hosts can send this command at any time. The return value is S_OK if the band is present and is in focus, or S_FALSE otherwise.
     * @type {Integer (Int32)}
     */
    static OLECMDID_FOCUSVIEWCONTROLS => 57

    /**
     * This notification event is provided for applications that display Internet Explorers default notification band implementation. By default, when the user presses the ALT-N key combination, Internet Explorer treats it as a request to focus the notification band.
     * @type {Integer (Int32)}
     */
    static OLECMDID_FOCUSVIEWCONTROLSQUERY => 58

    /**
     * Causes the Internet Explorer WebBrowser control to show the Information Bar menu.
     * @type {Integer (Int32)}
     */
    static OLECMDID_SHOWPAGEACTIONMENU => 59

    /**
     * Causes the Internet Explorer WebBrowser control to create an entry at the current Travel Log offset. The Docobject should implement <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa768478(v=vs.85)">ITravelLogClient</a> and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipersist">IPersist</a> interfaces, which are used by the Travel Log as it processes this command with calls to GetWindowData and GetPersistID, respectively.
     * @type {Integer (Int32)}
     */
    static OLECMDID_ADDTRAVELENTRY => 60

    /**
     * Called when LoadHistory is processed to update the previous Docobject state. For synchronous handling, this command can be called before returning from the LoadHistory call. For asynchronous handling, it can be called later.
     * @type {Integer (Int32)}
     */
    static OLECMDID_UPDATETRAVELENTRY => 61

    /**
     * Updates the state of the browser's Back and Forward buttons.
     * @type {Integer (Int32)}
     */
    static OLECMDID_UPDATEBACKFORWARDSTATE => 62

    /**
     * Windows Internet Explorer 7 and later. Sets the zoom factor of the browser. Takes a VT_I4 parameter in the range of 10 to 1000 (percent).
     * @type {Integer (Int32)}
     */
    static OLECMDID_OPTICAL_ZOOM => 63

    /**
     * Windows Internet Explorer 7 and later. Retrieves the minimum and maximum browser zoom factor limits. Returns a VT_I4 parameter; the LOWORD is the minimum zoom factor, the HIWORD is the maximum.
     * @type {Integer (Int32)}
     */
    static OLECMDID_OPTICAL_GETZOOMRANGE => 64

    /**
     * Windows Internet Explorer 7 and later. Notifies the Internet Explorer WebBrowser control of changes in window states, such as losing focus, or becoming hidden or minimized. The host indicates what has changed by setting OLECMDID_WINDOWSTATE_FLAG option flags in nCmdExecOpt.
     * @type {Integer (Int32)}
     */
    static OLECMDID_WINDOWSTATECHANGED => 65

    /**
     * Windows Internet Explorer 8 with Windows Vista. Has no effect with Windows Internet Explorer 8 with Windows XP. Notifies Trident to use the indicated Install Scope to install the ActiveX Control specified by the indicated Class ID. For more information, see the Remarks section.
     * @type {Integer (Int32)}
     */
    static OLECMDID_ACTIVEXINSTALLSCOPE => 66

    /**
     * Internet Explorer 8. Unlike OLECMDID_UPDATETRAVELENTRY, this updates a Travel Log entry that is not initialized from a previous Docobject state. While this command is not called from <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa768216(v=vs.85)">IPersistHistory::LoadHistory</a>, it can be called separately to save browser state that can be used later to recover from a crash.
     * @type {Integer (Int32)}
     */
    static OLECMDID_UPDATETRAVELENTRY_DATARECOVERY => 67

    /**
     * 
     * @type {Integer (Int32)}
     */
    static OLECMDID_SHOWTASKDLG => 68

    /**
     * 
     * @type {Integer (Int32)}
     */
    static OLECMDID_POPSTATEEVENT => 69

    /**
     * 
     * @type {Integer (Int32)}
     */
    static OLECMDID_VIEWPORT_MODE => 70

    /**
     * 
     * @type {Integer (Int32)}
     */
    static OLECMDID_LAYOUT_VIEWPORT_WIDTH => 71

    /**
     * 
     * @type {Integer (Int32)}
     */
    static OLECMDID_VISUAL_VIEWPORT_EXCLUDE_BOTTOM => 72

    /**
     * 
     * @type {Integer (Int32)}
     */
    static OLECMDID_USER_OPTICAL_ZOOM => 73

    /**
     * 
     * @type {Integer (Int32)}
     */
    static OLECMDID_PAGEAVAILABLE => 74

    /**
     * 
     * @type {Integer (Int32)}
     */
    static OLECMDID_GETUSERSCALABLE => 75

    /**
     * 
     * @type {Integer (Int32)}
     */
    static OLECMDID_UPDATE_CARET => 76

    /**
     * 
     * @type {Integer (Int32)}
     */
    static OLECMDID_ENABLE_VISIBILITY => 77

    /**
     * 
     * @type {Integer (Int32)}
     */
    static OLECMDID_MEDIA_PLAYBACK => 78

    /**
     * 
     * @type {Integer (Int32)}
     */
    static OLECMDID_SETFAVICON => 79

    /**
     * 
     * @type {Integer (Int32)}
     */
    static OLECMDID_SET_HOST_FULLSCREENMODE => 80

    /**
     * 
     * @type {Integer (Int32)}
     */
    static OLECMDID_EXITFULLSCREEN => 81

    /**
     * 
     * @type {Integer (Int32)}
     */
    static OLECMDID_SCROLLCOMPLETE => 82

    /**
     * 
     * @type {Integer (Int32)}
     */
    static OLECMDID_ONBEFOREUNLOAD => 83

    /**
     * 
     * @type {Integer (Int32)}
     */
    static OLECMDID_SHOWMESSAGE_BLOCKABLE => 84

    /**
     * 
     * @type {Integer (Int32)}
     */
    static OLECMDID_SHOWTASKDLG_BLOCKABLE => 85
}
