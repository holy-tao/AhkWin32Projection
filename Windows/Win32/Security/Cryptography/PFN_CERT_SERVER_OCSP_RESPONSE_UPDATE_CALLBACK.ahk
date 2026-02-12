#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class PFN_CERT_SERVER_OCSP_RESPONSE_UPDATE_CALLBACK extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<CERT_CHAIN_CONTEXT>} pChainContext 
     * @param {Pointer<CERT_SERVER_OCSP_RESPONSE_CONTEXT>} pServerOcspResponseContext 
     * @param {Pointer<CRL_CONTEXT>} pNewCrlContext 
     * @param {Pointer<CRL_CONTEXT>} pPrevCrlContext 
     * @param {Pointer<Void>} pvArg 
     * @param {Integer} dwWriteOcspFileError 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pChainContext, pServerOcspResponseContext, pNewCrlContext, pPrevCrlContext, pvArg, dwWriteOcspFileError) {
        pvArgMarshal := pvArg is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "ptr", pChainContext, "ptr", pServerOcspResponseContext, "ptr", pNewCrlContext, "ptr", pPrevCrlContext, pvArgMarshal, pvArg, "uint", dwWriteOcspFileError)
    }
}
