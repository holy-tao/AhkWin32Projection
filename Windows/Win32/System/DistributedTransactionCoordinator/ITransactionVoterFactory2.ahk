#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class ITransactionVoterFactory2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITransactionVoterFactory2
     * @type {Guid}
     */
    static IID => Guid("{5433376a-414d-11d3-b206-00c04fc2f3ef}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create"]

    /**
     * 
     * @param {ITransaction} pTransaction 
     * @param {ITransactionVoterNotifyAsync2} pVoterNotify 
     * @param {Pointer<ITransactionVoterBallotAsync2>} ppVoterBallot 
     * @returns {HRESULT} 
     */
    Create(pTransaction, pVoterNotify, ppVoterBallot) {
        result := ComCall(3, this, "ptr", pTransaction, "ptr", pVoterNotify, "ptr*", ppVoterBallot, "HRESULT")
        return result
    }
}
