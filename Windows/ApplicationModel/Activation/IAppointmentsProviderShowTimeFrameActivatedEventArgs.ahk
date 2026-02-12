#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides data when an app is activated to show a specified time frame on the user’s calendar.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.iappointmentsprovidershowtimeframeactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class IAppointmentsProviderShowTimeFrameActivatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppointmentsProviderShowTimeFrameActivatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{9baeaba6-0e0b-49aa-babc-12b1dc774986}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TimeToShow", "get_Duration"]

    /**
     * Gets the starting date and time of the time frame to be shown.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.iappointmentsprovidershowtimeframeactivatedeventargs.timetoshow
     * @type {DateTime} 
     */
    TimeToShow {
        get => this.get_TimeToShow()
    }

    /**
     * Gets the duration of the time frame to be shown.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.iappointmentsprovidershowtimeframeactivatedeventargs.duration
     * @type {TimeSpan} 
     */
    Duration {
        get => this.get_Duration()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_TimeToShow() {
        value := DateTime()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Duration() {
        value := TimeSpan()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
