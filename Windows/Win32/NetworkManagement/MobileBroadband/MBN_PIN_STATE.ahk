#Requires AutoHotkey v2.0.0 64-bit

/**
 * The MBN_PIN_STATE enumerated type indicates the current PIN state of the Mobile Broadband device.
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/ne-mbnapi-mbn_pin_state
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class MBN_PIN_STATE{

    /**
     * Indicates that no PIN is currently required.  
     * 
     * This state can occur when the device does not require a PIN.  It can also occur after repeated PIN entry attempts have exhausted the allowable quota and the device does not allow the PIN to be unblocked programmatically
     * @type {Integer (Int32)}
     */
    static MBN_PIN_STATE_NONE => 0

    /**
     * Indicates that the device is currently locked and requires a PIN to be entered to unlock it  The caller can unlock the device by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnpin-enter">Enter</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpin">IMbnPin</a> interface.
     * @type {Integer (Int32)}
     */
    static MBN_PIN_STATE_ENTER => 1

    /**
     * Indicates that the device is in a PIN blocked state and that the PIN needs to be unblocked using the corresponding PIN Unblock Key (PUK).  The caller can unlock the device by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnpin-unblock">Unblock</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpin">IMbnPin</a> interface.
     * 
     * This state can occur after repeated PIN entry attempts have exhausted the allowable quota.
     * @type {Integer (Int32)}
     */
    static MBN_PIN_STATE_UNBLOCK => 2
}
