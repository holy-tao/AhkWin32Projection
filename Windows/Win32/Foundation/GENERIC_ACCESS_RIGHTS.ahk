#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Foundation
 */
export default struct GENERIC_ACCESS_RIGHTS {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static GENERIC_READ => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static GENERIC_WRITE => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static GENERIC_EXECUTE => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static GENERIC_ALL => 268435456
}
