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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsDirty", "IsDeletedOffline", "IsCreatedOffline", "IsLocallyModifiedData", "IsLocallyModifiedAttributes", "IsLocallyModifiedTime"]

    /**
     * 
     * @param {Pointer<BOOL>} pbDirty 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefileschangeinfo-isdirty
     */
    IsDirty(pbDirty) {
        result := ComCall(3, this, "ptr", pbDirty, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbDeletedOffline 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefileschangeinfo-isdeletedoffline
     */
    IsDeletedOffline(pbDeletedOffline) {
        result := ComCall(4, this, "ptr", pbDeletedOffline, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbCreatedOffline 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefileschangeinfo-iscreatedoffline
     */
    IsCreatedOffline(pbCreatedOffline) {
        result := ComCall(5, this, "ptr", pbCreatedOffline, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbLocallyModifiedData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefileschangeinfo-islocallymodifieddata
     */
    IsLocallyModifiedData(pbLocallyModifiedData) {
        result := ComCall(6, this, "ptr", pbLocallyModifiedData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbLocallyModifiedAttributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefileschangeinfo-islocallymodifiedattributes
     */
    IsLocallyModifiedAttributes(pbLocallyModifiedAttributes) {
        result := ComCall(7, this, "ptr", pbLocallyModifiedAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbLocallyModifiedTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefileschangeinfo-islocallymodifiedtime
     */
    IsLocallyModifiedTime(pbLocallyModifiedTime) {
        result := ComCall(8, this, "ptr", pbLocallyModifiedTime, "HRESULT")
        return result
    }
}
