#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the reason for IncomingCallDismissed trigger.
  * 
  * > [!NOTE]
  * > This enum is deprecated.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.background.phoneincomingcalldismissedreason
 * @namespace Windows.ApplicationModel.Calls.Background
 * @version WindowsRuntime 1.4
 */
class PhoneIncomingCallDismissedReason extends Win32Enum{

    /**
     * Incoming call is being dismissed unexpectedly. Reason is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Incoming call is being dismissed due to rejection by the user.
     * @type {Integer (Int32)}
     */
    static CallRejected => 1

    /**
     * Incoming call is being dismissed due to text reply response by the user.
     * @type {Integer (Int32)}
     */
    static TextReply => 2

    /**
     * Incoming call is being dismissed due to a lost connection.
     * @type {Integer (Int32)}
     */
    static ConnectionLost => 3
}
