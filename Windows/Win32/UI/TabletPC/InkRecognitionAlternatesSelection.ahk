#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Not implemented. (InkRecognitionAlternatesSelection)
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut/ne-msinkaut-inkrecognitionalternatesselection
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct InkRecognitionAlternatesSelection {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static IRAS_Start => 0

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static IRAS_DefaultCount => 10

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static IRAS_All => -1
}
