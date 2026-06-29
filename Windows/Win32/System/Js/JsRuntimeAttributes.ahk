#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Js
 */
export default struct JsRuntimeAttributes {
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
    static JsRuntimeAttributeNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static JsRuntimeAttributeDisableBackgroundWork => 1

    /**
     * @type {Integer (Int32)}
     */
    static JsRuntimeAttributeAllowScriptInterrupt => 2

    /**
     * @type {Integer (Int32)}
     */
    static JsRuntimeAttributeEnableIdleProcessing => 4

    /**
     * @type {Integer (Int32)}
     */
    static JsRuntimeAttributeDisableNativeCodeGeneration => 8

    /**
     * @type {Integer (Int32)}
     */
    static JsRuntimeAttributeDisableEval => 16
}
