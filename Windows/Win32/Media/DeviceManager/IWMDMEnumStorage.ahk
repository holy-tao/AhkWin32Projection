#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMDMEnumStorage interface enumerates storages on a device.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iwmdmenumstorage
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDMEnumStorage extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDMEnumStorage
     * @type {Guid}
     */
    static IID => Guid("{1dcb3a05-33ed-11d3-8470-00c04f79dbc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone"]

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<IWMDMStorage>} ppStorage 
     * @param {Pointer<Integer>} pceltFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmenumstorage-next
     */
    Next(celt, ppStorage, pceltFetched) {
        result := ComCall(3, this, "uint", celt, "ptr*", ppStorage, "uint*", pceltFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<Integer>} pceltFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmenumstorage-skip
     */
    Skip(celt, pceltFetched) {
        result := ComCall(4, this, "uint", celt, "uint*", pceltFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmenumstorage-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWMDMEnumStorage>} ppEnumStorage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmenumstorage-clone
     */
    Clone(ppEnumStorage) {
        result := ComCall(6, this, "ptr*", ppEnumStorage, "HRESULT")
        return result
    }
}
