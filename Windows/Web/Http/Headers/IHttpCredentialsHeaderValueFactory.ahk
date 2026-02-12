#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\HttpCredentialsHeaderValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class IHttpCredentialsHeaderValueFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpCredentialsHeaderValueFactory
     * @type {Guid}
     */
    static IID => Guid("{f21d9e91-4d1c-4182-bfd1-34470a62f950}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromScheme", "CreateFromSchemeWithToken"]

    /**
     * 
     * @param {HSTRING} scheme 
     * @returns {HttpCredentialsHeaderValue} 
     */
    CreateFromScheme(scheme) {
        if(scheme is String) {
            pin := HSTRING.Create(scheme)
            scheme := pin.Value
        }
        scheme := scheme is Win32Handle ? NumGet(scheme, "ptr") : scheme

        result := ComCall(6, this, "ptr", scheme, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpCredentialsHeaderValue(value)
    }

    /**
     * 
     * @param {HSTRING} scheme 
     * @param {HSTRING} token 
     * @returns {HttpCredentialsHeaderValue} 
     */
    CreateFromSchemeWithToken(scheme, token) {
        if(scheme is String) {
            pin := HSTRING.Create(scheme)
            scheme := pin.Value
        }
        scheme := scheme is Win32Handle ? NumGet(scheme, "ptr") : scheme
        if(token is String) {
            pin := HSTRING.Create(token)
            token := pin.Value
        }
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", scheme, "ptr", token, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpCredentialsHeaderValue(value)
    }
}
