#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct DISPID_InkRecognitionResult {
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
    static DISPID_InkRecognitionResult_TopString => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_InkRecognitionResult_TopAlternate => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_InkRecognitionResult_Strokes => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_InkRecognitionResult_TopConfidence => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_InkRecognitionResult_AlternatesFromSelection => 5

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_InkRecognitionResult_ModifyTopAlternate => 6

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_InkRecognitionResult_SetResultOnStrokes => 7
}
