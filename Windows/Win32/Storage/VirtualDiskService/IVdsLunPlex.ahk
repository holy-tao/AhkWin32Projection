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
     * 
     * @param {Pointer<VDS_LUN_PLEX_PROP>} pPlexProp 
     * @returns {HRESULT} 
     */
    GetProperties(pPlexProp) {
        result := ComCall(3, this, "ptr", pPlexProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IVdsLun>} ppLun 
     * @returns {HRESULT} 
     */
    GetLun(ppLun) {
        result := ComCall(4, this, "ptr", ppLun, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VDS_DRIVE_EXTENT>} ppExtentArray 
     * @param {Pointer<Int32>} plNumberOfExtents 
     * @returns {HRESULT} 
     */
    QueryExtents(ppExtentArray, plNumberOfExtents) {
        result := ComCall(5, this, "ptr", ppExtentArray, "int*", plNumberOfExtents, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VDS_HINTS>} pHints 
     * @returns {HRESULT} 
     */
    QueryHints(pHints) {
        result := ComCall(6, this, "ptr", pHints, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VDS_HINTS>} pHints 
     * @returns {HRESULT} 
     */
    ApplyHints(pHints) {
        result := ComCall(7, this, "ptr", pHints, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
