#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\RangeBaseAutomationPeer.ahk
#Include .\ISliderAutomationPeer.ahk
#Include .\ISliderAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [Slider](../windows.ui.xaml.controls/slider.md) types to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime  [Slider](../windows.ui.xaml.controls/slider.md) class creates a new SliderAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. Derive your automation peer from SliderAutomationPeer if you are deriving a custom class from [Slider](../windows.ui.xaml.controls/slider.md) and want to add automation support for additional features that you enabled in your custom class. Then override [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) so that it returns your custom peer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.sliderautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class SliderAutomationPeer extends RangeBaseAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISliderAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISliderAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {Slider} owner 
     * @returns {SliderAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!SliderAutomationPeer.HasProp("__ISliderAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.SliderAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISliderAutomationPeerFactory.IID)
            SliderAutomationPeer.__ISliderAutomationPeerFactory := ISliderAutomationPeerFactory(factoryPtr)
        }

        return SliderAutomationPeer.__ISliderAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
