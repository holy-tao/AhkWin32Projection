#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class ITransactionVoterBallotAsync2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITransactionVoterBallotAsync2
     * @type {Guid}
     */
    static IID => Guid("{5433376c-414d-11d3-b206-00c04fc2f3ef}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["VoteRequestDone"]

    /**
     * 
     * @param {HRESULT} hr 
     * @param {Pointer<BOID>} pboidReason 
     * @returns {HRESULT} 
     */
    VoteRequestDone(hr, pboidReason) {
        result := ComCall(3, this, "int", hr, "ptr", pboidReason, "HRESULT")
        return result
    }
}
