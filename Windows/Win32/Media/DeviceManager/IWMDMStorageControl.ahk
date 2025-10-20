#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMDMStorageControl interface is used to insert, delete, or move files within a storage, a device, or between a device and the computer.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iwmdmstoragecontrol
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDMStorageControl extends IUnknown{
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
     * 
     * @param {Integer} fuMode 
     * @param {PWSTR} pwszFile 
     * @param {Pointer<IWMDMOperation>} pOperation 
     * @param {Pointer<IWMDMProgress>} pProgress 
     * @param {Pointer<IWMDMStorage>} ppNewObject 
     * @returns {HRESULT} 
     */
    Insert(fuMode, pwszFile, pOperation, pProgress, ppNewObject) {
        pwszFile := pwszFile is String ? StrPtr(pwszFile) : pwszFile

        result := ComCall(3, this, "uint", fuMode, "ptr", pwszFile, "ptr", pOperation, "ptr", pProgress, "ptr", ppNewObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} fuMode 
     * @param {Pointer<IWMDMProgress>} pProgress 
     * @returns {HRESULT} 
     */
    Delete(fuMode, pProgress) {
        result := ComCall(4, this, "uint", fuMode, "ptr", pProgress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} fuMode 
     * @param {PWSTR} pwszNewName 
     * @param {Pointer<IWMDMProgress>} pProgress 
     * @returns {HRESULT} 
     */
    Rename(fuMode, pwszNewName, pProgress) {
        pwszNewName := pwszNewName is String ? StrPtr(pwszNewName) : pwszNewName

        result := ComCall(5, this, "uint", fuMode, "ptr", pwszNewName, "ptr", pProgress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} fuMode 
     * @param {PWSTR} pwszFile 
     * @param {Pointer<IWMDMProgress>} pProgress 
     * @param {Pointer<IWMDMOperation>} pOperation 
     * @returns {HRESULT} 
     */
    Read(fuMode, pwszFile, pProgress, pOperation) {
        pwszFile := pwszFile is String ? StrPtr(pwszFile) : pwszFile

        result := ComCall(6, this, "uint", fuMode, "ptr", pwszFile, "ptr", pProgress, "ptr", pOperation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} fuMode 
     * @param {Pointer<IWMDMStorage>} pTargetObject 
     * @param {Pointer<IWMDMProgress>} pProgress 
     * @returns {HRESULT} 
     */
    Move(fuMode, pTargetObject, pProgress) {
        result := ComCall(7, this, "uint", fuMode, "ptr", pTargetObject, "ptr", pProgress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
