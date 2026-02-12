#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Devices\Geolocation\Geopoint.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Maps
 * @version WindowsRuntime 1.4
 */
class IMapRouteManeuver extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapRouteManeuver
     * @type {Guid}
     */
    static IID => Guid("{ed5c17f0-a6ab-4d65-a086-fa8a7e340df2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_StartingPoint", "get_LengthInMeters", "get_InstructionText", "get_Kind", "get_ExitNumber", "get_ManeuverNotices"]

    /**
     * @type {Geopoint} 
     */
    StartingPoint {
        get => this.get_StartingPoint()
    }

    /**
     * @type {Float} 
     */
    LengthInMeters {
        get => this.get_LengthInMeters()
    }

    /**
     * @type {HSTRING} 
     */
    InstructionText {
        get => this.get_InstructionText()
    }

    /**
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * @type {HSTRING} 
     */
    ExitNumber {
        get => this.get_ExitNumber()
    }

    /**
     * @type {Integer} 
     */
    ManeuverNotices {
        get => this.get_ManeuverNotices()
    }

    /**
     * 
     * @returns {Geopoint} 
     */
    get_StartingPoint() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Geopoint(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LengthInMeters() {
        result := ComCall(7, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_InstructionText() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ExitNumber() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ManeuverNotices() {
        result := ComCall(11, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
