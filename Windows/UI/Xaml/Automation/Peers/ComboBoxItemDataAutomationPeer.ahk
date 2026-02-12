#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SelectorItemAutomationPeer.ahk
#Include .\IComboBoxItemDataAutomationPeer.ahk
#Include ..\Provider\IScrollItemProvider.ahk
#Include .\IComboBoxItemDataAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes the data content of a [ComboBoxItem](../windows.ui.xaml.controls/comboboxitem.md) to Microsoft UI Automation.
 * @remarks
 * ComboBoxItemDataAutomationPeer is generated from [ComboBoxAutomationPeer](comboboxautomationpeer.md) logic, not an associated control class.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.comboboxitemdataautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class ComboBoxItemDataAutomationPeer extends SelectorItemAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IComboBoxItemDataAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IComboBoxItemDataAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {IInspectable} item 
     * @param {ComboBoxAutomationPeer} parent 
     * @returns {ComboBoxItemDataAutomationPeer} 
     */
    static CreateInstanceWithParentAndItem(item, parent) {
        if (!ComboBoxItemDataAutomationPeer.HasProp("__IComboBoxItemDataAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.ComboBoxItemDataAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IComboBoxItemDataAutomationPeerFactory.IID)
            ComboBoxItemDataAutomationPeer.__IComboBoxItemDataAutomationPeerFactory := IComboBoxItemDataAutomationPeerFactory(factoryPtr)
        }

        return ComboBoxItemDataAutomationPeer.__IComboBoxItemDataAutomationPeerFactory.CreateInstanceWithParentAndItem(item, parent, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Scrolls the content area of a parent container in order to display the peer owner's content within the visible region (viewport) of the container.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.comboboxitemdataautomationpeer.scrollintoview
     */
    ScrollIntoView() {
        if (!this.HasProp("__IScrollItemProvider")) {
            if ((queryResult := this.QueryInterface(IScrollItemProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollItemProvider := IScrollItemProvider(outPtr)
        }

        return this.__IScrollItemProvider.ScrollIntoView()
    }

;@endregion Instance Methods
}
