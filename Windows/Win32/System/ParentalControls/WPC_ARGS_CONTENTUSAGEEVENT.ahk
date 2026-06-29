#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ParentalControls
 */
export default struct WPC_ARGS_CONTENTUSAGEEVENT {
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
    static WPC_ARGS_CONTENTUSAGEEVENT_CONTENTPROVIDERID => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONTENTUSAGEEVENT_CONTENTPROVIDERTITLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONTENTUSAGEEVENT_ID => 2

    /**
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONTENTUSAGEEVENT_TITLE => 3

    /**
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONTENTUSAGEEVENT_CATEGORY => 4

    /**
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONTENTUSAGEEVENT_RATINGS => 5

    /**
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONTENTUSAGEEVENT_DECISION => 6

    /**
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONTENTUSAGEEVENT_CARGS => 7
}
