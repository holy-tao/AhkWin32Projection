#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents the information associated with local changes made to an item while working offline.
 * @see https://docs.microsoft.com/windows/win32/api//cscobj/nn-cscobj-iofflinefileschangeinfo
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class IOfflineFilesChangeInfo extends IUnknown{
    /**
     * The interface identifier for IOfflineFilesChangeInfo
     * @type {Guid}
     */
    static IID => Guid("{a96e6fa4-e0d1-4c29-960b-ee508fe68c72}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BOOL>} pbDirty 
     * @returns {HRESULT} 
     */
    IsDirty(pbDirty) {
        result := ComCall(3, this, "ptr", pbDirty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbDeletedOffline 
     * @returns {HRESULT} 
     */
    IsDeletedOffline(pbDeletedOffline) {
        result := ComCall(4, this, "ptr", pbDeletedOffline, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbCreatedOffline 
     * @returns {HRESULT} 
     */
    IsCreatedOffline(pbCreatedOffline) {
        result := ComCall(5, this, "ptr", pbCreatedOffline, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbLocallyModifiedData 
     * @returns {HRESULT} 
     */
    IsLocallyModifiedData(pbLocallyModifiedData) {
        result := ComCall(6, this, "ptr", pbLocallyModifiedData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbLocallyModifiedAttributes 
     * @returns {HRESULT} 
     */
    IsLocallyModifiedAttributes(pbLocallyModifiedAttributes) {
        result := ComCall(7, this, "ptr", pbLocallyModifiedAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbLocallyModifiedTime 
     * @returns {HRESULT} 
     */
    IsLocallyModifiedTime(pbLocallyModifiedTime) {
        result := ComCall(8, this, "ptr", pbLocallyModifiedTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
