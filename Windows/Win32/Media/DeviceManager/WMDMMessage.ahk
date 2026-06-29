#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WMDMMessage enumeration type defines message types and states.
 * @see https://learn.microsoft.com/windows/win32/WMDM/wmdmmessage
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct WMDMMessage {
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
    static WMDM_MSG_DEVICE_ARRIVAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_MSG_DEVICE_REMOVAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_MSG_MEDIA_ARRIVAL => 2

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_MSG_MEDIA_REMOVAL => 3
}
