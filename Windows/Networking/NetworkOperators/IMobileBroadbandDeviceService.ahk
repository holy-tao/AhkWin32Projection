#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\MobileBroadbandDeviceServiceDataSession.ahk
#Include .\MobileBroadbandDeviceServiceCommandSession.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IMobileBroadbandDeviceService extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMobileBroadbandDeviceService
     * @type {Guid}
     */
    static IID => Guid("{22be1a52-bd80-40ac-8e1f-2e07836a3dbd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DeviceServiceId", "get_SupportedCommands", "OpenDataSession", "OpenCommandSession"]

    /**
     * @type {Guid} 
     */
    DeviceServiceId {
        get => this.get_DeviceServiceId()
    }

    /**
     * @type {IVectorView<Integer>} 
     */
    SupportedCommands {
        get => this.get_SupportedCommands()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_DeviceServiceId() {
        value := Guid()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedCommands() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }

    /**
     * 
     * @returns {MobileBroadbandDeviceServiceDataSession} 
     */
    OpenDataSession() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MobileBroadbandDeviceServiceDataSession(value)
    }

    /**
     * 
     * @returns {MobileBroadbandDeviceServiceCommandSession} 
     */
    OpenCommandSession() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MobileBroadbandDeviceServiceCommandSession(value)
    }
}
