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
     * 
     * @param {HWND} hwnd 
     * @param {Integer} ullCompleted 
     * @param {Integer} ullTotal 
     * @returns {HRESULT} 
     */
    SetProgressValue(hwnd, ullCompleted, ullTotal) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(9, this, "ptr", hwnd, "uint", ullCompleted, "uint", ullTotal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {Integer} tbpFlags 
     * @returns {HRESULT} 
     */
    SetProgressState(hwnd, tbpFlags) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(10, this, "ptr", hwnd, "int", tbpFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwndTab 
     * @param {HWND} hwndMDI 
     * @returns {HRESULT} 
     */
    RegisterTab(hwndTab, hwndMDI) {
        hwndTab := hwndTab is Win32Handle ? NumGet(hwndTab, "ptr") : hwndTab
        hwndMDI := hwndMDI is Win32Handle ? NumGet(hwndMDI, "ptr") : hwndMDI

        result := ComCall(11, this, "ptr", hwndTab, "ptr", hwndMDI, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwndTab 
     * @returns {HRESULT} 
     */
    UnregisterTab(hwndTab) {
        hwndTab := hwndTab is Win32Handle ? NumGet(hwndTab, "ptr") : hwndTab

        result := ComCall(12, this, "ptr", hwndTab, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwndTab 
     * @param {HWND} hwndInsertBefore 
     * @returns {HRESULT} 
     */
    SetTabOrder(hwndTab, hwndInsertBefore) {
        hwndTab := hwndTab is Win32Handle ? NumGet(hwndTab, "ptr") : hwndTab
        hwndInsertBefore := hwndInsertBefore is Win32Handle ? NumGet(hwndInsertBefore, "ptr") : hwndInsertBefore

        result := ComCall(13, this, "ptr", hwndTab, "ptr", hwndInsertBefore, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwndTab 
     * @param {HWND} hwndMDI 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    SetTabActive(hwndTab, hwndMDI, dwReserved) {
        hwndTab := hwndTab is Win32Handle ? NumGet(hwndTab, "ptr") : hwndTab
        hwndMDI := hwndMDI is Win32Handle ? NumGet(hwndMDI, "ptr") : hwndMDI

        result := ComCall(14, this, "ptr", hwndTab, "ptr", hwndMDI, "uint", dwReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {Integer} cButtons 
     * @param {Pointer<THUMBBUTTON>} pButton 
     * @returns {HRESULT} 
     */
    ThumbBarAddButtons(hwnd, cButtons, pButton) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(15, this, "ptr", hwnd, "uint", cButtons, "ptr", pButton, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {Integer} cButtons 
     * @param {Pointer<THUMBBUTTON>} pButton 
     * @returns {HRESULT} 
     */
    ThumbBarUpdateButtons(hwnd, cButtons, pButton) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(16, this, "ptr", hwnd, "uint", cButtons, "ptr", pButton, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {HIMAGELIST} himl 
     * @returns {HRESULT} 
     */
    ThumbBarSetImageList(hwnd, himl) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd
        himl := himl is Win32Handle ? NumGet(himl, "ptr") : himl

        result := ComCall(17, this, "ptr", hwnd, "ptr", himl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {HICON} hIcon 
     * @param {PWSTR} pszDescription 
     * @returns {HRESULT} 
     */
    SetOverlayIcon(hwnd, hIcon, pszDescription) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd
        hIcon := hIcon is Win32Handle ? NumGet(hIcon, "ptr") : hIcon
        pszDescription := pszDescription is String ? StrPtr(pszDescription) : pszDescription

        result := ComCall(18, this, "ptr", hwnd, "ptr", hIcon, "ptr", pszDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {PWSTR} pszTip 
     * @returns {HRESULT} 
     */
    SetThumbnailTooltip(hwnd, pszTip) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd
        pszTip := pszTip is String ? StrPtr(pszTip) : pszTip

        result := ComCall(19, this, "ptr", hwnd, "ptr", pszTip, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {Pointer<RECT>} prcClip 
     * @returns {HRESULT} 
     */
    SetThumbnailClip(hwnd, prcClip) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(20, this, "ptr", hwnd, "ptr", prcClip, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
