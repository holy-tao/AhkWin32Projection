#Requires AutoHotkey v2.0.0 64-bit

/**
 * .
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/ne-mbnapi-mbn_device_services_interface_state
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class MBN_DEVICE_SERVICES_INTERFACE_STATE{

    /**
     * A Mobile Broadband device capable of supporting device service functionality has arrived.
     * @type {Integer (Int32)}
     */
    static MBN_DEVICE_SERVICES_CAPABLE_INTERFACE_ARRIVAL => 0

    /**
     * A Mobile Broadband device capable of supporting device services functionality has been removed.
     * @type {Integer (Int32)}
     */
    static MBN_DEVICE_SERVICES_CAPABLE_INTERFACE_REMOVAL => 1
}
