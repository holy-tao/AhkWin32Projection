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
     */
    deviceCount {
        get => this.get_deviceCount()
    }

    /**
     * The get_deviceCount method retrieves the number of available devices.
     * @param {Pointer<Integer>} plCount Pointer to a <b>long</b> that contains the device count.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_PDA_INITIALIZINGDEVICES (0xC00D118D)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows Media Player is currently busy initializing devices. Please try again later.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsyncservices-get_devicecount
     */
    get_deviceCount(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * The getDevice method retrieves a pointer to a device interface.
     * @param {Integer} lIndex <b>long</b> that contains the index of the device to retrieve. Device indexes are zero-based.
     * @returns {IWMPSyncDevice} Pointer to a pointer to an <b>IWMPSyncDevice</b> interface that represents the device having the specified index.
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsyncservices-getdevice
     */
    getDevice(lIndex) {
        result := ComCall(4, this, "int", lIndex, "ptr*", &ppDevice := 0, "HRESULT")
        return IWMPSyncDevice(ppDevice)
    }
}
