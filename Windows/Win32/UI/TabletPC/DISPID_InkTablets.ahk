#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct DISPID_InkTablets {
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
    static DISPID_ITs_NewEnum => -4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITsItem => 0

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITsDefaultTablet => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITsCount => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITsIsPacketPropertySupported => 3
}
