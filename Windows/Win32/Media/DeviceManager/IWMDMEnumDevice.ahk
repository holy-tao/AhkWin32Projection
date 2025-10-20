#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMDMEnumDevice interface enumerates portable devices attached to a computer. To obtain this interface, call IWMDeviceManager::EnumDevices.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iwmdmenumdevice
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDMEnumDevice extends IUnknown{
    /**
     * The interface identifier for IWMDMEnumDevice
     * @type {Guid}
     */
    static IID => Guid("{1dcb3a01-33ed-11d3-8470-00c04f79dbc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<IWMDMDevice>} ppDevice 
     * @param {Pointer<UInt32>} pceltFetched 
     * @returns {HRESULT} 
     */
    Next(celt, ppDevice, pceltFetched) {
        result := ComCall(3, this, "uint", celt, "ptr", ppDevice, "uint*", pceltFetched, "int")
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
     * @param {Pointer<IWMDMEnumDevice>} ppEnumDevice 
     * @returns {HRESULT} 
     */
    Clone(ppEnumDevice) {
        result := ComCall(6, this, "ptr", ppEnumDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
