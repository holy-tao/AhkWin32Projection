#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct INET_ZONE_MANAGER_CONSTANTS {
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
    static MAX_ZONE_PATH => 260

    /**
     * @type {Integer (Int32)}
     */
    static MAX_ZONE_DESCRIPTION => 200
}
