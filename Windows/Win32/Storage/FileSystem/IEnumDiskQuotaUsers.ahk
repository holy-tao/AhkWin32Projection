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
     * 
     * @param {Integer} cUsers 
     * @param {Pointer<IDiskQuotaUser>} rgUsers 
     * @param {Pointer<UInt32>} pcUsersFetched 
     * @returns {HRESULT} 
     */
    Next(cUsers, rgUsers, pcUsersFetched) {
        result := ComCall(3, this, "uint", cUsers, "ptr", rgUsers, "uint*", pcUsersFetched, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cUsers 
     * @returns {HRESULT} 
     */
    Skip(cUsers) {
        result := ComCall(4, this, "uint", cUsers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumDiskQuotaUsers>} ppEnum 
     * @returns {HRESULT} 
     */
    Clone(ppEnum) {
        result := ComCall(6, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
