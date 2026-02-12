#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\SpatialCoordinateSystem.ahk
#Include ..\..\..\Foundation\Numerics\Matrix4x4.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Perception.Spatial.Preview
 * @version WindowsRuntime 1.4
 */
class ISpatialGraphInteropFrameOfReferencePreview extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialGraphInteropFrameOfReferencePreview
     * @type {Guid}
     */
    static IID => Guid("{a8271b23-735f-5729-a98e-e64ed189abc5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CoordinateSystem", "get_NodeId", "get_CoordinateSystemToNodeTransform"]

    /**
     * @type {SpatialCoordinateSystem} 
     */
    CoordinateSystem {
        get => this.get_CoordinateSystem()
    }

    /**
     * @type {Guid} 
     */
    NodeId {
        get => this.get_NodeId()
    }

    /**
     * @type {Matrix4x4} 
     */
    CoordinateSystemToNodeTransform {
        get => this.get_CoordinateSystemToNodeTransform()
    }

    /**
     * 
     * @returns {SpatialCoordinateSystem} 
     */
    get_CoordinateSystem() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialCoordinateSystem(value)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_NodeId() {
        value := Guid()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Matrix4x4} 
     */
    get_CoordinateSystemToNodeTransform() {
        value := Matrix4x4()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
