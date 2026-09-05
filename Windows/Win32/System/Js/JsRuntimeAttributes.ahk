#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Js
 */
class JsRuntimeAttributes extends Win32Enum {

    /**
     * Native name: JsRuntimeAttributeNone
     * @type {Integer (Int32)}
     */
    static AttributeNone => 0

    /**
     * Native name: JsRuntimeAttributeDisableBackgroundWork
     * @type {Integer (Int32)}
     */
    static AttributeDisableBackgroundWork => 1

    /**
     * Native name: JsRuntimeAttributeAllowScriptInterrupt
     * @type {Integer (Int32)}
     */
    static AttributeAllowScriptInterrupt => 2

    /**
     * Native name: JsRuntimeAttributeEnableIdleProcessing
     * @type {Integer (Int32)}
     */
    static AttributeEnableIdleProcessing => 4

    /**
     * Native name: JsRuntimeAttributeDisableNativeCodeGeneration
     * @type {Integer (Int32)}
     */
    static AttributeDisableNativeCodeGeneration => 8

    /**
     * Native name: JsRuntimeAttributeDisableEval
     * @type {Integer (Int32)}
     */
    static AttributeDisableEval => 16
}
