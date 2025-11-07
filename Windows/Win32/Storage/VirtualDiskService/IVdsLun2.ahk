#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VDS_HINTS2.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for applying and querying logical unit number (LUN) hints.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdslun2
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsLun2 extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryHints2", "ApplyHints2"]

    /**
     * 
     * @returns {VDS_HINTS2} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslun2-queryhints2
     */
    QueryHints2() {
        pHints2 := VDS_HINTS2()
        result := ComCall(3, this, "ptr", pHints2, "HRESULT")
        return pHints2
    }

    /**
     * 
     * @param {Pointer<VDS_HINTS2>} pHints2 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslun2-applyhints2
     */
    ApplyHints2(pHints2) {
        result := ComCall(4, this, "ptr", pHints2, "HRESULT")
        return result
    }
}
