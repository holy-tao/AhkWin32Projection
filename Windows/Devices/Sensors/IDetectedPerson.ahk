#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\HeadOrientation.ahk
#Include .\HeadPosition.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IDetectedPerson extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDetectedPerson
     * @type {Guid}
     */
    static IID => Guid("{168cc0d9-3f05-5029-a0bf-cdcab4be3f9e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Engagement", "get_DistanceInMillimeters", "get_HeadOrientation", "get_HeadPosition", "get_PersonId"]

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
     * @type {HeadOrientation} 
     */
    HeadOrientation {
        get => this.get_HeadOrientation()
    }

    /**
     * @type {HeadPosition} 
     */
    HeadPosition {
        get => this.get_HeadPosition()
    }

    /**
     * @type {IReference<Integer>} 
     */
    PersonId {
        get => this.get_PersonId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Engagement() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }

    /**
     * 
     * @returns {HeadOrientation} 
     */
    get_HeadOrientation() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HeadOrientation(value)
    }

    /**
     * 
     * @returns {HeadPosition} 
     */
    get_HeadPosition() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HeadPosition(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_PersonId() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }
}
