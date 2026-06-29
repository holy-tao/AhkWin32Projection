#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct ERRORRESUMEACTION {
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
    static ERRORRESUMEACTION_ReexecuteErrorStatement => 0

    /**
     * @type {Integer (Int32)}
     */
    static ERRORRESUMEACTION_AbortCallAndReturnErrorToCaller => 1

    /**
     * @type {Integer (Int32)}
     */
    static ERRORRESUMEACTION_SkipErrorStatement => 2
}
