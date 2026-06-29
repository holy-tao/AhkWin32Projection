#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MSP_ADDRESS_EVENT (msp.h) enumeration constant is returned within the MSP_EVENT_INFO struct by the GetEvent method when MSP_EVENT is ME_ADDRESS_EVENT.
 * @see https://learn.microsoft.com/windows/win32/api/msp/ne-msp-msp_address_event
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct MSP_ADDRESS_EVENT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * A new terminal arrived by PNP.
     * @type {Integer (Int32)}
     */
    static ADDRESS_TERMINAL_AVAILABLE => 0

    /**
     * A terminal has been removed by PNP.
     * @type {Integer (Int32)}
     */
    static ADDRESS_TERMINAL_UNAVAILABLE => 1
}
