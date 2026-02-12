#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\UsbDevice.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class IUsbDeviceStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUsbDeviceStatics
     * @type {Guid}
     */
    static IID => Guid("{066b85a2-09b7-4446-8502-6fe6dcaa7309}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeviceSelector", "GetDeviceSelectorGuidOnly", "GetDeviceSelectorVidPidOnly", "GetDeviceClassSelector", "FromIdAsync"]

    /**
     * 
     * @param {Integer} vendorId 
     * @param {Integer} productId 
     * @param {Guid} winUsbInterfaceClass 
     * @returns {HSTRING} 
     */
    GetDeviceSelector(vendorId, productId, winUsbInterfaceClass) {
        value := HSTRING()
        result := ComCall(6, this, "uint", vendorId, "uint", productId, "ptr", winUsbInterfaceClass, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Guid} winUsbInterfaceClass 
     * @returns {HSTRING} 
     */
    GetDeviceSelectorGuidOnly(winUsbInterfaceClass) {
        value := HSTRING()
        result := ComCall(7, this, "ptr", winUsbInterfaceClass, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} vendorId 
     * @param {Integer} productId 
     * @returns {HSTRING} 
     */
    GetDeviceSelectorVidPidOnly(vendorId, productId) {
        value := HSTRING()
        result := ComCall(8, this, "uint", vendorId, "uint", productId, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {UsbDeviceClass} usbClass 
     * @returns {HSTRING} 
     */
    GetDeviceClassSelector(usbClass) {
        value := HSTRING()
        result := ComCall(9, this, "ptr", usbClass, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} deviceId 
     * @returns {IAsyncOperation<UsbDevice>} 
     */
    FromIdAsync(deviceId) {
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId

        result := ComCall(10, this, "ptr", deviceId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(UsbDevice, operation)
    }
}
