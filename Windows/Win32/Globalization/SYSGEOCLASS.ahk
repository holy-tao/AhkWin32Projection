#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the geographical location class.
 * @see https://learn.microsoft.com/windows/win32/api/winnls/ne-winnls-sysgeoclass
 * @namespace Windows.Win32.Globalization
 */
export default struct SYSGEOCLASS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Class for nation geographical location identifiers.
     * @type {Integer (Int32)}
     */
    static GEOCLASS_NATION => 16

    /**
     * Class for region geographical location identifiers.
     * @type {Integer (Int32)}
     */
    static GEOCLASS_REGION => 14

    /**
     * <b>Starting with Windows 8:</b> Class for all geographical location identifiers.
     * @type {Integer (Int32)}
     */
    static GEOCLASS_ALL => 0
}
