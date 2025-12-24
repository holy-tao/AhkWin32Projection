#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to a control that can cycle through a set of states, and maintain a state after it is set.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationtogglepattern
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationTogglePattern extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationTogglePattern
     * @type {Guid}
     */
    static IID => Guid("{94cf8058-9b8d-4ab9-8bfd-4cd0a33c8c70}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Toggle", "get_CurrentToggleState", "get_CachedToggleState"]

    /**
     * @type {Integer} 
     */
    CurrentToggleState {
        get => this.get_CurrentToggleState()
    }

    /**
     * @type {Integer} 
     */
    CachedToggleState {
        get => this.get_CachedToggleState()
    }

    /**
     * Cycles through the toggle states of the control.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationtogglepattern-toggle
     */
    Toggle() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Retrieves the state of the control.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationtogglepattern-get_currenttogglestate
     */
    get_CurrentToggleState() {
        result := ComCall(4, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached state of the control.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationtogglepattern-get_cachedtogglestate
     */
    get_CachedToggleState() {
        result := ComCall(5, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }
}
