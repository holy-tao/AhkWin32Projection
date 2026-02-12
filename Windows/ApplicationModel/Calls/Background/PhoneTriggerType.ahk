#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates a type of event for a phone trigger.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.background.phonetriggertype
 * @namespace Windows.ApplicationModel.Calls.Background
 * @version WindowsRuntime 1.4
 */
class PhoneTriggerType extends Win32Enum{

    /**
     * The system received a new voice mail message or the voice mail count went to 0.
     * @type {Integer (Int32)}
     */
    static NewVoicemailMessage => 0

    /**
     * The call history has changed.
     * @type {Integer (Int32)}
     */
    static CallHistoryChanged => 1

    /**
     * The [PhoneLineProperties](phonelineproperties.md) have changed.
     * @type {Integer (Int32)}
     */
    static LineChanged => 2

    /**
     * Airplane mode on a phone line was disabled so the phone could make an emergency call.
     * @type {Integer (Int32)}
     */
    static AirplaneModeDisabledForEmergencyCall => 3

    /**
     * A request was made for the origin of the phone call.
     * 
     * > [!NOTE]
     * > This constant is deprecated.
     * @type {Integer (Int32)}
     */
    static CallOriginDataRequest => 4

    /**
     * The call was blocked.
     * @type {Integer (Int32)}
     */
    static CallBlocked => 5

    /**
     * The incoming call was dismissed.
     * 
     * > [!NOTE]
     * > This constant is deprecated.
     * @type {Integer (Int32)}
     */
    static IncomingCallDismissed => 6

    /**
     * There is a new incoming call.
     * @type {Integer (Int32)}
     */
    static IncomingCallNotification => 7
}
