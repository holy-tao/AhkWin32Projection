#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct JS_PROPERTY_ATTRIBUTES {
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
    static JS_PROPERTY_ATTRIBUTE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static JS_PROPERTY_HAS_CHILDREN => 1

    /**
     * @type {Integer (Int32)}
     */
    static JS_PROPERTY_FAKE => 2

    /**
     * @type {Integer (Int32)}
     */
    static JS_PROPERTY_METHOD => 4

    /**
     * @type {Integer (Int32)}
     */
    static JS_PROPERTY_READONLY => 8

    /**
     * @type {Integer (Int32)}
     */
    static JS_PROPERTY_NATIVE_WINRT_POINTER => 16

    /**
     * @type {Integer (Int32)}
     */
    static JS_PROPERTY_FRAME_INTRYBLOCK => 32

    /**
     * @type {Integer (Int32)}
     */
    static JS_PROPERTY_FRAME_INCATCHBLOCK => 64

    /**
     * @type {Integer (Int32)}
     */
    static JS_PROPERTY_FRAME_INFINALLYBLOCK => 128
}
