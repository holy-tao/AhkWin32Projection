#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOfflineFilesItem.ahk

/**
 * Represents a file item in the Offline Files cache.
 * @see https://docs.microsoft.com/windows/win32/api//cscobj/nn-cscobj-iofflinefilesfileitem
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class IOfflineFilesFileItem extends IOfflineFilesItem{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOfflineFilesFileItem
     * @type {Guid}
     */
    static IID => Guid("{8dfadead-26c2-4eff-8a72-6b50723d9a00}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsSparse", "IsEncrypted"]

    /**
     * Determines whether an item in the Offline Files cache is sparsely cached.
     * @returns {BOOL} Receives <b>TRUE</b> if the item is sparsely cached, or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesfileitem-issparse
     */
    IsSparse() {
        result := ComCall(8, this, "int*", &pbIsSparse := 0, "HRESULT")
        return pbIsSparse
    }

    /**
     * Determines whether an item in the Offline Files cache is encrypted.
     * @returns {BOOL} Receives <b>TRUE</b> if the item is encrypted, or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesfileitem-isencrypted
     */
    IsEncrypted() {
        result := ComCall(9, this, "int*", &pbIsEncrypted := 0, "HRESULT")
        return pbIsEncrypted
    }
}
