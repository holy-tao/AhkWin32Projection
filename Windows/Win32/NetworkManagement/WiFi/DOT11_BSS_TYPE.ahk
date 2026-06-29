#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines a basic service set (BSS) network type.
 * @see https://learn.microsoft.com/windows/win32/NativeWiFi/dot11-bss-type
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_BSS_TYPE {
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
    static dot11_BSS_type_infrastructure => 1

    /**
     * @type {Integer (Int32)}
     */
    static dot11_BSS_type_independent => 2

    /**
     * @type {Integer (Int32)}
     */
    static dot11_BSS_type_any => 3
}
