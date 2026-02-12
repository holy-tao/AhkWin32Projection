#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\IJsonValue.ahk
#Include ..\..\Foundation\Collections\IKeyValuePair.ahk
#Include .\IJsonObject.ahk
#Include ..\..\Foundation\Collections\IMap.ahk
#Include ..\..\Foundation\Collections\IIterable.ahk
#Include .\IJsonObjectWithDefaultValues.ahk
#Include ..\..\Foundation\IStringable.ahk
#Include .\IJsonObjectStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a JSON object containing a collection of name and [JsonValue](jsonvalue.md) pairs.
  * 
  * JsonObject is an activatable class that implements [JsonValue](jsonvalue.md) and the [IMap<String,IJsonValue>](../windows.foundation.collections/imap_2.md) interface such that its name/value pairs can be manipulated like a dictionary. When there are values with duplicated names, the last name/value pair will be stored.
 * @remarks
 * For an example of how these class methods are used to parse an object from a JSON string and convert it into a JsonObject object, update the name/value pairs the object contains, and then serialize the updated JsonObject object as a JSON string, see [Using JavaScript Object Notation (JSON)](/previous-versions/windows/apps/hh770289(v=win.10)).
 * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonobject
 * @namespace Windows.Data.Json
 * @version WindowsRuntime 1.4
 */
class JsonObject extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IJsonObject

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IJsonObject.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Parses the specified JSON string that represents a [JsonObject](jsonobject.md) into a JSON value.
     * 
     * > [!NOTE]
     * > This will throw an exception if the provided JSON string is not valid. Use of [JsonObject.TryParse](jsonobject_tryparse_1919547471.md) is a recommended alternative. A [TryParse](jsonobject_tryparse_1919547471.md) call will return a boolean value to indicate success or failure and, if successful, the resultant [JsonObject](jsonobject.md).
     * @remarks
     * This method may only be called when the [ValueType](ijsonvalue_valuetype.md) is **Null**. If the value contained in the specified JSON string is a String, a Number or a Boolean, the [ValueType](ijsonvalue_valuetype.md) will be updated and the actual value can then be accessed through the [GetString](ijsonvalue_getstring_1001279800.md), [GetNumber](ijsonvalue_getnumber_1143516409.md) or [GetBoolean](ijsonvalue_getboolean_1304335680.md) methods. If [Parse](jsonvalue_parse_705027695.md) fails due to an invalid JSON string or resource allocation errors, the [ValueType](ijsonvalue_valuetype.md) will not be changed.
     * 
     * When implemented on the subclass [JsonObject](jsonobject_jsonobject_1221375020.md), this method requires the specified input string to be a valid JSON object value. When implemented on the subclass [JsonArray](jsonarray_jsonarray_1221375020.md), this method requires the specified input string to be a valid JSON array value. The original object state will be overwritten when [JsonObject](jsonobject_jsonobject_1221375020.md).[Parse](jsonvalue_parse_705027695.md) or [JsonArray](jsonarray_jsonarray_1221375020.md).[Parse](jsonvalue_parse_705027695.md) succeeds. If [Parse](jsonvalue_parse_705027695.md) fails, the object state remains intact.
     * @param {HSTRING} input_ The specified JSON string.
     * @returns {JsonObject} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonobject.parse
     */
    static Parse(input_) {
        if (!JsonObject.HasProp("__IJsonObjectStatics")) {
            activatableClassId := HSTRING.Create("Windows.Data.Json.JsonObject")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IJsonObjectStatics.IID)
            JsonObject.__IJsonObjectStatics := IJsonObjectStatics(factoryPtr)
        }

        return JsonObject.__IJsonObjectStatics.Parse(input_)
    }

    /**
     * Parses the specified string that represents a JSON object into a [JsonObject](jsonobject.md).
     * @param {HSTRING} input_ The specified JSON string.
     * @param {Pointer<JsonObject>} result_ The resultant [JsonObject](jsonobject.md).
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonobject.tryparse
     */
    static TryParse(input_, result_) {
        if (!JsonObject.HasProp("__IJsonObjectStatics")) {
            activatableClassId := HSTRING.Create("Windows.Data.Json.JsonObject")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IJsonObjectStatics.IID)
            JsonObject.__IJsonObjectStatics := IJsonObjectStatics(factoryPtr)
        }

        return JsonObject.__IJsonObjectStatics.TryParse(input_, result_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the type of the encapsulated JSON value. Possible types are defined by [JsonValueType](jsonvaluetype.md).
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonobject.valuetype
     * @type {Integer} 
     */
    ValueType {
        get => this.get_ValueType()
    }

    /**
     * Gets the size (count) of the collection.
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonobject.size
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
    }

    __Item[key] {
        get => this.Lookup(key)
        set => this.Insert(key, value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of a [JsonObject](jsonobject.md) that represents a JSON object containing a collection of name and [JsonValue](jsonvalue.md) pairs.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Data.Json.JsonObject")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Gets the specified [JsonValue](jsonvalue.md) value, or the provided default value if no such named value is found.
     * @param {HSTRING} name The name.
     * @returns {JsonValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonobject.getnamedvalue
     */
    GetNamedValue(name) {
        if (!this.HasProp("__IJsonObject")) {
            if ((queryResult := this.QueryInterface(IJsonObject.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJsonObject := IJsonObject(outPtr)
        }

        return this.__IJsonObject.GetNamedValue(name)
    }

    /**
     * Sets the value of the first [JsonValue](jsonvalue.md) object with the specified name to the specified value. If no such object is found, a new name and [JsonValue](jsonvalue.md) pair is inserted into the JSON object.
     * @remarks
     * If `value` is `null`, then any existing value with the specified name is removed.
     * @param {HSTRING} name The specified name.
     * @param {IJsonValue} value The specified value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonobject.setnamedvalue
     */
    SetNamedValue(name, value) {
        if (!this.HasProp("__IJsonObject")) {
            if ((queryResult := this.QueryInterface(IJsonObject.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJsonObject := IJsonObject(outPtr)
        }

        return this.__IJsonObject.SetNamedValue(name, value)
    }

    /**
     * Gets the [JsonObject](jsonobject.md) value with the specified name, or the provided default value if no such named value is found.
     * @param {HSTRING} name The name.
     * @returns {JsonObject} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonobject.getnamedobject
     */
    GetNamedObject(name) {
        if (!this.HasProp("__IJsonObject")) {
            if ((queryResult := this.QueryInterface(IJsonObject.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJsonObject := IJsonObject(outPtr)
        }

        return this.__IJsonObject.GetNamedObject(name)
    }

    /**
     * Gets the [JsonArray](jsonarray_jsonarray_1221375020.md) value with the specified name, or the provided default value if no such named value is found.
     * @param {HSTRING} name The name.
     * @returns {JsonArray} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonobject.getnamedarray
     */
    GetNamedArray(name) {
        if (!this.HasProp("__IJsonObject")) {
            if ((queryResult := this.QueryInterface(IJsonObject.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJsonObject := IJsonObject(outPtr)
        }

        return this.__IJsonObject.GetNamedArray(name)
    }

    /**
     * Gets the [String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true) value with the specified name, or the provided default value if no such named value is found.
     * @param {HSTRING} name The name.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonobject.getnamedstring
     */
    GetNamedString(name) {
        if (!this.HasProp("__IJsonObject")) {
            if ((queryResult := this.QueryInterface(IJsonObject.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJsonObject := IJsonObject(outPtr)
        }

        return this.__IJsonObject.GetNamedString(name)
    }

    /**
     * Gets the number value (a [Double](/dotnet/api/system.double?view=dotnet-uwp-10.0&preserve-view=true)) with the specified name, or the provided default value if no such named value is found.
     * @param {HSTRING} name The name.
     * @returns {Float} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonobject.getnamednumber
     */
    GetNamedNumber(name) {
        if (!this.HasProp("__IJsonObject")) {
            if ((queryResult := this.QueryInterface(IJsonObject.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJsonObject := IJsonObject(outPtr)
        }

        return this.__IJsonObject.GetNamedNumber(name)
    }

    /**
     * Gets the [Boolean](/dotnet/api/system.boolean?view=dotnet-uwp-10.0&preserve-view=true) value with the specified name, or the provided default value if no such named value is found.
     * @param {HSTRING} name The name.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonobject.getnamedboolean
     */
    GetNamedBoolean(name) {
        if (!this.HasProp("__IJsonObject")) {
            if ((queryResult := this.QueryInterface(IJsonObject.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJsonObject := IJsonObject(outPtr)
        }

        return this.__IJsonObject.GetNamedBoolean(name)
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
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonobject.stringify
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
     * Gets the [String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true) if the [ValueType](ijsonvalue_valuetype.md) of the encapsulated value is [String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true).
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonobject.getstring
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
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonobject.getnumber
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
     * Gets a [Boolean](/dotnet/api/system.boolean?view=dotnet-uwp-10.0&preserve-view=true) if the [ValueType](ijsonvalue_valuetype.md) of the encapsulated value is [Boolean](/dotnet/api/system.boolean?view=dotnet-uwp-10.0&preserve-view=true).
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonobject.getboolean
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
     * Returns a [JsonArray](jsonarray.md) if the [ValueType](ijsonvalue_valuetype.md) of the encapsulated value is **Array**.
     * @returns {JsonArray} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonobject.getarray
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
     * Gets the [JsonObject](jsonobject.md) if the [ValueType](ijsonvalue_valuetype.md) of the encapsulated value is **Object**.
     * @returns {JsonObject} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonobject.getobject
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
     * Gets the JSON value associated with the supplied key, if an entry with that key exists.
     * @param {Generic} key The requested key.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonobject.lookup
     */
    Lookup(key) {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{c9d9a725-786b-5113-b4b7-9b61764c220b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), IJsonValue, outPtr)
        }

        return this.__IMap.Lookup(key)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{c9d9a725-786b-5113-b4b7-9b61764c220b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), IJsonValue, outPtr)
        }

        return this.__IMap.get_Size()
    }

    /**
     * Indicates whether the [JsonObject](jsonobject.md) has an entry with the requested key.
     * @remarks
     * In C# and other languages that use .NET language projection, use the [ContainsKey](/dotnet/api/system.collections.generic.idictionary-2.containskey?view=dotnet-uwp-10.0&preserve-view=true) method instead of the **HasKey** method. The [JsonObject](jsonobject.md) class inherits **HasKey** from the [IMap<String,IJsonValue>](../windows.foundation.collections/imap_2.md) interface. However, this interface appears to .NET code as [IDictionary&lt;TKey,TValue&gt;](/dotnet/api/system.collections.generic.idictionary-2?view=dotnet-uwp-10.0&preserve-view=true) due to .NET language projection. Therefore, .NET code must use the **ContainsKey** method of the **IDictionary<TKey,TValue>** interface instead of the **HasKey** method of the **IMap<String,IJsonValue>** interface.
     * @param {Generic} key The requested key.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonobject.haskey
     */
    HasKey(key) {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{c9d9a725-786b-5113-b4b7-9b61764c220b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), IJsonValue, outPtr)
        }

        return this.__IMap.HasKey(key)
    }

    /**
     * Gets a [JsonObject](jsonobject.md) view.
     * @returns {IMapView<Generic, Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonobject.getview
     */
    GetView() {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{c9d9a725-786b-5113-b4b7-9b61764c220b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), IJsonValue, outPtr)
        }

        return this.__IMap.GetView()
    }

    /**
     * Adds a new entry to the [JsonObject](jsonobject.md).
     * @param {Generic} key The key to insert.
     * @param {Generic} value The [IJsonValue](ijsonvalue.md) to insert.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonobject.insert
     */
    Insert(key, value) {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{c9d9a725-786b-5113-b4b7-9b61764c220b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), IJsonValue, outPtr)
        }

        return this.__IMap.Insert(key, value)
    }

    /**
     * Removes a specific item from the [JsonObject](jsonobject.md).
     * @param {Generic} key The key of the item to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonobject.remove
     */
    Remove(key) {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{c9d9a725-786b-5113-b4b7-9b61764c220b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), IJsonValue, outPtr)
        }

        return this.__IMap.Remove(key)
    }

    /**
     * Removes all items from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonobject.clear
     */
    Clear() {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{c9d9a725-786b-5113-b4b7-9b61764c220b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), IJsonValue, outPtr)
        }

        return this.__IMap.Clear()
    }

    /**
     * Returns the iterator for iteration over the key/value pairs in the [JsonObject](jsonobject.md).
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonobject.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{dfabb6e1-0411-5a8f-aa87-354e7110f099}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(IKeyValuePair.Call.Bind(IKeyValuePair, (ptr) => HSTRING({ Value: ptr }), IJsonValue), outPtr)
        }

        return this.__IIterable.First()
    }

    /**
     * Gets the [JsonValue](jsonvalue.md) value with the specified name.
     * @remarks
     * This method should always used with a try/catch block because it throws an exception if the name found is not a [JsonValue](jsonvalue.md) type or the name is not found.
     * @param {HSTRING} name The name.
     * @param {JsonValue} defaultValue 
     * @returns {JsonValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonobject.getnamedvalue
     */
    GetNamedValueOrDefault(name, defaultValue) {
        if (!this.HasProp("__IJsonObjectWithDefaultValues")) {
            if ((queryResult := this.QueryInterface(IJsonObjectWithDefaultValues.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJsonObjectWithDefaultValues := IJsonObjectWithDefaultValues(outPtr)
        }

        return this.__IJsonObjectWithDefaultValues.GetNamedValueOrDefault(name, defaultValue)
    }

    /**
     * Gets the [JsonObject](jsonobject.md) value with the specified name.
     * @remarks
     * This method should always used with a try/catch block because it throws an exception if the name found is not a [JsonObject](jsonobject.md) type or the name is not found.
     * @param {HSTRING} name The name.
     * @param {JsonObject} defaultValue 
     * @returns {JsonObject} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonobject.getnamedobject
     */
    GetNamedObjectOrDefault(name, defaultValue) {
        if (!this.HasProp("__IJsonObjectWithDefaultValues")) {
            if ((queryResult := this.QueryInterface(IJsonObjectWithDefaultValues.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJsonObjectWithDefaultValues := IJsonObjectWithDefaultValues(outPtr)
        }

        return this.__IJsonObjectWithDefaultValues.GetNamedObjectOrDefault(name, defaultValue)
    }

    /**
     * Gets the [String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true) value with the specified name.
     * @remarks
     * This method should always used with a try/catch block because it throws an exception if the name found is not a [String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true) type or the name is not found.
     * @param {HSTRING} name The name.
     * @param {HSTRING} defaultValue 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonobject.getnamedstring
     */
    GetNamedStringOrDefault(name, defaultValue) {
        if (!this.HasProp("__IJsonObjectWithDefaultValues")) {
            if ((queryResult := this.QueryInterface(IJsonObjectWithDefaultValues.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJsonObjectWithDefaultValues := IJsonObjectWithDefaultValues(outPtr)
        }

        return this.__IJsonObjectWithDefaultValues.GetNamedStringOrDefault(name, defaultValue)
    }

    /**
     * Gets the [JsonArray](jsonarray.md) value with the specified name.
     * @remarks
     * This method should always used with a try/catch block because it throws an exception if the name found is not a [JsonArray](jsonarray.md) type or the name is not found.
     * @param {HSTRING} name The name.
     * @param {JsonArray} defaultValue 
     * @returns {JsonArray} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonobject.getnamedarray
     */
    GetNamedArrayOrDefault(name, defaultValue) {
        if (!this.HasProp("__IJsonObjectWithDefaultValues")) {
            if ((queryResult := this.QueryInterface(IJsonObjectWithDefaultValues.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJsonObjectWithDefaultValues := IJsonObjectWithDefaultValues(outPtr)
        }

        return this.__IJsonObjectWithDefaultValues.GetNamedArrayOrDefault(name, defaultValue)
    }

    /**
     * Gets the number value (a [Double](/dotnet/api/system.double?view=dotnet-uwp-10.0&preserve-view=true)) with the specified name.
     * @remarks
     * This method should always used with a try/catch block because it throws an exception if the name found is not a [Double](/dotnet/api/system.double?view=dotnet-uwp-10.0&preserve-view=true) type or the name is not found.
     * @param {HSTRING} name The name.
     * @param {Float} defaultValue 
     * @returns {Float} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonobject.getnamednumber
     */
    GetNamedNumberOrDefault(name, defaultValue) {
        if (!this.HasProp("__IJsonObjectWithDefaultValues")) {
            if ((queryResult := this.QueryInterface(IJsonObjectWithDefaultValues.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJsonObjectWithDefaultValues := IJsonObjectWithDefaultValues(outPtr)
        }

        return this.__IJsonObjectWithDefaultValues.GetNamedNumberOrDefault(name, defaultValue)
    }

    /**
     * Gets the [Boolean](/dotnet/api/system.boolean?view=dotnet-uwp-10.0&preserve-view=true) value with the specified name.
     * @remarks
     * This method should always used with a try/catch block because it throws an exception if the name found is not a [Boolean](/dotnet/api/system.boolean?view=dotnet-uwp-10.0&preserve-view=true) type or the name is not found.
     * @param {HSTRING} name The name.
     * @param {Boolean} defaultValue 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonobject.getnamedboolean
     */
    GetNamedBooleanOrDefault(name, defaultValue) {
        if (!this.HasProp("__IJsonObjectWithDefaultValues")) {
            if ((queryResult := this.QueryInterface(IJsonObjectWithDefaultValues.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJsonObjectWithDefaultValues := IJsonObjectWithDefaultValues(outPtr)
        }

        return this.__IJsonObjectWithDefaultValues.GetNamedBooleanOrDefault(name, defaultValue)
    }

    /**
     * Retrieves the JSON representation of the encapsulated value.
     * @remarks
     * If the [ValueType](ijsonvalue_valuetype.md) is **String**, then the returned string will be properly escaped and double quoted. This method is used for serializing the encapsulated value into a valid JSON format.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonobject.tostring
     */
    ToString() {
        if (!this.HasProp("__IStringable")) {
            if ((queryResult := this.QueryInterface(IStringable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStringable := IStringable(outPtr)
        }

        return this.__IStringable.ToString()
    }

    __Enum(numVars) {
        if(numVars != 1)
            throw ValueError(this.GetRuntimeClassName().ToString() " only supports iteration with 1 variable", -1, numVars)
    
        return this.First()
    }

;@endregion Instance Methods
}
