#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\HttpMediaTypeHeaderValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class IHttpMediaTypeHeaderValueStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpMediaTypeHeaderValueStatics
     * @type {Guid}
     */
    static IID => Guid("{e04d83df-1d41-4d8c-a2de-6fd2ed87399b}")

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
     * @returns {HttpMediaTypeHeaderValue} 
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

        return HttpMediaTypeHeaderValue(result_)
    }

    /**
     * 
     * @param {HSTRING} input_ 
     * @param {Pointer<HttpMediaTypeHeaderValue>} mediaTypeHeaderValue 
     * @returns {Boolean} 
     */
    TryParse(input_, mediaTypeHeaderValue) {
        if(input_ is String) {
            pin := HSTRING.Create(input_)
            input_ := pin.Value
        }
        input_ := input_ is Win32Handle ? NumGet(input_, "ptr") : input_

        result := ComCall(7, this, "ptr", input_, "ptr", mediaTypeHeaderValue, "int*", &succeeded := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return succeeded
    }
}
