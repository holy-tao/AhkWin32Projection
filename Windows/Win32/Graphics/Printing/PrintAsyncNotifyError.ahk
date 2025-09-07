#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the error code portion of the HRESULT returned after an asynchronous notification failure.
 * @see https://learn.microsoft.com/windows/win32/api/prnasnot/ne-prnasnot-printasyncnotifyerror
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class PrintAsyncNotifyError{

    /**
     * The Print Spooler-hosted printing system component closed the communication channel.
     * @type {Integer (Int32)}
     */
    static CHANNEL_CLOSED_BY_SERVER => 1

    /**
     * A listening application, other than the caller, closed the communication channel.
     * @type {Integer (Int32)}
     */
    static CHANNEL_CLOSED_BY_ANOTHER_LISTENER => 2

    /**
     * The caller has already closed the communication channel.
     * @type {Integer (Int32)}
     */
    static CHANNEL_CLOSED_BY_SAME_LISTENER => 3

    /**
     * The caller has already released the communication channel
     * @type {Integer (Int32)}
     */
    static CHANNEL_RELEASED_BY_LISTENER => 4

    /**
     * One or more listeners did not receive this notification however; at least one listener did receive this notification.
     * @type {Integer (Int32)}
     */
    static UNIRECTIONAL_NOTIFICATION_LOST => 5

    /**
     * There was a problem sending this notification. None of the listeners on this channel are configured to receive this notification type or there was a problem allocating the resources necessary to complete this call.
     * @type {Integer (Int32)}
     */
    static ASYNC_NOTIFICATION_FAILURE => 6

    /**
     * Indicates that there are no registered listening applications.
     * @type {Integer (Int32)}
     */
    static NO_LISTENERS => 7

    /**
     * The channel has already been closed.
     * @type {Integer (Int32)}
     */
    static CHANNEL_ALREADY_CLOSED => 8

    /**
     * The channel has already been opened.
     * @type {Integer (Int32)}
     */
    static CHANNEL_ALREADY_OPENED => 9

    /**
     * A notification cannot be sent because a response to the last notification has not been received.
     * @type {Integer (Int32)}
     */
    static CHANNEL_WAITING_FOR_CLIENT_NOTIFICATION => 10

    /**
     * The channel is not yet open.
     * @type {Integer (Int32)}
     */
    static CHANNEL_NOT_OPENED => 11

    /**
     * A notification cannot be sent because the recipient has not consumed the previous notification.
     * @type {Integer (Int32)}
     */
    static ASYNC_CALL_ALREADY_PARKED => 12

    /**
     * The listening application is not registered for notifications of the specified type from the specified queue or print server.
     * @type {Integer (Int32)}
     */
    static NOT_REGISTERED => 13

    /**
     * The listening application has already unregistered.
     * @type {Integer (Int32)}
     */
    static ALREADY_UNREGISTERED => 14

    /**
     * The listening application has already registered for notifications of the specified type from the specified queue or print server.
     * @type {Integer (Int32)}
     */
    static ALREADY_REGISTERED => 15

    /**
     * Another listener on this channel has already responded. Only the first respondent can continue the communication with the sender.
     * @type {Integer (Int32)}
     */
    static CHANNEL_ACQUIRED => 16

    /**
     * The channel is busy with another notification or response.
     * @type {Integer (Int32)}
     */
    static ASYNC_CALL_IN_PROGRESS => 17

    /**
     * The maximum size of the notification data has been exceeded. By default, the maximum data size allowed is 10 Megabytes.
     * @type {Integer (Int32)}
     */
    static MAX_NOTIFICATION_SIZE_EXCEEDED => 18

    /**
     * The Print Spooler cannot hold any more queued notifications. By default, a maximum number of 10 notifications are allowed to be queued.
     * @type {Integer (Int32)}
     */
    static INTERNAL_NOTIFICATION_QUEUE_IS_FULL => 19

    /**
     * The specified notification type is invalid.
     * @type {Integer (Int32)}
     */
    static INVALID_NOTIFICATION_TYPE => 20

    /**
     * No more applications can register for this type of notification on the specified queue or print server. The maximum number of such registrations is 10,000 by default.
     * @type {Integer (Int32)}
     */
    static MAX_REGISTRATION_COUNT_EXCEEDED => 21

    /**
     * The print spooler has already created the maximum number of channels and cannot create any more. The maximum number of channels the print spooler can create is 10,000 by default.
     * @type {Integer (Int32)}
     */
    static MAX_CHANNEL_COUNT_EXCEEDED => 22

    /**
     * Registration for local notification was successful. Registration for remote notification was not.
     * @type {Integer (Int32)}
     */
    static LOCAL_ONLY_REGISTRATION => 23

    /**
     * Registration for remote notification was successful. Registration for local notification was not.
     * @type {Integer (Int32)}
     */
    static REMOTE_ONLY_REGISTRATION => 24
}
