#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Exposes methods and properties to support access by a Microsoft UI Automation client to controls that act as containers for a collection of individual, selectable child items. The children of this element must implement [ISelectionItemProvider](iselectionitemprovider.md). Implement ISelectionProvider in order to support the capabilities that an automation client requests with a [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) call and [PatternInterface.SelectionItem](../windows.ui.xaml.automation.peers/patterninterface.md).
 * @remarks
 * This pattern has guidelines and conventions that aren't fully documented here. For more info on what this pattern is for, see [Selection Control Pattern](/windows/desktop/WinAuto/uiauto-implementingselection). However, you don't need to follow the guidance regarding [IRawElementProviderFragmentRoot](/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementproviderfragmentroot), that is specific to COM provider implementations and the interface doesn't exist in the Windows Runtime automation provider API.
 * 
 * ISelectionProvider is implemented by the existing Windows Runtime class [SelectorAutomationPeer](../windows.ui.xaml.automation.peers/selectorautomationpeer.md), which is the base class for [ComboBoxAutomationPeer](../windows.ui.xaml.automation.peers/comboboxautomationpeer.md) and [ListBoxAutomationPeer](../windows.ui.xaml.automation.peers/listboxautomationpeer.md).
 * 
 * Use [SelectionPatternIdentifiers](../windows.ui.xaml.automation/selectionpatternidentifiers.md) if you want to reference the ISelectionProvider pattern properties from control code when you fire automation events or call [RaisePropertyChangedEvent](../windows.ui.xaml.automation.peers/automationpeer_raisepropertychangedevent_715050195.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.iselectionprovider
 * @namespace Windows.UI.Xaml.Automation.Provider
 * @version WindowsRuntime 1.4
 */
class ISelectionProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISelectionProvider
     * @type {Guid}
     */
    static IID => Guid("{1f018fca-b944-4395-8de1-88f674af51d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CanSelectMultiple", "get_IsSelectionRequired", "GetSelection"]

    /**
     * Gets a value that indicates whether the Microsoft UI Automation provider allows more than one child element to be selected concurrently.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.iselectionprovider.canselectmultiple
     * @type {Boolean} 
     */
    CanSelectMultiple {
        get => this.get_CanSelectMultiple()
    }

    /**
     * Gets a value that indicates whether the UI Automation provider requires at least one child element to be selected.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.iselectionprovider.isselectionrequired
     * @type {Boolean} 
     */
    IsSelectionRequired {
        get => this.get_IsSelectionRequired()
    }

    /**
     * Indicates whether the Microsoft UI Automation provider allows more than one child element to be selected concurrently.
     * @remarks
     * This property may be dynamic. For example, in rare cases a control might allow 
     *         multiple items to be selected on initialization but subsequently allow only single selections to be made.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-iselectionprovider-get_canselectmultiple
     */
    get_CanSelectMultiple() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Indicates whether the Microsoft UI Automation provider requires at least one child element to be selected.
     * @remarks
     * This property can be dynamic. For example, the initial state of a control might 
     *         not have any items selected by default, meaning that <b>ISelectionProvider::IsSelectionRequired</b> is <b>FALSE</b>. 
     *         However, after an item is selected the control must always have at least one item selected.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-iselectionprovider-get_isselectionrequired
     */
    get_IsSelectionRequired() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Retrieves a Microsoft UI Automation provider for each child element that is selected.
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-iselectionprovider-getselection
     */
    GetSelection(result_) {
        result := ComCall(8, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
