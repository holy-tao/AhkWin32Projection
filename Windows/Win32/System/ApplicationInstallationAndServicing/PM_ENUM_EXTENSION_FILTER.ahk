#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct PM_ENUM_EXTENSION_FILTER {
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
    static PM_ENUM_EXTENSION_FILTER_BY_CONSUMER => 17

    /**
     * @type {Integer (Int32)}
     */
    static PM_ENUM_EXTENSION_FILTER_APPCONNECT => 17

    /**
     * @type {Integer (Int32)}
     */
    static PM_ENUM_EXTENSION_FILTER_PROTOCOL_ALL => 18

    /**
     * @type {Integer (Int32)}
     */
    static PM_ENUM_EXTENSION_FILTER_FTASSOC_FILETYPE_ALL => 19

    /**
     * @type {Integer (Int32)}
     */
    static PM_ENUM_EXTENSION_FILTER_FTASSOC_CONTENTTYPE_ALL => 20

    /**
     * @type {Integer (Int32)}
     */
    static PM_ENUM_EXTENSION_FILTER_FTASSOC_APPLICATION_ALL => 21

    /**
     * @type {Integer (Int32)}
     */
    static PM_ENUM_EXTENSION_FILTER_SHARETARGET_ALL => 22

    /**
     * @type {Integer (Int32)}
     */
    static PM_ENUM_EXTENSION_FILTER_FILEOPENPICKER_ALL => 23

    /**
     * @type {Integer (Int32)}
     */
    static PM_ENUM_EXTENSION_FILTER_FILESAVEPICKER_ALL => 24

    /**
     * @type {Integer (Int32)}
     */
    static PM_ENUM_EXTENSION_FILTER_CACHEDFILEUPDATER_ALL => 25

    /**
     * @type {Integer (Int32)}
     */
    static PM_ENUM_EXTENSION_FILTER_MAX => 26
}
