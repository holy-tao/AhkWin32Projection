#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRawElementProviderSimple.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to individual, selectable child controls of containers that implement ISelectionProvider.
 * @remarks
 * 
 * Implemented on a Microsoft UI Automation provider that 
 *             must support the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingselectionitem">SelectionItem</a> control pattern.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-iselectionitemprovider
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class ISelectionItemProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISelectionItemProvider
     * @type {Guid}
     */
    static IID => Guid("{2acad808-b2d4-452d-a407-91ff1ad167b2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Select", "AddToSelection", "RemoveFromSelection", "get_IsSelected", "get_SelectionContainer"]

    /**
     * @type {BOOL} 
     */
    IsSelected {
        get => this.get_IsSelected()
    }

    /**
     * @type {IRawElementProviderSimple} 
     */
    SelectionContainer {
        get => this.get_SelectionContainer()
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iselectionitemprovider-select
     */
    Select() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iselectionitemprovider-addtoselection
     */
    AddToSelection() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iselectionitemprovider-removefromselection
     */
    RemoveFromSelection() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iselectionitemprovider-get_isselected
     */
    get_IsSelected() {
        result := ComCall(6, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * 
     * @returns {IRawElementProviderSimple} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iselectionitemprovider-get_selectioncontainer
     */
    get_SelectionContainer() {
        result := ComCall(7, this, "ptr*", &pRetVal := 0, "HRESULT")
        return IRawElementProviderSimple(pRetVal)
    }
}
