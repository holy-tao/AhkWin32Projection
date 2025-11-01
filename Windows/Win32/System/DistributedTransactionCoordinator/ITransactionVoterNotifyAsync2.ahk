#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITransactionOutcomeEvents.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class ITransactionVoterNotifyAsync2 extends ITransactionOutcomeEvents{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITransactionVoterNotifyAsync2
     * @type {Guid}
     */
    static IID => Guid("{5433376b-414d-11d3-b206-00c04fc2f3ef}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["VoteRequest"]

    /**
     * 
     * @returns {HRESULT} 
     */
    VoteRequest() {
        result := ComCall(7, this, "HRESULT")
        return result
    }
}
