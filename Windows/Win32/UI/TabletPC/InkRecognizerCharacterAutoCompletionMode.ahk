#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies types of character input modes.
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut/ne-msinkaut-inkrecognizercharacterautocompletionmode
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct InkRecognizerCharacterAutoCompletionMode {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Recognition occurs as if all strokes have been input.
     * @type {Integer (Int32)}
     */
    static IRCACM_Full => 0

    /**
     * Recognition occurs on partial input. The order of the strokes must conform to the rules of the language.
     * @type {Integer (Int32)}
     */
    static IRCACM_Prefix => 1

    /**
     * Recognition occurs on partial input. The order of the strokes can be arbitrary.
     * @type {Integer (Int32)}
     */
    static IRCACM_Random => 2
}
