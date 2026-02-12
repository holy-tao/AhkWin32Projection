#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ToggleButtonAutomationPeer.ahk
#Include .\ICheckBoxAutomationPeer.ahk
#Include .\ICheckBoxAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [CheckBox](../windows.ui.xaml.controls/checkbox.md) types to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime  [CheckBox](../windows.ui.xaml.controls/checkbox.md) class creates a new CheckBoxAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. Derive your automation peer from CheckBoxAutomationPeer if you are deriving a custom class from [CheckBox](../windows.ui.xaml.controls/checkbox.md) and want to add automation support for additional features that you enabled in your custom class. Then override [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) so that it returns your custom peer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.checkboxautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class CheckBoxAutomationPeer extends ToggleButtonAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICheckBoxAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICheckBoxAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {CheckBox} owner 
     * @returns {CheckBoxAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!CheckBoxAutomationPeer.HasProp("__ICheckBoxAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.CheckBoxAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICheckBoxAutomationPeerFactory.IID)
            CheckBoxAutomationPeer.__ICheckBoxAutomationPeerFactory := ICheckBoxAutomationPeerFactory(factoryPtr)
        }

        return CheckBoxAutomationPeer.__ICheckBoxAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
