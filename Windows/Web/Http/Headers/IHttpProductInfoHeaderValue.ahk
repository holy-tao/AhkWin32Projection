#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\HttpProductHeaderValue.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class IHttpProductInfoHeaderValue extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpProductInfoHeaderValue
     * @type {Guid}
     */
    static IID => Guid("{1b1a8732-4c35-486a-966f-646489198e4d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Product", "get_Comment"]

    /**
     * @type {HttpProductHeaderValue} 
     */
    Product {
        get => this.get_Product()
    }

    /**
     * @type {HSTRING} 
     */
    Comment {
        get => this.get_Comment()
    }

    /**
     * 
     * @returns {HttpProductHeaderValue} 
     */
    get_Product() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpProductHeaderValue(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Comment() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
