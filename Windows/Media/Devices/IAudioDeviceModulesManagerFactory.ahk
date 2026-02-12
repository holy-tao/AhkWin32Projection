#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\AudioDeviceModulesManager.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class IAudioDeviceModulesManagerFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioDeviceModulesManagerFactory
     * @type {Guid}
     */
    static IID => Guid("{8db03670-e64d-4773-96c0-bc7ebf0e063f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create"]

    /**
     * Create Extended Stored Procedures
     * @param {HSTRING} deviceId 
     * @returns {AudioDeviceModulesManager} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(deviceId) {
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId

        result := ComCall(6, this, "ptr", deviceId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioDeviceModulesManager(result_)
    }
}
