#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMDMStorageControl.ahk

/**
 * The IWMDMStorageControl2 interface extends IWMDMStorageControl by making it possible to set the name of the destination file when inserting content into a storage.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iwmdmstoragecontrol2
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDMStorageControl2 extends IWMDMStorageControl{
    /**
     * The interface identifier for IWMDMStorageControl2
     * @type {Guid}
     */
    static IID => Guid("{972c2e88-bd6c-4125-8e09-84f837e637b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * 
     * @param {Integer} fuMode 
     * @param {PWSTR} pwszFileSource 
     * @param {PWSTR} pwszFileDest 
     * @param {Pointer<IWMDMOperation>} pOperation 
     * @param {Pointer<IWMDMProgress>} pProgress 
     * @param {Pointer<IUnknown>} pUnknown 
     * @param {Pointer<IWMDMStorage>} ppNewObject 
     * @returns {HRESULT} 
     */
    Insert2(fuMode, pwszFileSource, pwszFileDest, pOperation, pProgress, pUnknown, ppNewObject) {
        pwszFileSource := pwszFileSource is String ? StrPtr(pwszFileSource) : pwszFileSource
        pwszFileDest := pwszFileDest is String ? StrPtr(pwszFileDest) : pwszFileDest

        result := ComCall(8, this, "uint", fuMode, "ptr", pwszFileSource, "ptr", pwszFileDest, "ptr", pOperation, "ptr", pProgress, "ptr", pUnknown, "ptr", ppNewObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
