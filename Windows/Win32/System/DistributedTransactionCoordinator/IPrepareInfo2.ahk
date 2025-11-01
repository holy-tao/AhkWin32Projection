#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class IPrepareInfo2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrepareInfo2
     * @type {Guid}
     */
    static IID => Guid("{5fab2547-9779-11d1-b886-00c04fb9618a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPrepareInfoSize", "GetPrepareInfo"]

    /**
     * 
     * @param {Pointer<Integer>} pcbPrepInfo 
     * @returns {HRESULT} 
     */
    GetPrepareInfoSize(pcbPrepInfo) {
        pcbPrepInfoMarshal := pcbPrepInfo is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pcbPrepInfoMarshal, pcbPrepInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cbPrepareInfo 
     * @param {Pointer<Integer>} pPrepInfo 
     * @returns {HRESULT} 
     */
    GetPrepareInfo(cbPrepareInfo, pPrepInfo) {
        pPrepInfoMarshal := pPrepInfo is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "uint", cbPrepareInfo, pPrepInfoMarshal, pPrepInfo, "HRESULT")
        return result
    }
}
