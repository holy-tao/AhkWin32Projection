#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\JsonObject.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Data.Json
 * @version WindowsRuntime 1.4
 */
class IJsonObjectStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IJsonObjectStatics
     * @type {Guid}
     */
    static IID => Guid("{2289f159-54de-45d8-abcc-22603fa066a0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Parse", "TryParse"]

    /**
     * Parses a text value and returns its value in a given type using the culture of the application.
     * @remarks
     * Use **Parse** only for converting from string to date/time and number types. For general type conversions, use the **Convert** function. Keep in mind that there is a certain performance overhead in parsing the string value.
     * @param {HSTRING} input_ 
     * @returns {JsonObject} 
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/access/parse-function-access-custom-web-app
     */
    Parse(input_) {
        if(input_ is String) {
            pin := HSTRING.Create(input_)
            input_ := pin.Value
        }
        input_ := input_ is Win32Handle ? NumGet(input_, "ptr") : input_

        result := ComCall(6, this, "ptr", input_, "ptr*", &jsonObject_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return JsonObject(jsonObject_)
    }

    /**
     * 
     * @param {HSTRING} input_ 
     * @param {Pointer<JsonObject>} result_ 
     * @returns {Boolean} 
     */
    TryParse(input_, result_) {
        if(input_ is String) {
            pin := HSTRING.Create(input_)
            input_ := pin.Value
        }
        input_ := input_ is Win32Handle ? NumGet(input_, "ptr") : input_

        result := ComCall(7, this, "ptr", input_, "ptr", result_, "int*", &succeeded := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return succeeded
    }
}
