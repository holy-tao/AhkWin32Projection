#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMDMStorageControl2.ahk

/**
 * The IWMDMStorageControl3 interface extends IWMDMStorageControl2 by providing an Insert method that accepts an IWMDMMetaData interface pointer.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iwmdmstoragecontrol3
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDMStorageControl3 extends IWMDMStorageControl2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDMStorageControl3
     * @type {Guid}
     */
    static IID => Guid("{b3266365-d4f3-4696-8d53-bd27ec60993a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Insert3"]

    /**
     * 
     * @param {Integer} fuMode 
     * @param {Integer} fuType 
     * @param {PWSTR} pwszFileSource 
     * @param {PWSTR} pwszFileDest 
     * @param {IWMDMOperation} pOperation 
     * @param {IWMDMProgress} pProgress 
     * @param {IWMDMMetaData} pMetaData 
     * @param {IUnknown} pUnknown 
     * @param {Pointer<IWMDMStorage>} ppNewObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstoragecontrol3-insert3
     */
    Insert3(fuMode, fuType, pwszFileSource, pwszFileDest, pOperation, pProgress, pMetaData, pUnknown, ppNewObject) {
        pwszFileSource := pwszFileSource is String ? StrPtr(pwszFileSource) : pwszFileSource
        pwszFileDest := pwszFileDest is String ? StrPtr(pwszFileDest) : pwszFileDest

        result := ComCall(9, this, "uint", fuMode, "uint", fuType, "ptr", pwszFileSource, "ptr", pwszFileDest, "ptr", pOperation, "ptr", pProgress, "ptr", pMetaData, "ptr", pUnknown, "ptr*", ppNewObject, "HRESULT")
        return result
    }
}
