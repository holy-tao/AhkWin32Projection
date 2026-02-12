#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Specifies that an object has changed.
 * @remarks
 * A provider calls an implementation of the <b>PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FLUSH</b> callback function to indicate that an object has changed.
 * 
 * A pointer to this function is set in the <i>pfnFlush</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_initialize">PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_INITIALIZE</a> function.
 * 
 * An identifier is data chosen by the provider to represent the object being located for the caller. Identifiers need not be unique. If the provider determines that the object associated with the identifier is no longer valid, it should call this function to mark all objects with the associated identifier as invalid. This function is thread safe.
 * @see https://learn.microsoft.com/windows/win32/api//content/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_flush
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FLUSH extends IUnknown {

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
     * @param {Pointer<Void>} pContext 
     * @param {Pointer<Pointer<CRYPT_INTEGER_BLOB>>} rgIdentifierOrNameList 
     * @param {Integer} dwIdentifierOrNameListCount 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pContext, rgIdentifierOrNameList, dwIdentifierOrNameListCount) {
        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"
        rgIdentifierOrNameListMarshal := rgIdentifierOrNameList is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, pContextMarshal, pContext, rgIdentifierOrNameListMarshal, rgIdentifierOrNameList, "uint", dwIdentifierOrNameListCount, "int")
        return result
    }
}
