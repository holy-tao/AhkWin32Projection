#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPSyncServices interface provides methods to enumerate available devices that can synchronize digital media files with Windows Media Player 10 or later.To use this interface, you must create a remoted instance of the Windows Media Player control.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpsyncservices
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPSyncServices extends IUnknown{
    /**
     * The interface identifier for IWMPSyncServices
     * @type {Guid}
     */
    static IID => Guid("{8b5050ff-e0a4-4808-b3a8-893a9e1ed894}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int32>} plCount 
     * @returns {HRESULT} 
     */
    get_deviceCount(plCount) {
        result := ComCall(3, this, "int*", plCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<IWMPSyncDevice>} ppDevice 
     * @returns {HRESULT} 
     */
    getDevice(lIndex, ppDevice) {
        result := ComCall(4, this, "int", lIndex, "ptr", ppDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
