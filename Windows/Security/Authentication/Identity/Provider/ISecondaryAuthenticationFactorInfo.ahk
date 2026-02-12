#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Identity.Provider
 * @version WindowsRuntime 1.4
 */
class ISecondaryAuthenticationFactorInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISecondaryAuthenticationFactorInfo
     * @type {Guid}
     */
    static IID => Guid("{1e2ba861-8533-4fce-839b-ecb72410ac14}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DeviceId", "get_DeviceFriendlyName", "get_DeviceModelNumber", "get_DeviceConfigurationData"]

    /**
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * @type {HSTRING} 
     */
    DeviceFriendlyName {
        get => this.get_DeviceFriendlyName()
    }

    /**
     * @type {HSTRING} 
     */
    DeviceModelNumber {
        get => this.get_DeviceModelNumber()
    }

    /**
     * @type {IBuffer} 
     */
    DeviceConfigurationData {
        get => this.get_DeviceConfigurationData()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        deviceId := HSTRING()
        result := ComCall(6, this, "ptr", deviceId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return deviceId
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceFriendlyName() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceModelNumber() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_DeviceConfigurationData() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }
}
