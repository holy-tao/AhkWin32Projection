#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class IPrepareInfo extends IUnknown{
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
     * @param {Pointer<Byte>} pPrepInfo 
     * @returns {HRESULT} 
     */
    GetPrepareInfo(pPrepInfo) {
        result := ComCall(4, this, "char*", pPrepInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
