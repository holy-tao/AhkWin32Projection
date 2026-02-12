#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\ISettingsFlyoutAutomationPeer.ahk
#Include .\ISettingsFlyoutAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [SettingsFlyout](../windows.ui.xaml.controls/settingsflyout.md) types to Microsoft UI Automation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.settingsflyoutautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class SettingsFlyoutAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISettingsFlyoutAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISettingsFlyoutAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {SettingsFlyout} owner 
     * @returns {SettingsFlyoutAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!SettingsFlyoutAutomationPeer.HasProp("__ISettingsFlyoutAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.SettingsFlyoutAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISettingsFlyoutAutomationPeerFactory.IID)
            SettingsFlyoutAutomationPeer.__ISettingsFlyoutAutomationPeerFactory := ISettingsFlyoutAutomationPeerFactory(factoryPtr)
        }

        return SettingsFlyoutAutomationPeer.__ISettingsFlyoutAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
