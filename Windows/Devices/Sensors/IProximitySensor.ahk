#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\ProximitySensorReading.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include .\ProximitySensorDisplayOnOffController.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IProximitySensor extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProximitySensor
     * @type {Guid}
     */
    static IID => Guid("{54c076b8-ecfb-4944-b928-74fc504d47ee}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DeviceId", "get_MaxDistanceInMillimeters", "get_MinDistanceInMillimeters", "GetCurrentReading", "add_ReadingChanged", "remove_ReadingChanged", "CreateDisplayOnOffController"]

    /**
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * @type {IReference<Integer>} 
     */
    MaxDistanceInMillimeters {
        get => this.get_MaxDistanceInMillimeters()
    }

    /**
     * @type {IReference<Integer>} 
     */
    MinDistanceInMillimeters {
        get => this.get_MinDistanceInMillimeters()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxDistanceInMillimeters() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MinDistanceInMillimeters() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }

    /**
     * 
     * @returns {ProximitySensorReading} 
     */
    GetCurrentReading() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ProximitySensorReading(value)
    }

    /**
     * 
     * @param {TypedEventHandler<ProximitySensor, ProximitySensorReadingChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ReadingChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(10, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ReadingChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(11, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ProximitySensorDisplayOnOffController} 
     */
    CreateDisplayOnOffController() {
        result := ComCall(12, this, "ptr*", &controller := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ProximitySensorDisplayOnOffController(controller)
    }
}
