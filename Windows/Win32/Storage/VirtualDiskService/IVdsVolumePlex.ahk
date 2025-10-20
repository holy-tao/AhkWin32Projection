#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for maintaining volume plexes.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsvolumeplex
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsVolumePlex extends IUnknown{
    /**
     * The interface identifier for IVdsVolumePlex
     * @type {Guid}
     */
    static IID => Guid("{4daa0135-e1d1-40f1-aaa5-3cc1e53221c3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<VDS_VOLUME_PLEX_PROP>} pPlexProperties 
     * @returns {HRESULT} 
     */
    GetProperties(pPlexProperties) {
        result := ComCall(3, this, "ptr", pPlexProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IVdsVolume>} ppVolume 
     * @returns {HRESULT} 
     */
    GetVolume(ppVolume) {
        result := ComCall(4, this, "ptr", ppVolume, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VDS_DISK_EXTENT>} ppExtentArray 
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
     * @param {Pointer<VDS_INPUT_DISK>} pInputDiskArray 
     * @param {Integer} lNumberOfDisks 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     */
    Repair(pInputDiskArray, lNumberOfDisks, ppAsync) {
        result := ComCall(6, this, "ptr", pInputDiskArray, "int", lNumberOfDisks, "ptr", ppAsync, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
