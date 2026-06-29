#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Determines how a stroke is removed from an InkDisp object.
 * @remarks
 * This enumeration is a flag.
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut/ne-msinkaut-inkextractflags
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct InkExtractFlags {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The ink is copied from the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object.
     * @type {Integer (Int32)}
     */
    static IEF_CopyFromOriginal => 0

    /**
     * The ink is cut from the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object.
     * @type {Integer (Int32)}
     */
    static IEF_RemoveFromOriginal => 1

    /**
     * The ink is cut from the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object.
     * @type {Integer (Int32)}
     */
    static IEF_Default => 1
}
