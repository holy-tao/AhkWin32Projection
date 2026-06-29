#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies whether the first element or all elements within a group of points or packet values are used.
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut/ne-msinkaut-inkselectionconstants
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct InkSelectionConstants {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The first element is used.
     * @type {Integer (Int32)}
     */
    static ISC_FirstElement => 0

    /**
     * All elements are used.
     * @type {Integer (Int32)}
     */
    static ISC_AllElements => -1
}
