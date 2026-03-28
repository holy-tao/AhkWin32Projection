#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.System.Js
 * @version v4.0.30319
 */
class Js {

;@region Constants

    /**
     * @type {Integer (UInt64)}
     */
    static JS_SOURCE_CONTEXT_NONE => 18446744073709551615
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {Pointer<Void>} runtime 
     * @param {IDebugApplication64} debugApplication 
     * @param {Pointer<Pointer<Void>>} newContext 
     * @returns {Integer} 
     */
    static JsCreateContext(runtime, debugApplication, newContext) {
        runtimeMarshal := runtime is VarRef ? "ptr" : "ptr"
        newContextMarshal := newContext is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsCreateContext", runtimeMarshal, runtime, "ptr", debugApplication, newContextMarshal, newContext, "uint")
        return result
    }

    /**
     * 
     * @param {IDebugApplication64} debugApplication 
     * @returns {Integer} 
     */
    static JsStartDebugging(debugApplication) {
        result := DllCall("chakra.dll\JsStartDebugging", "ptr", debugApplication, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} attributes 
     * @param {Integer} runtimeVersion 
     * @param {Pointer<JsThreadServiceCallback>} threadService 
     * @param {Pointer<Pointer<Void>>} runtime 
     * @returns {Integer} 
     */
    static JsCreateRuntime(attributes, runtimeVersion, threadService, runtime) {
        runtimeMarshal := runtime is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsCreateRuntime", "int", attributes, "int", runtimeVersion, "ptr", threadService, runtimeMarshal, runtime, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} runtime 
     * @returns {Integer} 
     */
    static JsCollectGarbage(runtime) {
        runtimeMarshal := runtime is VarRef ? "ptr" : "ptr"

        result := DllCall("chakra.dll\JsCollectGarbage", runtimeMarshal, runtime, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} runtime 
     * @returns {Integer} 
     */
    static JsDisposeRuntime(runtime) {
        runtimeMarshal := runtime is VarRef ? "ptr" : "ptr"

        result := DllCall("chakra.dll\JsDisposeRuntime", runtimeMarshal, runtime, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} runtime 
     * @param {Pointer<Pointer>} memoryUsage 
     * @returns {Integer} 
     */
    static JsGetRuntimeMemoryUsage(runtime, memoryUsage) {
        runtimeMarshal := runtime is VarRef ? "ptr" : "ptr"
        memoryUsageMarshal := memoryUsage is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsGetRuntimeMemoryUsage", runtimeMarshal, runtime, memoryUsageMarshal, memoryUsage, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} runtime 
     * @param {Pointer<Pointer>} memoryLimit 
     * @returns {Integer} 
     */
    static JsGetRuntimeMemoryLimit(runtime, memoryLimit) {
        runtimeMarshal := runtime is VarRef ? "ptr" : "ptr"
        memoryLimitMarshal := memoryLimit is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsGetRuntimeMemoryLimit", runtimeMarshal, runtime, memoryLimitMarshal, memoryLimit, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} runtime 
     * @param {Pointer} memoryLimit 
     * @returns {Integer} 
     */
    static JsSetRuntimeMemoryLimit(runtime, memoryLimit) {
        runtimeMarshal := runtime is VarRef ? "ptr" : "ptr"

        result := DllCall("chakra.dll\JsSetRuntimeMemoryLimit", runtimeMarshal, runtime, "ptr", memoryLimit, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} runtime 
     * @param {Pointer<Void>} callbackState 
     * @param {Pointer<JsMemoryAllocationCallback>} allocationCallback 
     * @returns {Integer} 
     */
    static JsSetRuntimeMemoryAllocationCallback(runtime, callbackState, allocationCallback) {
        runtimeMarshal := runtime is VarRef ? "ptr" : "ptr"
        callbackStateMarshal := callbackState is VarRef ? "ptr" : "ptr"

        result := DllCall("chakra.dll\JsSetRuntimeMemoryAllocationCallback", runtimeMarshal, runtime, callbackStateMarshal, callbackState, "ptr", allocationCallback, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} runtime 
     * @param {Pointer<Void>} callbackState 
     * @param {Pointer<JsBeforeCollectCallback>} beforeCollectCallback 
     * @returns {Integer} 
     */
    static JsSetRuntimeBeforeCollectCallback(runtime, callbackState, beforeCollectCallback) {
        runtimeMarshal := runtime is VarRef ? "ptr" : "ptr"
        callbackStateMarshal := callbackState is VarRef ? "ptr" : "ptr"

        result := DllCall("chakra.dll\JsSetRuntimeBeforeCollectCallback", runtimeMarshal, runtime, callbackStateMarshal, callbackState, "ptr", beforeCollectCallback, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ref 
     * @param {Pointer<Integer>} count 
     * @returns {Integer} 
     */
    static JsAddRef(ref, count) {
        refMarshal := ref is VarRef ? "ptr" : "ptr"
        countMarshal := count is VarRef ? "uint*" : "ptr"

        result := DllCall("chakra.dll\JsAddRef", refMarshal, ref, countMarshal, count, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ref 
     * @param {Pointer<Integer>} count 
     * @returns {Integer} 
     */
    static JsRelease(ref, count) {
        refMarshal := ref is VarRef ? "ptr" : "ptr"
        countMarshal := count is VarRef ? "uint*" : "ptr"

        result := DllCall("chakra.dll\JsRelease", refMarshal, ref, countMarshal, count, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} currentContext 
     * @returns {Integer} 
     */
    static JsGetCurrentContext(currentContext) {
        currentContextMarshal := currentContext is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsGetCurrentContext", currentContextMarshal, currentContext, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} _context 
     * @returns {Integer} 
     */
    static JsSetCurrentContext(_context) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := DllCall("chakra.dll\JsSetCurrentContext", _contextMarshal, _context, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} _context 
     * @param {Pointer<Pointer<Void>>} runtime 
     * @returns {Integer} 
     */
    static JsGetRuntime(_context, runtime) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"
        runtimeMarshal := runtime is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsGetRuntime", _contextMarshal, _context, runtimeMarshal, runtime, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} nextIdleTick 
     * @returns {Integer} 
     */
    static JsIdle(nextIdleTick) {
        nextIdleTickMarshal := nextIdleTick is VarRef ? "uint*" : "ptr"

        result := DllCall("chakra.dll\JsIdle", nextIdleTickMarshal, nextIdleTick, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} script 
     * @param {Pointer} sourceContext 
     * @param {PWSTR} sourceUrl 
     * @param {Pointer<Pointer<Void>>} result 
     * @returns {Integer} 
     */
    static JsParseScript(script, sourceContext, sourceUrl, result) {
        script := script is String ? StrPtr(script) : script
        sourceUrl := sourceUrl is String ? StrPtr(sourceUrl) : sourceUrl

        resultMarshal := result is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsParseScript", "ptr", script, "ptr", sourceContext, "ptr", sourceUrl, resultMarshal, result, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} script 
     * @param {Pointer} sourceContext 
     * @param {PWSTR} sourceUrl 
     * @param {Pointer<Pointer<Void>>} result 
     * @returns {Integer} 
     */
    static JsRunScript(script, sourceContext, sourceUrl, result) {
        script := script is String ? StrPtr(script) : script
        sourceUrl := sourceUrl is String ? StrPtr(sourceUrl) : sourceUrl

        resultMarshal := result is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsRunScript", "ptr", script, "ptr", sourceContext, "ptr", sourceUrl, resultMarshal, result, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} script 
     * @param {Pointer<Integer>} _buffer 
     * @param {Pointer<Integer>} bufferSize 
     * @returns {Integer} 
     */
    static JsSerializeScript(script, _buffer, bufferSize) {
        script := script is String ? StrPtr(script) : script

        _bufferMarshal := _buffer is VarRef ? "char*" : "ptr"
        bufferSizeMarshal := bufferSize is VarRef ? "uint*" : "ptr"

        result := DllCall("chakra.dll\JsSerializeScript", "ptr", script, _bufferMarshal, _buffer, bufferSizeMarshal, bufferSize, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} script 
     * @param {Pointer<Integer>} _buffer 
     * @param {Pointer} sourceContext 
     * @param {PWSTR} sourceUrl 
     * @param {Pointer<Pointer<Void>>} result 
     * @returns {Integer} 
     */
    static JsParseSerializedScript(script, _buffer, sourceContext, sourceUrl, result) {
        script := script is String ? StrPtr(script) : script
        sourceUrl := sourceUrl is String ? StrPtr(sourceUrl) : sourceUrl

        _bufferMarshal := _buffer is VarRef ? "char*" : "ptr"
        resultMarshal := result is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsParseSerializedScript", "ptr", script, _bufferMarshal, _buffer, "ptr", sourceContext, "ptr", sourceUrl, resultMarshal, result, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} script 
     * @param {Pointer<Integer>} _buffer 
     * @param {Pointer} sourceContext 
     * @param {PWSTR} sourceUrl 
     * @param {Pointer<Pointer<Void>>} result 
     * @returns {Integer} 
     */
    static JsRunSerializedScript(script, _buffer, sourceContext, sourceUrl, result) {
        script := script is String ? StrPtr(script) : script
        sourceUrl := sourceUrl is String ? StrPtr(sourceUrl) : sourceUrl

        _bufferMarshal := _buffer is VarRef ? "char*" : "ptr"
        resultMarshal := result is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsRunSerializedScript", "ptr", script, _bufferMarshal, _buffer, "ptr", sourceContext, "ptr", sourceUrl, resultMarshal, result, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} name 
     * @param {Pointer<Pointer<Void>>} propertyId 
     * @returns {Integer} 
     */
    static JsGetPropertyIdFromName(name, propertyId) {
        name := name is String ? StrPtr(name) : name

        propertyIdMarshal := propertyId is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsGetPropertyIdFromName", "ptr", name, propertyIdMarshal, propertyId, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} propertyId 
     * @param {Pointer<Pointer<Integer>>} name 
     * @returns {Integer} 
     */
    static JsGetPropertyNameFromId(propertyId, name) {
        propertyIdMarshal := propertyId is VarRef ? "ptr" : "ptr"
        nameMarshal := name is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsGetPropertyNameFromId", propertyIdMarshal, propertyId, nameMarshal, name, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} undefinedValue 
     * @returns {Integer} 
     */
    static JsGetUndefinedValue(undefinedValue) {
        undefinedValueMarshal := undefinedValue is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsGetUndefinedValue", undefinedValueMarshal, undefinedValue, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} nullValue 
     * @returns {Integer} 
     */
    static JsGetNullValue(nullValue) {
        nullValueMarshal := nullValue is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsGetNullValue", nullValueMarshal, nullValue, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} trueValue 
     * @returns {Integer} 
     */
    static JsGetTrueValue(trueValue) {
        trueValueMarshal := trueValue is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsGetTrueValue", trueValueMarshal, trueValue, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} falseValue 
     * @returns {Integer} 
     */
    static JsGetFalseValue(falseValue) {
        falseValueMarshal := falseValue is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsGetFalseValue", falseValueMarshal, falseValue, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} value 
     * @param {Pointer<Pointer<Void>>} booleanValue 
     * @returns {Integer} 
     */
    static JsBoolToBoolean(value, booleanValue) {
        booleanValueMarshal := booleanValue is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsBoolToBoolean", "char", value, booleanValueMarshal, booleanValue, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} value 
     * @param {Pointer<Boolean>} boolValue 
     * @returns {Integer} 
     */
    static JsBooleanToBool(value, boolValue) {
        valueMarshal := value is VarRef ? "ptr" : "ptr"
        boolValueMarshal := boolValue is VarRef ? "int*" : "ptr"

        result := DllCall("chakra.dll\JsBooleanToBool", valueMarshal, value, boolValueMarshal, boolValue, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} value 
     * @param {Pointer<Pointer<Void>>} booleanValue 
     * @returns {Integer} 
     */
    static JsConvertValueToBoolean(value, booleanValue) {
        valueMarshal := value is VarRef ? "ptr" : "ptr"
        booleanValueMarshal := booleanValue is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsConvertValueToBoolean", valueMarshal, value, booleanValueMarshal, booleanValue, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} value 
     * @param {Pointer<Integer>} type 
     * @returns {Integer} 
     */
    static JsGetValueType(value, type) {
        valueMarshal := value is VarRef ? "ptr" : "ptr"
        typeMarshal := type is VarRef ? "int*" : "ptr"

        result := DllCall("chakra.dll\JsGetValueType", valueMarshal, value, typeMarshal, type, "uint")
        return result
    }

    /**
     * 
     * @param {Float} doubleValue 
     * @param {Pointer<Pointer<Void>>} value 
     * @returns {Integer} 
     */
    static JsDoubleToNumber(doubleValue, value) {
        valueMarshal := value is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsDoubleToNumber", "double", doubleValue, valueMarshal, value, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} intValue 
     * @param {Pointer<Pointer<Void>>} value 
     * @returns {Integer} 
     */
    static JsIntToNumber(intValue, value) {
        valueMarshal := value is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsIntToNumber", "int", intValue, valueMarshal, value, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} value 
     * @param {Pointer<Float>} doubleValue 
     * @returns {Integer} 
     */
    static JsNumberToDouble(value, doubleValue) {
        valueMarshal := value is VarRef ? "ptr" : "ptr"
        doubleValueMarshal := doubleValue is VarRef ? "double*" : "ptr"

        result := DllCall("chakra.dll\JsNumberToDouble", valueMarshal, value, doubleValueMarshal, doubleValue, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} value 
     * @param {Pointer<Pointer<Void>>} numberValue 
     * @returns {Integer} 
     */
    static JsConvertValueToNumber(value, numberValue) {
        valueMarshal := value is VarRef ? "ptr" : "ptr"
        numberValueMarshal := numberValue is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsConvertValueToNumber", valueMarshal, value, numberValueMarshal, numberValue, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} stringValue 
     * @param {Pointer<Integer>} length 
     * @returns {Integer} 
     */
    static JsGetStringLength(stringValue, length) {
        stringValueMarshal := stringValue is VarRef ? "ptr" : "ptr"
        lengthMarshal := length is VarRef ? "int*" : "ptr"

        result := DllCall("chakra.dll\JsGetStringLength", stringValueMarshal, stringValue, lengthMarshal, length, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} stringValue 
     * @param {Pointer} stringLength 
     * @param {Pointer<Pointer<Void>>} value 
     * @returns {Integer} 
     */
    static JsPointerToString(stringValue, stringLength, value) {
        stringValue := stringValue is String ? StrPtr(stringValue) : stringValue

        valueMarshal := value is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsPointerToString", "ptr", stringValue, "ptr", stringLength, valueMarshal, value, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} value 
     * @param {Pointer<Pointer<Integer>>} stringValue 
     * @param {Pointer<Pointer>} stringLength 
     * @returns {Integer} 
     */
    static JsStringToPointer(value, stringValue, stringLength) {
        valueMarshal := value is VarRef ? "ptr" : "ptr"
        stringValueMarshal := stringValue is VarRef ? "ptr*" : "ptr"
        stringLengthMarshal := stringLength is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsStringToPointer", valueMarshal, value, stringValueMarshal, stringValue, stringLengthMarshal, stringLength, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} value 
     * @param {Pointer<Pointer<Void>>} stringValue 
     * @returns {Integer} 
     */
    static JsConvertValueToString(value, stringValue) {
        valueMarshal := value is VarRef ? "ptr" : "ptr"
        stringValueMarshal := stringValue is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsConvertValueToString", valueMarshal, value, stringValueMarshal, stringValue, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} _variant 
     * @param {Pointer<Pointer<Void>>} value 
     * @returns {Integer} 
     */
    static JsVariantToValue(_variant, value) {
        valueMarshal := value is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsVariantToValue", "ptr", _variant, valueMarshal, value, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} _object 
     * @param {Pointer<VARIANT>} _variant 
     * @returns {Integer} 
     */
    static JsValueToVariant(_object, _variant) {
        _objectMarshal := _object is VarRef ? "ptr" : "ptr"

        result := DllCall("chakra.dll\JsValueToVariant", _objectMarshal, _object, "ptr", _variant, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} globalObject 
     * @returns {Integer} 
     */
    static JsGetGlobalObject(globalObject) {
        globalObjectMarshal := globalObject is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsGetGlobalObject", globalObjectMarshal, globalObject, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} _object 
     * @returns {Integer} 
     */
    static JsCreateObject(_object) {
        _objectMarshal := _object is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsCreateObject", _objectMarshal, _object, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} data 
     * @param {Pointer<JsFinalizeCallback>} finalizeCallback 
     * @param {Pointer<Pointer<Void>>} _object 
     * @returns {Integer} 
     */
    static JsCreateExternalObject(data, finalizeCallback, _object) {
        dataMarshal := data is VarRef ? "ptr" : "ptr"
        _objectMarshal := _object is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsCreateExternalObject", dataMarshal, data, "ptr", finalizeCallback, _objectMarshal, _object, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} value 
     * @param {Pointer<Pointer<Void>>} _object 
     * @returns {Integer} 
     */
    static JsConvertValueToObject(value, _object) {
        valueMarshal := value is VarRef ? "ptr" : "ptr"
        _objectMarshal := _object is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsConvertValueToObject", valueMarshal, value, _objectMarshal, _object, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} _object 
     * @param {Pointer<Pointer<Void>>} prototypeObject 
     * @returns {Integer} 
     */
    static JsGetPrototype(_object, prototypeObject) {
        _objectMarshal := _object is VarRef ? "ptr" : "ptr"
        prototypeObjectMarshal := prototypeObject is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsGetPrototype", _objectMarshal, _object, prototypeObjectMarshal, prototypeObject, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} _object 
     * @param {Pointer<Void>} prototypeObject 
     * @returns {Integer} 
     */
    static JsSetPrototype(_object, prototypeObject) {
        _objectMarshal := _object is VarRef ? "ptr" : "ptr"
        prototypeObjectMarshal := prototypeObject is VarRef ? "ptr" : "ptr"

        result := DllCall("chakra.dll\JsSetPrototype", _objectMarshal, _object, prototypeObjectMarshal, prototypeObject, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} _object 
     * @param {Pointer<Boolean>} value 
     * @returns {Integer} 
     */
    static JsGetExtensionAllowed(_object, value) {
        _objectMarshal := _object is VarRef ? "ptr" : "ptr"
        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := DllCall("chakra.dll\JsGetExtensionAllowed", _objectMarshal, _object, valueMarshal, value, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} _object 
     * @returns {Integer} 
     */
    static JsPreventExtension(_object) {
        _objectMarshal := _object is VarRef ? "ptr" : "ptr"

        result := DllCall("chakra.dll\JsPreventExtension", _objectMarshal, _object, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} _object 
     * @param {Pointer<Void>} propertyId 
     * @param {Pointer<Pointer<Void>>} value 
     * @returns {Integer} 
     */
    static JsGetProperty(_object, propertyId, value) {
        _objectMarshal := _object is VarRef ? "ptr" : "ptr"
        propertyIdMarshal := propertyId is VarRef ? "ptr" : "ptr"
        valueMarshal := value is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsGetProperty", _objectMarshal, _object, propertyIdMarshal, propertyId, valueMarshal, value, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} _object 
     * @param {Pointer<Void>} propertyId 
     * @param {Pointer<Pointer<Void>>} propertyDescriptor 
     * @returns {Integer} 
     */
    static JsGetOwnPropertyDescriptor(_object, propertyId, propertyDescriptor) {
        _objectMarshal := _object is VarRef ? "ptr" : "ptr"
        propertyIdMarshal := propertyId is VarRef ? "ptr" : "ptr"
        propertyDescriptorMarshal := propertyDescriptor is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsGetOwnPropertyDescriptor", _objectMarshal, _object, propertyIdMarshal, propertyId, propertyDescriptorMarshal, propertyDescriptor, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} _object 
     * @param {Pointer<Pointer<Void>>} propertyNames 
     * @returns {Integer} 
     */
    static JsGetOwnPropertyNames(_object, propertyNames) {
        _objectMarshal := _object is VarRef ? "ptr" : "ptr"
        propertyNamesMarshal := propertyNames is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsGetOwnPropertyNames", _objectMarshal, _object, propertyNamesMarshal, propertyNames, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} _object 
     * @param {Pointer<Void>} propertyId 
     * @param {Pointer<Void>} value 
     * @param {Integer} useStrictRules 
     * @returns {Integer} 
     */
    static JsSetProperty(_object, propertyId, value, useStrictRules) {
        _objectMarshal := _object is VarRef ? "ptr" : "ptr"
        propertyIdMarshal := propertyId is VarRef ? "ptr" : "ptr"
        valueMarshal := value is VarRef ? "ptr" : "ptr"

        result := DllCall("chakra.dll\JsSetProperty", _objectMarshal, _object, propertyIdMarshal, propertyId, valueMarshal, value, "char", useStrictRules, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} _object 
     * @param {Pointer<Void>} propertyId 
     * @param {Pointer<Boolean>} hasProperty 
     * @returns {Integer} 
     */
    static JsHasProperty(_object, propertyId, hasProperty) {
        _objectMarshal := _object is VarRef ? "ptr" : "ptr"
        propertyIdMarshal := propertyId is VarRef ? "ptr" : "ptr"
        hasPropertyMarshal := hasProperty is VarRef ? "int*" : "ptr"

        result := DllCall("chakra.dll\JsHasProperty", _objectMarshal, _object, propertyIdMarshal, propertyId, hasPropertyMarshal, hasProperty, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} _object 
     * @param {Pointer<Void>} propertyId 
     * @param {Integer} useStrictRules 
     * @param {Pointer<Pointer<Void>>} result 
     * @returns {Integer} 
     */
    static JsDeleteProperty(_object, propertyId, useStrictRules, result) {
        _objectMarshal := _object is VarRef ? "ptr" : "ptr"
        propertyIdMarshal := propertyId is VarRef ? "ptr" : "ptr"
        resultMarshal := result is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsDeleteProperty", _objectMarshal, _object, propertyIdMarshal, propertyId, "char", useStrictRules, resultMarshal, result, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} _object 
     * @param {Pointer<Void>} propertyId 
     * @param {Pointer<Void>} propertyDescriptor 
     * @param {Pointer<Boolean>} result 
     * @returns {Integer} 
     */
    static JsDefineProperty(_object, propertyId, propertyDescriptor, result) {
        _objectMarshal := _object is VarRef ? "ptr" : "ptr"
        propertyIdMarshal := propertyId is VarRef ? "ptr" : "ptr"
        propertyDescriptorMarshal := propertyDescriptor is VarRef ? "ptr" : "ptr"
        resultMarshal := result is VarRef ? "int*" : "ptr"

        result := DllCall("chakra.dll\JsDefineProperty", _objectMarshal, _object, propertyIdMarshal, propertyId, propertyDescriptorMarshal, propertyDescriptor, resultMarshal, result, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} _object 
     * @param {Pointer<Void>} index 
     * @param {Pointer<Boolean>} result 
     * @returns {Integer} 
     */
    static JsHasIndexedProperty(_object, index, result) {
        _objectMarshal := _object is VarRef ? "ptr" : "ptr"
        indexMarshal := index is VarRef ? "ptr" : "ptr"
        resultMarshal := result is VarRef ? "int*" : "ptr"

        result := DllCall("chakra.dll\JsHasIndexedProperty", _objectMarshal, _object, indexMarshal, index, resultMarshal, result, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} _object 
     * @param {Pointer<Void>} index 
     * @param {Pointer<Pointer<Void>>} result 
     * @returns {Integer} 
     */
    static JsGetIndexedProperty(_object, index, result) {
        _objectMarshal := _object is VarRef ? "ptr" : "ptr"
        indexMarshal := index is VarRef ? "ptr" : "ptr"
        resultMarshal := result is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsGetIndexedProperty", _objectMarshal, _object, indexMarshal, index, resultMarshal, result, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} _object 
     * @param {Pointer<Void>} index 
     * @param {Pointer<Void>} value 
     * @returns {Integer} 
     */
    static JsSetIndexedProperty(_object, index, value) {
        _objectMarshal := _object is VarRef ? "ptr" : "ptr"
        indexMarshal := index is VarRef ? "ptr" : "ptr"
        valueMarshal := value is VarRef ? "ptr" : "ptr"

        result := DllCall("chakra.dll\JsSetIndexedProperty", _objectMarshal, _object, indexMarshal, index, valueMarshal, value, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} _object 
     * @param {Pointer<Void>} index 
     * @returns {Integer} 
     */
    static JsDeleteIndexedProperty(_object, index) {
        _objectMarshal := _object is VarRef ? "ptr" : "ptr"
        indexMarshal := index is VarRef ? "ptr" : "ptr"

        result := DllCall("chakra.dll\JsDeleteIndexedProperty", _objectMarshal, _object, indexMarshal, index, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} object1 
     * @param {Pointer<Void>} object2 
     * @param {Pointer<Boolean>} result 
     * @returns {Integer} 
     */
    static JsEquals(object1, object2, result) {
        object1Marshal := object1 is VarRef ? "ptr" : "ptr"
        object2Marshal := object2 is VarRef ? "ptr" : "ptr"
        resultMarshal := result is VarRef ? "int*" : "ptr"

        result := DllCall("chakra.dll\JsEquals", object1Marshal, object1, object2Marshal, object2, resultMarshal, result, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} object1 
     * @param {Pointer<Void>} object2 
     * @param {Pointer<Boolean>} result 
     * @returns {Integer} 
     */
    static JsStrictEquals(object1, object2, result) {
        object1Marshal := object1 is VarRef ? "ptr" : "ptr"
        object2Marshal := object2 is VarRef ? "ptr" : "ptr"
        resultMarshal := result is VarRef ? "int*" : "ptr"

        result := DllCall("chakra.dll\JsStrictEquals", object1Marshal, object1, object2Marshal, object2, resultMarshal, result, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} _object 
     * @param {Pointer<Boolean>} value 
     * @returns {Integer} 
     */
    static JsHasExternalData(_object, value) {
        _objectMarshal := _object is VarRef ? "ptr" : "ptr"
        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := DllCall("chakra.dll\JsHasExternalData", _objectMarshal, _object, valueMarshal, value, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} _object 
     * @param {Pointer<Pointer<Void>>} externalData 
     * @returns {Integer} 
     */
    static JsGetExternalData(_object, externalData) {
        _objectMarshal := _object is VarRef ? "ptr" : "ptr"
        externalDataMarshal := externalData is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsGetExternalData", _objectMarshal, _object, externalDataMarshal, externalData, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} _object 
     * @param {Pointer<Void>} externalData 
     * @returns {Integer} 
     */
    static JsSetExternalData(_object, externalData) {
        _objectMarshal := _object is VarRef ? "ptr" : "ptr"
        externalDataMarshal := externalData is VarRef ? "ptr" : "ptr"

        result := DllCall("chakra.dll\JsSetExternalData", _objectMarshal, _object, externalDataMarshal, externalData, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} length 
     * @param {Pointer<Pointer<Void>>} result 
     * @returns {Integer} 
     */
    static JsCreateArray(length, result) {
        resultMarshal := result is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsCreateArray", "uint", length, resultMarshal, result, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} function 
     * @param {Pointer<Pointer<Void>>} arguments 
     * @param {Integer} argumentCount 
     * @param {Pointer<Pointer<Void>>} result 
     * @returns {Integer} 
     */
    static JsCallFunction(function, arguments, argumentCount, result) {
        functionMarshal := function is VarRef ? "ptr" : "ptr"
        argumentsMarshal := arguments is VarRef ? "ptr*" : "ptr"
        resultMarshal := result is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsCallFunction", functionMarshal, function, argumentsMarshal, arguments, "ushort", argumentCount, resultMarshal, result, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} function 
     * @param {Pointer<Pointer<Void>>} arguments 
     * @param {Integer} argumentCount 
     * @param {Pointer<Pointer<Void>>} result 
     * @returns {Integer} 
     */
    static JsConstructObject(function, arguments, argumentCount, result) {
        functionMarshal := function is VarRef ? "ptr" : "ptr"
        argumentsMarshal := arguments is VarRef ? "ptr*" : "ptr"
        resultMarshal := result is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsConstructObject", functionMarshal, function, argumentsMarshal, arguments, "ushort", argumentCount, resultMarshal, result, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<JsNativeFunction>} nativeFunction 
     * @param {Pointer<Void>} callbackState 
     * @param {Pointer<Pointer<Void>>} function 
     * @returns {Integer} 
     */
    static JsCreateFunction(nativeFunction, callbackState, function) {
        callbackStateMarshal := callbackState is VarRef ? "ptr" : "ptr"
        functionMarshal := function is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsCreateFunction", "ptr", nativeFunction, callbackStateMarshal, callbackState, functionMarshal, function, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} message 
     * @param {Pointer<Pointer<Void>>} error 
     * @returns {Integer} 
     */
    static JsCreateError(message, error) {
        messageMarshal := message is VarRef ? "ptr" : "ptr"
        errorMarshal := error is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsCreateError", messageMarshal, message, errorMarshal, error, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} message 
     * @param {Pointer<Pointer<Void>>} error 
     * @returns {Integer} 
     */
    static JsCreateRangeError(message, error) {
        messageMarshal := message is VarRef ? "ptr" : "ptr"
        errorMarshal := error is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsCreateRangeError", messageMarshal, message, errorMarshal, error, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} message 
     * @param {Pointer<Pointer<Void>>} error 
     * @returns {Integer} 
     */
    static JsCreateReferenceError(message, error) {
        messageMarshal := message is VarRef ? "ptr" : "ptr"
        errorMarshal := error is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsCreateReferenceError", messageMarshal, message, errorMarshal, error, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} message 
     * @param {Pointer<Pointer<Void>>} error 
     * @returns {Integer} 
     */
    static JsCreateSyntaxError(message, error) {
        messageMarshal := message is VarRef ? "ptr" : "ptr"
        errorMarshal := error is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsCreateSyntaxError", messageMarshal, message, errorMarshal, error, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} message 
     * @param {Pointer<Pointer<Void>>} error 
     * @returns {Integer} 
     */
    static JsCreateTypeError(message, error) {
        messageMarshal := message is VarRef ? "ptr" : "ptr"
        errorMarshal := error is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsCreateTypeError", messageMarshal, message, errorMarshal, error, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} message 
     * @param {Pointer<Pointer<Void>>} error 
     * @returns {Integer} 
     */
    static JsCreateURIError(message, error) {
        messageMarshal := message is VarRef ? "ptr" : "ptr"
        errorMarshal := error is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsCreateURIError", messageMarshal, message, errorMarshal, error, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Boolean>} hasException 
     * @returns {Integer} 
     */
    static JsHasException(hasException) {
        hasExceptionMarshal := hasException is VarRef ? "int*" : "ptr"

        result := DllCall("chakra.dll\JsHasException", hasExceptionMarshal, hasException, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} exception 
     * @returns {Integer} 
     */
    static JsGetAndClearException(exception) {
        exceptionMarshal := exception is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsGetAndClearException", exceptionMarshal, exception, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} exception 
     * @returns {Integer} 
     */
    static JsSetException(exception) {
        exceptionMarshal := exception is VarRef ? "ptr" : "ptr"

        result := DllCall("chakra.dll\JsSetException", exceptionMarshal, exception, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} runtime 
     * @returns {Integer} 
     */
    static JsDisableRuntimeExecution(runtime) {
        runtimeMarshal := runtime is VarRef ? "ptr" : "ptr"

        result := DllCall("chakra.dll\JsDisableRuntimeExecution", runtimeMarshal, runtime, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} runtime 
     * @returns {Integer} 
     */
    static JsEnableRuntimeExecution(runtime) {
        runtimeMarshal := runtime is VarRef ? "ptr" : "ptr"

        result := DllCall("chakra.dll\JsEnableRuntimeExecution", runtimeMarshal, runtime, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} runtime 
     * @param {Pointer<Boolean>} isDisabled 
     * @returns {Integer} 
     */
    static JsIsRuntimeExecutionDisabled(runtime, isDisabled) {
        runtimeMarshal := runtime is VarRef ? "ptr" : "ptr"
        isDisabledMarshal := isDisabled is VarRef ? "int*" : "ptr"

        result := DllCall("chakra.dll\JsIsRuntimeExecutionDisabled", runtimeMarshal, runtime, isDisabledMarshal, isDisabled, "uint")
        return result
    }

    /**
     * 
     * @param {IActiveScriptProfilerCallback} callback 
     * @param {Integer} _eventMask 
     * @param {Integer} _context 
     * @returns {Integer} 
     */
    static JsStartProfiling(callback, _eventMask, _context) {
        result := DllCall("chakra.dll\JsStartProfiling", "ptr", callback, "int", _eventMask, "uint", _context, "uint")
        return result
    }

    /**
     * 
     * @param {HRESULT} reason 
     * @returns {Integer} 
     */
    static JsStopProfiling(reason) {
        result := DllCall("chakra.dll\JsStopProfiling", "int", reason, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<IActiveScriptProfilerHeapEnum>} _enumerator 
     * @returns {Integer} 
     */
    static JsEnumerateHeap(_enumerator) {
        result := DllCall("chakra.dll\JsEnumerateHeap", "ptr*", _enumerator, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Boolean>} isEnumeratingHeap 
     * @returns {Integer} 
     */
    static JsIsEnumeratingHeap(isEnumeratingHeap) {
        isEnumeratingHeapMarshal := isEnumeratingHeap is VarRef ? "int*" : "ptr"

        result := DllCall("chakra.dll\JsIsEnumeratingHeap", isEnumeratingHeapMarshal, isEnumeratingHeap, "uint")
        return result
    }

;@endregion Methods
}
