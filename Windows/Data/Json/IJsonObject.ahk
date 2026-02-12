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
class IJsonObject extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IJsonObject
     * @type {Guid}
     */
    static IID => Guid("{064e24dd-29c2-4f83-9ac1-9ee11578beb3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNamedValue", "SetNamedValue", "GetNamedObject", "GetNamedArray", "GetNamedString", "GetNamedNumber", "GetNamedBoolean"]

    /**
     * 
     * @param {HSTRING} name 
     * @returns {JsonValue} 
     */
    GetNamedValue(name) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(6, this, "ptr", name, "ptr*", &returnValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return JsonValue(returnValue)
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {IJsonValue} value 
     * @returns {HRESULT} 
     */
    SetNamedValue(name, value) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(7, this, "ptr", name, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @returns {JsonObject} 
     */
    GetNamedObject(name) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(8, this, "ptr", name, "ptr*", &returnValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return JsonObject(returnValue)
    }

    /**
     * 
     * @param {HSTRING} name 
     * @returns {JsonArray} 
     */
    GetNamedArray(name) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(9, this, "ptr", name, "ptr*", &returnValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return JsonArray(returnValue)
    }

    /**
     * 
     * @param {HSTRING} name 
     * @returns {HSTRING} 
     */
    GetNamedString(name) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        returnValue := HSTRING()
        result := ComCall(10, this, "ptr", name, "ptr", returnValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return returnValue
    }

    /**
     * 
     * @param {HSTRING} name 
     * @returns {Float} 
     */
    GetNamedNumber(name) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(11, this, "ptr", name, "double*", &returnValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return returnValue
    }

    /**
     * 
     * @param {HSTRING} name 
     * @returns {Boolean} 
     */
    GetNamedBoolean(name) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(12, this, "ptr", name, "int*", &returnValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return returnValue
    }
}
