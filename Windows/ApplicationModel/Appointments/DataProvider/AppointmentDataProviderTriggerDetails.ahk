#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppointmentDataProviderTriggerDetails.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents trigger information about the background task in which data will be transferred between the app and its caller.
 * @remarks
 * Cast this type from a background task's [TriggerDetails](../windows.applicationmodel.background/ibackgroundtaskinstance_triggerdetails.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentdataprovidertriggerdetails
 * @namespace Windows.ApplicationModel.Appointments.DataProvider
 * @version WindowsRuntime 1.4
 */
class AppointmentDataProviderTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppointmentDataProviderTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppointmentDataProviderTriggerDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the data connection over which appointment data can be transferred.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentdataprovidertriggerdetails.connection
     * @type {AppointmentDataProviderConnection} 
     */
    Connection {
        get => this.get_Connection()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {AppointmentDataProviderConnection} 
     */
    get_Connection() {
        if (!this.HasProp("__IAppointmentDataProviderTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IAppointmentDataProviderTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentDataProviderTriggerDetails := IAppointmentDataProviderTriggerDetails(outPtr)
        }

        return this.__IAppointmentDataProviderTriggerDetails.get_Connection()
    }

;@endregion Instance Methods
}
