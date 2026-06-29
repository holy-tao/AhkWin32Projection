#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct OLECMDID_BROWSERSTATEFLAG {
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
    static OLECMDIDF_BROWSERSTATE_EXTENSIONSOFF => 1

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_BROWSERSTATE_IESECURITY => 2

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_BROWSERSTATE_PROTECTEDMODE_OFF => 4

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_BROWSERSTATE_RESET => 8

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_BROWSERSTATE_REQUIRESACTIVEX => 16

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_BROWSERSTATE_DESKTOPHTMLDIALOG => 32

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_BROWSERSTATE_BLOCKEDVERSION => 64
}
