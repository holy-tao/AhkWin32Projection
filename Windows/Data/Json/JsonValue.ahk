#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IJsonValue.ahk
#Include ..\..\Foundation\IStringable.ahk
#Include .\IJsonValueStatics2.ahk
#Include .\IJsonValueStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Implements the [IJsonValue](ijsonvalue.md) interface which represents a JSON value.
  * 
  * A JsonValue object can represent the three primitive JSON value types of Boolean, Number and String, and can also represent the complex value types of Array and Object by providing ways to access them.
 * @remarks
 * A JsonValue object has overloaded constructors to instantiate a new object from a JSON String, Number or Boolean value and a default constructor that instantiates a JsonValue object with a [ValueType](ijsonvalue_valuetype.md) of **NULL**.
 * 
 * For an example of how these class methods are used to parse a number or string from a JSON string and convert it into a JsonValue object, see [Using JavaScript Object Notation (JSON)](/previous-versions/windows/apps/hh770289(v=win.10)).
 * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonvalue
 * @namespace Windows.Data.Json
 * @version WindowsRuntime 1.4
 */
class JsonValue extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IJsonValue

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IJsonValue.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [JsonValue](jsonvalue.md) with a **NULL** value.
     * @returns {JsonValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonvalue.createnullvalue
     */
    static CreateNullValue() {
        if (!JsonValue.HasProp("__IJsonValueStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Data.Json.JsonValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IJsonValueStatics2.IID)
            JsonValue.__IJsonValueStatics2 := IJsonValueStatics2(factoryPtr)
        }

        return JsonValue.__IJsonValueStatics2.CreateNullValue()
    }

    /**
     * Parses the specified JSON string into a [JsonValue](jsonvalue.md).
     * 
     * > [!NOTE]
     * > This method will throw an exception if the provided JSON string is not valid. Use of [JsonObject.TryParse](jsonobject_tryparse_1919547471.md) is a recommended alternative. A [TryParse](jsonvalue_tryparse_1449496227.md) call will return a boolean value to indicate success or failure and, if successful, the resultant [JsonValue](jsonvalue.md).
     * @remarks
     * This method may only be called when the [ValueType](ijsonvalue_valuetype.md) is **Null**. If the value contained in the specified JSON string is a String, a Number or a Boolean, the [ValueType](ijsonvalue_valuetype.md) will be updated and the actual value can then be accessed through the [GetString](ijsonvalue_getstring_1001279800.md), [GetNumber](ijsonvalue_getnumber_1143516409.md) or [GetBoolean](ijsonvalue_getboolean_1304335680.md) methods. If Parse fails due to an invalid JSON string or resource allocation errors, the [ValueType](ijsonvalue_valuetype.md) will not be changed.
     * 
     * When implemented on the subclass [JsonObject](jsonobject_jsonobject_1221375020.md), this method requires the specified input string to be a valid JSON object value. When implemented on the subclass [JsonArray](jsonarray_jsonarray_1221375020.md), this method requires the specified input string to be a valid JSON array value. The original object state will be overwritten when JsonObject(jsonobject_jsonobject_1221375020.md).Parse or JsonArray(jsonarray_jsonarray_1221375020.md).Parse succeeds. If Parse fails, the object state remains intact.
     * @param {HSTRING} input_ The specified JSON string.
     * @returns {JsonValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonvalue.parse
     */
    static Parse(input_) {
        if (!JsonValue.HasProp("__IJsonValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Data.Json.JsonValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IJsonValueStatics.IID)
            JsonValue.__IJsonValueStatics := IJsonValueStatics(factoryPtr)
        }

        return JsonValue.__IJsonValueStatics.Parse(input_)
    }

    /**
     * Parses the specified string into a [JsonValue](jsonvalue.md).
     * @param {HSTRING} input_ The specified string.
     * @param {Pointer<JsonValue>} result_ The new [JsonValue](jsonvalue.md) object.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonvalue.tryparse
     */
    static TryParse(input_, result_) {
        if (!JsonValue.HasProp("__IJsonValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Data.Json.JsonValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IJsonValueStatics.IID)
            JsonValue.__IJsonValueStatics := IJsonValueStatics(factoryPtr)
        }

        return JsonValue.__IJsonValueStatics.TryParse(input_, result_)
    }

    /**
     * Creates a [JsonValue](jsonvalue.md) from a Boolean.
     * @param {Boolean} input_ The value to store in the [JsonValue](jsonvalue.md).
     * @returns {JsonValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonvalue.createbooleanvalue
     */
    static CreateBooleanValue(input_) {
        if (!JsonValue.HasProp("__IJsonValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Data.Json.JsonValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IJsonValueStatics.IID)
            JsonValue.__IJsonValueStatics := IJsonValueStatics(factoryPtr)
        }

        return JsonValue.__IJsonValueStatics.CreateBooleanValue(input_)
    }

    /**
     * Creates a [JsonValue](jsonvalue.md) from a Number (**Double**).
     * @param {Float} input_ The Number to store in the [JsonValue](jsonvalue.md).
     * @returns {JsonValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonvalue.createnumbervalue
     */
    static CreateNumberValue(input_) {
        if (!JsonValue.HasProp("__IJsonValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Data.Json.JsonValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IJsonValueStatics.IID)
            JsonValue.__IJsonValueStatics := IJsonValueStatics(factoryPtr)
        }

        return JsonValue.__IJsonValueStatics.CreateNumberValue(input_)
    }

    /**
     * Creates the string for a [JsonValue](jsonvalue.md).
     * @param {HSTRING} input_ The string for the [JsonValue](jsonvalue.md).
     * @returns {JsonValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonvalue.createstringvalue
     */
    static CreateStringValue(input_) {
        if (!JsonValue.HasProp("__IJsonValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Data.Json.JsonValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IJsonValueStatics.IID)
            JsonValue.__IJsonValueStatics := IJsonValueStatics(factoryPtr)
        }

        return JsonValue.__IJsonValueStatics.CreateStringValue(input_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the type of the encapsulated JSON value. Possible types are defined by [JsonValueType](jsonvaluetype.md).
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonvalue.valuetype
     * @type {Integer} 
     */
    ValueType {
        get => this.get_ValueType()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ValueType() {
        if (!this.HasProp("__IJsonValue")) {
            if ((queryResult := this.QueryInterface(IJsonValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJsonValue := IJsonValue(outPtr)
        }

        return this.__IJsonValue.get_ValueType()
    }

    /**
     * Retrieves the JSON representation of the encapsulated value.
     * @remarks
     * If the [ValueType](ijsonvalue_valuetype.md) is **String**, then the returned string will be properly escaped and double quoted. This method is used for serializing the encapsulated value into a valid JSON format.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonvalue.stringify
     */
    Stringify() {
        if (!this.HasProp("__IJsonValue")) {
            if ((queryResult := this.QueryInterface(IJsonValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJsonValue := IJsonValue(outPtr)
        }

        return this.__IJsonValue.Stringify()
    }

    /**
     * Gets a [String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true) if the [ValueType](ijsonvalue_valuetype.md) of the encapsulated value is [String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true).
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonvalue.getstring
     */
    GetString() {
        if (!this.HasProp("__IJsonValue")) {
            if ((queryResult := this.QueryInterface(IJsonValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJsonValue := IJsonValue(outPtr)
        }

        return this.__IJsonValue.GetString()
    }

    /**
     * Gets the number (a [Double](/dotnet/api/system.double?view=dotnet-uwp-10.0&preserve-view=true)) if the [ValueType](ijsonvalue_valuetype.md) of the encapsulated value is **Number**.
     * @returns {Float} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonvalue.getnumber
     */
    GetNumber() {
        if (!this.HasProp("__IJsonValue")) {
            if ((queryResult := this.QueryInterface(IJsonValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJsonValue := IJsonValue(outPtr)
        }

        return this.__IJsonValue.GetNumber()
    }

    /**
     * Gets the [Boolean](/dotnet/api/system.boolean?view=dotnet-uwp-10.0&preserve-view=true) if the [ValueType](ijsonvalue_valuetype.md) of the encapsulated value is [Boolean](/dotnet/api/system.boolean?view=dotnet-uwp-10.0&preserve-view=true).
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonvalue.getboolean
     */
    GetBoolean() {
        if (!this.HasProp("__IJsonValue")) {
            if ((queryResult := this.QueryInterface(IJsonValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJsonValue := IJsonValue(outPtr)
        }

        return this.__IJsonValue.GetBoolean()
    }

    /**
     * Gets an array if the [ValueType](ijsonvalue_valuetype.md) of the encapsulated value is **Array**.
     * @returns {JsonArray} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonvalue.getarray
     */
    GetArray() {
        if (!this.HasProp("__IJsonValue")) {
            if ((queryResult := this.QueryInterface(IJsonValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJsonValue := IJsonValue(outPtr)
        }

        return this.__IJsonValue.GetArray()
    }

    /**
     * Gets a [JsonObject](jsonobject.md) if the [ValueType](ijsonvalue_valuetype.md) of the encapsulated value is **Object**.
     * @returns {JsonObject} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonvalue.getobject
     */
    GetObject() {
        if (!this.HasProp("__IJsonValue")) {
            if ((queryResult := this.QueryInterface(IJsonValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJsonValue := IJsonValue(outPtr)
        }

        return this.__IJsonValue.GetObject()
    }

    /**
     * Retrieves the JSON representation of the encapsulated value.
     * @remarks
     * If the [ValueType](ijsonvalue_valuetype.md) is **String**, then the returned string will be properly escaped and double quoted. This method is used for serializing the encapsulated value into a valid JSON format.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonvalue.tostring
     */
    ToString() {
        if (!this.HasProp("__IStringable")) {
            if ((queryResult := this.QueryInterface(IStringable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStringable := IStringable(outPtr)
        }

        return this.__IStringable.ToString()
    }

;@endregion Instance Methods
}
