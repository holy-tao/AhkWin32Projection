#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\IColorSpectrumAutomationPeer.ahk
#Include .\IColorSpectrumAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes **[ColorSpectrum](../windows.ui.xaml.controls.primitives/colorspectrum.md)** types to Microsoft UI Automation.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Automation.Peers.ColorSpectrumAutomationPeer](/windows/winui/api/microsoft.ui.xaml.automation.peers.colorspectrumautomationpeer) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.colorspectrumautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class ColorSpectrumAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IColorSpectrumAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IColorSpectrumAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {ColorSpectrum} owner 
     * @returns {ColorSpectrumAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!ColorSpectrumAutomationPeer.HasProp("__IColorSpectrumAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.ColorSpectrumAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorSpectrumAutomationPeerFactory.IID)
            ColorSpectrumAutomationPeer.__IColorSpectrumAutomationPeerFactory := IColorSpectrumAutomationPeerFactory(factoryPtr)
        }

        return ColorSpectrumAutomationPeer.__IColorSpectrumAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
