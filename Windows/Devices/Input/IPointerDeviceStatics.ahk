#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\PointerDevice.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Input
 * @version WindowsRuntime 1.4
 */
class IPointerDeviceStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPointerDeviceStatics
     * @type {Guid}
     */
    static IID => Guid("{d8b89aa1-d1c6-416e-bd8d-5790914dc563}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPointerDevice", "GetPointerDevices"]

    /**
     * Gets information about the pointer device.
     * @param {Integer} pointerId 
     * @returns {PointerDevice} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-getpointerdevice
     */
    GetPointerDevice(pointerId) {
        result := ComCall(6, this, "uint", pointerId, "ptr*", &pointerDevice_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PointerDevice(pointerDevice_)
    }

    /**
     * Gets information about the pointer devices attached to the system.
     * @remarks
     * Windows 8 supports the following:
     * 
     * <ul>
     * <li>256 contacts per pointer device.</li>
     * <li>2560 total contacts per system session, regardless of the number of attached devices. For example, 10 pointer devices with 256 contacts each, 20 pointer devices with 128 contacts each, and so on.</li>
     * </ul>
     * @returns {IVectorView<PointerDevice>} Array of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_device_info">POINTER_DEVICE_INFO</a> structures for the pointer devices attached to the system. If NULL, the total number of attached pointer devices is returned in <i>deviceCount</i>.
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-getpointerdevices
     */
    GetPointerDevices() {
        result := ComCall(7, this, "ptr*", &pointerDevices := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(PointerDevice, pointerDevices)
    }
}
