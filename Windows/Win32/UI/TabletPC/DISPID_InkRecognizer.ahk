#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct DISPID_InkRecognizer {
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
    static DISPID_RecoClsid => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_RecoName => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_RecoVendor => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_RecoCapabilities => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_RecoLanguageID => 5

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_RecoPreferredPacketDescription => 6

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_RecoCreateRecognizerContext => 7

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_RecoSupportedProperties => 8
}
