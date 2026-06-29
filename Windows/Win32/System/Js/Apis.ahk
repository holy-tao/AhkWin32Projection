#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\JsRuntimeAttributes.ahk" { JsRuntimeAttributes }
#Import "..\Diagnostics\Debug\ActiveScript\IDebugApplication64.ahk" { IDebugApplication64 }
#Import ".\JsValueType.ahk" { JsValueType }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Diagnostics\Debug\ActiveScript\IActiveScriptProfilerCallback.ahk" { IActiveScriptProfilerCallback }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Diagnostics\Debug\ActiveScript\PROFILER_EVENT_MASK.ahk" { PROFILER_EVENT_MASK }
#Import ".\JsErrorCode.ahk" { JsErrorCode }
#Import ".\JsRuntimeVersion.ahk" { JsRuntimeVersion }
#Import "..\Diagnostics\Debug\ActiveScript\IActiveScriptProfilerHeapEnum.ahk" { IActiveScriptProfilerHeapEnum }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.System.Js
 */

;@region Functions
/**
 * 
 * @param {Pointer<Void>} runtime 
 * @param {IDebugApplication64} debugApplication 
 * @param {Pointer<Pointer<Void>>} newContext 
 * @returns {JsErrorCode} 
 */
export JsCreateContext(runtime, debugApplication, newContext) {
    runtimeMarshal := runtime is VarRef ? "ptr" : "ptr"
    newContextMarshal := newContext is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsCreateContext", runtimeMarshal, runtime, "ptr", debugApplication, newContextMarshal, newContext, JsErrorCode)
    return result
}

/**
 * 
 * @param {IDebugApplication64} debugApplication 
 * @returns {JsErrorCode} 
 */
export JsStartDebugging(debugApplication) {
    result := DllCall("chakra.dll\JsStartDebugging", "ptr", debugApplication, JsErrorCode)
    return result
}

/**
 * 
 * @param {JsRuntimeAttributes} attributes 
 * @param {JsRuntimeVersion} runtimeVersion 
 * @param {Pointer<JsThreadServiceCallback>} threadService 
 * @param {Pointer<Pointer<Void>>} runtime 
 * @returns {JsErrorCode} 
 */
export JsCreateRuntime(attributes, runtimeVersion, threadService, runtime) {
    runtimeMarshal := runtime is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsCreateRuntime", JsRuntimeAttributes, attributes, JsRuntimeVersion, runtimeVersion, "ptr", threadService, runtimeMarshal, runtime, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} runtime 
 * @returns {JsErrorCode} 
 */
export JsCollectGarbage(runtime) {
    runtimeMarshal := runtime is VarRef ? "ptr" : "ptr"

    result := DllCall("chakra.dll\JsCollectGarbage", runtimeMarshal, runtime, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} runtime 
 * @returns {JsErrorCode} 
 */
export JsDisposeRuntime(runtime) {
    runtimeMarshal := runtime is VarRef ? "ptr" : "ptr"

    result := DllCall("chakra.dll\JsDisposeRuntime", runtimeMarshal, runtime, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} runtime 
 * @param {Pointer<Pointer>} memoryUsage 
 * @returns {JsErrorCode} 
 */
export JsGetRuntimeMemoryUsage(runtime, memoryUsage) {
    runtimeMarshal := runtime is VarRef ? "ptr" : "ptr"
    memoryUsageMarshal := memoryUsage is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsGetRuntimeMemoryUsage", runtimeMarshal, runtime, memoryUsageMarshal, memoryUsage, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} runtime 
 * @param {Pointer<Pointer>} memoryLimit 
 * @returns {JsErrorCode} 
 */
export JsGetRuntimeMemoryLimit(runtime, memoryLimit) {
    runtimeMarshal := runtime is VarRef ? "ptr" : "ptr"
    memoryLimitMarshal := memoryLimit is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsGetRuntimeMemoryLimit", runtimeMarshal, runtime, memoryLimitMarshal, memoryLimit, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} runtime 
 * @param {Pointer} memoryLimit 
 * @returns {JsErrorCode} 
 */
export JsSetRuntimeMemoryLimit(runtime, memoryLimit) {
    runtimeMarshal := runtime is VarRef ? "ptr" : "ptr"

    result := DllCall("chakra.dll\JsSetRuntimeMemoryLimit", runtimeMarshal, runtime, "ptr", memoryLimit, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} runtime 
 * @param {Pointer<Void>} callbackState 
 * @param {Pointer<JsMemoryAllocationCallback>} allocationCallback 
 * @returns {JsErrorCode} 
 */
export JsSetRuntimeMemoryAllocationCallback(runtime, callbackState, allocationCallback) {
    runtimeMarshal := runtime is VarRef ? "ptr" : "ptr"
    callbackStateMarshal := callbackState is VarRef ? "ptr" : "ptr"

    result := DllCall("chakra.dll\JsSetRuntimeMemoryAllocationCallback", runtimeMarshal, runtime, callbackStateMarshal, callbackState, "ptr", allocationCallback, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} runtime 
 * @param {Pointer<Void>} callbackState 
 * @param {Pointer<JsBeforeCollectCallback>} beforeCollectCallback 
 * @returns {JsErrorCode} 
 */
export JsSetRuntimeBeforeCollectCallback(runtime, callbackState, beforeCollectCallback) {
    runtimeMarshal := runtime is VarRef ? "ptr" : "ptr"
    callbackStateMarshal := callbackState is VarRef ? "ptr" : "ptr"

    result := DllCall("chakra.dll\JsSetRuntimeBeforeCollectCallback", runtimeMarshal, runtime, callbackStateMarshal, callbackState, "ptr", beforeCollectCallback, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} ref 
 * @param {Pointer<Integer>} count 
 * @returns {JsErrorCode} 
 */
export JsAddRef(ref, count) {
    refMarshal := ref is VarRef ? "ptr" : "ptr"
    countMarshal := count is VarRef ? "uint*" : "ptr"

    result := DllCall("chakra.dll\JsAddRef", refMarshal, ref, countMarshal, count, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} ref 
 * @param {Pointer<Integer>} count 
 * @returns {JsErrorCode} 
 */
export JsRelease(ref, count) {
    refMarshal := ref is VarRef ? "ptr" : "ptr"
    countMarshal := count is VarRef ? "uint*" : "ptr"

    result := DllCall("chakra.dll\JsRelease", refMarshal, ref, countMarshal, count, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} currentContext 
 * @returns {JsErrorCode} 
 */
export JsGetCurrentContext(currentContext) {
    currentContextMarshal := currentContext is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsGetCurrentContext", currentContextMarshal, currentContext, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _context 
 * @returns {JsErrorCode} 
 */
export JsSetCurrentContext(_context) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("chakra.dll\JsSetCurrentContext", _contextMarshal, _context, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _context 
 * @param {Pointer<Pointer<Void>>} runtime 
 * @returns {JsErrorCode} 
 */
export JsGetRuntime(_context, runtime) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"
    runtimeMarshal := runtime is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsGetRuntime", _contextMarshal, _context, runtimeMarshal, runtime, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} nextIdleTick 
 * @returns {JsErrorCode} 
 */
export JsIdle(nextIdleTick) {
    nextIdleTickMarshal := nextIdleTick is VarRef ? "uint*" : "ptr"

    result := DllCall("chakra.dll\JsIdle", nextIdleTickMarshal, nextIdleTick, JsErrorCode)
    return result
}

/**
 * 
 * @param {PWSTR} script 
 * @param {Pointer} sourceContext 
 * @param {PWSTR} sourceUrl 
 * @param {Pointer<Pointer<Void>>} result 
 * @returns {JsErrorCode} 
 */
export JsParseScript(script, sourceContext, sourceUrl, result) {
    script := script is String ? StrPtr(script) : script
    sourceUrl := sourceUrl is String ? StrPtr(sourceUrl) : sourceUrl

    resultMarshal := result is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsParseScript", "ptr", script, "ptr", sourceContext, "ptr", sourceUrl, resultMarshal, result, JsErrorCode)
    return result
}

/**
 * 
 * @param {PWSTR} script 
 * @param {Pointer} sourceContext 
 * @param {PWSTR} sourceUrl 
 * @param {Pointer<Pointer<Void>>} result 
 * @returns {JsErrorCode} 
 */
export JsRunScript(script, sourceContext, sourceUrl, result) {
    script := script is String ? StrPtr(script) : script
    sourceUrl := sourceUrl is String ? StrPtr(sourceUrl) : sourceUrl

    resultMarshal := result is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsRunScript", "ptr", script, "ptr", sourceContext, "ptr", sourceUrl, resultMarshal, result, JsErrorCode)
    return result
}

/**
 * 
 * @param {PWSTR} script 
 * @param {Pointer<Integer>} _buffer 
 * @param {Pointer<Integer>} bufferSize 
 * @returns {JsErrorCode} 
 */
export JsSerializeScript(script, _buffer, bufferSize) {
    script := script is String ? StrPtr(script) : script

    _bufferMarshal := _buffer is VarRef ? "char*" : "ptr"
    bufferSizeMarshal := bufferSize is VarRef ? "uint*" : "ptr"

    result := DllCall("chakra.dll\JsSerializeScript", "ptr", script, _bufferMarshal, _buffer, bufferSizeMarshal, bufferSize, JsErrorCode)
    return result
}

/**
 * 
 * @param {PWSTR} script 
 * @param {Pointer<Integer>} _buffer 
 * @param {Pointer} sourceContext 
 * @param {PWSTR} sourceUrl 
 * @param {Pointer<Pointer<Void>>} result 
 * @returns {JsErrorCode} 
 */
export JsParseSerializedScript(script, _buffer, sourceContext, sourceUrl, result) {
    script := script is String ? StrPtr(script) : script
    sourceUrl := sourceUrl is String ? StrPtr(sourceUrl) : sourceUrl

    _bufferMarshal := _buffer is VarRef ? "char*" : "ptr"
    resultMarshal := result is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsParseSerializedScript", "ptr", script, _bufferMarshal, _buffer, "ptr", sourceContext, "ptr", sourceUrl, resultMarshal, result, JsErrorCode)
    return result
}

/**
 * 
 * @param {PWSTR} script 
 * @param {Pointer<Integer>} _buffer 
 * @param {Pointer} sourceContext 
 * @param {PWSTR} sourceUrl 
 * @param {Pointer<Pointer<Void>>} result 
 * @returns {JsErrorCode} 
 */
export JsRunSerializedScript(script, _buffer, sourceContext, sourceUrl, result) {
    script := script is String ? StrPtr(script) : script
    sourceUrl := sourceUrl is String ? StrPtr(sourceUrl) : sourceUrl

    _bufferMarshal := _buffer is VarRef ? "char*" : "ptr"
    resultMarshal := result is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsRunSerializedScript", "ptr", script, _bufferMarshal, _buffer, "ptr", sourceContext, "ptr", sourceUrl, resultMarshal, result, JsErrorCode)
    return result
}

/**
 * 
 * @param {PWSTR} name 
 * @param {Pointer<Pointer<Void>>} propertyId 
 * @returns {JsErrorCode} 
 */
export JsGetPropertyIdFromName(name, propertyId) {
    name := name is String ? StrPtr(name) : name

    propertyIdMarshal := propertyId is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsGetPropertyIdFromName", "ptr", name, propertyIdMarshal, propertyId, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} propertyId 
 * @param {Pointer<Pointer<Integer>>} name 
 * @returns {JsErrorCode} 
 */
export JsGetPropertyNameFromId(propertyId, name) {
    propertyIdMarshal := propertyId is VarRef ? "ptr" : "ptr"
    nameMarshal := name is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsGetPropertyNameFromId", propertyIdMarshal, propertyId, nameMarshal, name, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} undefinedValue 
 * @returns {JsErrorCode} 
 */
export JsGetUndefinedValue(undefinedValue) {
    undefinedValueMarshal := undefinedValue is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsGetUndefinedValue", undefinedValueMarshal, undefinedValue, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} nullValue 
 * @returns {JsErrorCode} 
 */
export JsGetNullValue(nullValue) {
    nullValueMarshal := nullValue is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsGetNullValue", nullValueMarshal, nullValue, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} trueValue 
 * @returns {JsErrorCode} 
 */
export JsGetTrueValue(trueValue) {
    trueValueMarshal := trueValue is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsGetTrueValue", trueValueMarshal, trueValue, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} falseValue 
 * @returns {JsErrorCode} 
 */
export JsGetFalseValue(falseValue) {
    falseValueMarshal := falseValue is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsGetFalseValue", falseValueMarshal, falseValue, JsErrorCode)
    return result
}

/**
 * 
 * @param {Integer} value 
 * @param {Pointer<Pointer<Void>>} booleanValue 
 * @returns {JsErrorCode} 
 */
export JsBoolToBoolean(value, booleanValue) {
    booleanValueMarshal := booleanValue is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsBoolToBoolean", "char", value, booleanValueMarshal, booleanValue, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} value 
 * @param {Pointer<Boolean>} boolValue 
 * @returns {JsErrorCode} 
 */
export JsBooleanToBool(value, boolValue) {
    valueMarshal := value is VarRef ? "ptr" : "ptr"
    boolValueMarshal := boolValue is VarRef ? "int*" : "ptr"

    result := DllCall("chakra.dll\JsBooleanToBool", valueMarshal, value, boolValueMarshal, boolValue, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} value 
 * @param {Pointer<Pointer<Void>>} booleanValue 
 * @returns {JsErrorCode} 
 */
export JsConvertValueToBoolean(value, booleanValue) {
    valueMarshal := value is VarRef ? "ptr" : "ptr"
    booleanValueMarshal := booleanValue is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsConvertValueToBoolean", valueMarshal, value, booleanValueMarshal, booleanValue, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} value 
 * @param {Pointer<JsValueType>} type 
 * @returns {JsErrorCode} 
 */
export JsGetValueType(value, type) {
    valueMarshal := value is VarRef ? "ptr" : "ptr"
    typeMarshal := type is VarRef ? "int*" : "ptr"

    result := DllCall("chakra.dll\JsGetValueType", valueMarshal, value, typeMarshal, type, JsErrorCode)
    return result
}

/**
 * 
 * @param {Float} doubleValue 
 * @param {Pointer<Pointer<Void>>} value 
 * @returns {JsErrorCode} 
 */
export JsDoubleToNumber(doubleValue, value) {
    valueMarshal := value is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsDoubleToNumber", "double", doubleValue, valueMarshal, value, JsErrorCode)
    return result
}

/**
 * 
 * @param {Integer} intValue 
 * @param {Pointer<Pointer<Void>>} value 
 * @returns {JsErrorCode} 
 */
export JsIntToNumber(intValue, value) {
    valueMarshal := value is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsIntToNumber", "int", intValue, valueMarshal, value, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} value 
 * @param {Pointer<Float>} doubleValue 
 * @returns {JsErrorCode} 
 */
export JsNumberToDouble(value, doubleValue) {
    valueMarshal := value is VarRef ? "ptr" : "ptr"
    doubleValueMarshal := doubleValue is VarRef ? "double*" : "ptr"

    result := DllCall("chakra.dll\JsNumberToDouble", valueMarshal, value, doubleValueMarshal, doubleValue, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} value 
 * @param {Pointer<Pointer<Void>>} numberValue 
 * @returns {JsErrorCode} 
 */
export JsConvertValueToNumber(value, numberValue) {
    valueMarshal := value is VarRef ? "ptr" : "ptr"
    numberValueMarshal := numberValue is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsConvertValueToNumber", valueMarshal, value, numberValueMarshal, numberValue, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} stringValue 
 * @param {Pointer<Integer>} length 
 * @returns {JsErrorCode} 
 */
export JsGetStringLength(stringValue, length) {
    stringValueMarshal := stringValue is VarRef ? "ptr" : "ptr"
    lengthMarshal := length is VarRef ? "int*" : "ptr"

    result := DllCall("chakra.dll\JsGetStringLength", stringValueMarshal, stringValue, lengthMarshal, length, JsErrorCode)
    return result
}

/**
 * 
 * @param {PWSTR} stringValue 
 * @param {Pointer} stringLength 
 * @param {Pointer<Pointer<Void>>} value 
 * @returns {JsErrorCode} 
 */
export JsPointerToString(stringValue, stringLength, value) {
    stringValue := stringValue is String ? StrPtr(stringValue) : stringValue

    valueMarshal := value is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsPointerToString", "ptr", stringValue, "ptr", stringLength, valueMarshal, value, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} value 
 * @param {Pointer<Pointer<Integer>>} stringValue 
 * @param {Pointer<Pointer>} stringLength 
 * @returns {JsErrorCode} 
 */
export JsStringToPointer(value, stringValue, stringLength) {
    valueMarshal := value is VarRef ? "ptr" : "ptr"
    stringValueMarshal := stringValue is VarRef ? "ptr*" : "ptr"
    stringLengthMarshal := stringLength is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsStringToPointer", valueMarshal, value, stringValueMarshal, stringValue, stringLengthMarshal, stringLength, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} value 
 * @param {Pointer<Pointer<Void>>} stringValue 
 * @returns {JsErrorCode} 
 */
export JsConvertValueToString(value, stringValue) {
    valueMarshal := value is VarRef ? "ptr" : "ptr"
    stringValueMarshal := stringValue is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsConvertValueToString", valueMarshal, value, stringValueMarshal, stringValue, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<VARIANT>} _variant 
 * @param {Pointer<Pointer<Void>>} value 
 * @returns {JsErrorCode} 
 */
export JsVariantToValue(_variant, value) {
    valueMarshal := value is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsVariantToValue", VARIANT.Ptr, _variant, valueMarshal, value, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _object 
 * @param {Pointer<VARIANT>} _variant 
 * @returns {JsErrorCode} 
 */
export JsValueToVariant(_object, _variant) {
    _objectMarshal := _object is VarRef ? "ptr" : "ptr"

    result := DllCall("chakra.dll\JsValueToVariant", _objectMarshal, _object, VARIANT.Ptr, _variant, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} globalObject 
 * @returns {JsErrorCode} 
 */
export JsGetGlobalObject(globalObject) {
    globalObjectMarshal := globalObject is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsGetGlobalObject", globalObjectMarshal, globalObject, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} _object 
 * @returns {JsErrorCode} 
 */
export JsCreateObject(_object) {
    _objectMarshal := _object is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsCreateObject", _objectMarshal, _object, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} data 
 * @param {Pointer<JsFinalizeCallback>} finalizeCallback 
 * @param {Pointer<Pointer<Void>>} _object 
 * @returns {JsErrorCode} 
 */
export JsCreateExternalObject(data, finalizeCallback, _object) {
    dataMarshal := data is VarRef ? "ptr" : "ptr"
    _objectMarshal := _object is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsCreateExternalObject", dataMarshal, data, "ptr", finalizeCallback, _objectMarshal, _object, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} value 
 * @param {Pointer<Pointer<Void>>} _object 
 * @returns {JsErrorCode} 
 */
export JsConvertValueToObject(value, _object) {
    valueMarshal := value is VarRef ? "ptr" : "ptr"
    _objectMarshal := _object is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsConvertValueToObject", valueMarshal, value, _objectMarshal, _object, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _object 
 * @param {Pointer<Pointer<Void>>} prototypeObject 
 * @returns {JsErrorCode} 
 */
export JsGetPrototype(_object, prototypeObject) {
    _objectMarshal := _object is VarRef ? "ptr" : "ptr"
    prototypeObjectMarshal := prototypeObject is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsGetPrototype", _objectMarshal, _object, prototypeObjectMarshal, prototypeObject, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _object 
 * @param {Pointer<Void>} prototypeObject 
 * @returns {JsErrorCode} 
 */
export JsSetPrototype(_object, prototypeObject) {
    _objectMarshal := _object is VarRef ? "ptr" : "ptr"
    prototypeObjectMarshal := prototypeObject is VarRef ? "ptr" : "ptr"

    result := DllCall("chakra.dll\JsSetPrototype", _objectMarshal, _object, prototypeObjectMarshal, prototypeObject, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _object 
 * @param {Pointer<Boolean>} value 
 * @returns {JsErrorCode} 
 */
export JsGetExtensionAllowed(_object, value) {
    _objectMarshal := _object is VarRef ? "ptr" : "ptr"
    valueMarshal := value is VarRef ? "int*" : "ptr"

    result := DllCall("chakra.dll\JsGetExtensionAllowed", _objectMarshal, _object, valueMarshal, value, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _object 
 * @returns {JsErrorCode} 
 */
export JsPreventExtension(_object) {
    _objectMarshal := _object is VarRef ? "ptr" : "ptr"

    result := DllCall("chakra.dll\JsPreventExtension", _objectMarshal, _object, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _object 
 * @param {Pointer<Void>} propertyId 
 * @param {Pointer<Pointer<Void>>} value 
 * @returns {JsErrorCode} 
 */
export JsGetProperty(_object, propertyId, value) {
    _objectMarshal := _object is VarRef ? "ptr" : "ptr"
    propertyIdMarshal := propertyId is VarRef ? "ptr" : "ptr"
    valueMarshal := value is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsGetProperty", _objectMarshal, _object, propertyIdMarshal, propertyId, valueMarshal, value, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _object 
 * @param {Pointer<Void>} propertyId 
 * @param {Pointer<Pointer<Void>>} propertyDescriptor 
 * @returns {JsErrorCode} 
 */
export JsGetOwnPropertyDescriptor(_object, propertyId, propertyDescriptor) {
    _objectMarshal := _object is VarRef ? "ptr" : "ptr"
    propertyIdMarshal := propertyId is VarRef ? "ptr" : "ptr"
    propertyDescriptorMarshal := propertyDescriptor is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsGetOwnPropertyDescriptor", _objectMarshal, _object, propertyIdMarshal, propertyId, propertyDescriptorMarshal, propertyDescriptor, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _object 
 * @param {Pointer<Pointer<Void>>} propertyNames 
 * @returns {JsErrorCode} 
 */
export JsGetOwnPropertyNames(_object, propertyNames) {
    _objectMarshal := _object is VarRef ? "ptr" : "ptr"
    propertyNamesMarshal := propertyNames is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsGetOwnPropertyNames", _objectMarshal, _object, propertyNamesMarshal, propertyNames, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _object 
 * @param {Pointer<Void>} propertyId 
 * @param {Pointer<Void>} value 
 * @param {Integer} useStrictRules 
 * @returns {JsErrorCode} 
 */
export JsSetProperty(_object, propertyId, value, useStrictRules) {
    _objectMarshal := _object is VarRef ? "ptr" : "ptr"
    propertyIdMarshal := propertyId is VarRef ? "ptr" : "ptr"
    valueMarshal := value is VarRef ? "ptr" : "ptr"

    result := DllCall("chakra.dll\JsSetProperty", _objectMarshal, _object, propertyIdMarshal, propertyId, valueMarshal, value, "char", useStrictRules, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _object 
 * @param {Pointer<Void>} propertyId 
 * @param {Pointer<Boolean>} hasProperty 
 * @returns {JsErrorCode} 
 */
export JsHasProperty(_object, propertyId, hasProperty) {
    _objectMarshal := _object is VarRef ? "ptr" : "ptr"
    propertyIdMarshal := propertyId is VarRef ? "ptr" : "ptr"
    hasPropertyMarshal := hasProperty is VarRef ? "int*" : "ptr"

    result := DllCall("chakra.dll\JsHasProperty", _objectMarshal, _object, propertyIdMarshal, propertyId, hasPropertyMarshal, hasProperty, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _object 
 * @param {Pointer<Void>} propertyId 
 * @param {Integer} useStrictRules 
 * @param {Pointer<Pointer<Void>>} result 
 * @returns {JsErrorCode} 
 */
export JsDeleteProperty(_object, propertyId, useStrictRules, result) {
    _objectMarshal := _object is VarRef ? "ptr" : "ptr"
    propertyIdMarshal := propertyId is VarRef ? "ptr" : "ptr"
    resultMarshal := result is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsDeleteProperty", _objectMarshal, _object, propertyIdMarshal, propertyId, "char", useStrictRules, resultMarshal, result, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _object 
 * @param {Pointer<Void>} propertyId 
 * @param {Pointer<Void>} propertyDescriptor 
 * @param {Pointer<Boolean>} result 
 * @returns {JsErrorCode} 
 */
export JsDefineProperty(_object, propertyId, propertyDescriptor, result) {
    _objectMarshal := _object is VarRef ? "ptr" : "ptr"
    propertyIdMarshal := propertyId is VarRef ? "ptr" : "ptr"
    propertyDescriptorMarshal := propertyDescriptor is VarRef ? "ptr" : "ptr"
    resultMarshal := result is VarRef ? "int*" : "ptr"

    result := DllCall("chakra.dll\JsDefineProperty", _objectMarshal, _object, propertyIdMarshal, propertyId, propertyDescriptorMarshal, propertyDescriptor, resultMarshal, result, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _object 
 * @param {Pointer<Void>} index 
 * @param {Pointer<Boolean>} result 
 * @returns {JsErrorCode} 
 */
export JsHasIndexedProperty(_object, index, result) {
    _objectMarshal := _object is VarRef ? "ptr" : "ptr"
    indexMarshal := index is VarRef ? "ptr" : "ptr"
    resultMarshal := result is VarRef ? "int*" : "ptr"

    result := DllCall("chakra.dll\JsHasIndexedProperty", _objectMarshal, _object, indexMarshal, index, resultMarshal, result, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _object 
 * @param {Pointer<Void>} index 
 * @param {Pointer<Pointer<Void>>} result 
 * @returns {JsErrorCode} 
 */
export JsGetIndexedProperty(_object, index, result) {
    _objectMarshal := _object is VarRef ? "ptr" : "ptr"
    indexMarshal := index is VarRef ? "ptr" : "ptr"
    resultMarshal := result is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsGetIndexedProperty", _objectMarshal, _object, indexMarshal, index, resultMarshal, result, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _object 
 * @param {Pointer<Void>} index 
 * @param {Pointer<Void>} value 
 * @returns {JsErrorCode} 
 */
export JsSetIndexedProperty(_object, index, value) {
    _objectMarshal := _object is VarRef ? "ptr" : "ptr"
    indexMarshal := index is VarRef ? "ptr" : "ptr"
    valueMarshal := value is VarRef ? "ptr" : "ptr"

    result := DllCall("chakra.dll\JsSetIndexedProperty", _objectMarshal, _object, indexMarshal, index, valueMarshal, value, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _object 
 * @param {Pointer<Void>} index 
 * @returns {JsErrorCode} 
 */
export JsDeleteIndexedProperty(_object, index) {
    _objectMarshal := _object is VarRef ? "ptr" : "ptr"
    indexMarshal := index is VarRef ? "ptr" : "ptr"

    result := DllCall("chakra.dll\JsDeleteIndexedProperty", _objectMarshal, _object, indexMarshal, index, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} object1 
 * @param {Pointer<Void>} object2 
 * @param {Pointer<Boolean>} result 
 * @returns {JsErrorCode} 
 */
export JsEquals(object1, object2, result) {
    object1Marshal := object1 is VarRef ? "ptr" : "ptr"
    object2Marshal := object2 is VarRef ? "ptr" : "ptr"
    resultMarshal := result is VarRef ? "int*" : "ptr"

    result := DllCall("chakra.dll\JsEquals", object1Marshal, object1, object2Marshal, object2, resultMarshal, result, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} object1 
 * @param {Pointer<Void>} object2 
 * @param {Pointer<Boolean>} result 
 * @returns {JsErrorCode} 
 */
export JsStrictEquals(object1, object2, result) {
    object1Marshal := object1 is VarRef ? "ptr" : "ptr"
    object2Marshal := object2 is VarRef ? "ptr" : "ptr"
    resultMarshal := result is VarRef ? "int*" : "ptr"

    result := DllCall("chakra.dll\JsStrictEquals", object1Marshal, object1, object2Marshal, object2, resultMarshal, result, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _object 
 * @param {Pointer<Boolean>} value 
 * @returns {JsErrorCode} 
 */
export JsHasExternalData(_object, value) {
    _objectMarshal := _object is VarRef ? "ptr" : "ptr"
    valueMarshal := value is VarRef ? "int*" : "ptr"

    result := DllCall("chakra.dll\JsHasExternalData", _objectMarshal, _object, valueMarshal, value, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _object 
 * @param {Pointer<Pointer<Void>>} externalData 
 * @returns {JsErrorCode} 
 */
export JsGetExternalData(_object, externalData) {
    _objectMarshal := _object is VarRef ? "ptr" : "ptr"
    externalDataMarshal := externalData is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsGetExternalData", _objectMarshal, _object, externalDataMarshal, externalData, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _object 
 * @param {Pointer<Void>} externalData 
 * @returns {JsErrorCode} 
 */
export JsSetExternalData(_object, externalData) {
    _objectMarshal := _object is VarRef ? "ptr" : "ptr"
    externalDataMarshal := externalData is VarRef ? "ptr" : "ptr"

    result := DllCall("chakra.dll\JsSetExternalData", _objectMarshal, _object, externalDataMarshal, externalData, JsErrorCode)
    return result
}

/**
 * 
 * @param {Integer} length 
 * @param {Pointer<Pointer<Void>>} result 
 * @returns {JsErrorCode} 
 */
export JsCreateArray(length, result) {
    resultMarshal := result is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsCreateArray", "uint", length, resultMarshal, result, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} function 
 * @param {Pointer<Pointer<Void>>} arguments 
 * @param {Integer} argumentCount 
 * @param {Pointer<Pointer<Void>>} result 
 * @returns {JsErrorCode} 
 */
export JsCallFunction(function, arguments, argumentCount, result) {
    functionMarshal := function is VarRef ? "ptr" : "ptr"
    argumentsMarshal := arguments is VarRef ? "ptr*" : "ptr"
    resultMarshal := result is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsCallFunction", functionMarshal, function, argumentsMarshal, arguments, "ushort", argumentCount, resultMarshal, result, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} function 
 * @param {Pointer<Pointer<Void>>} arguments 
 * @param {Integer} argumentCount 
 * @param {Pointer<Pointer<Void>>} result 
 * @returns {JsErrorCode} 
 */
export JsConstructObject(function, arguments, argumentCount, result) {
    functionMarshal := function is VarRef ? "ptr" : "ptr"
    argumentsMarshal := arguments is VarRef ? "ptr*" : "ptr"
    resultMarshal := result is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsConstructObject", functionMarshal, function, argumentsMarshal, arguments, "ushort", argumentCount, resultMarshal, result, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<JsNativeFunction>} nativeFunction 
 * @param {Pointer<Void>} callbackState 
 * @param {Pointer<Pointer<Void>>} function 
 * @returns {JsErrorCode} 
 */
export JsCreateFunction(nativeFunction, callbackState, function) {
    callbackStateMarshal := callbackState is VarRef ? "ptr" : "ptr"
    functionMarshal := function is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsCreateFunction", "ptr", nativeFunction, callbackStateMarshal, callbackState, functionMarshal, function, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} message 
 * @param {Pointer<Pointer<Void>>} _error 
 * @returns {JsErrorCode} 
 */
export JsCreateError(message, _error) {
    messageMarshal := message is VarRef ? "ptr" : "ptr"
    _errorMarshal := _error is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsCreateError", messageMarshal, message, _errorMarshal, _error, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} message 
 * @param {Pointer<Pointer<Void>>} _error 
 * @returns {JsErrorCode} 
 */
export JsCreateRangeError(message, _error) {
    messageMarshal := message is VarRef ? "ptr" : "ptr"
    _errorMarshal := _error is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsCreateRangeError", messageMarshal, message, _errorMarshal, _error, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} message 
 * @param {Pointer<Pointer<Void>>} _error 
 * @returns {JsErrorCode} 
 */
export JsCreateReferenceError(message, _error) {
    messageMarshal := message is VarRef ? "ptr" : "ptr"
    _errorMarshal := _error is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsCreateReferenceError", messageMarshal, message, _errorMarshal, _error, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} message 
 * @param {Pointer<Pointer<Void>>} _error 
 * @returns {JsErrorCode} 
 */
export JsCreateSyntaxError(message, _error) {
    messageMarshal := message is VarRef ? "ptr" : "ptr"
    _errorMarshal := _error is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsCreateSyntaxError", messageMarshal, message, _errorMarshal, _error, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} message 
 * @param {Pointer<Pointer<Void>>} _error 
 * @returns {JsErrorCode} 
 */
export JsCreateTypeError(message, _error) {
    messageMarshal := message is VarRef ? "ptr" : "ptr"
    _errorMarshal := _error is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsCreateTypeError", messageMarshal, message, _errorMarshal, _error, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} message 
 * @param {Pointer<Pointer<Void>>} _error 
 * @returns {JsErrorCode} 
 */
export JsCreateURIError(message, _error) {
    messageMarshal := message is VarRef ? "ptr" : "ptr"
    _errorMarshal := _error is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsCreateURIError", messageMarshal, message, _errorMarshal, _error, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Boolean>} hasException 
 * @returns {JsErrorCode} 
 */
export JsHasException(hasException) {
    hasExceptionMarshal := hasException is VarRef ? "int*" : "ptr"

    result := DllCall("chakra.dll\JsHasException", hasExceptionMarshal, hasException, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} exception 
 * @returns {JsErrorCode} 
 */
export JsGetAndClearException(exception) {
    exceptionMarshal := exception is VarRef ? "ptr*" : "ptr"

    result := DllCall("chakra.dll\JsGetAndClearException", exceptionMarshal, exception, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} exception 
 * @returns {JsErrorCode} 
 */
export JsSetException(exception) {
    exceptionMarshal := exception is VarRef ? "ptr" : "ptr"

    result := DllCall("chakra.dll\JsSetException", exceptionMarshal, exception, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} runtime 
 * @returns {JsErrorCode} 
 */
export JsDisableRuntimeExecution(runtime) {
    runtimeMarshal := runtime is VarRef ? "ptr" : "ptr"

    result := DllCall("chakra.dll\JsDisableRuntimeExecution", runtimeMarshal, runtime, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} runtime 
 * @returns {JsErrorCode} 
 */
export JsEnableRuntimeExecution(runtime) {
    runtimeMarshal := runtime is VarRef ? "ptr" : "ptr"

    result := DllCall("chakra.dll\JsEnableRuntimeExecution", runtimeMarshal, runtime, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Void>} runtime 
 * @param {Pointer<Boolean>} isDisabled 
 * @returns {JsErrorCode} 
 */
export JsIsRuntimeExecutionDisabled(runtime, isDisabled) {
    runtimeMarshal := runtime is VarRef ? "ptr" : "ptr"
    isDisabledMarshal := isDisabled is VarRef ? "int*" : "ptr"

    result := DllCall("chakra.dll\JsIsRuntimeExecutionDisabled", runtimeMarshal, runtime, isDisabledMarshal, isDisabled, JsErrorCode)
    return result
}

/**
 * 
 * @param {IActiveScriptProfilerCallback} callback 
 * @param {PROFILER_EVENT_MASK} _eventMask 
 * @param {Integer} _context 
 * @returns {JsErrorCode} 
 */
export JsStartProfiling(callback, _eventMask, _context) {
    result := DllCall("chakra.dll\JsStartProfiling", "ptr", callback, PROFILER_EVENT_MASK, _eventMask, "uint", _context, JsErrorCode)
    return result
}

/**
 * 
 * @param {HRESULT} reason 
 * @returns {JsErrorCode} 
 */
export JsStopProfiling(reason) {
    result := DllCall("chakra.dll\JsStopProfiling", "int", reason, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<IActiveScriptProfilerHeapEnum>} _enumerator 
 * @returns {JsErrorCode} 
 */
export JsEnumerateHeap(_enumerator) {
    result := DllCall("chakra.dll\JsEnumerateHeap", IActiveScriptProfilerHeapEnum.Ptr, _enumerator, JsErrorCode)
    return result
}

/**
 * 
 * @param {Pointer<Boolean>} isEnumeratingHeap 
 * @returns {JsErrorCode} 
 */
export JsIsEnumeratingHeap(isEnumeratingHeap) {
    isEnumeratingHeapMarshal := isEnumeratingHeap is VarRef ? "int*" : "ptr"

    result := DllCall("chakra.dll\JsIsEnumeratingHeap", isEnumeratingHeapMarshal, isEnumeratingHeap, JsErrorCode)
    return result
}

;@endregion Functions
