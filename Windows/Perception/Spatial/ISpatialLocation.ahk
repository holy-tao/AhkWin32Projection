#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Numerics\Vector3.ahk
#Include ..\..\Foundation\Numerics\Quaternion.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class ISpatialLocation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialLocation
     * @type {Guid}
     */
    static IID => Guid("{1d81d29d-24a1-37d5-8fa1-39b4f9ad67e2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Position", "get_Orientation", "get_AbsoluteLinearVelocity", "get_AbsoluteLinearAcceleration", "get_AbsoluteAngularVelocity", "get_AbsoluteAngularAcceleration"]

    /**
     * @type {Vector3} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * @type {Quaternion} 
     */
    Orientation {
        get => this.get_Orientation()
    }

    /**
     * @type {Vector3} 
     */
    AbsoluteLinearVelocity {
        get => this.get_AbsoluteLinearVelocity()
    }

    /**
     * @type {Vector3} 
     */
    AbsoluteLinearAcceleration {
        get => this.get_AbsoluteLinearAcceleration()
    }

    /**
     * @type {Quaternion} 
     */
    AbsoluteAngularVelocity {
        get => this.get_AbsoluteAngularVelocity()
    }

    /**
     * @type {Quaternion} 
     */
    AbsoluteAngularAcceleration {
        get => this.get_AbsoluteAngularAcceleration()
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Position() {
        value := Vector3()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Quaternion} 
     */
    get_Orientation() {
        value := Quaternion()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_AbsoluteLinearVelocity() {
        value := Vector3()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_AbsoluteLinearAcceleration() {
        value := Vector3()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Quaternion} 
     */
    get_AbsoluteAngularVelocity() {
        value := Quaternion()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Quaternion} 
     */
    get_AbsoluteAngularAcceleration() {
        value := Quaternion()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
