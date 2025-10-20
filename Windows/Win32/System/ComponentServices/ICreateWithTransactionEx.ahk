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
     * 
     * @param {Pointer<ITransaction>} pTransaction 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} pObject 
     * @returns {HRESULT} 
     */
    CreateInstance(pTransaction, rclsid, riid, pObject) {
        result := ComCall(3, this, "ptr", pTransaction, "ptr", rclsid, "ptr", riid, "ptr", pObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
