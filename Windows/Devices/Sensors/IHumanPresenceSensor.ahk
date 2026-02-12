#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\HumanPresenceSensorReading.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Defines the implementation for a type that supports inspecting and modifying human presence sensor readings in the pipeline between the sensor and the system.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.ihumanpresencesensorextension
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IHumanPresenceSensor extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHumanPresenceSensor
     * @type {Guid}
     */
    static IID => Guid("{2116788b-e389-5cc3-9a97-cb17be1008bd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DeviceId", "get_MaxDetectableDistanceInMillimeters", "get_MinDetectableDistanceInMillimeters", "GetCurrentReading", "add_ReadingChanged", "remove_ReadingChanged"]

    /**
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * @type {IReference<Integer>} 
     */
    MaxDetectableDistanceInMillimeters {
        get => this.get_MaxDetectableDistanceInMillimeters()
    }

    /**
     * @type {IReference<Integer>} 
     */
    MinDetectableDistanceInMillimeters {
        get => this.get_MinDetectableDistanceInMillimeters()
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
    get_MaxDetectableDistanceInMillimeters() {
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
    get_MinDetectableDistanceInMillimeters() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }

    /**
     * 
     * @returns {HumanPresenceSensorReading} 
     */
    GetCurrentReading() {
        result := ComCall(9, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HumanPresenceSensorReading(result_)
    }

    /**
     * 
     * @param {TypedEventHandler<HumanPresenceSensor, HumanPresenceSensorReadingChangedEventArgs>} handler 
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
}
