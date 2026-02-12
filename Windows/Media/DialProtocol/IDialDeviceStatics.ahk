#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\DialDevice.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.DialProtocol
 * @version WindowsRuntime 1.4
 */
class IDialDeviceStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDialDeviceStatics
     * @type {Guid}
     */
    static IID => Guid("{aa69cc95-01f8-4758-8461-2bbd1cdc3cf3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeviceSelector", "FromIdAsync", "DeviceInfoSupportsDialAsync"]

    /**
     * 
     * @param {HSTRING} appName 
     * @returns {HSTRING} 
     */
    GetDeviceSelector(appName) {
        if(appName is String) {
            pin := HSTRING.Create(appName)
            appName := pin.Value
        }
        appName := appName is Win32Handle ? NumGet(appName, "ptr") : appName

        selector_ := HSTRING()
        result := ComCall(6, this, "ptr", appName, "ptr", selector_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return selector_
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {IAsyncOperation<DialDevice>} 
     */
    FromIdAsync(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(7, this, "ptr", value, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(DialDevice, operation)
    }

    /**
     * 
     * @param {DeviceInformation} device 
     * @returns {IAsyncOperation<Boolean>} 
     */
    DeviceInfoSupportsDialAsync(device) {
        result := ComCall(8, this, "ptr", device, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }
}
