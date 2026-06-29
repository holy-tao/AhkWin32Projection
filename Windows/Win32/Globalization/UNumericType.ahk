#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UNumericType {
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
    static U_NT_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static U_NT_DECIMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static U_NT_DIGIT => 2

    /**
     * @type {Integer (Int32)}
     */
    static U_NT_NUMERIC => 3
}
