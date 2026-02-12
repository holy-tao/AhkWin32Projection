#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppointmentStoreChangeReader.ahk
#Include ..\..\..\Guid.ahk

/**
 * Enables the calling app to read through the changes to appointments in its appointment store.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentstorechangereader
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class AppointmentStoreChangeReader extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppointmentStoreChangeReader

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppointmentStoreChangeReader.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Returns a list of the changes that have occurred in the appointment store that have not yet been accepted by the calling app.
     * @returns {IAsyncOperation<IVectorView<AppointmentStoreChange>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentstorechangereader.readbatchasync
     */
    ReadBatchAsync() {
        if (!this.HasProp("__IAppointmentStoreChangeReader")) {
            if ((queryResult := this.QueryInterface(IAppointmentStoreChangeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentStoreChangeReader := IAppointmentStoreChangeReader(outPtr)
        }

        return this.__IAppointmentStoreChangeReader.ReadBatchAsync()
    }

    /**
     * Tells the system that all of the changes to appointments returned by the call to [ReadBatchAsync](appointmentstorechangereader_readbatchasync_888788553.md) have been addressed by the app.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentstorechangereader.acceptchanges
     */
    AcceptChanges() {
        if (!this.HasProp("__IAppointmentStoreChangeReader")) {
            if ((queryResult := this.QueryInterface(IAppointmentStoreChangeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentStoreChangeReader := IAppointmentStoreChangeReader(outPtr)
        }

        return this.__IAppointmentStoreChangeReader.AcceptChanges()
    }

    /**
     * Tells the system that all of the changes to appointments returned by the call to [ReadBatchAsync](appointmentstorechangereader_readbatchasync_888788553.md), up to the specified [AppointmentStoreChange](appointmentstorechange.md), have been addressed by the app.
     * @param {AppointmentStoreChange} lastChangeToAccept The [AppointmentStoreChange](appointmentstorechange.md) object indicating the latest change that has been addressed by the app.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentstorechangereader.acceptchangesthrough
     */
    AcceptChangesThrough(lastChangeToAccept) {
        if (!this.HasProp("__IAppointmentStoreChangeReader")) {
            if ((queryResult := this.QueryInterface(IAppointmentStoreChangeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentStoreChangeReader := IAppointmentStoreChangeReader(outPtr)
        }

        return this.__IAppointmentStoreChangeReader.AcceptChangesThrough(lastChangeToAccept)
    }

;@endregion Instance Methods
}
