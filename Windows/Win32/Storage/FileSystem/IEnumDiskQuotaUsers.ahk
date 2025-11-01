#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enumerates user quota entries on the volume.
 * @see https://docs.microsoft.com/windows/win32/api//dskquota/nn-dskquota-ienumdiskquotausers
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class IEnumDiskQuotaUsers extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumDiskQuotaUsers
     * @type {Guid}
     */
    static IID => Guid("{7988b577-ec89-11cf-9c00-00aa00a14f56}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone"]

    /**
     * 
     * @param {Integer} cUsers 
     * @param {Pointer<IDiskQuotaUser>} rgUsers 
     * @param {Pointer<Integer>} pcUsersFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-ienumdiskquotausers-next
     */
    Next(cUsers, rgUsers, pcUsersFetched) {
        result := ComCall(3, this, "uint", cUsers, "ptr*", rgUsers, "uint*", pcUsersFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cUsers 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-ienumdiskquotausers-skip
     */
    Skip(cUsers) {
        result := ComCall(4, this, "uint", cUsers, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-ienumdiskquotausers-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumDiskQuotaUsers>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-ienumdiskquotausers-clone
     */
    Clone(ppEnum) {
        result := ComCall(6, this, "ptr*", ppEnum, "HRESULT")
        return result
    }
}
