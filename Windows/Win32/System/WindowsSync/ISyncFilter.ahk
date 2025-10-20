#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncFilter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncFilter
     * @type {Guid}
     */
    static IID => Guid("{087a3f15-0fcb-44c1-9639-53c14e2b5506}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsIdentical", "Serialize"]

    /**
     * 
     * @param {ISyncFilter} pSyncFilter 
     * @returns {HRESULT} 
     */
    IsIdentical(pSyncFilter) {
        result := ComCall(3, this, "ptr", pSyncFilter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbSyncFilter 
     * @param {Pointer<Integer>} pcbSyncFilter 
     * @returns {HRESULT} 
     */
    Serialize(pbSyncFilter, pcbSyncFilter) {
        result := ComCall(4, this, "char*", pbSyncFilter, "uint*", pcbSyncFilter, "HRESULT")
        return result
    }
}
