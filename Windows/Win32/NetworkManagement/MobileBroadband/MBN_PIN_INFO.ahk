#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MBN_PIN_STATE.ahk" { MBN_PIN_STATE }
#Import ".\MBN_PIN_TYPE.ahk" { MBN_PIN_TYPE }

/**
 * The MBN_PIN_INFO structure represents the current PIN state of the device.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ns-mbnapi-mbn_pin_info
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct MBN_PIN_INFO {
    #StructPack 4

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_pin_state">MBN_PIN_STATE</a> value that indicates the current PIN state of the device.
     */
    pinState : MBN_PIN_STATE

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_pin_type">MBN_PIN_TYPE</a> value that indicates the type of PIN expected.  This field is valid only when <b>pinState</b> is either <b>MBN_PIN_STATE_ENTER</b> or <b>MBN_PIN_STATE_UNBLOCK</b>.
     */
    pinType : MBN_PIN_TYPE

    /**
     * Contains the number of attempts remaining to enter the valid PIN.  This information is not available on some devices.  If it is not available, then it is set to <b>MBN_ATTEMPTS_REMAINING_UNKNOWN</b>.
     */
    attemptsRemaining : UInt32

}
