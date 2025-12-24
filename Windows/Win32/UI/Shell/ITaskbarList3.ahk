#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITaskbarList2.ahk

/**
 * Extends ITaskbarList2 by exposing methods that support the unified launching and switching taskbar button functionality added in Windows 7.
 * @remarks
 * 
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
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-itaskbarlist3
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-itaskbarlist3-setprogressvalue
     */
    SetProgressValue(hwnd, ullCompleted, ullTotal) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(9, this, "ptr", hwnd, "uint", ullCompleted, "uint", ullTotal, "HRESULT")
        return result
    }

    /**
     * Sets the type and state of the progress indicator displayed on a taskbar button.
     * @param {HWND} hwnd Type: <b>HWND</b>
     * 
     * The handle of the window in which the progress of an operation is being shown. This window's associated taskbar button will display the progress bar.
     * @param {Integer} tbpFlags Type: <b>TBPFLAG</b>
     * 
     * Flags that control the current state of the progress button. Specify only one of the following flags; all states are mutually exclusive of all others.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-itaskbarlist3-setprogressstate
     */
    SetProgressState(hwnd, tbpFlags) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(10, this, "ptr", hwnd, "int", tbpFlags, "HRESULT")
        return result
    }

    /**
     * Informs the taskbar that a new tab or document thumbnail has been provided for display in an application's taskbar group flyout.
     * @param {HWND} hwndTab Type: <b>HWND</b>
     * 
     * Handle of the tab or document window. This value is required and cannot be <b>NULL</b>.
     * @param {HWND} hwndMDI Type: <b>HWND</b>
     * 
     * Handle of the application's main window. This value tells the taskbar which application's preview group to attach the new thumbnail to. This value is required and cannot be <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise. If either parameter is <b>NULL</b>, this method returns an error.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-itaskbarlist3-registertab
     */
    RegisterTab(hwndTab, hwndMDI) {
        hwndTab := hwndTab is Win32Handle ? NumGet(hwndTab, "ptr") : hwndTab
        hwndMDI := hwndMDI is Win32Handle ? NumGet(hwndMDI, "ptr") : hwndMDI

        result := ComCall(11, this, "ptr", hwndTab, "ptr", hwndMDI, "HRESULT")
        return result
    }

    /**
     * Removes a thumbnail from an application's preview group when that tab or document is closed in the application.
     * @param {HWND} hwndTab Type: <b>HWND</b>
     * 
     * The handle of the tab window whose thumbnail is being removed. This is the same value with which the thumbnail was registered as part the group through <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-itaskbarlist3-registertab">ITaskbarList3::RegisterTab</a>. This value is required and cannot be <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns <b>S_OK</b> if successful, or an error value otherwise. If <i>hwndTab</i> is <b>NULL</b>, this method returns an error.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-itaskbarlist3-unregistertab
     */
    UnregisterTab(hwndTab) {
        hwndTab := hwndTab is Win32Handle ? NumGet(hwndTab, "ptr") : hwndTab

        result := ComCall(12, this, "ptr", hwndTab, "HRESULT")
        return result
    }

    /**
     * Inserts a new thumbnail into a tabbed-document interface (TDI) or multiple-document interface (MDI) application's group flyout or moves an existing thumbnail to a new position in the application's group.
     * @param {HWND} hwndTab Type: <b>HWND</b>
     * 
     * The handle of the tab window whose thumbnail is being placed. This value is required, must already be registered through <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-itaskbarlist3-registertab">ITaskbarList3::RegisterTab</a>, and cannot be <b>NULL</b>.
     * @param {HWND} hwndInsertBefore Type: <b>HWND</b>
     * 
     * The handle of the tab window whose thumbnail that <i>hwndTab</i> is inserted to the left of. This handle must already be registered through <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-itaskbarlist3-registertab">ITaskbarList3::RegisterTab</a>. If this value is <b>NULL</b>, the new thumbnail is added to the end of the list.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-itaskbarlist3-settaborder
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-itaskbarlist3-settabactive
     */
    SetTabActive(hwndTab, hwndMDI, dwReserved) {
        hwndTab := hwndTab is Win32Handle ? NumGet(hwndTab, "ptr") : hwndTab
        hwndMDI := hwndMDI is Win32Handle ? NumGet(hwndMDI, "ptr") : hwndMDI

        result := ComCall(14, this, "ptr", hwndTab, "ptr", hwndMDI, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * Adds a thumbnail toolbar with a specified set of buttons to the thumbnail image of a window in a taskbar button flyout.
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
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-itaskbarlist3-thumbbaraddbuttons
     */
    ThumbBarAddButtons(hwnd, cButtons, pButton) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(15, this, "ptr", hwnd, "uint", cButtons, "ptr", pButton, "HRESULT")
        return result
    }

    /**
     * Shows, enables, disables, or hides buttons in a thumbnail toolbar as required by the window's current state. A thumbnail toolbar is a toolbar embedded in a thumbnail image of a window in a taskbar button flyout.
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-itaskbarlist3-thumbbarupdatebuttons
     */
    ThumbBarUpdateButtons(hwnd, cButtons, pButton) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(16, this, "ptr", hwnd, "uint", cButtons, "ptr", pButton, "HRESULT")
        return result
    }

    /**
     * Specifies an image list that contains button images for a toolbar embedded in a thumbnail image of a window in a taskbar button flyout.
     * @param {HWND} hwnd Type: <b>HWND</b>
     * 
     * The handle of the window whose thumbnail representation contains the toolbar to be updated. This handle must belong to the calling process.
     * @param {HIMAGELIST} himl Type: <b>HIMAGELIST</b>
     * 
     * The handle of the image list that contains all button images to be used in the toolbar.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-itaskbarlist3-thumbbarsetimagelist
     */
    ThumbBarSetImageList(hwnd, himl) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd
        himl := himl is Win32Handle ? NumGet(himl, "ptr") : himl

        result := ComCall(17, this, "ptr", hwnd, "ptr", himl, "HRESULT")
        return result
    }

    /**
     * Applies an overlay to a taskbar button to indicate application status or a notification to the user.
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-itaskbarlist3-setoverlayicon
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-itaskbarlist3-setthumbnailtooltip
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-itaskbarlist3-setthumbnailclip
     */
    SetThumbnailClip(hwnd, prcClip) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(20, this, "ptr", hwnd, "ptr", prcClip, "HRESULT")
        return result
    }
}
