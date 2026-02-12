#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\DisplayMuxDevice.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class IDisplayMuxDeviceStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDisplayMuxDeviceStatics
     * @type {Guid}
     */
    static IID => Guid("{7b37a64a-0465-53da-baee-70028480ced0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeviceSelector", "FromIdAsync"]

    /**
     * 
     * @returns {HSTRING} 
     */
    GetDeviceSelector() {
        result_ := HSTRING()
        result := ComCall(6, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} deviceInterfaceId 
     * @returns {IAsyncOperation<DisplayMuxDevice>} 
     */
    FromIdAsync(deviceInterfaceId) {
        if(deviceInterfaceId is String) {
            pin := HSTRING.Create(deviceInterfaceId)
            deviceInterfaceId := pin.Value
        }
        deviceInterfaceId := deviceInterfaceId is Win32Handle ? NumGet(deviceInterfaceId, "ptr") : deviceInterfaceId

        result := ComCall(7, this, "ptr", deviceInterfaceId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(DisplayMuxDevice, operation)
    }
}
