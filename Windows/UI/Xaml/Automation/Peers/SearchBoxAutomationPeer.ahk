#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\ISearchBoxAutomationPeer.ahk
#Include .\ISearchBoxAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [SearchBox](../windows.ui.xaml.controls/searchbox.md) types to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime  [SearchBox](../windows.ui.xaml.controls/searchbox.md) class creates a new SearchBoxAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. Derive your automation peer from SearchBoxAutomationPeer if you are deriving a custom class from [SearchBox](../windows.ui.xaml.controls/searchbox.md) and want to add automation support for additional features that you enabled in your custom class. Then override [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) so that it returns your custom peer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.searchboxautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class SearchBoxAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISearchBoxAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISearchBoxAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {SearchBox} owner 
     * @returns {SearchBoxAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!SearchBoxAutomationPeer.HasProp("__ISearchBoxAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.SearchBoxAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISearchBoxAutomationPeerFactory.IID)
            SearchBoxAutomationPeer.__ISearchBoxAutomationPeerFactory := ISearchBoxAutomationPeerFactory(factoryPtr)
        }

        return SearchBoxAutomationPeer.__ISearchBoxAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
