#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMDSPEnumStorage interface is used to enumerate the storage media on a device.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-imdspenumstorage
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IMDSPEnumStorage extends IUnknown{
    /**
     * The interface identifier for IMDSPEnumStorage
     * @type {Guid}
     */
    static IID => Guid("{1dcb3a15-33ed-11d3-8470-00c04f79dbc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<IMDSPStorage>} ppStorage 
     * @param {Pointer<UInt32>} pceltFetched 
     * @returns {HRESULT} 
     */
    Next(celt, ppStorage, pceltFetched) {
        result := ComCall(3, this, "uint", celt, "ptr", ppStorage, "uint*", pceltFetched, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<UInt32>} pceltFetched 
     * @returns {HRESULT} 
     */
    Skip(celt, pceltFetched) {
        result := ComCall(4, this, "uint", celt, "uint*", pceltFetched, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMDSPEnumStorage>} ppEnumStorage 
     * @returns {HRESULT} 
     */
    Clone(ppEnumStorage) {
        result := ComCall(6, this, "ptr", ppEnumStorage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
