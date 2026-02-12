#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\IDatePickerAutomationPeer.ahk
#Include .\IDatePickerAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [DatePicker](../windows.ui.xaml.controls/datepicker.md) types to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime  [DatePicker](../windows.ui.xaml.controls/datepicker.md) class creates a new DatePickerAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. Derive your automation peer from DatePickerAutomationPeer if you are deriving a custom class from [DatePicker](../windows.ui.xaml.controls/datepicker.md) and want to add automation support for additional features that you enabled in your custom class. Then override [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) so that it returns your custom peer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.datepickerautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class DatePickerAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDatePickerAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDatePickerAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {DatePicker} owner 
     * @returns {DatePickerAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!DatePickerAutomationPeer.HasProp("__IDatePickerAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.DatePickerAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDatePickerAutomationPeerFactory.IID)
            DatePickerAutomationPeer.__IDatePickerAutomationPeerFactory := IDatePickerAutomationPeerFactory(factoryPtr)
        }

        return DatePickerAutomationPeer.__IDatePickerAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
