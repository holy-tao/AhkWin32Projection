#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the inheritance relationship for a service.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-service-inheritance-types2
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct WPD_SERVICE_INHERITANCE_TYPES {
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
    static WPD_SERVICE_INHERITANCE_IMPLEMENTATION => 0
}
