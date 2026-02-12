#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SelectorAutomationPeer.ahk
#Include .\IListBoxAutomationPeer.ahk
#Include .\IListBoxAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [ListBox](../windows.ui.xaml.controls/listbox.md) types to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime  [ListBox](../windows.ui.xaml.controls/listbox.md) class creates a new ListBoxAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. Derive your automation peer from ListBoxAutomationPeer if you are deriving a custom class from [ListBox](../windows.ui.xaml.controls/listbox.md) and want to add automation support for additional features that you enabled in your custom class. Then override [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) so that it returns your custom peer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.listboxautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class ListBoxAutomationPeer extends SelectorAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IListBoxAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IListBoxAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {ListBox} owner 
     * @returns {ListBoxAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!ListBoxAutomationPeer.HasProp("__IListBoxAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.ListBoxAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListBoxAutomationPeerFactory.IID)
            ListBoxAutomationPeer.__IListBoxAutomationPeerFactory := IListBoxAutomationPeerFactory(factoryPtr)
        }

        return ListBoxAutomationPeer.__IListBoxAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
