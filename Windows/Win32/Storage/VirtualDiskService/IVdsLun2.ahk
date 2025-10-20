#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for applying and querying logical unit number (LUN) hints.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdslun2
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsLun2 extends IUnknown{
    /**
     * The interface identifier for IVdsLun2
     * @type {Guid}
     */
    static IID => Guid("{e5b3a735-9efb-499a-8071-4394d9ee6fcb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<VDS_HINTS2>} pHints2 
     * @returns {HRESULT} 
     */
    QueryHints2(pHints2) {
        result := ComCall(3, this, "ptr", pHints2, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VDS_HINTS2>} pHints2 
     * @returns {HRESULT} 
     */
    ApplyHints2(pHints2) {
        result := ComCall(4, this, "ptr", pHints2, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
