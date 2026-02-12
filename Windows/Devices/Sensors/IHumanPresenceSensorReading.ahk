#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IHumanPresenceSensorReading extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHumanPresenceSensorReading
     * @type {Guid}
     */
    static IID => Guid("{83533bf5-a85a-5d50-8be4-6072d745a3bb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Timestamp", "get_Presence", "get_Engagement", "get_DistanceInMillimeters"]

    /**
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * @type {Integer} 
     */
    Presence {
        get => this.get_Presence()
    }

    /**
     * @type {Integer} 
     */
    Engagement {
        get => this.get_Engagement()
    }

    /**
     * @type {IReference<Integer>} 
     */
    DistanceInMillimeters {
        get => this.get_DistanceInMillimeters()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Timestamp() {
        value := DateTime()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Presence() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Engagement() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_DistanceInMillimeters() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }
}
