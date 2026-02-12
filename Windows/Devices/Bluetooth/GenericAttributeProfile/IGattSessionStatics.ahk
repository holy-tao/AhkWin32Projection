#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\GattSession.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class IGattSessionStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattSessionStatics
     * @type {Guid}
     */
    static IID => Guid("{2e65b95c-539f-4db7-82a8-73bdbbf73ebf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FromDeviceIdAsync"]

    /**
     * 
     * @param {BluetoothDeviceId} deviceId 
     * @returns {IAsyncOperation<GattSession>} 
     */
    FromDeviceIdAsync(deviceId) {
        result := ComCall(6, this, "ptr", deviceId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GattSession, operation)
    }
}
