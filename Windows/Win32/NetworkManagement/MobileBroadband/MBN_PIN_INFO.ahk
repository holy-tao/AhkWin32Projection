#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MBN_PIN_STATE.ahk
#Include .\MBN_PIN_TYPE.ahk

/**
 * The MBN_PIN_INFO structure represents the current PIN state of the device.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ns-mbnapi-mbn_pin_info
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
class MBN_PIN_INFO extends Win32Struct {
    static sizeof => 12

    static packingSize => 4

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_pin_state">MBN_PIN_STATE</a> value that indicates the current PIN state of the device.
     * @type {MBN_PIN_STATE}
     */
    pinState {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_pin_type">MBN_PIN_TYPE</a> value that indicates the type of PIN expected.  This field is valid only when <b>pinState</b> is either <b>MBN_PIN_STATE_ENTER</b> or <b>MBN_PIN_STATE_UNBLOCK</b>.
     * @type {MBN_PIN_TYPE}
     */
    pinType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Contains the number of attempts remaining to enter the valid PIN.  This information is not available on some devices.  If it is not available, then it is set to <b>MBN_ATTEMPTS_REMAINING_UNKNOWN</b>.
     * @type {Integer}
     */
    attemptsRemaining {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
