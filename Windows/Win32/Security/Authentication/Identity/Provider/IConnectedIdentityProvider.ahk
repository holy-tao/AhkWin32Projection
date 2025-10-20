#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\System\Com\IUnknown.ahk

/**
 * Provides methods of interaction with a connected identity provider.
 * @see https://docs.microsoft.com/windows/win32/api//identityprovider/nn-identityprovider-iconnectedidentityprovider
 * @namespace Windows.Win32.Security.Authentication.Identity.Provider
 * @version v4.0.30319
 */
class IConnectedIdentityProvider extends IUnknown{
    /**
     * The interface identifier for IConnectedIdentityProvider
     * @type {Guid}
     */
    static IID => Guid("{b7417b54-e08c-429b-96c8-678d1369ecb1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Byte>} AuthBuffer 
     * @param {Integer} AuthBufferSize 
     * @returns {HRESULT} 
     */
    ConnectIdentity(AuthBuffer, AuthBufferSize) {
        result := ComCall(3, this, "char*", AuthBuffer, "uint", AuthBufferSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DisconnectIdentity() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} Connected 
     * @returns {HRESULT} 
     */
    IsConnected(Connected) {
        result := ComCall(5, this, "ptr", Connected, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Identifier 
     * @param {Pointer<IBindCtx>} Context 
     * @param {Pointer<VARIANT>} PostData 
     * @param {Pointer<PWSTR>} Url 
     * @returns {HRESULT} 
     */
    GetUrl(Identifier, Context, PostData, Url) {
        result := ComCall(6, this, "int", Identifier, "ptr", Context, "ptr", PostData, "ptr", Url, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pState 
     * @returns {HRESULT} 
     */
    GetAccountState(pState) {
        result := ComCall(7, this, "int*", pState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
