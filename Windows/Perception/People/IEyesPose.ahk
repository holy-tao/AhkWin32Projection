#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\PerceptionTimestamp.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Perception.People
 * @version WindowsRuntime 1.4
 */
class IEyesPose extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEyesPose
     * @type {Guid}
     */
    static IID => Guid("{682a9b23-8a1e-5b86-a060-906ffacb62a4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsCalibrationValid", "get_Gaze", "get_UpdateTimestamp"]

    /**
     * @type {Boolean} 
     */
    IsCalibrationValid {
        get => this.get_IsCalibrationValid()
    }

    /**
     * @type {IReference<SpatialRay>} 
     */
    Gaze {
        get => this.get_Gaze()
    }

    /**
     * @type {PerceptionTimestamp} 
     */
    UpdateTimestamp {
        get => this.get_UpdateTimestamp()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCalibrationValid() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IReference<SpatialRay>} 
     */
    get_Gaze() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetSpatialRay(), value)
    }

    /**
     * 
     * @returns {PerceptionTimestamp} 
     */
    get_UpdateTimestamp() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PerceptionTimestamp(value)
    }
}
