#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The ADDRESS_STATE enum is used by the ITAddress::get_State method to check the address state.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/ne-tapi3if-address_state
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ADDRESS_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Normal state; the address can be used.
     * @type {Integer (Int32)}
     */
    static AS_INSERVICE => 0

    /**
     * The address is temporarily out of service, but may go back into service at some time.
     * @type {Integer (Int32)}
     */
    static AS_OUTOFSERVICE => 1
}
