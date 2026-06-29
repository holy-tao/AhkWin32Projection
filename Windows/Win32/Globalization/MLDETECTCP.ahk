#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct MLDETECTCP {
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
    static MLDETECTCP_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static MLDETECTCP_7BIT => 1

    /**
     * @type {Integer (Int32)}
     */
    static MLDETECTCP_8BIT => 2

    /**
     * @type {Integer (Int32)}
     */
    static MLDETECTCP_DBCS => 4

    /**
     * @type {Integer (Int32)}
     */
    static MLDETECTCP_HTML => 8

    /**
     * @type {Integer (Int32)}
     */
    static MLDETECTCP_NUMBER => 16
}
