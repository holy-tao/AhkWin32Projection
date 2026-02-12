#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMSMQTransaction.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class IMSMQCoordinatedTransactionDispenser extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSMQCoordinatedTransactionDispenser
     * @type {Guid}
     */
    static IID => Guid("{d7d6e081-dccd-11d0-aa4b-0060970debae}")

    /**
     * The class identifier for MSMQCoordinatedTransactionDispenser
     * @type {Guid}
     */
    static CLSID => Guid("{d7d6e082-dccd-11d0-aa4b-0060970debae}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeginTransaction"]

    /**
     * Learn more about: BeginTransactionGrbit enumeration
     * @returns {IMSMQTransaction} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/extensible-storage-engine/begintransactiongrbit-enumeration
     */
    BeginTransaction() {
        result := ComCall(7, this, "ptr*", &ptransaction := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMSMQTransaction(ptransaction)
    }
}
