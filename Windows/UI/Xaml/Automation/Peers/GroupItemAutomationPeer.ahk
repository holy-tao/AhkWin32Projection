#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\IGroupItemAutomationPeer.ahk
#Include .\IGroupItemAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes a [GroupItem](../windows.ui.xaml.controls/groupitem.md) to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime  [GroupItem](../windows.ui.xaml.controls/groupitem.md) class creates a new GroupItemAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. Derive your automation peer from GroupItemAutomationPeer if you are deriving a custom class from [GroupItem](../windows.ui.xaml.controls/groupitem.md) and want to add automation support for additional features that you enabled in your custom class. Then override [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) so that it returns your custom peer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.groupitemautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class GroupItemAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGroupItemAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGroupItemAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {GroupItem} owner 
     * @returns {GroupItemAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!GroupItemAutomationPeer.HasProp("__IGroupItemAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.GroupItemAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGroupItemAutomationPeerFactory.IID)
            GroupItemAutomationPeer.__IGroupItemAutomationPeerFactory := IGroupItemAutomationPeerFactory(factoryPtr)
        }

        return GroupItemAutomationPeer.__IGroupItemAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
