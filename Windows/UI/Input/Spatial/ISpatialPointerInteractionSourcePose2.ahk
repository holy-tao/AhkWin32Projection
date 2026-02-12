#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Numerics\Quaternion.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Spatial
 * @version WindowsRuntime 1.4
 */
class ISpatialPointerInteractionSourcePose2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialPointerInteractionSourcePose2
     * @type {Guid}
     */
    static IID => Guid("{eccd86b8-52db-469f-9e3f-80c47f74bce9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Orientation", "get_PositionAccuracy"]

    /**
     * @type {Quaternion} 
     */
    Orientation {
        get => this.get_Orientation()
    }

    /**
     * @type {Integer} 
     */
    PositionAccuracy {
        get => this.get_PositionAccuracy()
    }

    /**
     * 
     * @returns {Quaternion} 
     */
    get_Orientation() {
        value := Quaternion()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PositionAccuracy() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
