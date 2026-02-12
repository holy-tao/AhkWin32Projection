#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\JsonObject.ahk
#Include .\JsonArray.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Data.Json
 * @version WindowsRuntime 1.4
 */
class IJsonArray extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IJsonArray
     * @type {Guid}
     */
    static IID => Guid("{08c1ddb6-0cbd-4a9a-b5d3-2f852dc37e81}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetObjectAt", "GetArrayAt", "GetStringAt", "GetNumberAt", "GetBooleanAt"]

    /**
     * 
     * @param {Integer} index 
     * @returns {JsonObject} 
     */
    GetObjectAt(index) {
        result := ComCall(6, this, "uint", index, "ptr*", &returnValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return JsonObject(returnValue)
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {JsonArray} 
     */
    GetArrayAt(index) {
        result := ComCall(7, this, "uint", index, "ptr*", &returnValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return JsonArray(returnValue)
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HSTRING} 
     */
    GetStringAt(index) {
        returnValue := HSTRING()
        result := ComCall(8, this, "uint", index, "ptr", returnValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return returnValue
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {Float} 
     */
    GetNumberAt(index) {
        result := ComCall(9, this, "uint", index, "double*", &returnValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return returnValue
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {Boolean} 
     */
    GetBooleanAt(index) {
        result := ComCall(10, this, "uint", index, "int*", &returnValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return returnValue
    }
}
