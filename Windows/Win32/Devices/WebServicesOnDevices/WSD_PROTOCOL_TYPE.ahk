#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies the type of protocol supported by a port.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ne-wsdtypes-wsd_protocol_type
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSD_PROTOCOL_TYPE extends Win32Enum{

    /**
     * No protocols supported.
     * @type {Integer (Int32)}
     */
    static WSD_PT_NONE => 0

    /**
     * The UDP protocol is supported.
     * @type {Integer (Int32)}
     */
    static WSD_PT_UDP => 1

    /**
     * The HTTP protocol is supported.
     * @type {Integer (Int32)}
     */
    static WSD_PT_HTTP => 2

    /**
     * The HTTPS protocol is supported.
     * @type {Integer (Int32)}
     */
    static WSD_PT_HTTPS => 4

    /**
     * The UDP, HTTP, and HTTPS protocols are supported.
     * @type {Integer (Int32)}
     */
    static WSD_PT_ALL => 255
}
