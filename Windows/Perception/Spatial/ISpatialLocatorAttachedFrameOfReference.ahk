#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Numerics\Vector3.ahk
#Include ..\..\Foundation\Numerics\Quaternion.ahk
#Include .\SpatialCoordinateSystem.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class ISpatialLocatorAttachedFrameOfReference extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialLocatorAttachedFrameOfReference
     * @type {Guid}
     */
    static IID => Guid("{e1774ef6-1f4f-499c-9625-ef5e6ed7a048}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RelativePosition", "put_RelativePosition", "get_RelativeOrientation", "put_RelativeOrientation", "AdjustHeading", "GetStationaryCoordinateSystemAtTimestamp", "TryGetRelativeHeadingAtTimestamp"]

    /**
     * @type {Vector3} 
     */
    RelativePosition {
        get => this.get_RelativePosition()
        set => this.put_RelativePosition(value)
    }

    /**
     * @type {Quaternion} 
     */
    RelativeOrientation {
        get => this.get_RelativeOrientation()
        set => this.put_RelativeOrientation(value)
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_RelativePosition() {
        value := Vector3()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Vector3} value 
     * @returns {HRESULT} 
     */
    put_RelativePosition(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Quaternion} 
     */
    get_RelativeOrientation() {
        value := Quaternion()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Quaternion} value 
     * @returns {HRESULT} 
     */
    put_RelativeOrientation(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Float} headingOffsetInRadians 
     * @returns {HRESULT} 
     */
    AdjustHeading(headingOffsetInRadians) {
        result := ComCall(10, this, "double", headingOffsetInRadians, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PerceptionTimestamp} timestamp_ 
     * @returns {SpatialCoordinateSystem} 
     */
    GetStationaryCoordinateSystemAtTimestamp(timestamp_) {
        result := ComCall(11, this, "ptr", timestamp_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialCoordinateSystem(value)
    }

    /**
     * 
     * @param {PerceptionTimestamp} timestamp_ 
     * @returns {IReference<Float>} 
     */
    TryGetRelativeHeadingAtTimestamp(timestamp_) {
        result := ComCall(12, this, "ptr", timestamp_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDouble(), value)
    }
}
