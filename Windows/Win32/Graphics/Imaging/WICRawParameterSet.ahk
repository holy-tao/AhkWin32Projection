#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the parameter set used by a raw codec.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicrawparameterset
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WICRawParameterSet {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * An as shot parameter set.
     * @type {Integer (Int32)}
     */
    static WICAsShotParameterSet => 1

    /**
     * A user adjusted parameter set.
     * @type {Integer (Int32)}
     */
    static WICUserAdjustedParameterSet => 2

    /**
     * A codec adjusted parameter set.
     * @type {Integer (Int32)}
     */
    static WICAutoAdjustedParameterSet => 3
}
