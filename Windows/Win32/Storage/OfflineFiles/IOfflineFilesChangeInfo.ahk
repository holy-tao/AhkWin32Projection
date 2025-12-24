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
     * Determines whether an item in the Offline Files cache has been modified.
     * @returns {BOOL} Receives <b>TRUE</b> if the item has been modified in some way while working offline, or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefileschangeinfo-isdirty
     */
    IsDirty() {
        result := ComCall(3, this, "int*", &pbDirty := 0, "int")
        return pbDirty
    }

    /**
     * Determines whether an item has been deleted from the Offline Files cache while working offline.
     * @returns {BOOL} Receives <b>TRUE</b> if the item has been deleted from the Offline Files cache while working offline, or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefileschangeinfo-isdeletedoffline
     */
    IsDeletedOffline() {
        result := ComCall(4, this, "int*", &pbDeletedOffline := 0, "HRESULT")
        return pbDeletedOffline
    }

    /**
     * Determines whether an item was created in the Offline Files cache while working offline.
     * @returns {BOOL} Receives <b>TRUE</b> if the item was created in the Offline Files cache while working offline, or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefileschangeinfo-iscreatedoffline
     */
    IsCreatedOffline() {
        result := ComCall(5, this, "int*", &pbCreatedOffline := 0, "HRESULT")
        return pbCreatedOffline
    }

    /**
     * Determines whether an item's data was modified while working offline.
     * @returns {BOOL} Receives <b>TRUE</b> if the item's data was modified in the Offline Files cache while working offline, or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefileschangeinfo-islocallymodifieddata
     */
    IsLocallyModifiedData() {
        result := ComCall(6, this, "int*", &pbLocallyModifiedData := 0, "HRESULT")
        return pbLocallyModifiedData
    }

    /**
     * Determines whether one or more of an item's attributes were modified while working offline.
     * @returns {BOOL} Receives <b>TRUE</b> if one or more of the item's attributes were modified in the Offline Files cache while working offline, or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefileschangeinfo-islocallymodifiedattributes
     */
    IsLocallyModifiedAttributes() {
        result := ComCall(7, this, "int*", &pbLocallyModifiedAttributes := 0, "HRESULT")
        return pbLocallyModifiedAttributes
    }

    /**
     * Determines whether one or more of an item's time values were modified while working offline.
     * @returns {BOOL} Receives <b>TRUE</b> if one or more of the item's time values were modified in the Offline Files cache while working offline, or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefileschangeinfo-islocallymodifiedtime
     */
    IsLocallyModifiedTime() {
        result := ComCall(8, this, "int*", &pbLocallyModifiedTime := 0, "HRESULT")
        return pbLocallyModifiedTime
    }
}
