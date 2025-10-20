#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Used by a server to help authenticate the client and to manage impersonation of the client.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-iserversecurity
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IServerSecurity extends IUnknown{
    /**
     * The interface identifier for IServerSecurity
     * @type {Guid}
     */
    static IID => Guid("{0000013e-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} pAuthnSvc 
     * @param {Pointer<UInt32>} pAuthzSvc 
     * @param {Pointer<UInt16>} pServerPrincName 
     * @param {Pointer<UInt32>} pAuthnLevel 
     * @param {Pointer<UInt32>} pImpLevel 
     * @param {Pointer<Void>} pPrivs 
     * @param {Pointer<UInt32>} pCapabilities 
     * @returns {HRESULT} 
     */
    QueryBlanket(pAuthnSvc, pAuthzSvc, pServerPrincName, pAuthnLevel, pImpLevel, pPrivs, pCapabilities) {
        result := ComCall(3, this, "uint*", pAuthnSvc, "uint*", pAuthzSvc, "ushort*", pServerPrincName, "uint*", pAuthnLevel, "uint*", pImpLevel, "ptr", pPrivs, "uint*", pCapabilities, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ImpersonateClient() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Terminates the impersonation of a client application.
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     *       
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-reverttoself
     */
    RevertToSelf() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsImpersonating() {
        result := ComCall(6, this, "int")
        return result
    }
}
