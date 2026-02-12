#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\IImageAutomationPeer.ahk
#Include .\IImageAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [Image](../windows.ui.xaml.controls/image.md) types to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime  [Image](../windows.ui.xaml.controls/image.md) class creates a new ImageAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. [Image](../windows.ui.xaml.controls/image.md) is sealed, so the normal scenario of deriving from the class and its existing peer isn't applicable to ImageAutomationPeer.
 * 
 * Also, the [Image](../windows.ui.xaml.controls/image.md) isn't focusable, which limits its participation in a Microsoft UI Automation tree view of the UI. There are techniques for increasing the accessibility visibility of images in UI, such as applying labels or visible captions. For more info, see "Accessible names for images" section of [Basic accessibility information](/windows/uwp/accessibility/basic-accessibility-information).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.imageautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class ImageAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IImageAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IImageAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {Image} owner 
     * @returns {ImageAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!ImageAutomationPeer.HasProp("__IImageAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.ImageAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IImageAutomationPeerFactory.IID)
            ImageAutomationPeer.__IImageAutomationPeerFactory := IImageAutomationPeerFactory(factoryPtr)
        }

        return ImageAutomationPeer.__IImageAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
