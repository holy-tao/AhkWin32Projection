#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * An instance of the IWMDMStorage interface provides methods to examine and explore a storage (a generic name for a data or collection object, such as a file, folder, or playlist) on a device.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iwmdmstorage
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDMStorage extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDMStorage
     * @type {Guid}
     */
    static IID => Guid("{1dcb3a06-33ed-11d3-8470-00c04f79dbc0}")

    /**
     * The class identifier for WMDMStorage
     * @type {Guid}
     */
    static CLSID => Guid("{807b3ce0-357a-11d3-8471-00c04f79dbc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAttributes", "GetStorageGlobals", "GetAttributes", "GetName", "GetDate", "GetSize", "GetRights", "EnumStorage", "SendOpaqueCommand"]

    /**
     * 
     * @param {Integer} dwAttributes 
     * @param {Pointer<WAVEFORMATEX>} pFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstorage-setattributes
     */
    SetAttributes(dwAttributes, pFormat) {
        result := ComCall(3, this, "uint", dwAttributes, "ptr", pFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWMDMStorageGlobals>} ppStorageGlobals 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstorage-getstorageglobals
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
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstorage-getattributes
     */
    GetAttributes(pdwAttributes, pFormat) {
        result := ComCall(5, this, "uint*", pdwAttributes, "ptr", pFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszName 
     * @param {Integer} nMaxChars 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstorage-getname
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
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstorage-getdate
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
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstorage-getsize
     */
    GetSize(pdwSizeLow, pdwSizeHigh) {
        result := ComCall(8, this, "uint*", pdwSizeLow, "uint*", pdwSizeHigh, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<WMDMRIGHTS>>} ppRights 
     * @param {Pointer<Integer>} pnRightsCount 
     * @param {Pointer<Integer>} abMac 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstorage-getrights
     */
    GetRights(ppRights, pnRightsCount, abMac) {
        result := ComCall(9, this, "ptr*", ppRights, "uint*", pnRightsCount, "char*", abMac, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWMDMEnumStorage>} pEnumStorage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstorage-enumstorage
     */
    EnumStorage(pEnumStorage) {
        result := ComCall(10, this, "ptr*", pEnumStorage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<OPAQUECOMMAND>} pCommand 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstorage-sendopaquecommand
     */
    SendOpaqueCommand(pCommand) {
        result := ComCall(11, this, "ptr", pCommand, "HRESULT")
        return result
    }
}
