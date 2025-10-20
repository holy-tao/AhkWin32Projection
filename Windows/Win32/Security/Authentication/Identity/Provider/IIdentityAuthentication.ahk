#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity.Provider
 * @version v4.0.30319
 */
class IIdentityAuthentication extends IUnknown{
    /**
     * The interface identifier for IIdentityAuthentication
     * @type {Guid}
     */
    static IID => Guid("{5e7ef254-979f-43b5-b74e-06e4eb7df0f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Byte>} CredBuffer 
     * @param {Integer} CredBufferLength 
     * @returns {HRESULT} 
     */
    SetIdentityCredential(CredBuffer, CredBufferLength) {
        result := ComCall(3, this, "char*", CredBuffer, "uint", CredBufferLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} CredBuffer 
     * @param {Integer} CredBufferLength 
     * @param {Pointer<IPropertyStore>} ppIdentityProperties 
     * @returns {HRESULT} 
     */
    ValidateIdentityCredential(CredBuffer, CredBufferLength, ppIdentityProperties) {
        result := ComCall(4, this, "char*", CredBuffer, "uint", CredBufferLength, "ptr", ppIdentityProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
