#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\AutomationPeer.ahk
#Include ..\..\..\..\Foundation\Collections\IVector.ahk
#Include .\AutomationPeerAnnotation.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class IAutomationPeer3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAutomationPeer3
     * @type {Guid}
     */
    static IID => Guid("{d3cfb977-0084-41d7-a221-28158d3bc32c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Navigate", "GetElementFromPoint", "GetFocusedElement", "ShowContextMenu", "GetControlledPeers", "GetAnnotations", "SetParent", "RaiseTextEditTextChangedEvent", "GetPositionInSet", "GetSizeOfSet", "GetLevel", "RaiseStructureChangedEvent"]

    /**
     * Note This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The Navigate element specifies a URL used by calls to External.NavigateTaskPaneURL.
     * @param {Integer} direction_ 
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/WMP/navigate-element
     */
    Navigate(direction_) {
        result := ComCall(6, this, "int", direction_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }

    /**
     * 
     * @param {POINT} pointInWindowCoordinates 
     * @returns {IInspectable} 
     */
    GetElementFromPoint(pointInWindowCoordinates) {
        result := ComCall(7, this, "ptr", pointInWindowCoordinates, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    GetFocusedElement() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ShowContextMenu() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVectorView<AutomationPeer>} 
     */
    GetControlledPeers() {
        result := ComCall(10, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(AutomationPeer, result_)
    }

    /**
     * 
     * @returns {IVector<AutomationPeerAnnotation>} 
     */
    GetAnnotations() {
        result := ComCall(11, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(AutomationPeerAnnotation, result_)
    }

    /**
     * Changes the parent window of the specified child window.
     * @remarks
     * An application can use the <b>SetParent</b> function to set the parent window of a pop-up, overlapped, or child window.
     * 
     * If the window identified by the <i>hWndChild</i> parameter is visible, the system performs the appropriate redrawing and repainting. 
     * 
     * For compatibility reasons, <b>SetParent</b> does not modify the <b>WS_CHILD</b> or <b>WS_POPUP</b> window styles of the window whose parent is being changed. Therefore, if <i>hWndNewParent</i> is <b>NULL</b>, you should also clear the <b>WS_CHILD</b> bit and set the <b>WS_POPUP</b> style after calling <b>SetParent</b>. Conversely, if <i>hWndNewParent</i> is not <b>NULL</b> and the window was previously a child of the desktop, you should clear the <b>WS_POPUP</b> style and set the <b>WS_CHILD</b> style before calling <b>SetParent</b>. 
     * 
     *  When you change the parent of a window, you should synchronize the UISTATE of both windows. For more information, see <a href="https://docs.microsoft.com/windows/desktop/menurc/wm-changeuistate">WM_CHANGEUISTATE</a> and <a href="https://docs.microsoft.com/windows/desktop/menurc/wm-updateuistate">WM_UPDATEUISTATE</a>. 
     * 
     * Unexpected behavior or errors may occur if <i>hWndNewParent</i> and <i>hWndChild</i> are running in different DPI awareness modes. The table below outlines this behavior:
     * 
     * <table>
     * <tr>
     * <th>Operation</th>
     * <th>Windows 8.1</th>
     * <th>Windows 10 (1607 and earlier)</th>
     * <th>Windows 10 (1703 and later)</th>
     * </tr>
     * <tr>
     * <td>SetParent (In-Proc) </td>
     * <td>N/A </td>
     * <td><b>Forced reset</b> 
     * (of current process)</td>
     * <td><b>Fail</b> 
     * (ERROR_INVALID_STATE)</td>
     * </tr>
     * <tr>
     * <td>SetParent (Cross-Proc) </td>
     * <td><b>Forced reset</b> 
     * (of child window's process)</td>
     * <td><b>Forced reset</b> 
     * (of child window's process)</td>
     * <td><b>Forced reset</b> 
     * (of child window's process)</td>
     * </tr>
     * </table>
     *  
     * 
     *  For more information on DPI awareness, see <a href="https://docs.microsoft.com/windows/desktop/hidpi/high-dpi-desktop-application-development-on-windows">the Windows High DPI documentation.</a>
     * @param {AutomationPeer} peer 
     * @returns {HRESULT} Type: <b>HWND</b>
     * 
     * If the function succeeds, the return value is a handle to the previous parent window.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-setparent
     */
    SetParent(peer) {
        result := ComCall(12, this, "ptr", peer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} automationTextEditChangeType_ 
     * @param {IVectorView<HSTRING>} changedData 
     * @returns {HRESULT} 
     */
    RaiseTextEditTextChangedEvent(automationTextEditChangeType_, changedData) {
        result := ComCall(13, this, "int", automationTextEditChangeType_, "ptr", changedData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetPositionInSet() {
        result := ComCall(14, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetSizeOfSet() {
        result := ComCall(15, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * GetLevel (Database Engine)
     * @remarks
     * Used to determine the level of one or more nodes or to filter the nodes to members of a specified level. The root of the hierarchy is level 0.
     *   
     * GetLevel is useful for breadth-first search indexes. For more information, see [Hierarchical Data &#40;SQL Server&#41;](../../relational-databases/hierarchical-data-sql-server.md).
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/ocs/docs/t-sql/data-types/getlevel-database-engine
     */
    GetLevel() {
        result := ComCall(16, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} structureChangeType_ 
     * @param {AutomationPeer} child 
     * @returns {HRESULT} 
     */
    RaiseStructureChangedEvent(structureChangeType_, child) {
        result := ComCall(17, this, "int", structureChangeType_, "ptr", child, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
