#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct EnTag_Mode {
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
    static EnTag_Remove => 0

    /**
     * @type {Integer (Int32)}
     */
    static EnTag_Once => 1

    /**
     * @type {Integer (Int32)}
     */
    static EnTag_Repeat => 2
}
