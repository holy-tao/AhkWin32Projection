#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMDMEnumDevice.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMDMEnumDevice interface enumerates portable devices attached to a computer. To obtain this interface, call IWMDeviceManager::EnumDevices.
 * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nn-mswmdm-iwmdmenumdevice
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDMEnumDevice extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone"]

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
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-iwmdmenumdevice-next
     */
    Next(celt, ppDevice, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr*", ppDevice, pceltFetchedMarshal, pceltFetched, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Skip method skips over a specified number of devices in the enumeration sequence.
     * @remarks
     * If the requested number of devices to skip is greater than the remaining devices, the return value from <b>Skip</b> is S_FALSE. At this point, <i>pceltFetched</i> must be used to determine the number of interfaces skipped. If you skip to the end of the device array, a subsequent call to <i>Next</i> also returns S_FALSE. For more information about the standard enumerator Skip method, see the Microsoft COM documentation, available at the Microsoft Web site.
     * @param {Integer} celt Number of devices to skip.
     * @returns {Integer} Number of devices actually skipped.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-iwmdmenumdevice-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "uint*", &pceltFetched := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-iwmdmenumdevice-reset
     */
    Reset() {
        result := ComCall(5, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Clone method returns a copy of the IWMDMEnumDevice interface. The new enumerator specifies the same enumeration state as the current enumerator.
     * @remarks
     * Using this method, a client can record a particular point in the enumeration sequence and return to that point later. The new enumerator supports the same interface as the original one.
     * @returns {IWMDMEnumDevice} Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmenumdevice">IWMDMEnumDevice</a> interface. The caller must release this interface when done with it.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-iwmdmenumdevice-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnumDevice := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWMDMEnumDevice(ppEnumDevice)
    }
}
