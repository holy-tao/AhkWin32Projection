#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the result of attempting to reserve VoIP resources.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.voipphonecallresourcereservationstatus
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class VoipPhoneCallResourceReservationStatus extends Win32Enum{

    /**
     * The resources have been reserved.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The resources were not reserved because they are not available.
     * @type {Integer (Int32)}
     */
    static ResourcesNotAvailable => 1
}
