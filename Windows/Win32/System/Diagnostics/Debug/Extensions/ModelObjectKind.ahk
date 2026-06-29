#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct ModelObjectKind {
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
    static ObjectPropertyAccessor => 0

    /**
     * @type {Integer (Int32)}
     */
    static ObjectContext => 1

    /**
     * @type {Integer (Int32)}
     */
    static ObjectTargetObject => 2

    /**
     * @type {Integer (Int32)}
     */
    static ObjectTargetObjectReference => 3

    /**
     * @type {Integer (Int32)}
     */
    static ObjectSynthetic => 4

    /**
     * @type {Integer (Int32)}
     */
    static ObjectNoValue => 5

    /**
     * @type {Integer (Int32)}
     */
    static ObjectError => 6

    /**
     * @type {Integer (Int32)}
     */
    static ObjectIntrinsic => 7

    /**
     * @type {Integer (Int32)}
     */
    static ObjectMethod => 8

    /**
     * @type {Integer (Int32)}
     */
    static ObjectKeyReference => 9
}
