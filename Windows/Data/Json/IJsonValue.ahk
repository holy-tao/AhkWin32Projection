#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\JsonArray.ahk
#Include .\JsonObject.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Encapsulates a JSON value.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.data.json.ijsonvalue
 * @namespace Windows.Data.Json
 * @version WindowsRuntime 1.4
 */
class IJsonValue extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IJsonValue
     * @type {Guid}
     */
    static IID => Guid("{a3219ecb-f0b3-4dcd-beee-19d48cd3ed1e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ValueType", "Stringify", "GetString", "GetNumber", "GetBoolean", "GetArray", "GetObject"]

    /**
     * Gets the type of the encapsulated JSON value. Possible types are defined by [JsonValueType](jsonvaluetype.md).
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.ijsonvalue.valuetype
     * @type {Integer} 
     */
    ValueType {
        get => this.get_ValueType()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ValueType() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Retrieves the JSON representation of the encapsulated value.
     * @remarks
     * If the [ValueType](ijsonvalue_valuetype.md) is **String**, then the returned string will be properly escaped and double quoted. This method is used for serializing the encapsulated value into a valid JSON format.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.ijsonvalue.stringify
     */
    Stringify() {
        returnValue := HSTRING()
        result := ComCall(7, this, "ptr", returnValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return returnValue
    }

    /**
     * Returns the [String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true) if the [ValueType](ijsonvalue_valuetype.md) of the encapsulated value is [String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true). If it is not, an exception is thrown.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.ijsonvalue.getstring
     */
    GetString() {
        returnValue := HSTRING()
        result := ComCall(8, this, "ptr", returnValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return returnValue
    }

    /**
     * Returns the number (a [Double](/dotnet/api/system.double?view=dotnet-uwp-10.0&preserve-view=true)) if the [ValueType](ijsonvalue_valuetype.md) of the encapsulated value is **Number**. If it is not, an exception is thrown.
     * @returns {Float} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.ijsonvalue.getnumber
     */
    GetNumber() {
        result := ComCall(9, this, "double*", &returnValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return returnValue
    }

    /**
     * Returns the [Boolean](/dotnet/api/system.boolean?view=dotnet-uwp-10.0&preserve-view=true) if the [ValueType](ijsonvalue_valuetype.md) of the encapsulated value is [Boolean](/dotnet/api/system.boolean?view=dotnet-uwp-10.0&preserve-view=true). If it is not, an exception is thrown.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.ijsonvalue.getboolean
     */
    GetBoolean() {
        result := ComCall(10, this, "int*", &returnValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return returnValue
    }

    /**
     * Returns a pointer to the array if the [ValueType](ijsonvalue_valuetype.md) of the encapsulated value is **Array**. If it is not, an exception is thrown.
     * @returns {JsonArray} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.ijsonvalue.getarray
     */
    GetArray() {
        result := ComCall(11, this, "ptr*", &returnValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return JsonArray(returnValue)
    }

    /**
     * Returns a pointer to the object if the [ValueType](ijsonvalue_valuetype.md) of the encapsulated value is **Object**. If it is not, an exception is thrown.
     * @returns {JsonObject} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.ijsonvalue.getobject
     */
    GetObject() {
        result := ComCall(12, this, "ptr*", &returnValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return JsonObject(returnValue)
    }
}
