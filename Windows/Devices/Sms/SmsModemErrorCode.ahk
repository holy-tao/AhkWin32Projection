#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Values that describe error codes from the SMS modem in an [SmsSendMessageResult](smssendmessageresult.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsmodemerrorcode
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class SmsModemErrorCode extends Win32Enum{

    /**
     * An unknown error.
     * @type {Integer (Int32)}
     */
    static Other => 0

    /**
     * A network error.
     * @type {Integer (Int32)}
     */
    static MessagingNetworkError => 1

    /**
     * SMS is not supported by the device.
     * @type {Integer (Int32)}
     */
    static SmsOperationNotSupportedByDevice => 2

    /**
     * SMS is not supported by the network.
     * @type {Integer (Int32)}
     */
    static SmsServiceNotSupportedByNetwork => 3

    /**
     * The device failed.
     * @type {Integer (Int32)}
     */
    static DeviceFailure => 4

    /**
     * The message was not encoded properly.
     * @type {Integer (Int32)}
     */
    static MessageNotEncodedProperly => 5

    /**
     * The message was too large.
     * @type {Integer (Int32)}
     */
    static MessageTooLarge => 6

    /**
     * The device was not ready to send SMS.
     * @type {Integer (Int32)}
     */
    static DeviceNotReady => 7

    /**
     * The network was not ready to send SMS.
     * @type {Integer (Int32)}
     */
    static NetworkNotReady => 8

    /**
     * The SMSC address was not valid.
     * @type {Integer (Int32)}
     */
    static InvalidSmscAddress => 9

    /**
     * There was a network failure.
     * @type {Integer (Int32)}
     */
    static NetworkFailure => 10

    /**
     * The device is restricted to a fixed dialing number list, and the number used was not in the list.
     * @type {Integer (Int32)}
     */
    static FixedDialingNumberRestricted => 11
}
