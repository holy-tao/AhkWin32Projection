#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class ICapturedFrameControlValues extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICapturedFrameControlValues
     * @type {Guid}
     */
    static IID => Guid("{90c65b7f-4e0d-4ca4-882d-7a144fed0a90}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Exposure", "get_ExposureCompensation", "get_IsoSpeed", "get_Focus", "get_SceneMode", "get_Flashed", "get_FlashPowerPercent", "get_WhiteBalance", "get_ZoomFactor"]

    /**
     * @type {IReference<TimeSpan>} 
     */
    Exposure {
        get => this.get_Exposure()
    }

    /**
     * @type {IReference<Float>} 
     */
    ExposureCompensation {
        get => this.get_ExposureCompensation()
    }

    /**
     * @type {IReference<Integer>} 
     */
    IsoSpeed {
        get => this.get_IsoSpeed()
    }

    /**
     * @type {IReference<Integer>} 
     */
    Focus {
        get => this.get_Focus()
    }

    /**
     * @type {IReference<Integer>} 
     */
    SceneMode {
        get => this.get_SceneMode()
    }

    /**
     * @type {IReference<Boolean>} 
     */
    Flashed {
        get => this.get_Flashed()
    }

    /**
     * @type {IReference<Float>} 
     */
    FlashPowerPercent {
        get => this.get_FlashPowerPercent()
    }

    /**
     * @type {IReference<Integer>} 
     */
    WhiteBalance {
        get => this.get_WhiteBalance()
    }

    /**
     * @type {IReference<Float>} 
     */
    ZoomFactor {
        get => this.get_ZoomFactor()
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_Exposure() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetTimeSpan(), value)
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_ExposureCompensation() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetSingle(), value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_IsoSpeed() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_Focus() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_SceneMode() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {IReference<Boolean>} 
     */
    get_Flashed() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetBoolean(), value)
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_FlashPowerPercent() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetSingle(), value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_WhiteBalance() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_ZoomFactor() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetSingle(), value)
    }
}
