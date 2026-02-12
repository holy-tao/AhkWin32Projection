#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IHumanPresenceSensor3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHumanPresenceSensor3
     * @type {Guid}
     */
    static IID => Guid("{963f006d-090d-532c-9eaf-803a9f69285b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MaxDetectablePersons", "get_MinDetectableAzimuthInDegrees", "get_MaxDetectableAzimuthInDegrees", "get_MinDetectableAltitudeInDegrees", "get_MaxDetectableAltitudeInDegrees"]

    /**
     * @type {Integer} 
     */
    MaxDetectablePersons {
        get => this.get_MaxDetectablePersons()
    }

    /**
     * @type {IReference<Float>} 
     */
    MinDetectableAzimuthInDegrees {
        get => this.get_MinDetectableAzimuthInDegrees()
    }

    /**
     * @type {IReference<Float>} 
     */
    MaxDetectableAzimuthInDegrees {
        get => this.get_MaxDetectableAzimuthInDegrees()
    }

    /**
     * @type {IReference<Float>} 
     */
    MinDetectableAltitudeInDegrees {
        get => this.get_MinDetectableAltitudeInDegrees()
    }

    /**
     * @type {IReference<Float>} 
     */
    MaxDetectableAltitudeInDegrees {
        get => this.get_MaxDetectableAltitudeInDegrees()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxDetectablePersons() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_MinDetectableAzimuthInDegrees() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDouble(), value)
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_MaxDetectableAzimuthInDegrees() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDouble(), value)
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_MinDetectableAltitudeInDegrees() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDouble(), value)
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_MaxDetectableAltitudeInDegrees() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDouble(), value)
    }
}
