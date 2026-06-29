#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies how an InkEdit control appears on the screen.
 * @see https://learn.microsoft.com/windows/win32/api/inked/ne-inked-appearanceconstants
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct AppearanceConstants {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Flat. Paints without visual effects.
     * @type {Integer (Int32)}
     */
    static rtfFlat => 0

    /**
     * Default. 3D. Paints with three-dimensional effects.
     * @type {Integer (Int32)}
     */
    static rtfThreeD => 1
}
