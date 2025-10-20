#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class IDtcToXaHelperFactory extends IUnknown{
    /**
     * The interface identifier for IDtcToXaHelperFactory
     * @type {Guid}
     */
    static IID => Guid("{a9861610-304a-11d1-9813-00a0c905416e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PSTR} pszDSN 
     * @param {PSTR} pszClientDllName 
     * @param {Pointer<Guid>} pguidRm 
     * @param {Pointer<IDtcToXaHelper>} ppXaHelper 
     * @returns {HRESULT} 
     */
    Create(pszDSN, pszClientDllName, pguidRm, ppXaHelper) {
        result := ComCall(3, this, "ptr", pszDSN, "ptr", pszClientDllName, "ptr", pguidRm, "ptr", ppXaHelper, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
