#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Web
 * @version WindowsRuntime 1.4
 */
class IWebAuthenticationResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebAuthenticationResult
     * @type {Guid}
     */
    static IID => Guid("{64002b4b-ede9-470a-a5cd-0323faf6e262}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ResponseData", "get_ResponseStatus", "get_ResponseErrorDetail"]

    /**
     * @type {HSTRING} 
     */
    ResponseData {
        get => this.get_ResponseData()
    }

    /**
     * @type {Integer} 
     */
    ResponseStatus {
        get => this.get_ResponseStatus()
    }

    /**
     * @type {Integer} 
     */
    ResponseErrorDetail {
        get => this.get_ResponseErrorDetail()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ResponseData() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ResponseStatus() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ResponseErrorDetail() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
