#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\JsonValue.ahk
#Include .\JsonObject.ahk
#Include .\JsonArray.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Data.Json
 * @version WindowsRuntime 1.4
 */
class IJsonObjectWithDefaultValues extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IJsonObjectWithDefaultValues
     * @type {Guid}
     */
    static IID => Guid("{d960d2a2-b7f0-4f00-8e44-d82cf415ea13}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNamedValueOrDefault", "GetNamedObjectOrDefault", "GetNamedStringOrDefault", "GetNamedArrayOrDefault", "GetNamedNumberOrDefault", "GetNamedBooleanOrDefault"]

    /**
     * 
     * @param {HSTRING} name 
     * @param {JsonValue} defaultValue 
     * @returns {JsonValue} 
     */
    GetNamedValueOrDefault(name, defaultValue) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(6, this, "ptr", name, "ptr", defaultValue, "ptr*", &returnValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return JsonValue(returnValue)
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {JsonObject} defaultValue 
     * @returns {JsonObject} 
     */
    GetNamedObjectOrDefault(name, defaultValue) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(7, this, "ptr", name, "ptr", defaultValue, "ptr*", &returnValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return JsonObject(returnValue)
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {HSTRING} defaultValue 
     * @returns {HSTRING} 
     */
    GetNamedStringOrDefault(name, defaultValue) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name
        if(defaultValue is String) {
            pin := HSTRING.Create(defaultValue)
            defaultValue := pin.Value
        }
        defaultValue := defaultValue is Win32Handle ? NumGet(defaultValue, "ptr") : defaultValue

        returnValue := HSTRING()
        result := ComCall(8, this, "ptr", name, "ptr", defaultValue, "ptr", returnValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return returnValue
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {JsonArray} defaultValue 
     * @returns {JsonArray} 
     */
    GetNamedArrayOrDefault(name, defaultValue) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(9, this, "ptr", name, "ptr", defaultValue, "ptr*", &returnValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return JsonArray(returnValue)
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Float} defaultValue 
     * @returns {Float} 
     */
    GetNamedNumberOrDefault(name, defaultValue) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(10, this, "ptr", name, "double", defaultValue, "double*", &returnValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return returnValue
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Boolean} defaultValue 
     * @returns {Boolean} 
     */
    GetNamedBooleanOrDefault(name, defaultValue) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(11, this, "ptr", name, "int", defaultValue, "int*", &returnValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return returnValue
    }
}
