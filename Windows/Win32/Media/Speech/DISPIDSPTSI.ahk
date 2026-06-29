#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct DISPIDSPTSI {
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
    static DISPIDSPTSI_ActiveOffset => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPIDSPTSI_ActiveLength => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPIDSPTSI_SelectionOffset => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPIDSPTSI_SelectionLength => 4
}
