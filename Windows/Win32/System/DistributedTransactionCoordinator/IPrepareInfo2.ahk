#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class IPrepareInfo2 extends IUnknown{
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
     * 
     * @param {Pointer<UInt32>} pcbPrepInfo 
     * @returns {HRESULT} 
     */
    GetPrepareInfoSize(pcbPrepInfo) {
        result := ComCall(3, this, "uint*", pcbPrepInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cbPrepareInfo 
     * @param {Pointer<Byte>} pPrepInfo 
     * @returns {HRESULT} 
     */
    GetPrepareInfo(cbPrepareInfo, pPrepInfo) {
        result := ComCall(4, this, "uint", cbPrepareInfo, "char*", pPrepInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
