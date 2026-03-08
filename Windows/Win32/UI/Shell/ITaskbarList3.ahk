#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITaskbarList2.ahk

/**
 * Extends ITaskbarList2 by exposing methods that support the unified launching and switching taskbar button functionality added in Windows 7.
 * @remarks
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-itaskbarlist">ITaskbarList</a> and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-itaskbarlist2">ITaskbarList2</a> interfaces, from which it inherits.
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * An implementation of this interface is provided in Windows as CLSID_TaskbarList. This interface is not implemented by third parties.
 * 
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * Use the methods of this interface to do the following:
 * 
 * <ul>
 * <li>When working with a TDI application (such as Windows Internet Explorer) or a MDI application (such as Microsoft Excel) that is displaying its windows as a group on the taskbar:
 *                         
 *                         <ul>
 * <li>Provide the taskbar with a thumbnail that represents the view of an individual tab or document.</li>
 * <li>Remove the thumbnail of an individual tab or document from the group.</li>
 * <li>Change the order of thumbnails in the group.</li>
 * <li>Set a tab thumbnail as the selected item when the thumbnails are shown.</li>
 * </ul>
 * </li>
 * <li>When applying an overlay to a taskbar icon, such as a notification.</li>
 * <li>When showing the progress of an operation, such as copying or installing an item.</li>
 * <li>When adding a toolbar to a thumbnail.</li>
 * </ul>
 * When an application displays a window, its taskbar button is created by the system. When the button is in place, the taskbar sends a <b>TaskbarButtonCreated</b> message to the window. Your application should call <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-registerwindowmessagea">RegisterWindowMessage</a>(L"TaskbarButtonCreated") and handle that message in its wndproc. That message must be received by your application before it calls any <b>ITaskbarList3</b> method.
 * 
 * <div class="alert"><b>Note</b>  Applications cannot programmatically pin themselves to the taskbar. That functionality is reserved strictly for the user.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-itaskbarlist3
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ITaskbarList3 extends ITaskbarList2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITaskbarList3
     * @type {Guid}
     */
    static IID => Guid("{ea1afb91-9e28-4b86-90e9-9e9f8a5eefaf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetProgressValue", "SetProgressState", "RegisterTab", "UnregisterTab", "SetTabOrder", "SetTabActive", "ThumbBarAddButtons", "ThumbBarUpdateButtons", "ThumbBarSetImageList", "SetOverlayIcon", "SetThumbnailTooltip", "SetThumbnailClip"]

    /**
     * Displays or updates a progress bar hosted in a taskbar button to show the specific percentage completed of the full operation.
     * @remarks
     * <h3><a id="Determinate_Progress_Bar_Lifecycle"></a><a id="determinate_progress_bar_lifecycle"></a><a id="DETERMINATE_PROGRESS_BAR_LIFECYCLE"></a>Determinate Progress Bar Lifecycle</h3>
     * An application first calls <b>SetProgressValue</b> to begin the display of a determinate progress bar, and then calls it again as needed to update the bar as the progress changes. When progress is complete, the application must call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-itaskbarlist3-setprogressstate">SetProgressState</a> with the TBPF_NOPROGRESS flag to dismiss the progress bar.
     * 
     * <h3><a id="How_the_Taskbar_Button_Chooses_the_Progress_Indicator_for_a_Group"></a><a id="how_the_taskbar_button_chooses_the_progress_indicator_for_a_group"></a><a id="HOW_THE_TASKBAR_BUTTON_CHOOSES_THE_PROGRESS_INDICATOR_FOR_A_GROUP"></a>How the Taskbar Button Chooses the Progress Indicator for a Group</h3>
     * The taskbar button can show a progress indicator for only one window at a time. When the taskbar button represents a group and more than one of the windows in that group are broadcasting progress information, the taskbar button chooses its progress display based on the following state priority.
     * 
     * 
     * 
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Priority</th>
     * <th>State</th>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>TBPF_ERROR</td>
     * </tr>
     * <tr>
     * <td>2</td>
     * <td>TBPF_PAUSED</td>
     * </tr>
     * <tr>
     * <td>3</td>
     * <td>TBPF_NORMAL</td>
     * </tr>
     * <tr>
     * <td>4</td>
     * <td>TBPF_INDETERMINATE</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * Unless <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-itaskbarlist3-setprogressstate">SetProgressState</a> has set a blocking state (TBPF_ERROR or TBPF_PAUSED) for the window, a call to <b>SetProgressValue</b> assumes the TBPF_NORMAL state even if it is not explicitly set. A call to <b>SetProgressValue</b> overrides and clears the TBPF_INDETERMINATE state.
     * 
     * In the case of a priority collision where two windows are broadcasting determinate progress, the window with the least progress is used.
     * 
     * Based on that priority, this determinate (specific percentage) progress indicator can be displayed in these cases:
     *     
     * <ul>
     * <li>The taskbar button does not represent a group and the single window that it represents is broadcasting determinate progress information through this method.</li>
     * <li>The taskbar button represents a group, only one window in that group is broadcasting progress information, and that window is broadcasting determinate progress information through this method.</li>
     * <li>The taskbar button represents a group, multiple windows in that group are broadcasting progress information, at least one of those windows is broadcasting progress information through this method, and none of those windows has set the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-itaskbarlist3-setprogressstate">TBPF_ERROR</a> or <b>TBPF_PAUSED</b> state.</li>
     * </ul>
     * 
     * 
     * If a window in the group has set <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-itaskbarlist3-setprogressstate">TBPF_ERROR</a> or <b>TBPF_PAUSED</b>, that state will be used for the button display. However, you can still make calls to <b>SetProgressValue</b> on other, unblocked windows in the group to update their progress in the background.
     * @param {HWND} hwnd Type: <b>HWND</b>
     * 
     * The handle of the window whose associated taskbar button is being used as a progress indicator.
     * @param {Integer} ullCompleted Type: <b>ULONGLONG</b>
     * 
     * An application-defined value that indicates the proportion of the operation that has been completed at the time the method is called.
     * @param {Integer} ullTotal Type: <b>ULONGLONG</b>
     * 
     * An application-defined value that specifies the value <i>ullCompleted</i> will have when the operation is complete.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itaskbarlist3-setprogressvalue
     */
    SetProgressValue(hwnd, ullCompleted, ullTotal) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(9, this, "ptr", hwnd, "uint", ullCompleted, "uint", ullTotal, "HRESULT")
        return result
    }

    /**
     * Sets the type and state of the progress indicator displayed on a taskbar button.
     * @remarks
     * Progress bar information is not shown in high contrast color schemes to guarantee that no accessibility needs are compromised.
     * 
     * Developers accustomed to the existing <a href="https://docs.microsoft.com/windows/desktop/Controls/progress-bar-control-reference">progress bar</a> control should find the taskbar button progress indicator to be a similar experience both in concept and visuals. Here, the taskbar button itself becomes a progress bar. A taskbar button's progress indicator should be a reflection of a more detailed progress bar in the associated window. This allows the user to see specifics, such as the percentage number and the amount of time remaining, that cannot be shown in a taskbar button. Also, because a taskbar button can show the progress of only a single window in a group, it allows the user to check the progress of individual windows. It also provides progress information to the user when the taskbar button cannot, such as in a high-contrast color scheme.
     * 
     * Note that a taskbar button progress bar is not intended for use with normally peripheral actions such as the loading of a webpage or the printing of a document. That type of progress should continue to be shown in a window's <a href="https://docs.microsoft.com/windows/desktop/Controls/status-bar-reference">status bar</a>.
     * 
     * The progress indicator is displayed between the taskbar button's icon or text and the background. If progress is shown for both the active taskbar button and an inactive button, shading in the respective progress bars is such that the active button is still obvious to the user. Also, button functionality such as the display of thumbnails continues to work normally when the button is being used to display progress.
     * 
     * When exiting an error or paused state, call this method again with the <b>TBPF_NORMAL</b> or <b>TBPF_INDETERMINATE</b> flag to continue in the original state or <b>TBPF_NOPROGRESS</b> if the operation is canceled.
     * 
     * <h3><a id="How_the_Taskbar_Button_Chooses_the_Progress_Indicator_for_a_Group"></a><a id="how_the_taskbar_button_chooses_the_progress_indicator_for_a_group"></a><a id="HOW_THE_TASKBAR_BUTTON_CHOOSES_THE_PROGRESS_INDICATOR_FOR_A_GROUP"></a>How the Taskbar Button Chooses the Progress Indicator for a Group</h3>
     * The taskbar button can show a progress indicator for only one window at a time. This includes the situation where the taskbar button represents a group and more than one window in that group is broadcasting progress information. In that case, the taskbar button chooses its progress display based on state priority. State priority is shown in the following table with priority 1 being the highest.
     * 
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Priority</th>
     * <th>State</th>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>TBPF_ERROR</td>
     * </tr>
     * <tr>
     * <td>2</td>
     * <td>TBPF_PAUSED</td>
     * </tr>
     * <tr>
     * <td>3</td>
     * <td>TBPF_NORMAL</td>
     * </tr>
     * <tr>
     * <td>4</td>
     * <td>TBPF_INDETERMINATE</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * Changing a window's state changes its priority in relation to other windows in the group which in turn might change which window in a group is used for the progress indicator in the taskbar button.
     * 
     * In the case of a priority collision between two windows that are broadcasting determinate progress, the window with the least progress is used.
     * 
     * Based on this priority, the indeterminate progress indicator can be displayed in the taskbar button only in these cases:
     *                 
     * <ul>
     * <li>The taskbar button does not represent a group and the single window that it represents has set TBPF_INDETERMINATE.</li>
     * <li>The taskbar button represents a group, only one window in that group is broadcasting progress information, and that window has set <b>TBPF_INDETERMINATE</b>.</li>
     * <li>The taskbar button represents a group, multiple windows in that group are broadcasting progress information, and all of those windows have set <b>TBPF_INDETERMINATE</b>.</li>
     * </ul>
     * 
     * 
     * A determinate progress indicator can be displayed in these cases:
     *                     
     * <ul>
     * <li>The taskbar button does not represent a group and the single window that it represents is broadcasting determinate progress information.</li>
     * <li>The taskbar button represents a group, only one window in that group is broadcasting progress information, and that window is broadcasting determinate progress information.</li>
     * <li>The taskbar button represents a group, multiple windows in that group are broadcasting progress information, at least one of those windows is broadcasting determinate progress information, and no window has set <b>TBPF_ERROR</b> or <b>TBPF_PAUSED</b>.</li>
     * </ul>
     * 
     * 
     * Note that a call to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-itaskbarlist3-setprogressvalue">SetProgressValue</a> will switch a progress indicator currently in an indeterminate mode (<b>TBPF_INDETERMINATE</b>) to a normal (determinate) display and clear the <b>TBPF_INDETERMINATE</b> flag.
     * @param {HWND} hwnd Type: <b>HWND</b>
     * 
     * The handle of the window in which the progress of an operation is being shown. This window's associated taskbar button will display the progress bar.
     * @param {Integer} tbpFlags Type: <b>TBPFLAG</b>
     * 
     * Flags that control the current state of the progress button. Specify only one of the following flags; all states are mutually exclusive of all others.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itaskbarlist3-setprogressstate
     */
    SetProgressState(hwnd, tbpFlags) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(10, this, "ptr", hwnd, "int", tbpFlags, "HRESULT")
        return result
    }

    /**
     * Informs the taskbar that a new tab or document thumbnail has been provided for display in an application's taskbar group flyout.
     * @remarks
     * By itself, registering a tab thumbnail alone will not result in its being displayed. You must also call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-itaskbarlist3-settaborder">ITaskbarList3::SetTabOrder</a> to instruct the group where to display it.
     * @param {HWND} hwndTab Type: <b>HWND</b>
     * 
     * Handle of the tab or document window. This value is required and cannot be <b>NULL</b>.
     * @param {HWND} hwndMDI Type: <b>HWND</b>
     * 
     * Handle of the application's main window. This value tells the taskbar which application's preview group to attach the new thumbnail to. This value is required and cannot be <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise. If either parameter is <b>NULL</b>, this method returns an error.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itaskbarlist3-registertab
     */
    RegisterTab(hwndTab, hwndMDI) {
        hwndTab := hwndTab is Win32Handle ? NumGet(hwndTab, "ptr") : hwndTab
        hwndMDI := hwndMDI is Win32Handle ? NumGet(hwndMDI, "ptr") : hwndMDI

        result := ComCall(11, this, "ptr", hwndTab, "ptr", hwndMDI, "HRESULT")
        return result
    }

    /**
     * Removes a thumbnail from an application's preview group when that tab or document is closed in the application.
     * @remarks
     * It is the responsibility of the calling application to free <i>hwndTab</i> through <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-destroywindow">DestroyWindow</a>. <b>UnregisterTab</b> must be called before the handle is freed.
     * @param {HWND} hwndTab Type: <b>HWND</b>
     * 
     * The handle of the tab window whose thumbnail is being removed. This is the same value with which the thumbnail was registered as part the group through <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-itaskbarlist3-registertab">ITaskbarList3::RegisterTab</a>. This value is required and cannot be <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns <b>S_OK</b> if successful, or an error value otherwise. If <i>hwndTab</i> is <b>NULL</b>, this method returns an error.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itaskbarlist3-unregistertab
     */
    UnregisterTab(hwndTab) {
        hwndTab := hwndTab is Win32Handle ? NumGet(hwndTab, "ptr") : hwndTab

        result := ComCall(12, this, "ptr", hwndTab, "HRESULT")
        return result
    }

    /**
     * Inserts a new thumbnail into a tabbed-document interface (TDI) or multiple-document interface (MDI) application's group flyout or moves an existing thumbnail to a new position in the application's group.
     * @remarks
     * This method must be called for the thumbnail to be shown in the group. Call it after you have called <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-itaskbarlist3-registertab">ITaskbarList3::RegisterTab</a>.
     * @param {HWND} hwndTab Type: <b>HWND</b>
     * 
     * The handle of the tab window whose thumbnail is being placed. This value is required, must already be registered through <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-itaskbarlist3-registertab">ITaskbarList3::RegisterTab</a>, and cannot be <b>NULL</b>.
     * @param {HWND} hwndInsertBefore Type: <b>HWND</b>
     * 
     * The handle of the tab window whose thumbnail that <i>hwndTab</i> is inserted to the left of. This handle must already be registered through <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-itaskbarlist3-registertab">ITaskbarList3::RegisterTab</a>. If this value is <b>NULL</b>, the new thumbnail is added to the end of the list.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itaskbarlist3-settaborder
     */
    SetTabOrder(hwndTab, hwndInsertBefore) {
        hwndTab := hwndTab is Win32Handle ? NumGet(hwndTab, "ptr") : hwndTab
        hwndInsertBefore := hwndInsertBefore is Win32Handle ? NumGet(hwndInsertBefore, "ptr") : hwndInsertBefore

        result := ComCall(13, this, "ptr", hwndTab, "ptr", hwndInsertBefore, "HRESULT")
        return result
    }

    /**
     * Informs the taskbar that a tab or document window has been made the active window.
     * @param {HWND} hwndTab Type: <b>HWND</b>
     * 
     * Handle of the active tab window. This handle must already be registered through <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-itaskbarlist3-registertab">ITaskbarList3::RegisterTab</a>. This value can be <b>NULL</b> if no tab is active.
     * @param {HWND} hwndMDI Type: <b>HWND</b>
     * 
     * Handle of the application's main window. This value tells the taskbar which group the thumbnail is a member of. This value is required and cannot be <b>NULL</b>.
     * @param {Integer} dwReserved Type: <b>DWORD</b>
     * 
     * Reserved; set to 0.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itaskbarlist3-settabactive
     */
    SetTabActive(hwndTab, hwndMDI, dwReserved) {
        hwndTab := hwndTab is Win32Handle ? NumGet(hwndTab, "ptr") : hwndTab
        hwndMDI := hwndMDI is Win32Handle ? NumGet(hwndMDI, "ptr") : hwndMDI

        result := ComCall(14, this, "ptr", hwndTab, "ptr", hwndMDI, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * Adds a thumbnail toolbar with a specified set of buttons to the thumbnail image of a window in a taskbar button flyout.
     * @remarks
     * This method allows an application to define buttons for an active toolbar control that is embedded in a window's taskbar thumbnail preview. This provides access to the window's essential commands without making the user restore or activate the window. For example, Windows Media Player might offer standard media transport controls such as play, pause, mute, and stop.
     * 
     * The toolbar used in the thumbnail is essentially a standard <a href="https://docs.microsoft.com/windows/desktop/Controls/toolbar-control-reference">toolbar</a> control. It has a maximum of seven buttons, and it is center-aligned, transparent, and displayed in an area beneath the thumbnail rather than covering any portion of it. Each button's ID, image, tooltip, and state are defined in a <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-thumbbutton">THUMBBUTTON</a> structure, which is then passed to the taskbar. The application can then subsequently show, alter, or hide buttons from the thumbnail toolbar as required by its current state by calling <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-itaskbarlist3-thumbbarupdatebuttons">ITaskbarList3::ThumbBarUpdateButtons</a>.
     * 
     * When a button in a thumbnail toolbar is clicked, the window associated with that thumbnail is sent a <a href="https://docs.microsoft.com/windows/desktop/menurc/wm-command">WM_COMMAND</a> message with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms632657(v=vs.85)">HIWORD</a> of its <i>wParam</i> parameter set to <b>THBN_CLICKED</b> and the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms632659(v=vs.85)">LOWORD</a> to the button ID.
     * 
     * After a toolbar has been added to a thumbnail, buttons can be altered only through <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-itaskbarlist3-thumbbarupdatebuttons">ITaskbarList3::ThumbBarUpdateButtons</a>. While individual buttons cannot be added or removed, they can be shown and hidden through <b>ThumbBarUpdateButtons</b> as needed. The toolbar itself cannot be removed without re-creating the window itself.
     * 
     * Because there is a limited amount of space in which to display thumbnails, as well as a constantly changing number of thumbnails to display, applications are not guaranteed a specific toolbar size. If display space is low, buttons in the toolbar are truncated from right to left as needed. Therefore, an application should prioritize the commands associated with its buttons to ensure that those of highest priority are to the left and are therefore least likely to be truncated.
     * 
     * Thumbnail toolbars are displayed only when thumbnails are being displayed. For instance, if a taskbar button represents a group with more open windows than there is room to display thumbnails for, the UI reverts to a legacy menu rather than thumbnails.
     * @param {HWND} hwnd Type: <b>HWND</b>
     * 
     * The handle of the window whose thumbnail representation will receive the toolbar. This handle must belong to the calling process.
     * @param {Integer} cButtons Type: <b>UINT</b>
     * 
     * The number of buttons defined in the array pointed to by <i>pButton</i>. The maximum number of buttons allowed is 7.
     * @param {Pointer<THUMBBUTTON>} pButton Type: <b>LPTHUMBBUTTON</b>
     * 
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-thumbbutton">THUMBBUTTON</a> structures. Each <b>THUMBBUTTON</b> defines an individual button to be added to the toolbar. Buttons cannot be added or deleted later, so this must be the full defined set. Buttons also cannot be reordered, so their order in the array, which is the order in which they are displayed left to right, will be their permanent order.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns <b>S_OK</b> if successful, or an error value otherwise, including the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hwnd</i> parameter does not specify a handle that belongs to the process or does not specify a window that is associated with a taskbar button. This value is also returned if <i>pButton</i> is less than 1 or greater than 7.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itaskbarlist3-thumbbaraddbuttons
     */
    ThumbBarAddButtons(hwnd, cButtons, pButton) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(15, this, "ptr", hwnd, "uint", cButtons, "ptr", pButton, "HRESULT")
        return result
    }

    /**
     * Shows, enables, disables, or hides buttons in a thumbnail toolbar as required by the window's current state. A thumbnail toolbar is a toolbar embedded in a thumbnail image of a window in a taskbar button flyout.
     * @remarks
     * Because there is a limited amount of space in which to display thumbnails, as well as a constantly changing number of thumbnails to display, applications are not guaranteed a specific toolbar size. If display space is low, buttons in the toolbar are truncated from right to left as needed. Therefore, an application should prioritize the commands associated with its buttons to ensure that those of highest priority are to the left and are therefore least likely to be truncated.
     * 
     * Thumbnail toolbars are displayed only when thumbnails are being displayed on the taskbar. For instance, if a taskbar button represents a group with more open windows than there is room to display thumbnails for, the UI reverts to a legacy menu rather than thumbnails.
     * @param {HWND} hwnd Type: <b>HWND</b>
     * 
     * The handle of the window whose thumbnail representation contains the toolbar.
     * @param {Integer} cButtons Type: <b>UINT</b>
     * 
     * The number of buttons defined in the array pointed to by <i>pButton</i>. The maximum number of buttons allowed is 7. This array contains only structures that represent existing buttons that are being updated.
     * @param {Pointer<THUMBBUTTON>} pButton Type: <b>LPTHUMBBUTTON</b>
     * 
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-thumbbutton">THUMBBUTTON</a> structures. Each <b>THUMBBUTTON</b> defines an individual button. If the button already exists (the <b>iId</b> value is already defined), then that existing button is updated with the information provided in the structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itaskbarlist3-thumbbarupdatebuttons
     */
    ThumbBarUpdateButtons(hwnd, cButtons, pButton) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(16, this, "ptr", hwnd, "uint", cButtons, "ptr", pButton, "HRESULT")
        return result
    }

    /**
     * Specifies an image list that contains button images for a toolbar embedded in a thumbnail image of a window in a taskbar button flyout.
     * @remarks
     * Applications must provide these button images:
     *                 
     *                 
     * 
     * 
     * <ul>
     * <li>The button in its default active state.</li>
     * <li>Images suitable for use with high-dpi (dots per inch) displays.</li>
     * </ul>
     * 
     * 
     * Images must be 32-bit and of dimensions <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getsystemmetrics">GetSystemMetrics</a>(SM_CXICON) x <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getsystemmetrics">GetSystemMetrics</a>(SM_CYICON). The toolbar itself provides visuals for a button's clicked, disabled, and hover states.
     * @param {HWND} hwnd Type: <b>HWND</b>
     * 
     * The handle of the window whose thumbnail representation contains the toolbar to be updated. This handle must belong to the calling process.
     * @param {HIMAGELIST} himl Type: <b>HIMAGELIST</b>
     * 
     * The handle of the image list that contains all button images to be used in the toolbar.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itaskbarlist3-thumbbarsetimagelist
     */
    ThumbBarSetImageList(hwnd, himl) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd
        himl := himl is Win32Handle ? NumGet(himl, "ptr") : himl

        result := ComCall(17, this, "ptr", hwnd, "ptr", himl, "HRESULT")
        return result
    }

    /**
     * Applies an overlay to a taskbar button to indicate application status or a notification to the user.
     * @remarks
     * In versions of Windows earlier than Windows 7, applications often used icons in the notification area of the taskbar to display application status and notifications to the user. The Windows 7 taskbar allows an application to provide that same sort of user feedback through its taskbar button, centralizing more of the application information in one place. These overlays are similar to existing overlays used for shortcut icons or security notifications, displayed at the lower-right corner of the button.
     * 
     * The following illustration shows an overlay (the small, green square that indicates the user status as "Available") applied to the far-right taskbar button.
     * 
     * <img alt="Screen shot of the Windows Messenger taskbar button with an overlay to indicate an Available status" src="./images/TaskbarOverlay.png"/>
     * Icon overlays serve as a contextual notification of status, and are intended to negate the need for a separate notification area status icon to communicate that information to the user. The application designer must decide during the development cycle which method—icon overlay or notification area status icon—best serves that application. Overlay icons are intended to supply important, long-standing status or notifications such as network status, messenger status, or new mail. They should not be frequently changed, nor should they be animated.
     * 
     * To display an overlay icon, the taskbar must be in the default large icon mode. If the taskbar is configured through <b>Taskbar and Start Menu Properties</b> to show small icons, overlays cannot be applied and calls to this method are ignored.
     * 
     * Because a single overlay is applied to the taskbar button instead of to the individual window thumbnails, this is a per-group feature rather than per-window. Requests for overlay icons can be received from individual windows in a taskbar group, but they do not queue. The last overlay received is the overlay shown. If the last overlay received is removed, the overlay that it replaced is restored so long as it is still active. As an example, windows 1, 2, and 3 set, in order, overlays A, B, and C. Because overlay C was received last, it is shown on the taskbar button. Window 2 calls <b>SetOverlayIcon</b> with a <b>NULL</b> value to remove overlay B. Window 3 then does the same to remove overlay C. Because window 1's overlay A is still active, that overlay is then displayed on the taskbar button.
     * 
     * If Windows Explorer shuts down unexpectedly, overlays are not restored when Windows Explorer is restored. The application should wait to receive the <b>TaskbarButtonCreated</b> message that indicates that Windows Explorer has restarted and the taskbar button has been re-created, and then call <b>SetOverlayIcon</b> again to reapply the overlay.
     * @param {HWND} hwnd Type: <b>HWND</b>
     * 
     * The handle of the window whose associated taskbar button receives the overlay. This handle must belong to a calling process associated with the button's application and must be a valid <b>HWND</b> or the call is ignored.
     * @param {HICON} hIcon Type: <b>HICON</b>
     * 
     * The handle of an icon to use as the overlay. This should be a small icon, measuring 16x16 pixels at 96 dpi. If an overlay icon is already applied to the taskbar button, that existing overlay is replaced.
     * 
     * 
     * 
     * This value can be <b>NULL</b>. How a <b>NULL</b> value is handled depends on whether the taskbar button represents a single window or a group of windows.
     *                         
     * <ul>
     * <li>If the taskbar button represents a single window, the overlay icon is removed from the display.</li>
     * <li>If the taskbar button represents a group of windows and a previous overlay is still available (received earlier than the current overlay, but not yet freed by a <b>NULL</b> value), then that previous overlay is displayed in place of the current overlay.</li>
     * </ul>
     * 
     * 
     * It is the responsibility of the calling application to free <i>hIcon</i> when it is no longer needed. This can generally be done after you call <b>SetOverlayIcon</b> because the taskbar makes and uses its own copy of the icon.
     * @param {PWSTR} pszDescription Type: <b>LPCWSTR</b>
     * 
     * A pointer to a string that provides an alt text version of the information conveyed by the overlay, for accessibility purposes.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itaskbarlist3-setoverlayicon
     */
    SetOverlayIcon(hwnd, hIcon, pszDescription) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd
        hIcon := hIcon is Win32Handle ? NumGet(hIcon, "ptr") : hIcon
        pszDescription := pszDescription is String ? StrPtr(pszDescription) : pszDescription

        result := ComCall(18, this, "ptr", hwnd, "ptr", hIcon, "ptr", pszDescription, "HRESULT")
        return result
    }

    /**
     * Specifies or updates the text of the tooltip that is displayed when the mouse pointer rests on an individual preview thumbnail in a taskbar button flyout.
     * @param {HWND} hwnd Type: <b>HWND</b>
     * 
     * The handle to the window whose thumbnail displays the tooltip. This handle must belong to the calling process.
     * @param {PWSTR} pszTip Type: <b>LPCWSTR</b>
     * 
     * The pointer to the text to be displayed in the tooltip. This value can be <b>NULL</b>, in which case the title of the window specified by <i>hwnd</i> is used as the tooltip.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itaskbarlist3-setthumbnailtooltip
     */
    SetThumbnailTooltip(hwnd, pszTip) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd
        pszTip := pszTip is String ? StrPtr(pszTip) : pszTip

        result := ComCall(19, this, "ptr", hwnd, "ptr", pszTip, "HRESULT")
        return result
    }

    /**
     * Selects a portion of a window's client area to display as that window's thumbnail in the taskbar.
     * @param {HWND} hwnd Type: <b>HWND</b>
     * 
     * The handle to a window represented in the taskbar.
     * @param {Pointer<RECT>} prcClip Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that specifies a selection within the window's client area, relative to the upper-left corner of that client area. To clear a clip that is already in place and return to the default display of the thumbnail, set this parameter to <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itaskbarlist3-setthumbnailclip
     */
    SetThumbnailClip(hwnd, prcClip) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(20, this, "ptr", hwnd, "ptr", prcClip, "HRESULT")
        return result
    }
}
