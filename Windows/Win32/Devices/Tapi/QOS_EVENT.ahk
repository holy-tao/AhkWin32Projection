#Requires AutoHotkey v2.0.0 64-bit

/**
 * The QOS_EVENT enum describes quality of service (QOS) events. The ITQOSEvent::get_Event method returns a member of this enum to indicate the type of QOS event that occurred.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/ne-tapi3if-qos_event
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class QOS_EVENT{

    /**
     * QOS is not available.
     * @type {Integer (Int32)}
     */
    static QE_NOQOS => 1

    /**
     * The QOS request could not be met.
     * @type {Integer (Int32)}
     */
    static QE_ADMISSIONFAILURE => 2

    /**
     * The type of QOS requested is not supported.
     * @type {Integer (Int32)}
     */
    static QE_POLICYFAILURE => 3

    /**
     * Unspecified QOS error.
     * @type {Integer (Int32)}
     */
    static QE_GENERICERROR => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static QE_LASTITEM => 4
}
