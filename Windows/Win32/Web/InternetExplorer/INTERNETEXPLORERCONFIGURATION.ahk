#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct INTERNETEXPLORERCONFIGURATION {
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
    static INTERNETEXPLORERCONFIGURATION_HOST => 1

    /**
     * @type {Integer (Int32)}
     */
    static INTERNETEXPLORERCONFIGURATION_WEB_DRIVER => 2

    /**
     * @type {Integer (Int32)}
     */
    static INTERNETEXPLORERCONFIGURATION_WEB_DRIVER_EDGE => 4
}
