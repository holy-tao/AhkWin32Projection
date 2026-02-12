#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SliderAutomationPeer.ahk
#Include .\IColorPickerSliderAutomationPeer.ahk
#Include .\IColorPickerSliderAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes **[ColorPickerSlider](../windows.ui.xaml.controls.primitives/colorpickerslider.md)** types to Microsoft UI Automation.  
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Automation.Peers.ColorPickerSliderAutomationPeer](/windows/winui/api/microsoft.ui.xaml.automation.peers.colorpickersliderautomationpeer) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.colorpickersliderautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class ColorPickerSliderAutomationPeer extends SliderAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IColorPickerSliderAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IColorPickerSliderAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {ColorPickerSlider} owner 
     * @returns {ColorPickerSliderAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!ColorPickerSliderAutomationPeer.HasProp("__IColorPickerSliderAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.ColorPickerSliderAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorPickerSliderAutomationPeerFactory.IID)
            ColorPickerSliderAutomationPeer.__IColorPickerSliderAutomationPeerFactory := IColorPickerSliderAutomationPeerFactory(factoryPtr)
        }

        return ColorPickerSliderAutomationPeer.__IColorPickerSliderAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
