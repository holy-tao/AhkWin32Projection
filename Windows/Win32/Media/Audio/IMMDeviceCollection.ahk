#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMMDevice.ahk" { IMMDevice }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IMMDeviceCollection interface represents a collection of multimedia device resources.
 * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nn-mmdeviceapi-immdevicecollection
 * @namespace Windows.Win32.Media.Audio
 */
export default struct IMMDeviceCollection extends IUnknown {
    /**
     * The interface identifier for IMMDeviceCollection
     * @type {Guid}
     */
    static IID := Guid("{0bd7a1be-7a1a-44db-8397-cc5392387b5e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMMDeviceCollection interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCount : IntPtr
        Item     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMMDeviceCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetCount method retrieves a count of the devices in the device collection.
     * @remarks
     * For a code example that calls the <b>GetCount</b> method, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/device-properties">Device Properties</a>.
     * @returns {Integer} Pointer to a <b>UINT</b> variable into which the method writes the number of devices in the device collection.
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-immdevicecollection-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &pcDevices := 0, "HRESULT")
        return pcDevices
    }

    /**
     * The Item method retrieves a pointer to the specified item in the device collection.
     * @remarks
     * This method retrieves a pointer to the <b>IMMDevice</b> interface of the specified item in the device collection. Each item in the collection is an endpoint object that represents an audio endpoint device. The caller selects a device from the device collection by specifying the device number. For a collection of <i>n</i> devices, valid device numbers range from 0 to <i>n</i>– 1. To obtain a count of the devices in a collection, call the <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nf-mmdeviceapi-immdevicecollection-getcount">IMMDeviceCollection::GetCount</a> method.
     * 
     * For a code example that calls the <b>Item</b> method, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/device-properties">Device Properties</a>.
     * @param {Integer} nDevice The device number. If the collection contains <i>n</i> devices, the devices are numbered 0 to <i>n</i>– 1.
     * @returns {IMMDevice} Pointer to a pointer variable into which the method writes the address of the <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nn-mmdeviceapi-immdevice">IMMDevice</a> interface of the specified item in the device collection. Through this method, the caller obtains a counted reference to the interface. The caller is responsible for releasing the interface, when it is no longer needed, by calling the interface's <b>Release</b> method. If the <b>Item</b> call fails,  <i>*ppDevice</i> is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-immdevicecollection-item
     */
    Item(nDevice) {
        result := ComCall(4, this, "uint", nDevice, "ptr*", &ppDevice := 0, "HRESULT")
        return IMMDevice(ppDevice)
    }

    Query(iid) {
        if (IMMDeviceCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCount := CallbackCreate(GetMethod(implObj, "GetCount"), flags, 2)
        this.vtbl.Item := CallbackCreate(GetMethod(implObj, "Item"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCount)
        CallbackFree(this.vtbl.Item)
    }
}
