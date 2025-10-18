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
     * @param {Pointer<IDebugApplication64>} debugApplication 
     * @param {Pointer<Void>} newContext 
     * @returns {Integer} 
     */
    static JsCreateContext(runtime, debugApplication, newContext) {
        result := DllCall("chakra.dll\JsCreateContext", "ptr", runtime, "ptr", debugApplication, "ptr", newContext, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<IDebugApplication64>} debugApplication 
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
     * @param {Pointer<Void>} runtime 
     * @returns {Integer} 
     */
    static JsCreateRuntime(attributes, runtimeVersion, threadService, runtime) {
        result := DllCall("chakra.dll\JsCreateRuntime", "int", attributes, "int", runtimeVersion, "ptr", threadService, "ptr", runtime, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} runtime 
     * @returns {Integer} 
     */
    static JsCollectGarbage(runtime) {
        result := DllCall("chakra.dll\JsCollectGarbage", "ptr", runtime, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} runtime 
     * @returns {Integer} 
     */
    static JsDisposeRuntime(runtime) {
        result := DllCall("chakra.dll\JsDisposeRuntime", "ptr", runtime, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} runtime 
     * @param {Pointer<UIntPtr>} memoryUsage 
     * @returns {Integer} 
     */
    static JsGetRuntimeMemoryUsage(runtime, memoryUsage) {
        result := DllCall("chakra.dll\JsGetRuntimeMemoryUsage", "ptr", runtime, "ptr*", memoryUsage, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} runtime 
     * @param {Pointer<UIntPtr>} memoryLimit 
     * @returns {Integer} 
     */
    static JsGetRuntimeMemoryLimit(runtime, memoryLimit) {
        result := DllCall("chakra.dll\JsGetRuntimeMemoryLimit", "ptr", runtime, "ptr*", memoryLimit, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} runtime 
     * @param {Pointer} memoryLimit 
     * @returns {Integer} 
     */
    static JsSetRuntimeMemoryLimit(runtime, memoryLimit) {
        result := DllCall("chakra.dll\JsSetRuntimeMemoryLimit", "ptr", runtime, "ptr", memoryLimit, "uint")
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
        result := DllCall("chakra.dll\JsSetRuntimeMemoryAllocationCallback", "ptr", runtime, "ptr", callbackState, "ptr", allocationCallback, "uint")
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
        result := DllCall("chakra.dll\JsSetRuntimeBeforeCollectCallback", "ptr", runtime, "ptr", callbackState, "ptr", beforeCollectCallback, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ref 
     * @param {Pointer<UInt32>} count 
     * @returns {Integer} 
     */
    static JsAddRef(ref, count) {
        result := DllCall("chakra.dll\JsAddRef", "ptr", ref, "uint*", count, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ref 
     * @param {Pointer<UInt32>} count 
     * @returns {Integer} 
     */
    static JsRelease(ref, count) {
        result := DllCall("chakra.dll\JsRelease", "ptr", ref, "uint*", count, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} currentContext 
     * @returns {Integer} 
     */
    static JsGetCurrentContext(currentContext) {
        result := DllCall("chakra.dll\JsGetCurrentContext", "ptr", currentContext, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} context 
     * @returns {Integer} 
     */
    static JsSetCurrentContext(context) {
        result := DllCall("chakra.dll\JsSetCurrentContext", "ptr", context, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} context 
     * @param {Pointer<Void>} runtime 
     * @returns {Integer} 
     */
    static JsGetRuntime(context, runtime) {
        result := DllCall("chakra.dll\JsGetRuntime", "ptr", context, "ptr", runtime, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} nextIdleTick 
     * @returns {Integer} 
     */
    static JsIdle(nextIdleTick) {
        result := DllCall("chakra.dll\JsIdle", "uint*", nextIdleTick, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} script 
     * @param {Pointer} sourceContext 
     * @param {PWSTR} sourceUrl 
     * @param {Pointer<Void>} result 
     * @returns {Integer} 
     */
    static JsParseScript(script, sourceContext, sourceUrl, result) {
        script := script is String ? StrPtr(script) : script
        sourceUrl := sourceUrl is String ? StrPtr(sourceUrl) : sourceUrl

        result := DllCall("chakra.dll\JsParseScript", "ptr", script, "ptr", sourceContext, "ptr", sourceUrl, "ptr", result, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} script 
     * @param {Pointer} sourceContext 
     * @param {PWSTR} sourceUrl 
     * @param {Pointer<Void>} result 
     * @returns {Integer} 
     */
    static JsRunScript(script, sourceContext, sourceUrl, result) {
        script := script is String ? StrPtr(script) : script
        sourceUrl := sourceUrl is String ? StrPtr(sourceUrl) : sourceUrl

        result := DllCall("chakra.dll\JsRunScript", "ptr", script, "ptr", sourceContext, "ptr", sourceUrl, "ptr", result, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} script 
     * @param {Pointer<Byte>} buffer 
     * @param {Pointer<UInt32>} bufferSize 
     * @returns {Integer} 
     */
    static JsSerializeScript(script, buffer, bufferSize) {
        script := script is String ? StrPtr(script) : script

        result := DllCall("chakra.dll\JsSerializeScript", "ptr", script, "char*", buffer, "uint*", bufferSize, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} script 
     * @param {Pointer<Byte>} buffer 
     * @param {Pointer} sourceContext 
     * @param {PWSTR} sourceUrl 
     * @param {Pointer<Void>} result 
     * @returns {Integer} 
     */
    static JsParseSerializedScript(script, buffer, sourceContext, sourceUrl, result) {
        script := script is String ? StrPtr(script) : script
        sourceUrl := sourceUrl is String ? StrPtr(sourceUrl) : sourceUrl

        result := DllCall("chakra.dll\JsParseSerializedScript", "ptr", script, "char*", buffer, "ptr", sourceContext, "ptr", sourceUrl, "ptr", result, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} script 
     * @param {Pointer<Byte>} buffer 
     * @param {Pointer} sourceContext 
     * @param {PWSTR} sourceUrl 
     * @param {Pointer<Void>} result 
     * @returns {Integer} 
     */
    static JsRunSerializedScript(script, buffer, sourceContext, sourceUrl, result) {
        script := script is String ? StrPtr(script) : script
        sourceUrl := sourceUrl is String ? StrPtr(sourceUrl) : sourceUrl

        result := DllCall("chakra.dll\JsRunSerializedScript", "ptr", script, "char*", buffer, "ptr", sourceContext, "ptr", sourceUrl, "ptr", result, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} name 
     * @param {Pointer<Void>} propertyId 
     * @returns {Integer} 
     */
    static JsGetPropertyIdFromName(name, propertyId) {
        name := name is String ? StrPtr(name) : name

        result := DllCall("chakra.dll\JsGetPropertyIdFromName", "ptr", name, "ptr", propertyId, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} propertyId 
     * @param {Pointer<UInt16>} name 
     * @returns {Integer} 
     */
    static JsGetPropertyNameFromId(propertyId, name) {
        result := DllCall("chakra.dll\JsGetPropertyNameFromId", "ptr", propertyId, "ushort*", name, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} undefinedValue 
     * @returns {Integer} 
     */
    static JsGetUndefinedValue(undefinedValue) {
        result := DllCall("chakra.dll\JsGetUndefinedValue", "ptr", undefinedValue, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} nullValue 
     * @returns {Integer} 
     */
    static JsGetNullValue(nullValue) {
        result := DllCall("chakra.dll\JsGetNullValue", "ptr", nullValue, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} trueValue 
     * @returns {Integer} 
     */
    static JsGetTrueValue(trueValue) {
        result := DllCall("chakra.dll\JsGetTrueValue", "ptr", trueValue, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} falseValue 
     * @returns {Integer} 
     */
    static JsGetFalseValue(falseValue) {
        result := DllCall("chakra.dll\JsGetFalseValue", "ptr", falseValue, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} value 
     * @param {Pointer<Void>} booleanValue 
     * @returns {Integer} 
     */
    static JsBoolToBoolean(value, booleanValue) {
        result := DllCall("chakra.dll\JsBoolToBoolean", "char", value, "ptr", booleanValue, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} value 
     * @param {Pointer<Boolean>} boolValue 
     * @returns {Integer} 
     */
    static JsBooleanToBool(value, boolValue) {
        result := DllCall("chakra.dll\JsBooleanToBool", "ptr", value, "int*", boolValue, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} value 
     * @param {Pointer<Void>} booleanValue 
     * @returns {Integer} 
     */
    static JsConvertValueToBoolean(value, booleanValue) {
        result := DllCall("chakra.dll\JsConvertValueToBoolean", "ptr", value, "ptr", booleanValue, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} value 
     * @param {Pointer<Int32>} type 
     * @returns {Integer} 
     */
    static JsGetValueType(value, type) {
        result := DllCall("chakra.dll\JsGetValueType", "ptr", value, "int*", type, "uint")
        return result
    }

    /**
     * 
     * @param {Float} doubleValue 
     * @param {Pointer<Void>} value 
     * @returns {Integer} 
     */
    static JsDoubleToNumber(doubleValue, value) {
        result := DllCall("chakra.dll\JsDoubleToNumber", "double", doubleValue, "ptr", value, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} intValue 
     * @param {Pointer<Void>} value 
     * @returns {Integer} 
     */
    static JsIntToNumber(intValue, value) {
        result := DllCall("chakra.dll\JsIntToNumber", "int", intValue, "ptr", value, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} value 
     * @param {Pointer<Double>} doubleValue 
     * @returns {Integer} 
     */
    static JsNumberToDouble(value, doubleValue) {
        result := DllCall("chakra.dll\JsNumberToDouble", "ptr", value, "double*", doubleValue, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} value 
     * @param {Pointer<Void>} numberValue 
     * @returns {Integer} 
     */
    static JsConvertValueToNumber(value, numberValue) {
        result := DllCall("chakra.dll\JsConvertValueToNumber", "ptr", value, "ptr", numberValue, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} stringValue 
     * @param {Pointer<Int32>} length 
     * @returns {Integer} 
     */
    static JsGetStringLength(stringValue, length) {
        result := DllCall("chakra.dll\JsGetStringLength", "ptr", stringValue, "int*", length, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} stringValue 
     * @param {Pointer} stringLength 
     * @param {Pointer<Void>} value 
     * @returns {Integer} 
     */
    static JsPointerToString(stringValue, stringLength, value) {
        stringValue := stringValue is String ? StrPtr(stringValue) : stringValue

        result := DllCall("chakra.dll\JsPointerToString", "ptr", stringValue, "ptr", stringLength, "ptr", value, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} value 
     * @param {Pointer<UInt16>} stringValue 
     * @param {Pointer<UIntPtr>} stringLength 
     * @returns {Integer} 
     */
    static JsStringToPointer(value, stringValue, stringLength) {
        result := DllCall("chakra.dll\JsStringToPointer", "ptr", value, "ushort*", stringValue, "ptr*", stringLength, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} value 
     * @param {Pointer<Void>} stringValue 
     * @returns {Integer} 
     */
    static JsConvertValueToString(value, stringValue) {
        result := DllCall("chakra.dll\JsConvertValueToString", "ptr", value, "ptr", stringValue, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} variant 
     * @param {Pointer<Void>} value 
     * @returns {Integer} 
     */
    static JsVariantToValue(variant, value) {
        result := DllCall("chakra.dll\JsVariantToValue", "ptr", variant, "ptr", value, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} object 
     * @param {Pointer<VARIANT>} variant 
     * @returns {Integer} 
     */
    static JsValueToVariant(object, variant) {
        result := DllCall("chakra.dll\JsValueToVariant", "ptr", object, "ptr", variant, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} globalObject 
     * @returns {Integer} 
     */
    static JsGetGlobalObject(globalObject) {
        result := DllCall("chakra.dll\JsGetGlobalObject", "ptr", globalObject, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} object 
     * @returns {Integer} 
     */
    static JsCreateObject(object) {
        result := DllCall("chakra.dll\JsCreateObject", "ptr", object, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} data 
     * @param {Pointer<JsFinalizeCallback>} finalizeCallback 
     * @param {Pointer<Void>} object 
     * @returns {Integer} 
     */
    static JsCreateExternalObject(data, finalizeCallback, object) {
        result := DllCall("chakra.dll\JsCreateExternalObject", "ptr", data, "ptr", finalizeCallback, "ptr", object, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} value 
     * @param {Pointer<Void>} object 
     * @returns {Integer} 
     */
    static JsConvertValueToObject(value, object) {
        result := DllCall("chakra.dll\JsConvertValueToObject", "ptr", value, "ptr", object, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} object 
     * @param {Pointer<Void>} prototypeObject 
     * @returns {Integer} 
     */
    static JsGetPrototype(object, prototypeObject) {
        result := DllCall("chakra.dll\JsGetPrototype", "ptr", object, "ptr", prototypeObject, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} object 
     * @param {Pointer<Void>} prototypeObject 
     * @returns {Integer} 
     */
    static JsSetPrototype(object, prototypeObject) {
        result := DllCall("chakra.dll\JsSetPrototype", "ptr", object, "ptr", prototypeObject, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} object 
     * @param {Pointer<Boolean>} value 
     * @returns {Integer} 
     */
    static JsGetExtensionAllowed(object, value) {
        result := DllCall("chakra.dll\JsGetExtensionAllowed", "ptr", object, "int*", value, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} object 
     * @returns {Integer} 
     */
    static JsPreventExtension(object) {
        result := DllCall("chakra.dll\JsPreventExtension", "ptr", object, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} object 
     * @param {Pointer<Void>} propertyId 
     * @param {Pointer<Void>} value 
     * @returns {Integer} 
     */
    static JsGetProperty(object, propertyId, value) {
        result := DllCall("chakra.dll\JsGetProperty", "ptr", object, "ptr", propertyId, "ptr", value, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} object 
     * @param {Pointer<Void>} propertyId 
     * @param {Pointer<Void>} propertyDescriptor 
     * @returns {Integer} 
     */
    static JsGetOwnPropertyDescriptor(object, propertyId, propertyDescriptor) {
        result := DllCall("chakra.dll\JsGetOwnPropertyDescriptor", "ptr", object, "ptr", propertyId, "ptr", propertyDescriptor, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} object 
     * @param {Pointer<Void>} propertyNames 
     * @returns {Integer} 
     */
    static JsGetOwnPropertyNames(object, propertyNames) {
        result := DllCall("chakra.dll\JsGetOwnPropertyNames", "ptr", object, "ptr", propertyNames, "uint")
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
        result := DllCall("chakra.dll\JsSetProperty", "ptr", object, "ptr", propertyId, "ptr", value, "char", useStrictRules, "uint")
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
        result := DllCall("chakra.dll\JsHasProperty", "ptr", object, "ptr", propertyId, "int*", hasProperty, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} object 
     * @param {Pointer<Void>} propertyId 
     * @param {Integer} useStrictRules 
     * @param {Pointer<Void>} result 
     * @returns {Integer} 
     */
    static JsDeleteProperty(object, propertyId, useStrictRules, result) {
        result := DllCall("chakra.dll\JsDeleteProperty", "ptr", object, "ptr", propertyId, "char", useStrictRules, "ptr", result, "uint")
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
        result := DllCall("chakra.dll\JsDefineProperty", "ptr", object, "ptr", propertyId, "ptr", propertyDescriptor, "int*", result, "uint")
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
        result := DllCall("chakra.dll\JsHasIndexedProperty", "ptr", object, "ptr", index, "int*", result, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} object 
     * @param {Pointer<Void>} index 
     * @param {Pointer<Void>} result 
     * @returns {Integer} 
     */
    static JsGetIndexedProperty(object, index, result) {
        result := DllCall("chakra.dll\JsGetIndexedProperty", "ptr", object, "ptr", index, "ptr", result, "uint")
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
        result := DllCall("chakra.dll\JsSetIndexedProperty", "ptr", object, "ptr", index, "ptr", value, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} object 
     * @param {Pointer<Void>} index 
     * @returns {Integer} 
     */
    static JsDeleteIndexedProperty(object, index) {
        result := DllCall("chakra.dll\JsDeleteIndexedProperty", "ptr", object, "ptr", index, "uint")
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
        result := DllCall("chakra.dll\JsEquals", "ptr", object1, "ptr", object2, "int*", result, "uint")
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
        result := DllCall("chakra.dll\JsStrictEquals", "ptr", object1, "ptr", object2, "int*", result, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} object 
     * @param {Pointer<Boolean>} value 
     * @returns {Integer} 
     */
    static JsHasExternalData(object, value) {
        result := DllCall("chakra.dll\JsHasExternalData", "ptr", object, "int*", value, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} object 
     * @param {Pointer<Void>} externalData 
     * @returns {Integer} 
     */
    static JsGetExternalData(object, externalData) {
        result := DllCall("chakra.dll\JsGetExternalData", "ptr", object, "ptr", externalData, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} object 
     * @param {Pointer<Void>} externalData 
     * @returns {Integer} 
     */
    static JsSetExternalData(object, externalData) {
        result := DllCall("chakra.dll\JsSetExternalData", "ptr", object, "ptr", externalData, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} length 
     * @param {Pointer<Void>} result 
     * @returns {Integer} 
     */
    static JsCreateArray(length, result) {
        result := DllCall("chakra.dll\JsCreateArray", "uint", length, "ptr", result, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} function 
     * @param {Pointer<Void>} arguments 
     * @param {Integer} argumentCount 
     * @param {Pointer<Void>} result 
     * @returns {Integer} 
     */
    static JsCallFunction(function, arguments, argumentCount, result) {
        result := DllCall("chakra.dll\JsCallFunction", "ptr", function, "ptr", arguments, "ushort", argumentCount, "ptr", result, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} function 
     * @param {Pointer<Void>} arguments 
     * @param {Integer} argumentCount 
     * @param {Pointer<Void>} result 
     * @returns {Integer} 
     */
    static JsConstructObject(function, arguments, argumentCount, result) {
        result := DllCall("chakra.dll\JsConstructObject", "ptr", function, "ptr", arguments, "ushort", argumentCount, "ptr", result, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<JsNativeFunction>} nativeFunction 
     * @param {Pointer<Void>} callbackState 
     * @param {Pointer<Void>} function 
     * @returns {Integer} 
     */
    static JsCreateFunction(nativeFunction, callbackState, function) {
        result := DllCall("chakra.dll\JsCreateFunction", "ptr", nativeFunction, "ptr", callbackState, "ptr", function, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} message 
     * @param {Pointer<Void>} error 
     * @returns {Integer} 
     */
    static JsCreateError(message, error) {
        result := DllCall("chakra.dll\JsCreateError", "ptr", message, "ptr", error, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} message 
     * @param {Pointer<Void>} error 
     * @returns {Integer} 
     */
    static JsCreateRangeError(message, error) {
        result := DllCall("chakra.dll\JsCreateRangeError", "ptr", message, "ptr", error, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} message 
     * @param {Pointer<Void>} error 
     * @returns {Integer} 
     */
    static JsCreateReferenceError(message, error) {
        result := DllCall("chakra.dll\JsCreateReferenceError", "ptr", message, "ptr", error, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} message 
     * @param {Pointer<Void>} error 
     * @returns {Integer} 
     */
    static JsCreateSyntaxError(message, error) {
        result := DllCall("chakra.dll\JsCreateSyntaxError", "ptr", message, "ptr", error, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} message 
     * @param {Pointer<Void>} error 
     * @returns {Integer} 
     */
    static JsCreateTypeError(message, error) {
        result := DllCall("chakra.dll\JsCreateTypeError", "ptr", message, "ptr", error, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} message 
     * @param {Pointer<Void>} error 
     * @returns {Integer} 
     */
    static JsCreateURIError(message, error) {
        result := DllCall("chakra.dll\JsCreateURIError", "ptr", message, "ptr", error, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Boolean>} hasException 
     * @returns {Integer} 
     */
    static JsHasException(hasException) {
        result := DllCall("chakra.dll\JsHasException", "int*", hasException, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} exception 
     * @returns {Integer} 
     */
    static JsGetAndClearException(exception) {
        result := DllCall("chakra.dll\JsGetAndClearException", "ptr", exception, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} exception 
     * @returns {Integer} 
     */
    static JsSetException(exception) {
        result := DllCall("chakra.dll\JsSetException", "ptr", exception, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} runtime 
     * @returns {Integer} 
     */
    static JsDisableRuntimeExecution(runtime) {
        result := DllCall("chakra.dll\JsDisableRuntimeExecution", "ptr", runtime, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} runtime 
     * @returns {Integer} 
     */
    static JsEnableRuntimeExecution(runtime) {
        result := DllCall("chakra.dll\JsEnableRuntimeExecution", "ptr", runtime, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} runtime 
     * @param {Pointer<Boolean>} isDisabled 
     * @returns {Integer} 
     */
    static JsIsRuntimeExecutionDisabled(runtime, isDisabled) {
        result := DllCall("chakra.dll\JsIsRuntimeExecutionDisabled", "ptr", runtime, "int*", isDisabled, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<IActiveScriptProfilerCallback>} callback 
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
        result := DllCall("chakra.dll\JsEnumerateHeap", "ptr", enumerator, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Boolean>} isEnumeratingHeap 
     * @returns {Integer} 
     */
    static JsIsEnumeratingHeap(isEnumeratingHeap) {
        result := DllCall("chakra.dll\JsIsEnumeratingHeap", "int*", isEnumeratingHeap, "uint")
        return result
    }

;@endregion Methods
}
