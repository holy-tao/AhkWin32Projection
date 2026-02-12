#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\HidDevice.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.HumanInterfaceDevice
 * @version WindowsRuntime 1.4
 */
class IHidDeviceStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHidDeviceStatics
     * @type {Guid}
     */
    static IID => Guid("{9e5981e4-9856-418c-9f73-77de0cd85754}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeviceSelector", "GetDeviceSelectorVidPid", "FromIdAsync"]

    /**
     * 
     * @param {Integer} usagePage 
     * @param {Integer} usageId 
     * @returns {HSTRING} 
     */
    GetDeviceSelector(usagePage, usageId) {
        selector_ := HSTRING()
        result := ComCall(6, this, "ushort", usagePage, "ushort", usageId, "ptr", selector_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return selector_
    }

    /**
     * 
     * @param {Integer} usagePage 
     * @param {Integer} usageId 
     * @param {Integer} vendorId 
     * @param {Integer} productId 
     * @returns {HSTRING} 
     */
    GetDeviceSelectorVidPid(usagePage, usageId, vendorId, productId) {
        selector_ := HSTRING()
        result := ComCall(7, this, "ushort", usagePage, "ushort", usageId, "ushort", vendorId, "ushort", productId, "ptr", selector_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return selector_
    }

    /**
     * 
     * @param {HSTRING} deviceId 
     * @param {Integer} accessMode 
     * @returns {IAsyncOperation<HidDevice>} 
     */
    FromIdAsync(deviceId, accessMode) {
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId

        result := ComCall(8, this, "ptr", deviceId, "int", accessMode, "ptr*", &hidDevice_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(HidDevice, hidDevice_)
    }
}
