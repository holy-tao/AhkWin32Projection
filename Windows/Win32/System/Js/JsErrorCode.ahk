#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Js
 */
class JsErrorCode extends Win32Enum {

    /**
     * Native name: JsNoError
     * @type {Integer (UInt32)}
     */
    static NoError => 0

    /**
     * Native name: JsErrorCategoryUsage
     * @type {Integer (UInt32)}
     */
    static CategoryUsage => 65536

    /**
     * Native name: JsErrorInvalidArgument
     * @type {Integer (UInt32)}
     */
    static InvalidArgument => 65537

    /**
     * Native name: JsErrorNullArgument
     * @type {Integer (UInt32)}
     */
    static NullArgument => 65538

    /**
     * Native name: JsErrorNoCurrentContext
     * @type {Integer (UInt32)}
     */
    static NoCurrentContext => 65539

    /**
     * Native name: JsErrorInExceptionState
     * @type {Integer (UInt32)}
     */
    static InExceptionState => 65540

    /**
     * Native name: JsErrorNotImplemented
     * @type {Integer (UInt32)}
     */
    static NotImplemented => 65541

    /**
     * Native name: JsErrorWrongThread
     * @type {Integer (UInt32)}
     */
    static WrongThread => 65542

    /**
     * Native name: JsErrorRuntimeInUse
     * @type {Integer (UInt32)}
     */
    static RuntimeInUse => 65543

    /**
     * Native name: JsErrorBadSerializedScript
     * @type {Integer (UInt32)}
     */
    static BadSerializedScript => 65544

    /**
     * Native name: JsErrorInDisabledState
     * @type {Integer (UInt32)}
     */
    static InDisabledState => 65545

    /**
     * Native name: JsErrorCannotDisableExecution
     * @type {Integer (UInt32)}
     */
    static CannotDisableExecution => 65546

    /**
     * Native name: JsErrorHeapEnumInProgress
     * @type {Integer (UInt32)}
     */
    static HeapEnumInProgress => 65547

    /**
     * Native name: JsErrorArgumentNotObject
     * @type {Integer (UInt32)}
     */
    static ArgumentNotObject => 65548

    /**
     * Native name: JsErrorInProfileCallback
     * @type {Integer (UInt32)}
     */
    static InProfileCallback => 65549

    /**
     * Native name: JsErrorInThreadServiceCallback
     * @type {Integer (UInt32)}
     */
    static InThreadServiceCallback => 65550

    /**
     * Native name: JsErrorCannotSerializeDebugScript
     * @type {Integer (UInt32)}
     */
    static CannotSerializeDebugScript => 65551

    /**
     * Native name: JsErrorAlreadyDebuggingContext
     * @type {Integer (UInt32)}
     */
    static AlreadyDebuggingContext => 65552

    /**
     * Native name: JsErrorAlreadyProfilingContext
     * @type {Integer (UInt32)}
     */
    static AlreadyProfilingContext => 65553

    /**
     * Native name: JsErrorIdleNotEnabled
     * @type {Integer (UInt32)}
     */
    static IdleNotEnabled => 65554

    /**
     * Native name: JsErrorCategoryEngine
     * @type {Integer (UInt32)}
     */
    static CategoryEngine => 131072

    /**
     * Native name: JsErrorOutOfMemory
     * @type {Integer (UInt32)}
     */
    static OutOfMemory => 131073

    /**
     * Native name: JsErrorCategoryScript
     * @type {Integer (UInt32)}
     */
    static CategoryScript => 196608

    /**
     * Native name: JsErrorScriptException
     * @type {Integer (UInt32)}
     */
    static ScriptException => 196609

    /**
     * Native name: JsErrorScriptCompile
     * @type {Integer (UInt32)}
     */
    static ScriptCompile => 196610

    /**
     * Native name: JsErrorScriptTerminated
     * @type {Integer (UInt32)}
     */
    static ScriptTerminated => 196611

    /**
     * Native name: JsErrorScriptEvalDisabled
     * @type {Integer (UInt32)}
     */
    static ScriptEvalDisabled => 196612

    /**
     * Native name: JsErrorCategoryFatal
     * @type {Integer (UInt32)}
     */
    static CategoryFatal => 262144

    /**
     * Native name: JsErrorFatal
     * @type {Integer (UInt32)}
     */
    static Fatal => 262145
}
