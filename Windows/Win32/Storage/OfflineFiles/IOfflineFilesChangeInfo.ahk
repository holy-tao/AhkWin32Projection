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
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefileschangeinfo-isdirty
     */
    IsDirty() {
        result := ComCall(3, this, "int*", &pbDirty := 0, "int")
        return pbDirty
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefileschangeinfo-isdeletedoffline
     */
    IsDeletedOffline() {
        result := ComCall(4, this, "int*", &pbDeletedOffline := 0, "HRESULT")
        return pbDeletedOffline
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefileschangeinfo-iscreatedoffline
     */
    IsCreatedOffline() {
        result := ComCall(5, this, "int*", &pbCreatedOffline := 0, "HRESULT")
        return pbCreatedOffline
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefileschangeinfo-islocallymodifieddata
     */
    IsLocallyModifiedData() {
        result := ComCall(6, this, "int*", &pbLocallyModifiedData := 0, "HRESULT")
        return pbLocallyModifiedData
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefileschangeinfo-islocallymodifiedattributes
     */
    IsLocallyModifiedAttributes() {
        result := ComCall(7, this, "int*", &pbLocallyModifiedAttributes := 0, "HRESULT")
        return pbLocallyModifiedAttributes
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefileschangeinfo-islocallymodifiedtime
     */
    IsLocallyModifiedTime() {
        result := ComCall(8, this, "int*", &pbLocallyModifiedTime := 0, "HRESULT")
        return pbLocallyModifiedTime
    }
}
