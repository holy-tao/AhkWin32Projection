#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\IListBoxItemAutomationPeer.ahk
#Include .\IListBoxItemAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes the items in the [Items](../windows.ui.xaml.controls/itemscontrol_items.md) collection of a [ListBox](../windows.ui.xaml.controls/listbox.md) to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime  [ListBoxItem](../windows.ui.xaml.controls/listboxitem.md) class creates a new ListBoxItemAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. Derive your automation peer from ListBoxItemAutomationPeer if you are deriving a custom class from [ListBoxItem](../windows.ui.xaml.controls/listboxitem.md) and want to add automation support for additional features that you enabled in your custom class. Then override [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) so that it returns your custom peer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.listboxitemautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class ListBoxItemAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IListBoxItemAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IListBoxItemAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {ListBoxItem} owner 
     * @returns {ListBoxItemAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!ListBoxItemAutomationPeer.HasProp("__IListBoxItemAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.ListBoxItemAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListBoxItemAutomationPeerFactory.IID)
            ListBoxItemAutomationPeer.__IListBoxItemAutomationPeerFactory := IListBoxItemAutomationPeerFactory(factoryPtr)
        }

        return ListBoxItemAutomationPeer.__IListBoxItemAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
