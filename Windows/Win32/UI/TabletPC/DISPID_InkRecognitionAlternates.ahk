#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct DISPID_InkRecognitionAlternates {
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
    static DISPID_InkRecognitionAlternates_NewEnum => -4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_InkRecognitionAlternates_Item => 0

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_InkRecognitionAlternates_Count => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_InkRecognitionAlternates_Strokes => 2
}
