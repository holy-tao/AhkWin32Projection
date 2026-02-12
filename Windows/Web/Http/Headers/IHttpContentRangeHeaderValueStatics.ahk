#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\HttpContentRangeHeaderValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class IHttpContentRangeHeaderValueStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpContentRangeHeaderValueStatics
     * @type {Guid}
     */
    static IID => Guid("{80a346ca-174c-4fae-821c-134cd294aa38}")

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
     * @returns {HttpContentRangeHeaderValue} 
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/access/parse-function-access-custom-web-app
     */
    Parse(input_) {
        if(input_ is String) {
            pin := HSTRING.Create(input_)
            input_ := pin.Value
        }
        input_ := input_ is Win32Handle ? NumGet(input_, "ptr") : input_

        result := ComCall(6, this, "ptr", input_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpContentRangeHeaderValue(result_)
    }

    /**
     * 
     * @param {HSTRING} input_ 
     * @param {Pointer<HttpContentRangeHeaderValue>} contentRangeHeaderValue 
     * @returns {Boolean} 
     */
    TryParse(input_, contentRangeHeaderValue) {
        if(input_ is String) {
            pin := HSTRING.Create(input_)
            input_ := pin.Value
        }
        input_ := input_ is Win32Handle ? NumGet(input_, "ptr") : input_

        result := ComCall(7, this, "ptr", input_, "ptr", contentRangeHeaderValue, "int*", &succeeded := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return succeeded
    }
}
