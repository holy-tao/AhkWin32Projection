#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The FAX_DEVICE_RECEIVE_MODE_ENUM enumeration defines the way a device answers an incoming call.
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/ne-faxcomex-fax_device_receive_mode_enum
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class FAX_DEVICE_RECEIVE_MODE_ENUM extends Win32Enum{

    /**
     * The device will not answer the call.
     * @type {Integer (Int32)}
     */
    static fdrmNO_ANSWER => 0

    /**
     * The device will automatically answer the call.
     * @type {Integer (Int32)}
     */
    static fdrmAUTO_ANSWER => 1

    /**
     * The device will answer the call only if made to do so manually.
     * @type {Integer (Int32)}
     */
    static fdrmMANUAL_ANSWER => 2
}
