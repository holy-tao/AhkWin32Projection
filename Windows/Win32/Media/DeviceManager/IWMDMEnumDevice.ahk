#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWMDMDevice.ahk" { IWMDMDevice }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWMDMEnumDevice interface enumerates portable devices attached to a computer. To obtain this interface, call IWMDeviceManager::EnumDevices.
 * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nn-mswmdm-iwmdmenumdevice
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct IWMDMEnumDevice extends IUnknown {
    /**
     * The interface identifier for IWMDMEnumDevice
     * @type {Guid}
     */
    static IID := Guid("{1dcb3a01-33ed-11d3-8470-00c04f79dbc0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMDMEnumDevice interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMDMEnumDevice.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Next method returns a pointer to the next device, represented by an IWMDMDevice interface.
     * @remarks
     * The returned device interface(s) are based on a cached list of devices. If a Plug and Play device is attached or removed, the current enumerator will not reflect that, and therefore, <b>Next</b> will return devices based on the cached list. Applications should obtain a new enumerator object by calling <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdevicemanager-enumdevices">IWMDeviceManager::EnumDevices</a> to get a refreshed list of devices.
     * 
     * If you only want to retrieve a single interface at a time, you do not need to allocate an array for this method, as shown in the following code:
     * 
     * 
     * ```cpp
     * 
     * // Get a device enumerator to examine each device.
     * CComPtr<IWMDeviceManager2> pIWMDevMgr2;
     * hr = m_IWMDeviceMgr->QueryInterface (__uuidof(IWMDeviceManager2), (void**) &pIWMDevMgr2);
     * if (hr == S_OK)
     * {
     *     // TODO: Display a message that the application retrieved IWMDeviceManager2.
     * }
     * else
     * {
     *     // TODO: Display a message that the application was not able to 
     *     // retrieve IWMDeviceManager2 in EnumDevices.
     *     return hr;
     * }
     * 
     * // Enumerate through the devices using the faster EnumDevices2 plug-and-play method.
     * CComPtr<IWMDMEnumDevice> pEnumDevice;
     * hr = pIWMDevMgr2->EnumDevices2(&pEnumDevice);
     * if (hr != S_OK)
     * {
     *     //.TODO: Display a message that an error occurred in calling EnumDevices2.
     *     return hr;
     * }
     * 
     * // Enumerate through devices.
     * IWMDMDevice *pIWMDMDevice;
     * ULONG ulFetched = 0;
     * while(pEnumDevice->Next(1, &pIWMDMDevice, &ulFetched) == S_OK)
     * {
     *     if (ulFetched != 1)
     *     {
     *         return E_FAIL;
     *     }
     *     // Do some stuff here....
     * }
     * 
     * ```
     * @param {Integer} celt Number of devices requested.
     * @param {Pointer<IWMDMDevice>} ppDevice Pointer to caller-allocated array of <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmdevice">IWMDMDevice</a> interface pointers. The size of this array must be <b>IWMDMDevice</b> *[celt]. The caller must release these interfaces when done with them. To avoid allocating a whole array, simply pass in the address of a pointer to an <b>IWMDMDevice</b> interface, as shown in Remarks.
     * @param {Pointer<Integer>} pceltFetched Pointer to a variable that receives the number of devices (interfaces) returned.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmenumdevice-next
     */
    Next(celt, ppDevice, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, IWMDMDevice.Ptr, ppDevice, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * The Skip method skips over a specified number of devices in the enumeration sequence.
     * @remarks
     * If the requested number of devices to skip is greater than the remaining devices, the return value from <b>Skip</b> is S_FALSE. At this point, <i>pceltFetched</i> must be used to determine the number of interfaces skipped. If you skip to the end of the device array, a subsequent call to <i>Next</i> also returns S_FALSE. For more information about the standard enumerator Skip method, see the Microsoft COM documentation, available at the Microsoft Web site.
     * @param {Integer} celt Number of devices to skip.
     * @returns {Integer} Number of devices actually skipped.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmenumdevice-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "uint*", &pceltFetched := 0, "HRESULT")
        return pceltFetched
    }

    /**
     * The Reset method resets the enumeration so that Next returns a pointer to the first device.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmenumdevice-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The Clone method returns a copy of the IWMDMEnumDevice interface. The new enumerator specifies the same enumeration state as the current enumerator.
     * @remarks
     * Using this method, a client can record a particular point in the enumeration sequence and return to that point later. The new enumerator supports the same interface as the original one.
     * @returns {IWMDMEnumDevice} Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmenumdevice">IWMDMEnumDevice</a> interface. The caller must release this interface when done with it.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmenumdevice-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnumDevice := 0, "HRESULT")
        return IWMDMEnumDevice(ppEnumDevice)
    }

    Query(iid) {
        if (IWMDMEnumDevice.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Next := CallbackCreate(GetMethod(implObj, "Next"), flags, 4)
        this.vtbl.Skip := CallbackCreate(GetMethod(implObj, "Skip"), flags, 3)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Next)
        CallbackFree(this.vtbl.Skip)
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.Clone)
    }
}
