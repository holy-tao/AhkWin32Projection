#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct FAX_ENUM_PORT_OPEN_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static PORT_OPEN_QUERY => 1

    /**
     * @type {Integer (Int32)}
     */
    static PORT_OPEN_MODIFY => 2
}
