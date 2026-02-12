#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IRawElementProviderSimple.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Exposes methods and properties to support access by a Microsoft UI Automation client to individual, selectable child controls of containers that implement [ISelectionProvider](iselectionprovider.md). Implement this interface in order to support the capabilities that an automation client requests with a [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) call and [PatternInterface.SelectionItem](../windows.ui.xaml.automation.peers/patterninterface.md).
 * @remarks
 * This pattern has guidelines and conventions that aren't fully documented here. For more info on what this pattern is for, see [SelectionItem Control Pattern](/windows/desktop/WinAuto/uiauto-implementingselectionitem). However, you don't need to follow the guidance regarding [IRawElementProviderFragmentRoot](/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementproviderfragmentroot), that is specific to COM provider implementations and the interface doesn't exist in the Windows Runtime automation provider API.
 * 
 * ISelectionItemProvider is implemented by these existing Windows Runtime classes:
 * + [RadioButtonAutomationPeer](../windows.ui.xaml.automation.peers/radiobuttonautomationpeer.md)
 * + [SelectorItemAutomationPeer](../windows.ui.xaml.automation.peers/selectoritemautomationpeer.md)
 * 
 * 
 * Use [SelectionItemPatternIdentifiers](../windows.ui.xaml.automation/selectionitempatternidentifiers.md) if you want to reference the ISelectionItemProvider pattern properties from control code when you fire automation events or call [RaisePropertyChangedEvent](../windows.ui.xaml.automation.peers/automationpeer_raisepropertychangedevent_715050195.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.iselectionitemprovider
 * @namespace Windows.UI.Xaml.Automation.Provider
 * @version WindowsRuntime 1.4
 */
class ISelectionItemProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISelectionItemProvider
     * @type {Guid}
     */
    static IID => Guid("{6a4977c1-830d-42d2-bf62-042ebddecc19}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsSelected", "get_SelectionContainer", "AddToSelection", "RemoveFromSelection", "Select"]

    /**
     * Gets a value that indicates whether an item is selected.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.iselectionitemprovider.isselected
     * @type {Boolean} 
     */
    IsSelected {
        get => this.get_IsSelected()
    }

    /**
     * Gets the UI Automation provider that implements [ISelectionProvider](iselectionprovider.md) and acts as the container for the calling object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.iselectionitemprovider.selectioncontainer
     * @type {IRawElementProviderSimple} 
     */
    SelectionContainer {
        get => this.get_SelectionContainer()
    }

    /**
     * Indicates whether an item is selected.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-iselectionitemprovider-get_isselected
     */
    get_IsSelected() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Specifies the provider that implements ISelectionProvider and acts as the container for the calling object.
     * @returns {IRawElementProviderSimple} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-iselectionitemprovider-get_selectioncontainer
     */
    get_SelectionContainer() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRawElementProviderSimple(value)
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
        result := ComCall(8, this, "int")
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
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
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
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
