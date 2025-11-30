#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The QOS_SERVICE_LEVEL enum is used by the ITBasicCallControl::SetQOS method to indicate quality of service requirements for a call.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/ne-tapi3if-qos_service_level
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class QOS_SERVICE_LEVEL extends Win32Enum{

    /**
     * Quality of service level required.
     * @type {Integer (Int32)}
     */
    static QSL_NEEDED => 1

    /**
     * Quality of service level desired if available.
     * @type {Integer (Int32)}
     */
    static QSL_IF_AVAILABLE => 2

    /**
     * Quality of service level desired is "best effort."
     * @type {Integer (Int32)}
     */
    static QSL_BEST_EFFORT => 3
}
