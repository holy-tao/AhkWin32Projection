#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class IGetDispenser extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDispenser"]

    /**
     * 
     * @param {Pointer<Guid>} iid 
     * @param {Pointer<Pointer<Void>>} ppvObject 
     * @returns {HRESULT} 
     */
    GetDispenser(iid, ppvObject) {
        result := ComCall(3, this, "ptr", iid, "ptr*", ppvObject, "HRESULT")
        return result
    }
}
