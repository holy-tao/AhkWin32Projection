#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies whether the InkEdit control is idle, collecting ink, or recognizing ink.
 * @see https://learn.microsoft.com/windows/win32/api/inked/ne-inked-inkeditstatus
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct InkEditStatus {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-control-reference">InkEdit</a> control is neither collecting nor recognizing ink.
     * @type {Integer (Int32)}
     */
    static IES_Idle => 0

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-control-reference">InkEdit</a> control is collecting ink.
     * @type {Integer (Int32)}
     */
    static IES_Collecting => 1

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-control-reference">InkEdit</a> control is recognizing ink.
     * @type {Integer (Int32)}
     */
    static IES_Recognizing => 2
}
