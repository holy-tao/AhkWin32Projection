#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class IVoipPhoneCall4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVoipPhoneCall4
     * @type {Guid}
     */
    static IID => Guid("{eba66290-ad6d-5899-bdda-81bfe9f999a1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsUsingAssociatedDevicesList", "NotifyCallActiveOnDevices", "AddAssociatedCallControlDevice", "RemoveAssociatedCallControlDevice", "SetAssociatedCallControlDevices", "GetAssociatedCallControlDevices"]

    /**
     * @type {Boolean} 
     */
    IsUsingAssociatedDevicesList {
        get => this.get_IsUsingAssociatedDevicesList()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsUsingAssociatedDevicesList() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {IIterable<HSTRING>} associatedDeviceIds 
     * @returns {HRESULT} 
     */
    NotifyCallActiveOnDevices(associatedDeviceIds) {
        result := ComCall(7, this, "ptr", associatedDeviceIds, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} deviceId 
     * @returns {HRESULT} 
     */
    AddAssociatedCallControlDevice(deviceId) {
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId

        result := ComCall(8, this, "ptr", deviceId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} deviceId 
     * @returns {HRESULT} 
     */
    RemoveAssociatedCallControlDevice(deviceId) {
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId

        result := ComCall(9, this, "ptr", deviceId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IIterable<HSTRING>} associatedDeviceIds 
     * @returns {HRESULT} 
     */
    SetAssociatedCallControlDevices(associatedDeviceIds) {
        result := ComCall(10, this, "ptr", associatedDeviceIds, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    GetAssociatedCallControlDevices() {
        result := ComCall(11, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), result_)
    }
}
