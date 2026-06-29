#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct DISPID_InkTablet {
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
    static DISPID_ITName => 0

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITPlugAndPlayId => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITPropertyMetrics => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITIsPacketPropertySupported => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITMaximumInputRectangle => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITHardwareCapabilities => 5
}
