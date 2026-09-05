#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies which standard command is to be executed. A single value from this enumeration is passed in the nCmdID argument of IOleCommandTarget::Exec.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/docobj/ne-docobj-olecmdid
 * @namespace Windows.Win32.System.Ole
 */
class OLECMDID extends Win32Enum {

    /**
     * <b>File</b> menu, <b>Open</b> command
     * Native name: OLECMDID_OPEN
     * @type {Integer (Int32)}
     */
    static OPEN => 1

    /**
     * <b>File</b> menu, <b>New</b> command
     * Native name: OLECMDID_NEW
     * @type {Integer (Int32)}
     */
    static NEW => 2

    /**
     * <b>File</b> menu, <b>Save</b> command
     * Native name: OLECMDID_SAVE
     * @type {Integer (Int32)}
     */
    static SAVE => 3

    /**
     * <b>File</b> menu, <b>Save As</b> command
     * Native name: OLECMDID_SAVEAS
     * @type {Integer (Int32)}
     */
    static SAVEAS => 4

    /**
     * <b>File</b> menu, <b>Save Copy As</b> command
     * Native name: OLECMDID_SAVECOPYAS
     * @type {Integer (Int32)}
     */
    static SAVECOPYAS => 5

    /**
     * <b>File</b> menu, <b>Print</b> command
     * Native name: OLECMDID_PRINT
     * @type {Integer (Int32)}
     */
    static PRINT => 6

    /**
     * <b>File</b> menu, <b>Print Preview</b> command
     * Native name: OLECMDID_PRINTPREVIEW
     * @type {Integer (Int32)}
     */
    static PRINTPREVIEW => 7

    /**
     * <b>File</b> menu, <b>Page Setup</b> command
     * Native name: OLECMDID_PAGESETUP
     * @type {Integer (Int32)}
     */
    static PAGESETUP => 8

    /**
     * <b>Tools</b> menu, <b>Spelling</b> command
     * Native name: OLECMDID_SPELL
     * @type {Integer (Int32)}
     */
    static SPELL => 9

    /**
     * <b>File</b> menu, <b>Properties</b> command
     * Native name: OLECMDID_PROPERTIES
     * @type {Integer (Int32)}
     */
    static PROPERTIES => 10

    /**
     * <b>Edit</b> menu, <b>Cut</b> command
     * Native name: OLECMDID_CUT
     * @type {Integer (Int32)}
     */
    static CUT => 11

    /**
     * <b>Edit</b> menu, <b>Copy</b> command
     * Native name: OLECMDID_COPY
     * @type {Integer (Int32)}
     */
    static COPY => 12

    /**
     * <b>Edit</b> menu, <b>Paste</b> command
     * Native name: OLECMDID_PASTE
     * @type {Integer (Int32)}
     */
    static PASTE => 13

    /**
     * <b>Edit</b> menu, <b>Paste Special</b> command
     * Native name: OLECMDID_PASTESPECIAL
     * @type {Integer (Int32)}
     */
    static PASTESPECIAL => 14

    /**
     * <b>Edit</b> menu, <b>Undo</b> command
     * Native name: OLECMDID_UNDO
     * @type {Integer (Int32)}
     */
    static UNDO => 15

    /**
     * <b>Edit</b> menu, <b>Redo</b> command
     * Native name: OLECMDID_REDO
     * @type {Integer (Int32)}
     */
    static REDO => 16

    /**
     * <b>Edit</b> menu, <b>Select All</b> command
     * Native name: OLECMDID_SELECTALL
     * @type {Integer (Int32)}
     */
    static SELECTALL => 17

    /**
     * <b>Edit</b> menu, <b>Clear</b> command
     * Native name: OLECMDID_CLEARSELECTION
     * @type {Integer (Int32)}
     */
    static CLEARSELECTION => 18

    /**
     * <b>View</b> menu, <b>Zoom</b> command (see below for details.)
     * Native name: OLECMDID_ZOOM
     * @type {Integer (Int32)}
     */
    static ZOOM => 19

    /**
     * Retrieves zoom range applicable to <b>View Zoom</b> (see below for details.)
     * Native name: OLECMDID_GETZOOMRANGE
     * @type {Integer (Int32)}
     */
    static GETZOOMRANGE => 20

    /**
     * Informs the receiver, usually a frame, of state changes. The receiver can then query the status of the commands whenever convenient.
     * Native name: OLECMDID_UPDATECOMMANDS
     * @type {Integer (Int32)}
     */
    static UPDATECOMMANDS => 21

    /**
     * Asks the receiver to refresh its display. Implemented by the document/object.
     * Native name: OLECMDID_REFRESH
     * @type {Integer (Int32)}
     */
    static REFRESH => 22

    /**
     * Stops all current processing. Implemented by the document/object.
     * Native name: OLECMDID_STOP
     * @type {Integer (Int32)}
     */
    static STOP => 23

    /**
     * <b>View</b> menu, <b>Toolbars</b> command. Implemented by the document/object to hide its toolbars.
     * Native name: OLECMDID_HIDETOOLBARS
     * @type {Integer (Int32)}
     */
    static HIDETOOLBARS => 24

    /**
     * Sets the maximum value of a progress indicator if one is owned by the receiving object, usually a frame. The minimum value is always zero.
     * Native name: OLECMDID_SETPROGRESSMAX
     * @type {Integer (Int32)}
     */
    static SETPROGRESSMAX => 25

    /**
     * Sets the current value of a progress indicator if one is owned by the receiving object, usually a frame.
     * Native name: OLECMDID_SETPROGRESSPOS
     * @type {Integer (Int32)}
     */
    static SETPROGRESSPOS => 26

    /**
     * Sets the text contained in a progress indicator if one is owned by the receiving object, usually a frame. If the receiver currently has no progress indicator, this text should be displayed in the status bar (if one exists) as with <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplaceframe-setstatustext">IOleInPlaceFrame::SetStatusText</a>.
     * Native name: OLECMDID_SETPROGRESSTEXT
     * @type {Integer (Int32)}
     */
    static SETPROGRESSTEXT => 27

    /**
     * Sets the title bar text of the receiving object, usually a frame.
     * Native name: OLECMDID_SETTITLE
     * @type {Integer (Int32)}
     */
    static SETTITLE => 28

    /**
     * Called by the object when downloading state changes. Takes a VT_BOOL parameter, which is <b>TRUE</b> if the object is downloading data and <b>FALSE</b> if it not. Primarily implemented by the frame.
     * Native name: OLECMDID_SETDOWNLOADSTATE
     * @type {Integer (Int32)}
     */
    static SETDOWNLOADSTATE => 29

    /**
     * Stops the download when executed. Typically, this command is propagated to all contained objects. When queried, sets MSOCMDF_ENABLED. Implemented by the document/object.
     * Native name: OLECMDID_STOPDOWNLOAD
     * @type {Integer (Int32)}
     */
    static STOPDOWNLOAD => 30

    /**
     * Native name: OLECMDID_ONTOOLBARACTIVATED
     * @type {Integer (Int32)}
     */
    static ONTOOLBARACTIVATED => 31

    /**
     * <b>Edit</b> menu, <b>Find</b> command
     * Native name: OLECMDID_FIND
     * @type {Integer (Int32)}
     */
    static FIND => 32

    /**
     * <b>Edit</b> menu, <b>Delete</b> command
     * Native name: OLECMDID_DELETE
     * @type {Integer (Int32)}
     */
    static DELETE => 33

    /**
     * Issued in response to <b>HTTP-EQUIV</b> metatag and results in a call to the deprecated <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nf-shdeprecated-ibrowserservice-onhttpequiv">OnHttpEquiv</a> method with the <i>fDone</i> parameter set to <b>false</b>. This command takes a <b>VT_BSTR</b> parameter which is passed to <b>OnHttpEquiv</b>.
     * Native name: OLECMDID_HTTPEQUIV
     * @type {Integer (Int32)}
     */
    static HTTPEQUIV => 34

    /**
     * Issued in response to <b>HTTP-EQUIV</b> metatag and results in a call to the deprecated <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nf-shdeprecated-ibrowserservice-onhttpequiv">OnHttpEquiv</a> method with the <i>fDone</i> parameter set to <b>true</b>. This command takes a <b>VT_BSTR</b> parameter which is passed to <b>OnHttpEquiv</b>.
     * Native name: OLECMDID_HTTPEQUIV_DONE
     * @type {Integer (Int32)}
     */
    static HTTPEQUIV_DONE => 35

    /**
     * Pauses or resumes receiver interaction. This command takes a <b>VT_BOOL</b> parameter that pauses interaction when set to <b>FALSE</b> and resumes interaction when set to <b>TRUE</b>.
     * Native name: OLECMDID_ENABLE_INTERACTION
     * @type {Integer (Int32)}
     */
    static ENABLE_INTERACTION => 36

    /**
     * Notifies the receiver of an intent to close the window imminently. This command takes a <b>VT_BOOL</b> output parameter that returns <b>TRUE</b> if the receiver can close and <b>FALSE</b> if it can't.
     * Native name: OLECMDID_ONUNLOAD
     * @type {Integer (Int32)}
     */
    static ONUNLOAD => 37

    /**
     * This command has no effect.
     * Native name: OLECMDID_PROPERTYBAG2
     * @type {Integer (Int32)}
     */
    static PROPERTYBAG2 => 38

    /**
     * Notifies the receiver that a refresh is about to start.
     * Native name: OLECMDID_PREREFRESH
     * @type {Integer (Int32)}
     */
    static PREREFRESH => 39

    /**
     * Tells the receiver to display the script error message.
     * Native name: OLECMDID_SHOWSCRIPTERROR
     * @type {Integer (Int32)}
     */
    static SHOWSCRIPTERROR => 40

    /**
     * This command takes an <a href="https://docs.microsoft.com/previous-versions/hh773930(v=vs.85)">IHTMLEventObj</a> input parameter that  contains a  message that the receiver shows.
     * Native name: OLECMDID_SHOWMESSAGE
     * @type {Integer (Int32)}
     */
    static SHOWMESSAGE => 41

    /**
     * Tells the receiver to show the Find dialog box. It takes a <b>VT_DISPATCH</b> input param.
     * Native name: OLECMDID_SHOWFIND
     * @type {Integer (Int32)}
     */
    static SHOWFIND => 42

    /**
     * Tells the receiver to show the Page Setup dialog box. It takes an <a href="https://docs.microsoft.com/previous-versions/hh773930(v=vs.85)">IHTMLEventObj2</a>  input parameter.
     * Native name: OLECMDID_SHOWPAGESETUP
     * @type {Integer (Int32)}
     */
    static SHOWPAGESETUP => 43

    /**
     * Tells the receiver to show the Print dialog box. It takes an <a href="https://docs.microsoft.com/previous-versions/hh773930(v=vs.85)">IHTMLEventObj2</a>  input parameter.
     * Native name: OLECMDID_SHOWPRINT
     * @type {Integer (Int32)}
     */
    static SHOWPRINT => 44

    /**
     * The exit command for the File menu.
     * Native name: OLECMDID_CLOSE
     * @type {Integer (Int32)}
     */
    static CLOSE => 45

    /**
     * Supports the <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-iolecommandtarget-querystatus">QueryStatus</a> method.
     * Native name: OLECMDID_ALLOWUILESSSAVEAS
     * @type {Integer (Int32)}
     */
    static ALLOWUILESSSAVEAS => 46

    /**
     * Notifies the  receiver that CSS files should not be downloaded when in <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iapplicationdesignmodesettings">DesignMode</a>.
     * Native name: OLECMDID_DONTDOWNLOADCSS
     * @type {Integer (Int32)}
     */
    static DONTDOWNLOADCSS => 47

    /**
     * This command has no effect.
     * Native name: OLECMDID_UPDATEPAGESTATUS
     * @type {Integer (Int32)}
     */
    static UPDATEPAGESTATUS => 48

    /**
     * <b>File</b> menu, updated <b>Print</b> command
     * Native name: OLECMDID_PRINT2
     * @type {Integer (Int32)}
     */
    static PRINT2 => 49

    /**
     * <b>File</b> menu, updated <b>Print Preview</b> command
     * Native name: OLECMDID_PRINTPREVIEW2
     * @type {Integer (Int32)}
     */
    static PRINTPREVIEW2 => 50

    /**
     * Sets an explicit Print Template value of <b>TRUE</b> or <b>FALSE</b>, based on a <b>VT_BOOL</b> input parameter.
     * Native name: OLECMDID_SETPRINTTEMPLATE
     * @type {Integer (Int32)}
     */
    static SETPRINTTEMPLATE => 51

    /**
     * Gets a  <b>VT_BOOL</b> output parameter indicating whether the Print Template value is <b>TRUE</b> or <b>FALSE</b>.
     * Native name: OLECMDID_GETPRINTTEMPLATE
     * @type {Integer (Int32)}
     */
    static GETPRINTTEMPLATE => 52

    /**
     * Indicates that a page action has been blocked. PAGEACTIONBLOCKED is designed for use with applications that host the Internet Explorer WebBrowser control to implement their own UI.
     * Native name: OLECMDID_PAGEACTIONBLOCKED
     * @type {Integer (Int32)}
     */
    static PAGEACTIONBLOCKED => 55

    /**
     * Specifies which actions are displayed in the Internet Explorer notification band.
     * Native name: OLECMDID_PAGEACTIONUIQUERY
     * @type {Integer (Int32)}
     */
    static PAGEACTIONUIQUERY => 56

    /**
     * Causes the Internet Explorer WebBrowser control to focus its default notification band. Hosts can send this command at any time. The return value is S_OK if the band is present and is in focus, or S_FALSE otherwise.
     * Native name: OLECMDID_FOCUSVIEWCONTROLS
     * @type {Integer (Int32)}
     */
    static FOCUSVIEWCONTROLS => 57

    /**
     * This notification event is provided for applications that display Internet Explorers default notification band implementation. By default, when the user presses the ALT-N key combination, Internet Explorer treats it as a request to focus the notification band.
     * Native name: OLECMDID_FOCUSVIEWCONTROLSQUERY
     * @type {Integer (Int32)}
     */
    static FOCUSVIEWCONTROLSQUERY => 58

    /**
     * Causes the Internet Explorer WebBrowser control to show the Information Bar menu.
     * Native name: OLECMDID_SHOWPAGEACTIONMENU
     * @type {Integer (Int32)}
     */
    static SHOWPAGEACTIONMENU => 59

    /**
     * Causes the Internet Explorer WebBrowser control to create an entry at the current Travel Log offset. The Docobject should implement <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa768478(v=vs.85)">ITravelLogClient</a> and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipersist">IPersist</a> interfaces, which are used by the Travel Log as it processes this command with calls to GetWindowData and GetPersistID, respectively.
     * Native name: OLECMDID_ADDTRAVELENTRY
     * @type {Integer (Int32)}
     */
    static ADDTRAVELENTRY => 60

    /**
     * Called when LoadHistory is processed to update the previous Docobject state. For synchronous handling, this command can be called before returning from the LoadHistory call. For asynchronous handling, it can be called later.
     * Native name: OLECMDID_UPDATETRAVELENTRY
     * @type {Integer (Int32)}
     */
    static UPDATETRAVELENTRY => 61

    /**
     * Updates the state of the browser's Back and Forward buttons.
     * Native name: OLECMDID_UPDATEBACKFORWARDSTATE
     * @type {Integer (Int32)}
     */
    static UPDATEBACKFORWARDSTATE => 62

    /**
     * Windows Internet Explorer 7 and later. Sets the zoom factor of the browser. Takes a VT_I4 parameter in the range of 10 to 1000 (percent).
     * Native name: OLECMDID_OPTICAL_ZOOM
     * @type {Integer (Int32)}
     */
    static OPTICAL_ZOOM => 63

    /**
     * Windows Internet Explorer 7 and later. Retrieves the minimum and maximum browser zoom factor limits. Returns a VT_I4 parameter; the LOWORD is the minimum zoom factor, the HIWORD is the maximum.
     * Native name: OLECMDID_OPTICAL_GETZOOMRANGE
     * @type {Integer (Int32)}
     */
    static OPTICAL_GETZOOMRANGE => 64

    /**
     * Windows Internet Explorer 7 and later. Notifies the Internet Explorer WebBrowser control of changes in window states, such as losing focus, or becoming hidden or minimized. The host indicates what has changed by setting OLECMDID_WINDOWSTATE_FLAG option flags in nCmdExecOpt.
     * Native name: OLECMDID_WINDOWSTATECHANGED
     * @type {Integer (Int32)}
     */
    static WINDOWSTATECHANGED => 65

    /**
     * Windows Internet Explorer 8 with Windows Vista. Has no effect with Windows Internet Explorer 8 with Windows XP. Notifies Trident to use the indicated Install Scope to install the ActiveX Control specified by the indicated Class ID. For more information, see the Remarks section.
     * Native name: OLECMDID_ACTIVEXINSTALLSCOPE
     * @type {Integer (Int32)}
     */
    static ACTIVEXINSTALLSCOPE => 66

    /**
     * Internet Explorer 8. Unlike OLECMDID_UPDATETRAVELENTRY, this updates a Travel Log entry that is not initialized from a previous Docobject state. While this command is not called from <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa768216(v=vs.85)">IPersistHistory::LoadHistory</a>, it can be called separately to save browser state that can be used later to recover from a crash.
     * Native name: OLECMDID_UPDATETRAVELENTRY_DATARECOVERY
     * @type {Integer (Int32)}
     */
    static UPDATETRAVELENTRY_DATARECOVERY => 67

    /**
     * Native name: OLECMDID_SHOWTASKDLG
     * @type {Integer (Int32)}
     */
    static SHOWTASKDLG => 68

    /**
     * Native name: OLECMDID_POPSTATEEVENT
     * @type {Integer (Int32)}
     */
    static POPSTATEEVENT => 69

    /**
     * Native name: OLECMDID_VIEWPORT_MODE
     * @type {Integer (Int32)}
     */
    static VIEWPORT_MODE => 70

    /**
     * Native name: OLECMDID_LAYOUT_VIEWPORT_WIDTH
     * @type {Integer (Int32)}
     */
    static LAYOUT_VIEWPORT_WIDTH => 71

    /**
     * Native name: OLECMDID_VISUAL_VIEWPORT_EXCLUDE_BOTTOM
     * @type {Integer (Int32)}
     */
    static VISUAL_VIEWPORT_EXCLUDE_BOTTOM => 72

    /**
     * Native name: OLECMDID_USER_OPTICAL_ZOOM
     * @type {Integer (Int32)}
     */
    static USER_OPTICAL_ZOOM => 73

    /**
     * Native name: OLECMDID_PAGEAVAILABLE
     * @type {Integer (Int32)}
     */
    static PAGEAVAILABLE => 74

    /**
     * Native name: OLECMDID_GETUSERSCALABLE
     * @type {Integer (Int32)}
     */
    static GETUSERSCALABLE => 75

    /**
     * Native name: OLECMDID_UPDATE_CARET
     * @type {Integer (Int32)}
     */
    static UPDATE_CARET => 76

    /**
     * Native name: OLECMDID_ENABLE_VISIBILITY
     * @type {Integer (Int32)}
     */
    static ENABLE_VISIBILITY => 77

    /**
     * Native name: OLECMDID_MEDIA_PLAYBACK
     * @type {Integer (Int32)}
     */
    static MEDIA_PLAYBACK => 78

    /**
     * Native name: OLECMDID_SETFAVICON
     * @type {Integer (Int32)}
     */
    static SETFAVICON => 79

    /**
     * Native name: OLECMDID_SET_HOST_FULLSCREENMODE
     * @type {Integer (Int32)}
     */
    static SET_HOST_FULLSCREENMODE => 80

    /**
     * Native name: OLECMDID_EXITFULLSCREEN
     * @type {Integer (Int32)}
     */
    static EXITFULLSCREEN => 81

    /**
     * Native name: OLECMDID_SCROLLCOMPLETE
     * @type {Integer (Int32)}
     */
    static SCROLLCOMPLETE => 82

    /**
     * Native name: OLECMDID_ONBEFOREUNLOAD
     * @type {Integer (Int32)}
     */
    static ONBEFOREUNLOAD => 83

    /**
     * Native name: OLECMDID_SHOWMESSAGE_BLOCKABLE
     * @type {Integer (Int32)}
     */
    static SHOWMESSAGE_BLOCKABLE => 84

    /**
     * Native name: OLECMDID_SHOWTASKDLG_BLOCKABLE
     * @type {Integer (Int32)}
     */
    static SHOWTASKDLG_BLOCKABLE => 85
}
