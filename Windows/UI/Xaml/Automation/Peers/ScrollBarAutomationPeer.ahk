#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\RangeBaseAutomationPeer.ahk
#Include .\IScrollBarAutomationPeer.ahk
#Include .\IScrollBarAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [ScrollBar](../windows.ui.xaml.controls.primitives/scrollbar.md) types to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime  [ScrollBar](../windows.ui.xaml.controls.primitives/scrollbar.md) class creates a new ScrollBarAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. [ScrollBar](../windows.ui.xaml.controls.primitives/scrollbar.md) is sealed, so the normal scenario of deriving from the [ScrollBar](../windows.ui.xaml.controls.primitives/scrollbar.md) class and its existing peer isn't applicable to ScrollBarAutomationPeer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.scrollbarautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class ScrollBarAutomationPeer extends RangeBaseAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IScrollBarAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IScrollBarAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {ScrollBar} owner 
     * @returns {ScrollBarAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!ScrollBarAutomationPeer.HasProp("__IScrollBarAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.ScrollBarAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollBarAutomationPeerFactory.IID)
            ScrollBarAutomationPeer.__IScrollBarAutomationPeerFactory := IScrollBarAutomationPeerFactory(factoryPtr)
        }

        return ScrollBarAutomationPeer.__IScrollBarAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
