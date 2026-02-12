#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\UI\Input\Spatial\SpatialInteractionSource.ahk
#Include .\HandMeshVertexState.ahk
#Include .\HandPose.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Perception.People
 * @version WindowsRuntime 1.4
 */
class IHandMeshObserver extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHandMeshObserver
     * @type {Guid}
     */
    static IID => Guid("{85ae30cb-6fc3-55c4-a7b4-29e33896ca69}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Source", "get_TriangleIndexCount", "get_VertexCount", "GetTriangleIndices", "GetVertexStateForPose", "get_NeutralPose", "get_NeutralPoseVersion", "get_ModelId"]

    /**
     * @type {SpatialInteractionSource} 
     */
    Source {
        get => this.get_Source()
    }

    /**
     * @type {Integer} 
     */
    TriangleIndexCount {
        get => this.get_TriangleIndexCount()
    }

    /**
     * @type {Integer} 
     */
    VertexCount {
        get => this.get_VertexCount()
    }

    /**
     * @type {HandPose} 
     */
    NeutralPose {
        get => this.get_NeutralPose()
    }

    /**
     * @type {Integer} 
     */
    NeutralPoseVersion {
        get => this.get_NeutralPoseVersion()
    }

    /**
     * @type {Integer} 
     */
    ModelId {
        get => this.get_ModelId()
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
     * @returns {Integer} 
     */
    get_TriangleIndexCount() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VertexCount() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Pointer<Integer>} indices_length 
     * @param {Pointer<Pointer<Integer>>} indices 
     * @returns {HRESULT} 
     */
    GetTriangleIndices(indices_length, indices) {
        indices_lengthMarshal := indices_length is VarRef ? "uint*" : "ptr"
        indicesMarshal := indices is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, indices_lengthMarshal, indices_length, indicesMarshal, indices, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HandPose} handPose_ 
     * @returns {HandMeshVertexState} 
     */
    GetVertexStateForPose(handPose_) {
        result := ComCall(10, this, "ptr", handPose_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HandMeshVertexState(result_)
    }

    /**
     * 
     * @returns {HandPose} 
     */
    get_NeutralPose() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HandPose(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NeutralPoseVersion() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ModelId() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
