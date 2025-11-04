#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMDSPStorage interface provides an instanced-based association with a storage medium on a device.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-imdspstorage
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IMDSPStorage extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMDSPStorage
     * @type {Guid}
     */
    static IID => Guid("{1dcb3a16-33ed-11d3-8470-00c04f79dbc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAttributes", "GetStorageGlobals", "GetAttributes", "GetName", "GetDate", "GetSize", "GetRights", "CreateStorage", "EnumStorage", "SendOpaqueCommand"]

    /**
     * 
     * @param {Integer} dwAttributes 
     * @param {Pointer<WAVEFORMATEX>} pFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspstorage-setattributes
     */
    SetAttributes(dwAttributes, pFormat) {
        result := ComCall(3, this, "uint", dwAttributes, "ptr", pFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMDSPStorageGlobals>} ppStorageGlobals 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspstorage-getstorageglobals
     */
    GetStorageGlobals(ppStorageGlobals) {
        result := ComCall(4, this, "ptr*", ppStorageGlobals, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwAttributes 
     * @param {Pointer<WAVEFORMATEX>} pFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspstorage-getattributes
     */
    GetAttributes(pdwAttributes, pFormat) {
        pdwAttributesMarshal := pdwAttributes is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pdwAttributesMarshal, pdwAttributes, "ptr", pFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszName 
     * @param {Integer} nMaxChars 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspstorage-getname
     */
    GetName(pwszName, nMaxChars) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(6, this, "ptr", pwszName, "uint", nMaxChars, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WMDMDATETIME>} pDateTimeUTC 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspstorage-getdate
     */
    GetDate(pDateTimeUTC) {
        result := ComCall(7, this, "ptr", pDateTimeUTC, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwSizeLow 
     * @param {Pointer<Integer>} pdwSizeHigh 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspstorage-getsize
     */
    GetSize(pdwSizeLow, pdwSizeHigh) {
        pdwSizeLowMarshal := pdwSizeLow is VarRef ? "uint*" : "ptr"
        pdwSizeHighMarshal := pdwSizeHigh is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pdwSizeLowMarshal, pdwSizeLow, pdwSizeHighMarshal, pdwSizeHigh, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<WMDMRIGHTS>>} ppRights 
     * @param {Pointer<Integer>} pnRightsCount 
     * @param {Pointer<Integer>} abMac 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspstorage-getrights
     */
    GetRights(ppRights, pnRightsCount, abMac) {
        ppRightsMarshal := ppRights is VarRef ? "ptr*" : "ptr"
        pnRightsCountMarshal := pnRightsCount is VarRef ? "uint*" : "ptr"
        abMacMarshal := abMac is VarRef ? "char*" : "ptr"

        result := ComCall(9, this, ppRightsMarshal, ppRights, pnRightsCountMarshal, pnRightsCount, abMacMarshal, abMac, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwAttributes 
     * @param {Pointer<WAVEFORMATEX>} pFormat 
     * @param {PWSTR} pwszName 
     * @param {Pointer<IMDSPStorage>} ppNewStorage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspstorage-createstorage
     */
    CreateStorage(dwAttributes, pFormat, pwszName, ppNewStorage) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(10, this, "uint", dwAttributes, "ptr", pFormat, "ptr", pwszName, "ptr*", ppNewStorage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMDSPEnumStorage>} ppEnumStorage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspstorage-enumstorage
     */
    EnumStorage(ppEnumStorage) {
        result := ComCall(11, this, "ptr*", ppEnumStorage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<OPAQUECOMMAND>} pCommand 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspstorage-sendopaquecommand
     */
    SendOpaqueCommand(pCommand) {
        result := ComCall(12, this, "ptr", pCommand, "HRESULT")
        return result
    }
}
