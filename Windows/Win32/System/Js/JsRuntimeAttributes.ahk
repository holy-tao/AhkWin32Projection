#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Js
 * @version v4.0.30319
 */
class JsRuntimeAttributes{

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
