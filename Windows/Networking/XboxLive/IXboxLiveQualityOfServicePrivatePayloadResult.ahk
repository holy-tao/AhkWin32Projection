#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\XboxLiveDeviceAddress.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.XboxLive
 * @version WindowsRuntime 1.4
 */
class IXboxLiveQualityOfServicePrivatePayloadResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXboxLiveQualityOfServicePrivatePayloadResult
     * @type {Guid}
     */
    static IID => Guid("{5a6302ae-6f38-41c0-9fcc-ea6cb978cafc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Status", "get_DeviceAddress", "get_Value"]

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {XboxLiveDeviceAddress} 
     */
    DeviceAddress {
        get => this.get_DeviceAddress()
    }

    /**
     * @type {IBuffer} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {XboxLiveDeviceAddress} 
     */
    get_DeviceAddress() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XboxLiveDeviceAddress(value)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Value() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }
}
