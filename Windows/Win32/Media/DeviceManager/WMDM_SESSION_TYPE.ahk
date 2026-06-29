#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WMDM\_SESSION\_TYPE enumeration type defines the session type.
 * @see https://learn.microsoft.com/windows/win32/WMDM/wmdm-session-type
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct WMDM_SESSION_TYPE {
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
    static WMDM_SESSION_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_SESSION_TRANSFER_TO_DEVICE => 1

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_SESSION_TRANSFER_FROM_DEVICE => 16

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_SESSION_DELETE => 256

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_SESSION_CUSTOM => 4096
}
