#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\IJsonValue.ahk
#Include .\IJsonArray.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\Foundation\IStringable.ahk
#Include .\IJsonArrayStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a JSON array.
  * 
  * [JsonArray](jsonarray_jsonarray_1221375020.md) inherits the [IVector(IJsonValue)](../windows.foundation.collections/ivector_1.md) and [IIterable(IJsonValue)](../windows.foundation.collections/iiterable_1.md) interfaces, which provide methods to iterate through the elements in the array and update its contents.
 * @remarks
 * For an example of how these class methods are used to parse an array from a JSON string and convert it into a JsonArray object, update the values the array contains, and then serialize the updated JsonArray object as a JSON string, see [Using JavaScript Object Notation (JSON)](/previous-versions/windows/apps/hh770289(v=win.10)).
 * 
 * <!--Begin NET note for IEnumerable support-->
 * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonarray
 * @namespace Windows.Data.Json
 * @version WindowsRuntime 1.4
 */
class JsonArray extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IJsonArray

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IJsonArray.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Parses the specified JSON string that represents a [JsonArray](jsonarray.md).
     * 
     * > [!NOTE]
     * > This method will throw an exception if the provided JSON string is not valid. Use of [JsonObject.TryParse](jsonobject_tryparse_1919547471.md) is a recommended alternative. A [TryParse](jsonarray_tryparse_1149006451.md) call will return a boolean value to indicate success or failure and, if successful, the resultant [JsonArray](jsonarray.md).
     * @remarks
     * This method may only be called when the [ValueType](ijsonvalue_valuetype.md) is **Null**. If the value contained in the specified JSON string is a String, a Number or a Boolean, the [ValueType](ijsonvalue_valuetype.md) will be updated and the actual value can then be accessed through the [GetString](ijsonvalue_getstring_1001279800.md), [GetNumber](ijsonvalue_getnumber_1143516409.md) or [GetBoolean](ijsonvalue_getboolean_1304335680.md) methods. If [Parse](jsonvalue_parse_705027695.md) fails due to an invalid JSON string or resource allocation errors, the [ValueType](ijsonvalue_valuetype.md) will not be changed.
     * 
     * When implemented on the subclass [JsonObject](jsonobject_jsonobject_1221375020.md), this method requires the specified input string to be a valid JSON object value. When implemented on the subclass [JsonArray](jsonarray_jsonarray_1221375020.md), this method requires the specified input string to be a valid JSON array value. The original object state will be overwritten when [JsonObject](jsonobject_jsonobject_1221375020.md).[Parse](jsonvalue_parse_705027695.md) or [JsonArray](jsonarray_jsonarray_1221375020.md).[Parse](jsonvalue_parse_705027695.md) succeeds. If [Parse](jsonvalue_parse_705027695.md) fails, the object state remains intact.
     * @param {HSTRING} input_ The specified JSON string.
     * @returns {JsonArray} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonarray.parse
     */
    static Parse(input_) {
        if (!JsonArray.HasProp("__IJsonArrayStatics")) {
            activatableClassId := HSTRING.Create("Windows.Data.Json.JsonArray")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IJsonArrayStatics.IID)
            JsonArray.__IJsonArrayStatics := IJsonArrayStatics(factoryPtr)
        }

        return JsonArray.__IJsonArrayStatics.Parse(input_)
    }

    /**
     * Parses the provided string into a [JsonArray](jsonarray.md).
     * @param {HSTRING} input_ The specified string.
     * @param {Pointer<JsonArray>} result_ The new [JsonArray](jsonarray.md) object.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonarray.tryparse
     */
    static TryParse(input_, result_) {
        if (!JsonArray.HasProp("__IJsonArrayStatics")) {
            activatableClassId := HSTRING.Create("Windows.Data.Json.JsonArray")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IJsonArrayStatics.IID)
            JsonArray.__IJsonArrayStatics := IJsonArrayStatics(factoryPtr)
        }

        return JsonArray.__IJsonArrayStatics.TryParse(input_, result_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the type of the values within the array. Possible types are defined by [JsonValueType](jsonvaluetype.md).
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonarray.valuetype
     * @type {Integer} 
     */
    ValueType {
        get => this.get_ValueType()
    }

    /**
     * Gets the size (count) of the array.
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonarray.size
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
    }

    __Item[index] {
        get => this.GetAt(index)
        set => this.SetAt(index, value) 
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new [JsonArray](jsonarray.md) object that represents a JSON array.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Data.Json.JsonArray")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Gets the [JsonObject](jsonobject.md) at the specified index if the [ValueType](ijsonvalue_valuetype.md) of the encapsulated value is **Object**.
     * @param {Integer} index The specified index.
     * @returns {JsonObject} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonarray.getobjectat
     */
    GetObjectAt(index) {
        if (!this.HasProp("__IJsonArray")) {
            if ((queryResult := this.QueryInterface(IJsonArray.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJsonArray := IJsonArray(outPtr)
        }

        return this.__IJsonArray.GetObjectAt(index)
    }

    /**
     * Gets the [JsonArray](jsonarray.md) at the specified index if the [ValueType](ijsonvalue_valuetype.md) of the encapsulated value is **Array** .
     * @param {Integer} index The specified index.
     * @returns {JsonArray} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonarray.getarrayat
     */
    GetArrayAt(index) {
        if (!this.HasProp("__IJsonArray")) {
            if ((queryResult := this.QueryInterface(IJsonArray.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJsonArray := IJsonArray(outPtr)
        }

        return this.__IJsonArray.GetArrayAt(index)
    }

    /**
     * Gets the [String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true) at the specified index if the [ValueType](ijsonvalue_valuetype.md) of the encapsulated value is **String**.
     * @param {Integer} index The specified index.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonarray.getstringat
     */
    GetStringAt(index) {
        if (!this.HasProp("__IJsonArray")) {
            if ((queryResult := this.QueryInterface(IJsonArray.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJsonArray := IJsonArray(outPtr)
        }

        return this.__IJsonArray.GetStringAt(index)
    }

    /**
     * Gets the number (a [Double](/dotnet/api/system.double?view=dotnet-uwp-10.0&preserve-view=true)) at the specified index if the [ValueType](ijsonvalue_valuetype.md) of the value at that index is **Number**.
     * @param {Integer} index The specified index.
     * @returns {Float} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonarray.getnumberat
     */
    GetNumberAt(index) {
        if (!this.HasProp("__IJsonArray")) {
            if ((queryResult := this.QueryInterface(IJsonArray.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJsonArray := IJsonArray(outPtr)
        }

        return this.__IJsonArray.GetNumberAt(index)
    }

    /**
     * Gets the [Boolean](/dotnet/api/system.boolean?view=dotnet-uwp-10.0&preserve-view=true) value at the specified index if the [ValueType](ijsonvalue_valuetype.md) of the value at that index is **Boolean**.
     * @param {Integer} index The specified index.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonarray.getbooleanat
     */
    GetBooleanAt(index) {
        if (!this.HasProp("__IJsonArray")) {
            if ((queryResult := this.QueryInterface(IJsonArray.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJsonArray := IJsonArray(outPtr)
        }

        return this.__IJsonArray.GetBooleanAt(index)
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
     * Returns the JSON representation of the encapsulated value.
     * @remarks
     * If the [ValueType](ijsonvalue_valuetype.md) is **String**, then the returned string will be properly escaped and double quoted. This method is used for serializing the encapsulated value into a valid JSON format.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonarray.stringify
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
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonarray.getstring
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
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonarray.getnumber
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
     * Gets the [Boolean](/dotnet/api/system.boolean?view=dotnet-uwp-10.0&preserve-view=true) value if the [ValueType](ijsonvalue_valuetype.md) of the encapsulated value is [Boolean](/dotnet/api/system.boolean?view=dotnet-uwp-10.0&preserve-view=true).
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonarray.getboolean
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
     * Gets the [JsonArray](jsonarray.md) if the [ValueType](ijsonvalue_valuetype.md) of the encapsulated value is **Array**.
     * @returns {JsonArray} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonarray.getarray
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
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonarray.getobject
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
     * Returns the item located at the specified index.
     * @param {Integer} index The integer index for the value to retrieve.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonarray.getat
     */
    GetAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{d44662bc-dce3-59a8-9272-4b210f33908b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(IJsonValue, outPtr)
        }

        return this.__IVector.GetAt(index)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{d44662bc-dce3-59a8-9272-4b210f33908b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(IJsonValue, outPtr)
        }

        return this.__IVector.get_Size()
    }

    /**
     * Gets a [JsonArray](jsonarray.md) view.
     * @returns {IVectorView<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonarray.getview
     */
    GetView() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{d44662bc-dce3-59a8-9272-4b210f33908b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(IJsonValue, outPtr)
        }

        return this.__IVector.GetView()
    }

    /**
     * Searches for a [JsonValue](jsonvalue.md) object and returns the zero-based index of its first occurrence within the [JsonArray](jsonarray.md).
     * @param {Generic} value The [IJsonValue](ijsonvalue.md) to look up.
     * @param {Pointer<UInt32>} index The zero-based index of the first occurrence of item within the [JsonArray](jsonarray.md), if found; otherwise, –1.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonarray.indexof
     */
    IndexOf(value, index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{d44662bc-dce3-59a8-9272-4b210f33908b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(IJsonValue, outPtr)
        }

        return this.__IVector.IndexOf(value, index)
    }

    /**
     * Sets the value at the specified index using the provided [JsonValue](jsonvalue.md).
     * @param {Integer} index The index at which to set the value.
     * @param {Generic} value The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonarray.setat
     */
    SetAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{d44662bc-dce3-59a8-9272-4b210f33908b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(IJsonValue, outPtr)
        }

        return this.__IVector.SetAt(index, value)
    }

    /**
     * Inserts a [JsonValue](jsonvalue.md) into an array at the specified index.
     * @param {Integer} index The zero-based index at which the item should be inserted.
     * @param {Generic} value The [IJsonValue](ijsonvalue.md) object to insert.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonarray.insertat
     */
    InsertAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{d44662bc-dce3-59a8-9272-4b210f33908b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(IJsonValue, outPtr)
        }

        return this.__IVector.InsertAt(index, value)
    }

    /**
     * Removes the element at the specified index of the collection.
     * @remarks
     * If successful, calling this method reduces the collection size by one. Items with index values greater than the called index have their index values reduced by one.
     * @param {Integer} index The zero-based index of the element to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonarray.removeat
     */
    RemoveAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{d44662bc-dce3-59a8-9272-4b210f33908b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(IJsonValue, outPtr)
        }

        return this.__IVector.RemoveAt(index)
    }

    /**
     * Adds a new item to the array.
     * @param {Generic} value The new item to add.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonarray.append
     */
    Append(value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{d44662bc-dce3-59a8-9272-4b210f33908b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(IJsonValue, outPtr)
        }

        return this.__IVector.Append(value)
    }

    /**
     * Removes the last item in the array.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonarray.removeatend
     */
    RemoveAtEnd() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{d44662bc-dce3-59a8-9272-4b210f33908b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(IJsonValue, outPtr)
        }

        return this.__IVector.RemoveAtEnd()
    }

    /**
     * Removes all items from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonarray.clear
     */
    Clear() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{d44662bc-dce3-59a8-9272-4b210f33908b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(IJsonValue, outPtr)
        }

        return this.__IVector.Clear()
    }

    /**
     * Gets all array items of type [IJsonValue](ijsonvalue.md), starting from a specified index.
     * @param {Integer} startIndex The starting index.
     * @param {Pointer<Integer>} items_length 
     * @param {Pointer<Pointer<Generic>>} items Returns items of the [IJsonValue](ijsonvalue.md).
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonarray.getmany
     */
    GetMany(startIndex, items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{d44662bc-dce3-59a8-9272-4b210f33908b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(IJsonValue, outPtr)
        }

        return this.__IVector.GetMany(startIndex, items_length, items)
    }

    /**
     * Clears the array and then inserts the provided collection of [JsonValue](jsonvalue.md) objects as new array items.
     * @param {Integer} items_length 
     * @param {Pointer<Generic>} items The new collection items.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonarray.replaceall
     */
    ReplaceAll(items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{d44662bc-dce3-59a8-9272-4b210f33908b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(IJsonValue, outPtr)
        }

        return this.__IVector.ReplaceAll(items_length, items)
    }

    /**
     * Returns the iterator for iteration over the items in the array.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonarray.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{cb0492b6-4113-55cf-b2c5-99eb428ba493}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(IJsonValue, outPtr)
        }

        return this.__IIterable.First()
    }

    /**
     * Returns the JSON representation of the encapsulated value.
     * @remarks
     * If the [ValueType](ijsonvalue_valuetype.md) is **String**, then the returned string will be properly escaped and double quoted. This method is used for serializing the encapsulated value into a valid JSON format.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonarray.tostring
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
