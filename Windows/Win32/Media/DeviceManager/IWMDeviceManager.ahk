#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMDMEnumDevice.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMDeviceManager interface is the top level Windows Media Device Manager interface for applications.
 * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nn-mswmdm-iwmdevicemanager
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDeviceManager extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRevision", "GetDeviceCount", "EnumDevices"]

    /**
     * The GetRevision method retrieves the version number of Windows Media Device Manager currently in use.
     * @returns {Integer} Pointer to a <b>DWORD</b> specifying the Windows Media Device Manager version number. Windows Media Device Manager 10 returns 0x00080000.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-iwmdevicemanager-getrevision
     */
    GetRevision() {
        result := ComCall(3, this, "uint*", &pdwRevision := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwRevision
    }

    /**
     * The GetDeviceCount method retrieves the number of portable devices that are currently connected to the computer.
     * @returns {Integer} Pointer to a <b>DWORD</b> specifying the count of known devices.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-iwmdevicemanager-getdevicecount
     */
    GetDeviceCount() {
        result := ComCall(4, this, "uint*", &pdwCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwCount
    }

    /**
     * The EnumDevices method retrieves a pointer to the IWMDMEnumDevice interface that can be used to enumerate portable devices connected to the computer.
     * @remarks
     * This method returns devices based on earlier versions of Windows Media Device Manager. To get all devices, including newer devices (such as MTP devices), call <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdevicemanager2-enumdevices2">IWMDMDeviceManager2::EnumDevices2</a>.
     * @returns {IWMDMEnumDevice} Pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmenumdevice">IWMDMEnumDevice</a> interface used to enumerate devices. The caller must release this interface when done with it.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-iwmdevicemanager-enumdevices
     */
    EnumDevices() {
        result := ComCall(5, this, "ptr*", &ppEnumDevice := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWMDMEnumDevice(ppEnumDevice)
    }
}
