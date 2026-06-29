#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains constants used to distinguish between classes and instances.
 * @see https://learn.microsoft.com/windows/win32/api/wbemcli/ne-wbemcli-wbem_genus_type
 * @namespace Windows.Win32.System.Wmi
 */
export default struct WBEM_GENUS_TYPE {
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
    static WBEM_GENUS_CLASS => 1

    /**
     * @type {Integer (Int32)}
     */
    static WBEM_GENUS_INSTANCE => 2
}
