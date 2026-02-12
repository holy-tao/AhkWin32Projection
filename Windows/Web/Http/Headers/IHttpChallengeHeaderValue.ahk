#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include .\HttpNameValueHeaderValue.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class IHttpChallengeHeaderValue extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpChallengeHeaderValue
     * @type {Guid}
     */
    static IID => Guid("{393361af-0f7d-4820-9fdd-a2b956eeaeab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Parameters", "get_Scheme", "get_Token"]

    /**
     * @type {IVector<HttpNameValueHeaderValue>} 
     */
    Parameters {
        get => this.get_Parameters()
    }

    /**
     * @type {HSTRING} 
     */
    Scheme {
        get => this.get_Scheme()
    }

    /**
     * @type {HSTRING} 
     */
    Token {
        get => this.get_Token()
    }

    /**
     * 
     * @returns {IVector<HttpNameValueHeaderValue>} 
     */
    get_Parameters() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(HttpNameValueHeaderValue, value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Scheme() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Token() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
