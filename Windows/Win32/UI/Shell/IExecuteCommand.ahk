#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that set a given state or parameter related to the command verb, as well as a method to invoke that verb.
 * @remarks
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * Implement this interface when you choose it as your method to invoke the verb to perform an action on selected items. The items are passed as a Shell item array through <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iobjectwithselection-setselection">IObjectWithSelection::SetSelection</a>, so the object must also implement <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iobjectwithselection">IObjectWithSelection</a>.
 * 
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * Do not call the methods of <b>IExecuteCommand</b> directly. Windows Explorer calls your <b>IExecuteCommand</b> methods when the user wants to perform an action on the items.
 * 
 * Note that, apart from <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iexecutecommand-execute">Execute</a>, the methods of this interface pass system information to the handler. The system itself calls these methods, setting the parameters appropriately based on system settings and conditions.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iexecutecommand
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IExecuteCommand extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IExecuteCommand
     * @type {Guid}
     */
    static IID => Guid("{7f9185b0-cb92-43c5-80a9-92277a4f7b54}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetKeyState", "SetParameters", "SetPosition", "SetShowWindow", "SetNoShowUI", "SetDirectory", "Execute"]

    /**
     * Sets a value based on the current state of the keys CTRL and SHIFT.
     * @param {Integer} grfKeyState Type: <b>DWORD</b>
     * 
     * One or both of the following flags to indicate whether the key is pressed.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iexecutecommand-setkeystate
     */
    SetKeyState(grfKeyState) {
        result := ComCall(3, this, "uint", grfKeyState, "HRESULT")
        return result
    }

    /**
     * Provides parameter values for the verb.
     * @param {PWSTR} pszParameters Type: <b>LPCWSTR</b>
     * 
     * Pointer to a string that contains parameter values. The format and contents of this string is determined by the verb that is to be invoked.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iexecutecommand-setparameters
     */
    SetParameters(pszParameters) {
        pszParameters := pszParameters is String ? StrPtr(pszParameters) : pszParameters

        result := ComCall(4, this, "ptr", pszParameters, "HRESULT")
        return result
    }

    /**
     * Sets the coordinates of a point used for display.
     * @param {POINT} pt Type: <b><a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a></b>
     * 
     * The screen coordinates at which the user right-clicked to invoke the shortcut menu from which a command was chosen. Applications can use this information to present any UI. This is particularly useful in a multi-monitor situation. The default position is the center of the default monitor.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iexecutecommand-setposition
     */
    SetPosition(pt) {
        result := ComCall(5, this, "ptr", pt, "HRESULT")
        return result
    }

    /**
     * Sets the specified window's visual state.
     * @param {Integer} nShow Type: <b>int</b>
     * 
     * It can be any of the values that can be specified in the <i>nCmdShow</i> parameter for the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-showwindow">ShowWindow</a> function.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iexecutecommand-setshowwindow
     */
    SetShowWindow(nShow) {
        result := ComCall(6, this, "int", nShow, "HRESULT")
        return result
    }

    /**
     * Indicates whether any UI associated with the selected Shell item should be displayed.
     * @param {BOOL} fNoShowUI Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to block display of any associated UI; <b>FALSE</b> to display the UI. <b>FALSE</b> is the default value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iexecutecommand-setnoshowui
     */
    SetNoShowUI(fNoShowUI) {
        result := ComCall(7, this, "int", fNoShowUI, "HRESULT")
        return result
    }

    /**
     * Sets a new working directory.
     * @param {PWSTR} pszDirectory Type: <b>LPCWSTR</b>
     * 
     * Pointer to a null-terminated string with the fully qualified path of the new working directory. If this value is <b>NULL</b>, the current working directory is used.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iexecutecommand-setdirectory
     */
    SetDirectory(pszDirectory) {
        pszDirectory := pszDirectory is String ? StrPtr(pszDirectory) : pszDirectory

        result := ComCall(8, this, "ptr", pszDirectory, "HRESULT")
        return result
    }

    /**
     * Invoke the verb on the selected items. Call this method after you have called the other methods of this interface.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iexecutecommand-execute
     */
    Execute() {
        result := ComCall(9, this, "HRESULT")
        return result
    }
}
