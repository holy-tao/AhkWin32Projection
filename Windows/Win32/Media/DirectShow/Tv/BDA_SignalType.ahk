#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct BDA_SignalType {
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
    static Bda_SignalType_Unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static Bda_SignalType_Analog => 1

    /**
     * @type {Integer (Int32)}
     */
    static Bda_SignalType_Digital => 2
}
