#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\IThumbAutomationPeer.ahk
#Include .\IThumbAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [Thumb](../windows.ui.xaml.controls.primitives/thumb.md) types to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime  [Thumb](../windows.ui.xaml.controls.primitives/thumb.md) class creates a new ThumbAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. [Thumb](../windows.ui.xaml.controls.primitives/thumb.md) is sealed, so the normal scenario of deriving from the [Thumb](../windows.ui.xaml.controls.primitives/thumb.md) class and its existing peer isn't applicable to ThumbAutomationPeer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.thumbautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class ThumbAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IThumbAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IThumbAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {Thumb} owner 
     * @returns {ThumbAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!ThumbAutomationPeer.HasProp("__IThumbAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.ThumbAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IThumbAutomationPeerFactory.IID)
            ThumbAutomationPeer.__IThumbAutomationPeerFactory := IThumbAutomationPeerFactory(factoryPtr)
        }

        return ThumbAutomationPeer.__IThumbAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
