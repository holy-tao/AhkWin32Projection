#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\Spatial\SpatialCoordinateSystem.ahk
#Include ..\PerceptionTimestamp.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Perception.People
 * @version WindowsRuntime 1.4
 */
class IHandMeshVertexState extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHandMeshVertexState
     * @type {Guid}
     */
    static IID => Guid("{046c5fef-1d8b-55de-ab2c-1cd424886d8f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CoordinateSystem", "GetVertices", "get_UpdateTimestamp"]

    /**
     * @type {SpatialCoordinateSystem} 
     */
    CoordinateSystem {
        get => this.get_CoordinateSystem()
    }

    /**
     * @type {PerceptionTimestamp} 
     */
    UpdateTimestamp {
        get => this.get_UpdateTimestamp()
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
     * @param {Pointer<Integer>} vertices_length 
     * @param {Pointer<Pointer<HandMeshVertex>>} vertices 
     * @returns {HRESULT} 
     */
    GetVertices(vertices_length, vertices) {
        vertices_lengthMarshal := vertices_length is VarRef ? "uint*" : "ptr"
        verticesMarshal := vertices is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, vertices_lengthMarshal, vertices_length, verticesMarshal, vertices, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
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
