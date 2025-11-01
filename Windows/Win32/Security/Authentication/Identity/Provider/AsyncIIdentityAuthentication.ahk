#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity.Provider
 * @version v4.0.30319
 */
class AsyncIIdentityAuthentication extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Begin_SetIdentityCredential", "Finish_SetIdentityCredential", "Begin_ValidateIdentityCredential", "Finish_ValidateIdentityCredential"]

    /**
     * 
     * @param {Pointer<Integer>} CredBuffer 
     * @param {Integer} CredBufferLength 
     * @returns {HRESULT} 
     */
    Begin_SetIdentityCredential(CredBuffer, CredBufferLength) {
        CredBufferMarshal := CredBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, CredBufferMarshal, CredBuffer, "uint", CredBufferLength, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Finish_SetIdentityCredential() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} CredBuffer 
     * @param {Integer} CredBufferLength 
     * @param {Pointer<IPropertyStore>} ppIdentityProperties 
     * @returns {HRESULT} 
     */
    Begin_ValidateIdentityCredential(CredBuffer, CredBufferLength, ppIdentityProperties) {
        CredBufferMarshal := CredBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, CredBufferMarshal, CredBuffer, "uint", CredBufferLength, "ptr*", ppIdentityProperties, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IPropertyStore>} ppIdentityProperties 
     * @returns {HRESULT} 
     */
    Finish_ValidateIdentityCredential(ppIdentityProperties) {
        result := ComCall(6, this, "ptr*", ppIdentityProperties, "HRESULT")
        return result
    }
}
