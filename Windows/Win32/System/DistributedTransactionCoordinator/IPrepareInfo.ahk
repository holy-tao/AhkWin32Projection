#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class IPrepareInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrepareInfo
     * @type {Guid}
     */
    static IID => Guid("{80c7bfd0-87ee-11ce-8081-0080c758527e}")

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
        result := ComCall(3, this, "uint*", pcbPrepInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pPrepInfo 
     * @returns {HRESULT} 
     */
    GetPrepareInfo(pPrepInfo) {
        result := ComCall(4, this, "char*", pPrepInfo, "HRESULT")
        return result
    }
}
