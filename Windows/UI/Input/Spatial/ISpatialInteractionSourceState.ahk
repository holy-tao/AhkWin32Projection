#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SpatialInteractionSource.ahk
#Include .\SpatialInteractionSourceProperties.ahk
#Include ..\..\..\Perception\PerceptionTimestamp.ahk
#Include .\SpatialPointerPose.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Spatial
 * @version WindowsRuntime 1.4
 */
class ISpatialInteractionSourceState extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialInteractionSourceState
     * @type {Guid}
     */
    static IID => Guid("{d5c475ef-4b63-37ec-98b9-9fc652b9d2f2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Source", "get_Properties", "get_IsPressed", "get_Timestamp", "TryGetPointerPose"]

    /**
     * @type {SpatialInteractionSource} 
     */
    Source {
        get => this.get_Source()
    }

    /**
     * @type {SpatialInteractionSourceProperties} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * @type {Boolean} 
     */
    IsPressed {
        get => this.get_IsPressed()
    }

    /**
     * @type {PerceptionTimestamp} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * 
     * @returns {SpatialInteractionSource} 
     */
    get_Source() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialInteractionSource(value)
    }

    /**
     * 
     * @returns {SpatialInteractionSourceProperties} 
     */
    get_Properties() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialInteractionSourceProperties(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPressed() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {PerceptionTimestamp} 
     */
    get_Timestamp() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PerceptionTimestamp(value)
    }

    /**
     * 
     * @param {SpatialCoordinateSystem} coordinateSystem 
     * @returns {SpatialPointerPose} 
     */
    TryGetPointerPose(coordinateSystem) {
        result := ComCall(10, this, "ptr", coordinateSystem, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialPointerPose(value)
    }
}
