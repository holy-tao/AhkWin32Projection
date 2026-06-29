#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the pen-tip shape.
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut/ne-msinkaut-inkpentip
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct InkPenTip {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The pen tip is round. This is the default pen tip.
     * @type {Integer (Int32)}
     */
    static IPT_Ball => 0

    /**
     * The pen tip is rectangular.
     * @type {Integer (Int32)}
     */
    static IPT_Rectangle => 1
}
