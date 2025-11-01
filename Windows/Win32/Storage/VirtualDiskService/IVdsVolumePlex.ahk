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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperties", "GetVolume", "QueryExtents", "Repair"]

    /**
     * 
     * @param {Pointer<VDS_VOLUME_PLEX_PROP>} pPlexProperties 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvolumeplex-getproperties
     */
    GetProperties(pPlexProperties) {
        result := ComCall(3, this, "ptr", pPlexProperties, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IVdsVolume>} ppVolume 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvolumeplex-getvolume
     */
    GetVolume(ppVolume) {
        result := ComCall(4, this, "ptr*", ppVolume, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<VDS_DISK_EXTENT>>} ppExtentArray 
     * @param {Pointer<Integer>} plNumberOfExtents 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvolumeplex-queryextents
     */
    QueryExtents(ppExtentArray, plNumberOfExtents) {
        plNumberOfExtentsMarshal := plNumberOfExtents is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "ptr*", ppExtentArray, plNumberOfExtentsMarshal, plNumberOfExtents, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VDS_INPUT_DISK>} pInputDiskArray 
     * @param {Integer} lNumberOfDisks 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvolumeplex-repair
     */
    Repair(pInputDiskArray, lNumberOfDisks, ppAsync) {
        result := ComCall(6, this, "ptr", pInputDiskArray, "int", lNumberOfDisks, "ptr*", ppAsync, "HRESULT")
        return result
    }
}
