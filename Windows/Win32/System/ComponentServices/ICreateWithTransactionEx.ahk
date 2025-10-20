#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Creates an object that is enlisted within a manual transaction.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icreatewithtransactionex
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ICreateWithTransactionEx extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICreateWithTransactionEx
     * @type {Guid}
     */
    static IID => Guid("{455acf57-5345-11d2-99cf-00c04f797bc9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstance"]

    /**
     * 
     * @param {ITransaction} pTransaction 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} pObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icreatewithtransactionex-createinstance
     */
    CreateInstance(pTransaction, rclsid, riid, pObject) {
        result := ComCall(3, this, "ptr", pTransaction, "ptr", rclsid, "ptr", riid, "ptr*", pObject, "HRESULT")
        return result
    }
}
