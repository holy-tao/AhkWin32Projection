#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class ITransactionExportFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITransactionExportFactory
     * @type {Guid}
     */
    static IID => Guid("{e1cf9b53-8745-11ce-a9ba-00aa006c3706}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRemoteClassId", "Create"]

    /**
     * 
     * @param {Pointer<Guid>} pclsid 
     * @returns {HRESULT} 
     */
    GetRemoteClassId(pclsid) {
        result := ComCall(3, this, "ptr", pclsid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cbWhereabouts 
     * @param {Pointer<Integer>} rgbWhereabouts 
     * @param {Pointer<ITransactionExport>} ppExport 
     * @returns {HRESULT} 
     */
    Create(cbWhereabouts, rgbWhereabouts, ppExport) {
        rgbWhereaboutsMarshal := rgbWhereabouts is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "uint", cbWhereabouts, rgbWhereaboutsMarshal, rgbWhereabouts, "ptr*", ppExport, "HRESULT")
        return result
    }
}
