#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct DISPID_InkDivisionUnit {
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
    static DISPID_IInkDivisionUnit_Strokes => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IInkDivisionUnit_DivisionType => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IInkDivisionUnit_RecognizedString => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IInkDivisionUnit_RotationTransform => 4
}
