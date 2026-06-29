#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UVerticalOrientation {
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
    static U_VO_ROTATED => 0

    /**
     * @type {Integer (Int32)}
     */
    static U_VO_TRANSFORMED_ROTATED => 1

    /**
     * @type {Integer (Int32)}
     */
    static U_VO_TRANSFORMED_UPRIGHT => 2

    /**
     * @type {Integer (Int32)}
     */
    static U_VO_UPRIGHT => 3
}
