#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct TypeKind {
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
    static TypeUDT => 0

    /**
     * @type {Integer (Int32)}
     */
    static TypePointer => 1

    /**
     * @type {Integer (Int32)}
     */
    static TypeMemberPointer => 2

    /**
     * @type {Integer (Int32)}
     */
    static TypeArray => 3

    /**
     * @type {Integer (Int32)}
     */
    static TypeFunction => 4

    /**
     * @type {Integer (Int32)}
     */
    static TypeTypedef => 5

    /**
     * @type {Integer (Int32)}
     */
    static TypeEnum => 6

    /**
     * @type {Integer (Int32)}
     */
    static TypeIntrinsic => 7

    /**
     * @type {Integer (Int32)}
     */
    static TypeExtendedArray => 8
}
