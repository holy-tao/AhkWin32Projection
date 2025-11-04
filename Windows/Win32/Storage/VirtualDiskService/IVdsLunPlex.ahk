#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for performing query and configuration operations on a LUN plex.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdslunplex
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsLunPlex extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsLunPlex
     * @type {Guid}
     */
    static IID => Guid("{0ee1a790-5d2e-4abb-8c99-c481e8be2138}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperties", "GetLun", "QueryExtents", "QueryHints", "ApplyHints"]

    /**
     * 
     * @param {Pointer<VDS_LUN_PLEX_PROP>} pPlexProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslunplex-getproperties
     */
    GetProperties(pPlexProp) {
        result := ComCall(3, this, "ptr", pPlexProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IVdsLun>} ppLun 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslunplex-getlun
     */
    GetLun(ppLun) {
        result := ComCall(4, this, "ptr*", ppLun, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<VDS_DRIVE_EXTENT>>} ppExtentArray 
     * @param {Pointer<Integer>} plNumberOfExtents 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslunplex-queryextents
     */
    QueryExtents(ppExtentArray, plNumberOfExtents) {
        ppExtentArrayMarshal := ppExtentArray is VarRef ? "ptr*" : "ptr"
        plNumberOfExtentsMarshal := plNumberOfExtents is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, ppExtentArrayMarshal, ppExtentArray, plNumberOfExtentsMarshal, plNumberOfExtents, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VDS_HINTS>} pHints 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslunplex-queryhints
     */
    QueryHints(pHints) {
        result := ComCall(6, this, "ptr", pHints, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VDS_HINTS>} pHints 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslunplex-applyhints
     */
    ApplyHints(pHints) {
        result := ComCall(7, this, "ptr", pHints, "HRESULT")
        return result
    }
}
