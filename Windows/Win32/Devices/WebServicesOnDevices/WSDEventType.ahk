#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies the type of event produced by the session layer.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ne-wsdtypes-wsdeventtype
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSDEventType{

    /**
     * No events were detected.
     * @type {Integer (Int32)}
     */
    static WSDET_NONE => 0

    /**
     * An incoming message was detected.
     * @type {Integer (Int32)}
     */
    static WSDET_INCOMING_MESSAGE => 1

    /**
     * An incoming message fault was detected.
     * @type {Integer (Int32)}
     */
    static WSDET_INCOMING_FAULT => 2

    /**
     * A message transmission failure was detected.
     * @type {Integer (Int32)}
     */
    static WSDET_TRANSMISSION_FAILURE => 3

    /**
     * A message response timeout was detected.
     * @type {Integer (Int32)}
     */
    static WSDET_RESPONSE_TIMEOUT => 4
}
