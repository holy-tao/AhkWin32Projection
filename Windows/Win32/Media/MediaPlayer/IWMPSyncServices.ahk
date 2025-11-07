#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMPSyncDevice.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPSyncServices interface provides methods to enumerate available devices that can synchronize digital media files with Windows Media Player 10 or later.To use this interface, you must create a remoted instance of the Windows Media Player control.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpsyncservices
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPSyncServices extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_deviceCount", "getDevice"]

    /**
     * 
     * @param {Pointer<Integer>} plCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsyncservices-get_devicecount
     */
    get_deviceCount(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @returns {IWMPSyncDevice} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsyncservices-getdevice
     */
    getDevice(lIndex) {
        result := ComCall(4, this, "int", lIndex, "ptr*", &ppDevice := 0, "HRESULT")
        return IWMPSyncDevice(ppDevice)
    }
}
