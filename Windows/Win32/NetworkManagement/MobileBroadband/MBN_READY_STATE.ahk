#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MBN_READY_STATE enumerated type contains values that indicate the readiness of a Mobile Broadband device to engage in cellular network traffic operations.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_ready_state
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
class MBN_READY_STATE extends Win32Enum {

    /**
     * The mobile broadband device stack is off.
     * Native name: MBN_READY_STATE_OFF
     * @type {Integer (Int32)}
     */
    static OFF => 0

    /**
     * The card and stack is powered up and ready to be used for mobile broadband operations.
     * Native name: MBN_READY_STATE_INITIALIZED
     * @type {Integer (Int32)}
     */
    static INITIALIZED => 1

    /**
     * The SIM is not inserted.
     * Native name: MBN_READY_STATE_SIM_NOT_INSERTED
     * @type {Integer (Int32)}
     */
    static SIM_NOT_INSERTED => 2

    /**
     * The SIM is invalid  (PIN Unblock Key retrials have exceeded the limit).
     * Native name: MBN_READY_STATE_BAD_SIM
     * @type {Integer (Int32)}
     */
    static BAD_SIM => 3

    /**
     * General device failure.
     * Native name: MBN_READY_STATE_FAILURE
     * @type {Integer (Int32)}
     */
    static FAILURE => 4

    /**
     * The subscription is not activated.
     * Native name: MBN_READY_STATE_NOT_ACTIVATED
     * @type {Integer (Int32)}
     */
    static NOT_ACTIVATED => 5

    /**
     * The device is locked by a PIN or password which is preventing the device from initializing and registering onto the network.  The calling application can call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnpinmanager-getpinstate">GetPinState</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpinmanager">IMbnPinManager</a> interface to get the type of PIN needed to be entered to unlock the device.
     * Native name: MBN_READY_STATE_DEVICE_LOCKED
     * @type {Integer (Int32)}
     */
    static DEVICE_LOCKED => 6

    /**
     * The device is blocked by a PIN or password which is preventing the device from initializing and registering onto the network.  The calling application should call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnpin-unblock">Unblock</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpin">IMbnPin</a> interface to unblock the device.
     * Native name: MBN_READY_STATE_DEVICE_BLOCKED
     * @type {Integer (Int32)}
     */
    static DEVICE_BLOCKED => 7

    /**
     * Native name: MBN_READY_STATE_NO_ESIM_PROFILE
     * @type {Integer (Int32)}
     */
    static NO_ESIM_PROFILE => 8
}
