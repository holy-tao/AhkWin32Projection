#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMDeviceManager interface is the top level Windows Media Device Manager interface for applications.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iwmdevicemanager
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDeviceManager extends IUnknown{
    /**
     * The interface identifier for IWMDeviceManager
     * @type {Guid}
     */
    static IID => Guid("{1dcb3a00-33ed-11d3-8470-00c04f79dbc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} pdwRevision 
     * @returns {HRESULT} 
     */
    GetRevision(pdwRevision) {
        result := ComCall(3, this, "uint*", pdwRevision, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwCount 
     * @returns {HRESULT} 
     */
    GetDeviceCount(pdwCount) {
        result := ComCall(4, this, "uint*", pdwCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMDMEnumDevice>} ppEnumDevice 
     * @returns {HRESULT} 
     */
    EnumDevices(ppEnumDevice) {
        result := ComCall(5, this, "ptr", ppEnumDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
