#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a virtualized item, which is an item that is represented by a placeholder automation element in the Microsoft UI Automation tree.
 * @remarks
 * A virtualized item can be an item retrieved from a control that supports the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingitemcontainer">ItemContainer</a> control pattern, or a virtualized embedded object retrieved from a control that supports the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-about-text-and-textrange-patterns">Text</a> control pattern.
 * 
 * The placeholder automation element for a virtualized item might not have loaded data for all UI Automation properties, and may return <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-error-codes">UIA_E_ELEMENTNOTAVAILABLE</a> in response to queries for properties that are not available.
 * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationclient/nn-uiautomationclient-iuiautomationvirtualizeditempattern
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationVirtualizedItemPattern extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationVirtualizedItemPattern
     * @type {Guid}
     */
    static IID => Guid("{6ba3d7a6-04cf-4f11-8793-a8d1cde9969f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Realize"]

    /**
     * Creates a full UI Automation element for a virtualized item.
     * @remarks
     * A virtualized item is represented by a placeholder automation element in the UI Automation tree. The <b>Realize</b> method causes the provider to make full information available for the item so that a full UI Automation element can be created for the item.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationclient/nf-uiautomationclient-iuiautomationvirtualizeditempattern-realize
     */
    Realize() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
