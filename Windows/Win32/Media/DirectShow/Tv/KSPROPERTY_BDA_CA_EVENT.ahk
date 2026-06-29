#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct KSPROPERTY_BDA_CA_EVENT {
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
    static KSEVENT_BDA_PROGRAM_FLOW_STATUS_CHANGED => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSEVENT_BDA_CA_MODULE_STATUS_CHANGED => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSEVENT_BDA_CA_SMART_CARD_STATUS_CHANGED => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSEVENT_BDA_CA_MODULE_UI_REQUESTED => 3
}
