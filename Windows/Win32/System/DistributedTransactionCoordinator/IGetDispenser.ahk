#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class IGetDispenser extends IUnknown{
    /**
     * The interface identifier for IGetDispenser
     * @type {Guid}
     */
    static IID => Guid("{c23cc370-87ef-11ce-8081-0080c758527e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} iid 
     * @param {Pointer<Void>} ppvObject 
     * @returns {HRESULT} 
     */
    GetDispenser(iid, ppvObject) {
        result := ComCall(3, this, "ptr", iid, "ptr", ppvObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
