#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * WCN_VALUE_TYPE_BOOLEAN enumeration defines values used to represent true/false conditions encountered during device setup and association.
 * @see https://learn.microsoft.com/windows/win32/api/wcntypes/ne-wcntypes-wcn_value_type_boolean
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectNow
 */
export default struct WCN_VALUE_TYPE_BOOLEAN {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The argument is false.
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_FALSE => 0

    /**
     * The argument is true.
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_TRUE => 1
}
