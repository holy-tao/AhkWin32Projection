#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ToggleButtonAutomationPeer.ahk
#Include .\IAppBarToggleButtonAutomationPeer.ahk
#Include .\IAppBarToggleButtonAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [AppBarToggleButton](../windows.ui.xaml.controls/appbartogglebutton.md) types to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime  [AppBarToggleButton](../windows.ui.xaml.controls/appbartogglebutton.md) class creates a new AppBarToggleButtonAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. Derive your automation peer from AppBarToggleButtonAutomationPeer if you are deriving a custom class from [AppBarToggleButton](../windows.ui.xaml.controls/appbartogglebutton.md) and want to add automation support for additional features that you enabled in your custom class. Then override [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) so that it returns your custom peer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.appbartogglebuttonautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class AppBarToggleButtonAutomationPeer extends ToggleButtonAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppBarToggleButtonAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppBarToggleButtonAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {AppBarToggleButton} owner 
     * @returns {AppBarToggleButtonAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!AppBarToggleButtonAutomationPeer.HasProp("__IAppBarToggleButtonAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.AppBarToggleButtonAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppBarToggleButtonAutomationPeerFactory.IID)
            AppBarToggleButtonAutomationPeer.__IAppBarToggleButtonAutomationPeerFactory := IAppBarToggleButtonAutomationPeerFactory(factoryPtr)
        }

        return AppBarToggleButtonAutomationPeer.__IAppBarToggleButtonAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
