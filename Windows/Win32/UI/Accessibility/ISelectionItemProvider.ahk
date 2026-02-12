#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRawElementProviderSimple.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to individual, selectable child controls of containers that implement ISelectionProvider.
 * @remarks
 * Implemented on a Microsoft UI Automation provider that 
 *             must support the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingselectionitem">SelectionItem</a> control pattern.
 * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nn-uiautomationcore-iselectionitemprovider
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
     * Deselects any selected items and then selects the current element.
     * @remarks
     * If the current element isn’t selected, this method deselects any selected items and then selects the current element.  If the current element is already selected, this method does nothing.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-iselectionitemprovider-select
     */
    Select() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds the current element to the collection of selected items. (ISelectionItemProvider.AddToSelection)
     * @remarks
     * If the result of a call to <b>ISelectionItemProvider::AddToSelection</b> is that a single item is selected, then 
     * 			send an <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">UIA_SelectionItem_ElementSelectedEventId</a> event for that element; otherwise send an <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">UIA_SelectionItem_ElementAddedToSelectionEventId</a> or 
     * 			<a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">UIA_SelectionItem_ElementRemovedFromSelectionEventId</a> event as appropriate. 
     * 
     * <div class="alert"><b>Note</b>  This rule does not depend on whether the container allows single or multiple selection, 
     * 			or on what method was used to change the selection. Only the result matters.</div>
     * <div> </div>
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-iselectionitemprovider-addtoselection
     */
    AddToSelection() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes the current element from the collection of selected items.
     * @remarks
     * Send an <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">UIA_SelectionItem_ElementRemovedFromSelectionEventId</a> event as appropriate. 
     * 
     * <div class="alert"><b>Note</b>  This rule does not depend on whether the container allows single or multiple selection, 
     * 			or on what method was used to change the selection. Only the result matters.</div>
     * <div> </div>
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-iselectionitemprovider-removefromselection
     */
    RemoveFromSelection() {
        result := ComCall(5, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Indicates whether an item is selected.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-iselectionitemprovider-get_isselected
     */
    get_IsSelected() {
        result := ComCall(6, this, "int*", &pRetVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pRetVal
    }

    /**
     * Specifies the provider that implements ISelectionProvider and acts as the container for the calling object.
     * @returns {IRawElementProviderSimple} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-iselectionitemprovider-get_selectioncontainer
     */
    get_SelectionContainer() {
        result := ComCall(7, this, "ptr*", &pRetVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRawElementProviderSimple(pRetVal)
    }
}
