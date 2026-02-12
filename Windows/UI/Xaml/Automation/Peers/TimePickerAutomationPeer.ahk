#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\ITimePickerAutomationPeer.ahk
#Include .\ITimePickerAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [TimePicker](../windows.ui.xaml.controls/timepicker.md) types to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime  [TimePicker](../windows.ui.xaml.controls/timepicker.md) class creates a new TimePickerAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. Derive your automation peer from TimePickerAutomationPeer if you are deriving a custom class from [TimePicker](../windows.ui.xaml.controls/timepicker.md) and want to add automation support for additional features that you enabled in your custom class. Then override [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) so that it returns your custom peer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.timepickerautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class TimePickerAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITimePickerAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITimePickerAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {TimePicker} owner 
     * @returns {TimePickerAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!TimePickerAutomationPeer.HasProp("__ITimePickerAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.TimePickerAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITimePickerAutomationPeerFactory.IID)
            TimePickerAutomationPeer.__ITimePickerAutomationPeerFactory := ITimePickerAutomationPeerFactory(factoryPtr)
        }

        return TimePickerAutomationPeer.__ITimePickerAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
