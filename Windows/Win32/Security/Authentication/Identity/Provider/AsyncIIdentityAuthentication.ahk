#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity.Provider
 * @version v4.0.30319
 */
class AsyncIIdentityAuthentication extends IUnknown{
    /**
     * The interface identifier for AsyncIIdentityAuthentication
     * @type {Guid}
     */
    static IID => Guid("{f9a2f918-feca-4e9c-9633-61cbf13ed34d}")

    /**
     * The class identifier for AsyncIIdentityAuthentication
     * @type {Guid}
     */
    static CLSID => Guid("{f9a2f918-feca-4e9c-9633-61cbf13ed34d}")

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
    Begin_SetIdentityCredential(CredBuffer, CredBufferLength) {
        result := ComCall(3, this, "char*", CredBuffer, "uint", CredBufferLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Finish_SetIdentityCredential() {
        result := ComCall(4, this, "int")
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
    Begin_ValidateIdentityCredential(CredBuffer, CredBufferLength, ppIdentityProperties) {
        result := ComCall(5, this, "char*", CredBuffer, "uint", CredBufferLength, "ptr", ppIdentityProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPropertyStore>} ppIdentityProperties 
     * @returns {HRESULT} 
     */
    Finish_ValidateIdentityCredential(ppIdentityProperties) {
        result := ComCall(6, this, "ptr", ppIdentityProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
