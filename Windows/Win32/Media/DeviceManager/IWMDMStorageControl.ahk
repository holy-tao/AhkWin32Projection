#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMDMStorage.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMDMStorageControl interface is used to insert, delete, or move files within a storage, a device, or between a device and the computer.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iwmdmstoragecontrol
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDMStorageControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDMStorageControl
     * @type {Guid}
     */
    static IID => Guid("{1dcb3a08-33ed-11d3-8470-00c04f79dbc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Insert", "Delete", "Rename", "Read", "Move"]

    /**
     * 
     * @param {Integer} fuMode 
     * @param {PWSTR} pwszFile 
     * @param {IWMDMOperation} pOperation 
     * @param {IWMDMProgress} pProgress 
     * @returns {IWMDMStorage} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstoragecontrol-insert
     */
    Insert(fuMode, pwszFile, pOperation, pProgress) {
        pwszFile := pwszFile is String ? StrPtr(pwszFile) : pwszFile

        result := ComCall(3, this, "uint", fuMode, "ptr", pwszFile, "ptr", pOperation, "ptr", pProgress, "ptr*", &ppNewObject := 0, "HRESULT")
        return IWMDMStorage(ppNewObject)
    }

    /**
     * 
     * @param {Integer} fuMode 
     * @param {IWMDMProgress} pProgress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstoragecontrol-delete
     */
    Delete(fuMode, pProgress) {
        result := ComCall(4, this, "uint", fuMode, "ptr", pProgress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} fuMode 
     * @param {PWSTR} pwszNewName 
     * @param {IWMDMProgress} pProgress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstoragecontrol-rename
     */
    Rename(fuMode, pwszNewName, pProgress) {
        pwszNewName := pwszNewName is String ? StrPtr(pwszNewName) : pwszNewName

        result := ComCall(5, this, "uint", fuMode, "ptr", pwszNewName, "ptr", pProgress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} fuMode 
     * @param {PWSTR} pwszFile 
     * @param {IWMDMProgress} pProgress 
     * @param {IWMDMOperation} pOperation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstoragecontrol-read
     */
    Read(fuMode, pwszFile, pProgress, pOperation) {
        pwszFile := pwszFile is String ? StrPtr(pwszFile) : pwszFile

        result := ComCall(6, this, "uint", fuMode, "ptr", pwszFile, "ptr", pProgress, "ptr", pOperation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} fuMode 
     * @param {IWMDMStorage} pTargetObject 
     * @param {IWMDMProgress} pProgress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstoragecontrol-move
     */
    Move(fuMode, pTargetObject, pProgress) {
        result := ComCall(7, this, "uint", fuMode, "ptr", pTargetObject, "ptr", pProgress, "HRESULT")
        return result
    }
}
