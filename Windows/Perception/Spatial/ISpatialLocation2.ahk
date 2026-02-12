#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Numerics\Vector3.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class ISpatialLocation2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialLocation2
     * @type {Guid}
     */
    static IID => Guid("{117f2416-38a7-4a18-b404-ab8fabe1d78b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AbsoluteAngularVelocityAxisAngle", "get_AbsoluteAngularAccelerationAxisAngle"]

    /**
     * @type {Vector3} 
     */
    AbsoluteAngularVelocityAxisAngle {
        get => this.get_AbsoluteAngularVelocityAxisAngle()
    }

    /**
     * @type {Vector3} 
     */
    AbsoluteAngularAccelerationAxisAngle {
        get => this.get_AbsoluteAngularAccelerationAxisAngle()
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_AbsoluteAngularVelocityAxisAngle() {
        value := Vector3()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_AbsoluteAngularAccelerationAxisAngle() {
        value := Vector3()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
