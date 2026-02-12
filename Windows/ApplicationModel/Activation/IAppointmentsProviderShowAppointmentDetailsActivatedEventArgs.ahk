#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides data when an app is activated to show the details of an appointment.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.iappointmentsprovidershowappointmentdetailsactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class IAppointmentsProviderShowAppointmentDetailsActivatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppointmentsProviderShowAppointmentDetailsActivatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{3958f065-9841-4ca5-999b-885198b9ef2a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InstanceStartDate", "get_LocalId", "get_RoamingId"]

    /**
     * Gets the start date of the appointment instance for which the app should display details.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.iappointmentsprovidershowappointmentdetailsactivatedeventargs.instancestartdate
     * @type {IReference<DateTime>} 
     */
    InstanceStartDate {
        get => this.get_InstanceStartDate()
    }

    /**
     * Ges the local identifier of the appointment for which the app should display details.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.iappointmentsprovidershowappointmentdetailsactivatedeventargs.localid
     * @type {HSTRING} 
     */
    LocalId {
        get => this.get_LocalId()
    }

    /**
     * Gets the roaming identifier of the appointment for which the app should display details.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.iappointmentsprovidershowappointmentdetailsactivatedeventargs.roamingid
     * @type {HSTRING} 
     */
    RoamingId {
        get => this.get_RoamingId()
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_InstanceStartDate() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDateTime(), value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LocalId() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RoamingId() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
