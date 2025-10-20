#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class ITransactionEnlistmentAsync extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITransactionEnlistmentAsync
     * @type {Guid}
     */
    static IID => Guid("{0fb15081-af41-11ce-bd2b-204c4f4f5020}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PrepareRequestDone", "CommitRequestDone", "AbortRequestDone"]

    /**
     * 
     * @param {HRESULT} hr 
     * @param {IMoniker} pmk 
     * @param {Pointer<BOID>} pboidReason 
     * @returns {HRESULT} 
     */
    PrepareRequestDone(hr, pmk, pboidReason) {
        result := ComCall(3, this, "int", hr, "ptr", pmk, "ptr", pboidReason, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} hr 
     * @returns {HRESULT} 
     */
    CommitRequestDone(hr) {
        result := ComCall(4, this, "int", hr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} hr 
     * @returns {HRESULT} 
     */
    AbortRequestDone(hr) {
        result := ComCall(5, this, "int", hr, "HRESULT")
        return result
    }
}
