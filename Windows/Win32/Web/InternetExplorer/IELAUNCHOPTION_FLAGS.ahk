#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct IELAUNCHOPTION_FLAGS {
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
    static IELAUNCHOPTION_SCRIPTDEBUG => 1

    /**
     * @type {Integer (Int32)}
     */
    static IELAUNCHOPTION_FORCE_COMPAT => 2

    /**
     * @type {Integer (Int32)}
     */
    static IELAUNCHOPTION_FORCE_EDGE => 4

    /**
     * @type {Integer (Int32)}
     */
    static IELAUNCHOPTION_LOCK_ENGINE => 8
}
