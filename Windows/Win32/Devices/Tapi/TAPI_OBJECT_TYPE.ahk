#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The TAPI_OBJECT_TYPE enum is used to indicate the type of TAPI object involved in an event.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/ne-tapi3if-tapi_object_type
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class TAPI_OBJECT_TYPE extends Win32Enum{

    /**
     * No TAPI object event has occurred.
     * @type {Integer (Int32)}
     */
    static TOT_NONE => 0

    /**
     * Type of TAPI object is TAPI.
     * @type {Integer (Int32)}
     */
    static TOT_TAPI => 1

    /**
     * Type of TAPI object is Address.
     * @type {Integer (Int32)}
     */
    static TOT_ADDRESS => 2

    /**
     * Type of TAPI object is Terminal.
     * @type {Integer (Int32)}
     */
    static TOT_TERMINAL => 3

    /**
     * Type of TAPI object is Call.
     * @type {Integer (Int32)}
     */
    static TOT_CALL => 4

    /**
     * Type of TAPI object is CallHub.
     * @type {Integer (Int32)}
     */
    static TOT_CALLHUB => 5

    /**
     * Type of TAPI object is Phone.
     * @type {Integer (Int32)}
     */
    static TOT_PHONE => 6
}
