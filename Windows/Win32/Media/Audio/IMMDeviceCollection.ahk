#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMMDeviceCollection interface represents a collection of multimedia device resources.
 * @see https://docs.microsoft.com/windows/win32/api//mmdeviceapi/nn-mmdeviceapi-immdevicecollection
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IMMDeviceCollection extends IUnknown{
    /**
     * The interface identifier for IMMDeviceCollection
     * @type {Guid}
     */
    static IID => Guid("{0bd7a1be-7a1a-44db-8397-cc5392387b5e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} pcDevices 
     * @returns {HRESULT} 
     */
    GetCount(pcDevices) {
        result := ComCall(3, this, "uint*", pcDevices, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nDevice 
     * @param {Pointer<IMMDevice>} ppDevice 
     * @returns {HRESULT} 
     */
    Item(nDevice, ppDevice) {
        result := ComCall(4, this, "uint", nDevice, "ptr", ppDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
