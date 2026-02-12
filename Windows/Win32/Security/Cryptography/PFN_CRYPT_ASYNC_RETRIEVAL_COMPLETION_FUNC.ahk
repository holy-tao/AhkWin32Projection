#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class PFN_CRYPT_ASYNC_RETRIEVAL_COMPLETION_FUNC extends IUnknown {

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
     * @param {Pointer<Void>} pvCompletion 
     * @param {Integer} dwCompletionCode 
     * @param {PSTR} pszUrl 
     * @param {PSTR} pszObjectOid 
     * @param {Pointer<Void>} pvObject 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pvCompletion, dwCompletionCode, pszUrl, pszObjectOid, pvObject) {
        pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl
        pszObjectOid := pszObjectOid is String ? StrPtr(pszObjectOid) : pszObjectOid

        pvCompletionMarshal := pvCompletion is VarRef ? "ptr" : "ptr"
        pvObjectMarshal := pvObject is VarRef ? "ptr" : "ptr"

        ComCall(3, this, pvCompletionMarshal, pvCompletion, "uint", dwCompletionCode, "ptr", pszUrl, "ptr", pszObjectOid, pvObjectMarshal, pvObject)
    }
}
