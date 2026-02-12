#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Numerics\Vector3.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\UI\Color.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Lights
 * @version WindowsRuntime 1.4
 */
class ILampInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILampInfo
     * @type {Guid}
     */
    static IID => Guid("{30bb521c-0acf-49da-8c10-150b9cf62713}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Index", "get_Purposes", "get_Position", "get_RedLevelCount", "get_GreenLevelCount", "get_BlueLevelCount", "get_GainLevelCount", "get_FixedColor", "GetNearestSupportedColor", "get_UpdateLatency"]

    /**
     * @type {Integer} 
     */
    Index {
        get => this.get_Index()
    }

    /**
     * @type {Integer} 
     */
    Purposes {
        get => this.get_Purposes()
    }

    /**
     * @type {Vector3} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * @type {Integer} 
     */
    RedLevelCount {
        get => this.get_RedLevelCount()
    }

    /**
     * @type {Integer} 
     */
    GreenLevelCount {
        get => this.get_GreenLevelCount()
    }

    /**
     * @type {Integer} 
     */
    BlueLevelCount {
        get => this.get_BlueLevelCount()
    }

    /**
     * @type {Integer} 
     */
    GainLevelCount {
        get => this.get_GainLevelCount()
    }

    /**
     * @type {IReference<Color>} 
     */
    FixedColor {
        get => this.get_FixedColor()
    }

    /**
     * @type {TimeSpan} 
     */
    UpdateLatency {
        get => this.get_UpdateLatency()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Index() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Purposes() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Position() {
        value := Vector3()
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
    get_RedLevelCount() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_GreenLevelCount() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BlueLevelCount() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_GainLevelCount() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_FixedColor() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {Color} desiredColor 
     * @returns {Color} 
     */
    GetNearestSupportedColor(desiredColor) {
        result_ := Color()
        result := ComCall(14, this, "ptr", desiredColor, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_UpdateLatency() {
        value := TimeSpan()
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
