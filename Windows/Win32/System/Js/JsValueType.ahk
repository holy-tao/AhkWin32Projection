#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Js
 */
export default struct JsValueType {
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
    static JsUndefined => 0

    /**
     * @type {Integer (Int32)}
     */
    static JsNull => 1

    /**
     * @type {Integer (Int32)}
     */
    static JsNumber => 2

    /**
     * @type {Integer (Int32)}
     */
    static JsString => 3

    /**
     * @type {Integer (Int32)}
     */
    static JsBoolean => 4

    /**
     * @type {Integer (Int32)}
     */
    static JsObject => 5

    /**
     * @type {Integer (Int32)}
     */
    static JsFunction => 6

    /**
     * @type {Integer (Int32)}
     */
    static JsError => 7

    /**
     * @type {Integer (Int32)}
     */
    static JsArray => 8
}
