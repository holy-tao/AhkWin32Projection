#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Elements of the TfLBIClick enumeration specify which mouse button was used to click a toolbar item.
 * @see https://learn.microsoft.com/windows/win32/api/ctfutb/ne-ctfutb-tflbiclick
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct TfLBIClick {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The user right-clicked the button.
     * @type {Integer (Int32)}
     */
    static TF_LBI_CLK_RIGHT => 1

    /**
     * The user left-clicked the button.
     * @type {Integer (Int32)}
     */
    static TF_LBI_CLK_LEFT => 2
}
