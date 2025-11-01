#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class ITransactionImportWhereabouts extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITransactionImportWhereabouts
     * @type {Guid}
     */
    static IID => Guid("{0141fda4-8fc0-11ce-bd18-204c4f4f5020}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetWhereaboutsSize", "GetWhereabouts"]

    /**
     * 
     * @param {Pointer<Integer>} pcbWhereabouts 
     * @returns {HRESULT} 
     */
    GetWhereaboutsSize(pcbWhereabouts) {
        pcbWhereaboutsMarshal := pcbWhereabouts is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pcbWhereaboutsMarshal, pcbWhereabouts, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cbWhereabouts 
     * @param {Pointer<Integer>} rgbWhereabouts 
     * @param {Pointer<Integer>} pcbUsed 
     * @returns {HRESULT} 
     */
    GetWhereabouts(cbWhereabouts, rgbWhereabouts, pcbUsed) {
        rgbWhereaboutsMarshal := rgbWhereabouts is VarRef ? "char*" : "ptr"
        pcbUsedMarshal := pcbUsed is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", cbWhereabouts, rgbWhereaboutsMarshal, rgbWhereabouts, pcbUsedMarshal, pcbUsed, "HRESULT")
        return result
    }
}
