#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MBN_READY_STATE enumerated type contains values that indicate the readiness of a Mobile Broadband device to engage in cellular network traffic operations.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_ready_state
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class MBN_READY_STATE extends Win32Enum{

    /**
     * The mobile broadband device stack is off.
     * @type {Integer (Int32)}
     */
    static MBN_READY_STATE_OFF => 0

    /**
     * The card and stack is powered up and ready to be used for mobile broadband operations.
     * @type {Integer (Int32)}
     */
    static MBN_READY_STATE_INITIALIZED => 1

    /**
     * The SIM is not inserted.
     * @type {Integer (Int32)}
     */
    static MBN_READY_STATE_SIM_NOT_INSERTED => 2

    /**
     * The SIM is invalid  (PIN Unblock Key retrials have exceeded the limit).
     * @type {Integer (Int32)}
     */
    static MBN_READY_STATE_BAD_SIM => 3

    /**
     * General device failure.
     * @type {Integer (Int32)}
     */
    static MBN_READY_STATE_FAILURE => 4

    /**
     * The subscription is not activated.
     * @type {Integer (Int32)}
     */
    static MBN_READY_STATE_NOT_ACTIVATED => 5

    /**
     * The device is locked by a PIN or password which is preventing the device from initializing and registering onto the network.  The calling application can call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnpinmanager-getpinstate">GetPinState</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpinmanager">IMbnPinManager</a> interface to get the type of PIN needed to be entered to unlock the device.
     * @type {Integer (Int32)}
     */
    static MBN_READY_STATE_DEVICE_LOCKED => 6

    /**
     * The device is blocked by a PIN or password which is preventing the device from initializing and registering onto the network.  The calling application should call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnpin-unblock">Unblock</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpin">IMbnPin</a> interface to unblock the device.
     * @type {Integer (Int32)}
     */
    static MBN_READY_STATE_DEVICE_BLOCKED => 7

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MBN_READY_STATE_NO_ESIM_PROFILE => 8
}
