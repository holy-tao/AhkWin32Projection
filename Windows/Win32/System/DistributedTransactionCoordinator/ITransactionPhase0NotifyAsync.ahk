#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class ITransactionPhase0NotifyAsync extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITransactionPhase0NotifyAsync
     * @type {Guid}
     */
    static IID => Guid("{ef081809-0c76-11d2-87a6-00c04f990f34}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Phase0Request", "EnlistCompleted"]

    /**
     * 
     * @param {BOOL} fAbortingHint 
     * @returns {HRESULT} 
     */
    Phase0Request(fAbortingHint) {
        result := ComCall(3, this, "int", fAbortingHint, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} status 
     * @returns {HRESULT} 
     */
    EnlistCompleted(status) {
        result := ComCall(4, this, "int", status, "HRESULT")
        return result
    }
}
