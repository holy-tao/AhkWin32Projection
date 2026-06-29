#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct EXpsFontRestriction {
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
    static Xps_Restricted_Font_Installable => 0

    /**
     * @type {Integer (Int32)}
     */
    static Xps_Restricted_Font_NoEmbedding => 2

    /**
     * @type {Integer (Int32)}
     */
    static Xps_Restricted_Font_PreviewPrint => 4

    /**
     * @type {Integer (Int32)}
     */
    static Xps_Restricted_Font_Editable => 8
}
