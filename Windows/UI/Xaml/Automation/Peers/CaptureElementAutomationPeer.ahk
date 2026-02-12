#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\ICaptureElementAutomationPeer.ahk
#Include .\ICaptureElementAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [CaptureElement](../windows.ui.xaml.controls/captureelement.md) types to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime  [CaptureElement](../windows.ui.xaml.controls/captureelement.md) class creates a new CaptureElementAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. [CaptureElement](../windows.ui.xaml.controls/captureelement.md) is sealed, so the normal scenario of deriving from the class and its existing peer isn't applicable to CaptureElementAutomationPeer.
 * 
 * Also, the [CaptureElement](../windows.ui.xaml.controls/captureelement.md) isn't focusable, which limits its participation in a Microsoft UI Automation tree view of the UI.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.captureelementautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class CaptureElementAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICaptureElementAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICaptureElementAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {CaptureElement} owner 
     * @returns {CaptureElementAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!CaptureElementAutomationPeer.HasProp("__ICaptureElementAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.CaptureElementAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICaptureElementAutomationPeerFactory.IID)
            CaptureElementAutomationPeer.__ICaptureElementAutomationPeerFactory := ICaptureElementAutomationPeerFactory(factoryPtr)
        }

        return CaptureElementAutomationPeer.__ICaptureElementAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
