#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\ICalendarDatePickerAutomationPeer.ahk
#Include ..\Provider\IInvokeProvider.ahk
#Include ..\Provider\IValueProvider.ahk
#Include .\ICalendarDatePickerAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [CalendarDatePicker](../windows.ui.xaml.controls/calendardatepicker.md) types to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime [CalendarDatePicker](../windows.ui.xaml.controls/calendardatepicker.md) class creates a new CalendarDatePickerAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. Derive your automation peer from CalendarDatePickerAutomationPeer if you are deriving a custom class from [CalendarDatePicker](../windows.ui.xaml.controls/calendardatepicker.md) and want to add automation support for additional features that you enabled in your custom class. Then override [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) so that it returns your custom peer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.calendardatepickerautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class CalendarDatePickerAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICalendarDatePickerAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICalendarDatePickerAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {CalendarDatePicker} owner 
     * @returns {CalendarDatePickerAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!CalendarDatePickerAutomationPeer.HasProp("__ICalendarDatePickerAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.CalendarDatePickerAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarDatePickerAutomationPeerFactory.IID)
            CalendarDatePickerAutomationPeer.__ICalendarDatePickerAutomationPeerFactory := ICalendarDatePickerAutomationPeerFactory(factoryPtr)
        }

        return CalendarDatePickerAutomationPeer.__ICalendarDatePickerAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a value that specifies whether the value of a control is read-only.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.calendardatepickerautomationpeer.isreadonly
     * @type {Boolean} 
     */
    IsReadOnly {
        get => this.get_IsReadOnly()
    }

    /**
     * Gets the value of the control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.calendardatepickerautomationpeer.value
     * @type {HSTRING} 
     */
    Value {
        get => this.get_Value()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Sends a request to open the [CalendarDatePicker](../windows.ui.xaml.controls/calendardatepicker.md) associated with the automation peer.
     * @remarks
     * Calls to **Invoke** should return immediately without blocking. However, this behavior is entirely dependent on the Microsoft UI Automation provider implementation. In scenarios where calling **Invoke** causes a blocking issue, such as a modal dialog, a separate helper thread may be required to call the method.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.calendardatepickerautomationpeer.invoke
     */
    Invoke() {
        if (!this.HasProp("__IInvokeProvider")) {
            if ((queryResult := this.QueryInterface(IInvokeProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInvokeProvider := IInvokeProvider(outPtr)
        }

        return this.__IInvokeProvider.Invoke()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsReadOnly() {
        if (!this.HasProp("__IValueProvider")) {
            if ((queryResult := this.QueryInterface(IValueProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IValueProvider := IValueProvider(outPtr)
        }

        return this.__IValueProvider.get_IsReadOnly()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Value() {
        if (!this.HasProp("__IValueProvider")) {
            if ((queryResult := this.QueryInterface(IValueProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IValueProvider := IValueProvider(outPtr)
        }

        return this.__IValueProvider.get_Value()
    }

    /**
     * Sets the value of a control, as an implementation of the [IValueProvider](../windows.ui.xaml.automation.provider/ivalueprovider.md) pattern.
     * @param {HSTRING} value The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.calendardatepickerautomationpeer.setvalue
     */
    SetValue(value) {
        if (!this.HasProp("__IValueProvider")) {
            if ((queryResult := this.QueryInterface(IValueProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IValueProvider := IValueProvider(outPtr)
        }

        return this.__IValueProvider.SetValue(value)
    }

;@endregion Instance Methods
}
