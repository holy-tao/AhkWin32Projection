#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMMDevice.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMMDeviceCollection interface represents a collection of multimedia device resources.
 * @see https://docs.microsoft.com/windows/win32/api//mmdeviceapi/nn-mmdeviceapi-immdevicecollection
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IMMDeviceCollection extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "Item"]

    /**
     * The GetCount method retrieves a count of the devices in the device collection.
     * @returns {Integer} Pointer to a <b>UINT</b> variable into which the method writes the number of devices in the device collection.
     * @see https://docs.microsoft.com/windows/win32/api//mmdeviceapi/nf-mmdeviceapi-immdevicecollection-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &pcDevices := 0, "HRESULT")
        return pcDevices
    }

    /**
     * The Item method retrieves a pointer to the specified item in the device collection.
     * @param {Integer} nDevice The device number. If the collection contains <i>n</i> devices, the devices are numbered 0 to <i>n</i>– 1.
     * @returns {IMMDevice} Pointer to a pointer variable into which the method writes the address of the <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nn-mmdeviceapi-immdevice">IMMDevice</a> interface of the specified item in the device collection. Through this method, the caller obtains a counted reference to the interface. The caller is responsible for releasing the interface, when it is no longer needed, by calling the interface's <b>Release</b> method. If the <b>Item</b> call fails,  <i>*ppDevice</i> is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mmdeviceapi/nf-mmdeviceapi-immdevicecollection-item
     */
    Item(nDevice) {
        result := ComCall(4, this, "uint", nDevice, "ptr*", &ppDevice := 0, "HRESULT")
        return IMMDevice(ppDevice)
    }
}
