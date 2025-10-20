#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class ITipPullSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITipPullSink
     * @type {Guid}
     */
    static IID => Guid("{17cf72d2-bac5-11d1-b1bf-00c04fc2f3ef}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PullComplete"]

    /**
     * 
     * @param {HRESULT} i_hrPull 
     * @returns {HRESULT} 
     */
    PullComplete(i_hrPull) {
        result := ComCall(3, this, "int", i_hrPull, "HRESULT")
        return result
    }
}
