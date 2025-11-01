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

        result := DllCall("chakra.dll\JsCreateContext", runtimeMarshal, runtime, "ptr", debugApplication, "ptr*", newContext, "uint")
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
        result := DllCall("chakra.dll\JsCreateRuntime", "int", attributes, "int", runtimeVersion, "ptr", threadService, "ptr*", runtime, "uint")
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
        result := DllCall("chakra.dll\JsGetCurrentContext", "ptr*", currentContext, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} context 
     * @returns {Integer} 
     */
    static JsSetCurrentContext(context) {
        contextMarshal := context is VarRef ? "ptr" : "ptr"

        result := DllCall("chakra.dll\JsSetCurrentContext", contextMarshal, context, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} context 
     * @param {Pointer<Pointer<Void>>} runtime 
     * @returns {Integer} 
     */
    static JsGetRuntime(context, runtime) {
        contextMarshal := context is VarRef ? "ptr" : "ptr"

        result := DllCall("chakra.dll\JsGetRuntime", contextMarshal, context, "ptr*", runtime, "uint")
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

        result := DllCall("chakra.dll\JsParseScript", "ptr", script, "ptr", sourceContext, "ptr", sourceUrl, "ptr*", result, "uint")
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

        result := DllCall("chakra.dll\JsRunScript", "ptr", script, "ptr", sourceContext, "ptr", sourceUrl, "ptr*", result, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} script 
     * @param {Pointer<Integer>} buffer 
     * @param {Pointer<Integer>} bufferSize 
     * @returns {Integer} 
     */
    static JsSerializeScript(script, buffer, bufferSize) {
        script := script is String ? StrPtr(script) : script

        bufferMarshal := buffer is VarRef ? "char*" : "ptr"
        bufferSizeMarshal := bufferSize is VarRef ? "uint*" : "ptr"

        result := DllCall("chakra.dll\JsSerializeScript", "ptr", script, bufferMarshal, buffer, bufferSizeMarshal, bufferSize, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} script 
     * @param {Pointer<Integer>} buffer 
     * @param {Pointer} sourceContext 
     * @param {PWSTR} sourceUrl 
     * @param {Pointer<Pointer<Void>>} result 
     * @returns {Integer} 
     */
    static JsParseSerializedScript(script, buffer, sourceContext, sourceUrl, result) {
        script := script is String ? StrPtr(script) : script
        sourceUrl := sourceUrl is String ? StrPtr(sourceUrl) : sourceUrl

        bufferMarshal := buffer is VarRef ? "char*" : "ptr"

        result := DllCall("chakra.dll\JsParseSerializedScript", "ptr", script, bufferMarshal, buffer, "ptr", sourceContext, "ptr", sourceUrl, "ptr*", result, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} script 
     * @param {Pointer<Integer>} buffer 
     * @param {Pointer} sourceContext 
     * @param {PWSTR} sourceUrl 
     * @param {Pointer<Pointer<Void>>} result 
     * @returns {Integer} 
     */
    static JsRunSerializedScript(script, buffer, sourceContext, sourceUrl, result) {
        script := script is String ? StrPtr(script) : script
        sourceUrl := sourceUrl is String ? StrPtr(sourceUrl) : sourceUrl

        bufferMarshal := buffer is VarRef ? "char*" : "ptr"

        result := DllCall("chakra.dll\JsRunSerializedScript", "ptr", script, bufferMarshal, buffer, "ptr", sourceContext, "ptr", sourceUrl, "ptr*", result, "uint")
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

        result := DllCall("chakra.dll\JsGetPropertyIdFromName", "ptr", name, "ptr*", propertyId, "uint")
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

        result := DllCall("chakra.dll\JsGetPropertyNameFromId", propertyIdMarshal, propertyId, "ptr*", name, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} undefinedValue 
     * @returns {Integer} 
     */
    static JsGetUndefinedValue(undefinedValue) {
        result := DllCall("chakra.dll\JsGetUndefinedValue", "ptr*", undefinedValue, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} nullValue 
     * @returns {Integer} 
     */
    static JsGetNullValue(nullValue) {
        result := DllCall("chakra.dll\JsGetNullValue", "ptr*", nullValue, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} trueValue 
     * @returns {Integer} 
     */
    static JsGetTrueValue(trueValue) {
        result := DllCall("chakra.dll\JsGetTrueValue", "ptr*", trueValue, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} falseValue 
     * @returns {Integer} 
     */
    static JsGetFalseValue(falseValue) {
        result := DllCall("chakra.dll\JsGetFalseValue", "ptr*", falseValue, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} value 
     * @param {Pointer<Pointer<Void>>} booleanValue 
     * @returns {Integer} 
     */
    static JsBoolToBoolean(value, booleanValue) {
        result := DllCall("chakra.dll\JsBoolToBoolean", "char", value, "ptr*", booleanValue, "uint")
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

        result := DllCall("chakra.dll\JsConvertValueToBoolean", valueMarshal, value, "ptr*", booleanValue, "uint")
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
        result := DllCall("chakra.dll\JsDoubleToNumber", "double", doubleValue, "ptr*", value, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} intValue 
     * @param {Pointer<Pointer<Void>>} value 
     * @returns {Integer} 
     */
    static JsIntToNumber(intValue, value) {
        result := DllCall("chakra.dll\JsIntToNumber", "int", intValue, "ptr*", value, "uint")
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

        result := DllCall("chakra.dll\JsConvertValueToNumber", valueMarshal, value, "ptr*", numberValue, "uint")
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

        result := DllCall("chakra.dll\JsPointerToString", "ptr", stringValue, "ptr", stringLength, "ptr*", value, "uint")
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
        stringLengthMarshal := stringLength is VarRef ? "ptr*" : "ptr"

        result := DllCall("chakra.dll\JsStringToPointer", valueMarshal, value, "ptr*", stringValue, stringLengthMarshal, stringLength, "uint")
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

        result := DllCall("chakra.dll\JsConvertValueToString", valueMarshal, value, "ptr*", stringValue, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} variant 
     * @param {Pointer<Pointer<Void>>} value 
     * @returns {Integer} 
     */
    static JsVariantToValue(variant, value) {
        result := DllCall("chakra.dll\JsVariantToValue", "ptr", variant, "ptr*", value, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} object 
     * @param {Pointer<VARIANT>} variant 
     * @returns {Integer} 
     */
    static JsValueToVariant(object, variant) {
        objectMarshal := object is VarRef ? "ptr" : "ptr"

        result := DllCall("chakra.dll\JsValueToVariant", objectMarshal, object, "ptr", variant, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} globalObject 
     * @returns {Integer} 
     */
    static JsGetGlobalObject(globalObject) {
        result := DllCall("chakra.dll\JsGetGlobalObject", "ptr*", globalObject, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} object 
     * @returns {Integer} 
     */
    static JsCreateObject(object) {
        result := DllCall("chakra.dll\JsCreateObject", "ptr*", object, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} data 
     * @param {Pointer<JsFinalizeCallback>} finalizeCallback 
     * @param {Pointer<Pointer<Void>>} object 
     * @returns {Integer} 
     */
    static JsCreateExternalObject(data, finalizeCallback, object) {
        dataMarshal := data is VarRef ? "ptr" : "ptr"

        result := DllCall("chakra.dll\JsCreateExternalObject", dataMarshal, data, "ptr", finalizeCallback, "ptr*", object, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} value 
     * @param {Pointer<Pointer<Void>>} object 
     * @returns {Integer} 
     */
    static JsConvertValueToObject(value, object) {
        valueMarshal := value is VarRef ? "ptr" : "ptr"

        result := DllCall("chakra.dll\JsConvertValueToObject", valueMarshal, value, "ptr*", object, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} object 
     * @param {Pointer<Pointer<Void>>} prototypeObject 
     * @returns {Integer} 
     */
    static JsGetPrototype(object, prototypeObject) {
        objectMarshal := object is VarRef ? "ptr" : "ptr"

        result := DllCall("chakra.dll\JsGetPrototype", objectMarshal, object, "ptr*", prototypeObject, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} object 
     * @param {Pointer<Void>} prototypeObject 
     * @returns {Integer} 
     */
    static JsSetPrototype(object, prototypeObject) {
        objectMarshal := object is VarRef ? "ptr" : "ptr"
        prototypeObjectMarshal := prototypeObject is VarRef ? "ptr" : "ptr"

        result := DllCall("chakra.dll\JsSetPrototype", objectMarshal, object, prototypeObjectMarshal, prototypeObject, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} object 
     * @param {Pointer<Boolean>} value 
     * @returns {Integer} 
     */
    static JsGetExtensionAllowed(object, value) {
        objectMarshal := object is VarRef ? "ptr" : "ptr"
        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := DllCall("chakra.dll\JsGetExtensionAllowed", objectMarshal, object, valueMarshal, value, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} object 
     * @returns {Integer} 
     */
    static JsPreventExtension(object) {
        objectMarshal := object is VarRef ? "ptr" : "ptr"

        result := DllCall("chakra.dll\JsPreventExtension", objectMarshal, object, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} object 
     * @param {Pointer<Void>} propertyId 
     * @param {Pointer<Pointer<Void>>} value 
     * @returns {Integer} 
     */
    static JsGetProperty(object, propertyId, value) {
        objectMarshal := object is VarRef ? "ptr" : "ptr"
        propertyIdMarshal := propertyId is VarRef ? "ptr" : "ptr"

        result := DllCall("chakra.dll\JsGetProperty", objectMarshal, object, propertyIdMarshal, propertyId, "ptr*", value, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} object 
     * @param {Pointer<Void>} propertyId 
     * @param {Pointer<Pointer<Void>>} propertyDescriptor 
     * @returns {Integer} 
     */
    static JsGetOwnPropertyDescriptor(object, propertyId, propertyDescriptor) {
        objectMarshal := object is VarRef ? "ptr" : "ptr"
        propertyIdMarshal := propertyId is VarRef ? "ptr" : "ptr"

        result := DllCall("chakra.dll\JsGetOwnPropertyDescriptor", objectMarshal, object, propertyIdMarshal, propertyId, "ptr*", propertyDescriptor, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} object 
     * @param {Pointer<Pointer<Void>>} propertyNames 
     * @returns {Integer} 
     */
    static JsGetOwnPropertyNames(object, propertyNames) {
        objectMarshal := object is VarRef ? "ptr" : "ptr"

        result := DllCall("chakra.dll\JsGetOwnPropertyNames", objectMarshal, object, "ptr*", propertyNames, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} object 
     * @param {Pointer<Void>} propertyId 
     * @param {Pointer<Void>} value 
     * @param {Integer} useStrictRules 
     * @returns {Integer} 
     */
    static JsSetProperty(object, propertyId, value, useStrictRules) {
        objectMarshal := object is VarRef ? "ptr" : "ptr"
        propertyIdMarshal := propertyId is VarRef ? "ptr" : "ptr"
        valueMarshal := value is VarRef ? "ptr" : "ptr"

        result := DllCall("chakra.dll\JsSetProperty", objectMarshal, object, propertyIdMarshal, propertyId, valueMarshal, value, "char", useStrictRules, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} object 
     * @param {Pointer<Void>} propertyId 
     * @param {Pointer<Boolean>} hasProperty 
     * @returns {Integer} 
     */
    static JsHasProperty(object, propertyId, hasProperty) {
        objectMarshal := object is VarRef ? "ptr" : "ptr"
        propertyIdMarshal := propertyId is VarRef ? "ptr" : "ptr"
        hasPropertyMarshal := hasProperty is VarRef ? "int*" : "ptr"

        result := DllCall("chakra.dll\JsHasProperty", objectMarshal, object, propertyIdMarshal, propertyId, hasPropertyMarshal, hasProperty, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} object 
     * @param {Pointer<Void>} propertyId 
     * @param {Integer} useStrictRules 
     * @param {Pointer<Pointer<Void>>} result 
     * @returns {Integer} 
     */
    static JsDeleteProperty(object, propertyId, useStrictRules, result) {
        objectMarshal := object is VarRef ? "ptr" : "ptr"
        propertyIdMarshal := propertyId is VarRef ? "ptr" : "ptr"

        result := DllCall("chakra.dll\JsDeleteProperty", objectMarshal, object, propertyIdMarshal, propertyId, "char", useStrictRules, "ptr*", result, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} object 
     * @param {Pointer<Void>} propertyId 
     * @param {Pointer<Void>} propertyDescriptor 
     * @param {Pointer<Boolean>} result 
     * @returns {Integer} 
     */
    static JsDefineProperty(object, propertyId, propertyDescriptor, result) {
        objectMarshal := object is VarRef ? "ptr" : "ptr"
        propertyIdMarshal := propertyId is VarRef ? "ptr" : "ptr"
        propertyDescriptorMarshal := propertyDescriptor is VarRef ? "ptr" : "ptr"
        resultMarshal := result is VarRef ? "int*" : "ptr"

        result := DllCall("chakra.dll\JsDefineProperty", objectMarshal, object, propertyIdMarshal, propertyId, propertyDescriptorMarshal, propertyDescriptor, resultMarshal, result, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} object 
     * @param {Pointer<Void>} index 
     * @param {Pointer<Boolean>} result 
     * @returns {Integer} 
     */
    static JsHasIndexedProperty(object, index, result) {
        objectMarshal := object is VarRef ? "ptr" : "ptr"
        indexMarshal := index is VarRef ? "ptr" : "ptr"
        resultMarshal := result is VarRef ? "int*" : "ptr"

        result := DllCall("chakra.dll\JsHasIndexedProperty", objectMarshal, object, indexMarshal, index, resultMarshal, result, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} object 
     * @param {Pointer<Void>} index 
     * @param {Pointer<Pointer<Void>>} result 
     * @returns {Integer} 
     */
    static JsGetIndexedProperty(object, index, result) {
        objectMarshal := object is VarRef ? "ptr" : "ptr"
        indexMarshal := index is VarRef ? "ptr" : "ptr"

        result := DllCall("chakra.dll\JsGetIndexedProperty", objectMarshal, object, indexMarshal, index, "ptr*", result, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} object 
     * @param {Pointer<Void>} index 
     * @param {Pointer<Void>} value 
     * @returns {Integer} 
     */
    static JsSetIndexedProperty(object, index, value) {
        objectMarshal := object is VarRef ? "ptr" : "ptr"
        indexMarshal := index is VarRef ? "ptr" : "ptr"
        valueMarshal := value is VarRef ? "ptr" : "ptr"

        result := DllCall("chakra.dll\JsSetIndexedProperty", objectMarshal, object, indexMarshal, index, valueMarshal, value, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} object 
     * @param {Pointer<Void>} index 
     * @returns {Integer} 
     */
    static JsDeleteIndexedProperty(object, index) {
        objectMarshal := object is VarRef ? "ptr" : "ptr"
        indexMarshal := index is VarRef ? "ptr" : "ptr"

        result := DllCall("chakra.dll\JsDeleteIndexedProperty", objectMarshal, object, indexMarshal, index, "uint")
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
     * @param {Pointer<Void>} object 
     * @param {Pointer<Boolean>} value 
     * @returns {Integer} 
     */
    static JsHasExternalData(object, value) {
        objectMarshal := object is VarRef ? "ptr" : "ptr"
        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := DllCall("chakra.dll\JsHasExternalData", objectMarshal, object, valueMarshal, value, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} object 
     * @param {Pointer<Pointer<Void>>} externalData 
     * @returns {Integer} 
     */
    static JsGetExternalData(object, externalData) {
        objectMarshal := object is VarRef ? "ptr" : "ptr"

        result := DllCall("chakra.dll\JsGetExternalData", objectMarshal, object, "ptr*", externalData, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} object 
     * @param {Pointer<Void>} externalData 
     * @returns {Integer} 
     */
    static JsSetExternalData(object, externalData) {
        objectMarshal := object is VarRef ? "ptr" : "ptr"
        externalDataMarshal := externalData is VarRef ? "ptr" : "ptr"

        result := DllCall("chakra.dll\JsSetExternalData", objectMarshal, object, externalDataMarshal, externalData, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} length 
     * @param {Pointer<Pointer<Void>>} result 
     * @returns {Integer} 
     */
    static JsCreateArray(length, result) {
        result := DllCall("chakra.dll\JsCreateArray", "uint", length, "ptr*", result, "uint")
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

        result := DllCall("chakra.dll\JsCallFunction", functionMarshal, function, "ptr*", arguments, "ushort", argumentCount, "ptr*", result, "uint")
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

        result := DllCall("chakra.dll\JsConstructObject", functionMarshal, function, "ptr*", arguments, "ushort", argumentCount, "ptr*", result, "uint")
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

        result := DllCall("chakra.dll\JsCreateFunction", "ptr", nativeFunction, callbackStateMarshal, callbackState, "ptr*", function, "uint")
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

        result := DllCall("chakra.dll\JsCreateError", messageMarshal, message, "ptr*", error, "uint")
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

        result := DllCall("chakra.dll\JsCreateRangeError", messageMarshal, message, "ptr*", error, "uint")
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

        result := DllCall("chakra.dll\JsCreateReferenceError", messageMarshal, message, "ptr*", error, "uint")
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

        result := DllCall("chakra.dll\JsCreateSyntaxError", messageMarshal, message, "ptr*", error, "uint")
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

        result := DllCall("chakra.dll\JsCreateTypeError", messageMarshal, message, "ptr*", error, "uint")
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

        result := DllCall("chakra.dll\JsCreateURIError", messageMarshal, message, "ptr*", error, "uint")
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
        result := DllCall("chakra.dll\JsGetAndClearException", "ptr*", exception, "uint")
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
     * @param {Integer} eventMask 
     * @param {Integer} context 
     * @returns {Integer} 
     */
    static JsStartProfiling(callback, eventMask, context) {
        result := DllCall("chakra.dll\JsStartProfiling", "ptr", callback, "int", eventMask, "uint", context, "uint")
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
     * @param {Pointer<IActiveScriptProfilerHeapEnum>} enumerator 
     * @returns {Integer} 
     */
    static JsEnumerateHeap(enumerator) {
        result := DllCall("chakra.dll\JsEnumerateHeap", "ptr*", enumerator, "uint")
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
