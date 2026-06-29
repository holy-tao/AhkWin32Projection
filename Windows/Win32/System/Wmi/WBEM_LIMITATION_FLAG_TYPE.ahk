#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct WBEM_LIMITATION_FLAG_TYPE {
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
    static WBEM_FLAG_EXCLUDE_OBJECT_QUALIFIERS => 16

    /**
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_EXCLUDE_PROPERTY_QUALIFIERS => 32
}
