#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\Printing3DBufferDescription.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\Foundation\Collections\IPropertySet.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\Printing3DMeshVerificationResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class IPrinting3DMesh extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrinting3DMesh
     * @type {Guid}
     */
    static IID => Guid("{192e90dc-0228-2e01-bc20-c5290cbf32c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_VertexCount", "put_VertexCount", "get_IndexCount", "put_IndexCount", "get_VertexPositionsDescription", "put_VertexPositionsDescription", "get_VertexNormalsDescription", "put_VertexNormalsDescription", "get_TriangleIndicesDescription", "put_TriangleIndicesDescription", "get_TriangleMaterialIndicesDescription", "put_TriangleMaterialIndicesDescription", "GetVertexPositions", "CreateVertexPositions", "GetVertexNormals", "CreateVertexNormals", "GetTriangleIndices", "CreateTriangleIndices", "GetTriangleMaterialIndices", "CreateTriangleMaterialIndices", "get_BufferDescriptionSet", "get_BufferSet", "VerifyAsync"]

    /**
     * @type {Integer} 
     */
    VertexCount {
        get => this.get_VertexCount()
        set => this.put_VertexCount(value)
    }

    /**
     * @type {Integer} 
     */
    IndexCount {
        get => this.get_IndexCount()
        set => this.put_IndexCount(value)
    }

    /**
     * @type {Printing3DBufferDescription} 
     */
    VertexPositionsDescription {
        get => this.get_VertexPositionsDescription()
        set => this.put_VertexPositionsDescription(value)
    }

    /**
     * @type {Printing3DBufferDescription} 
     */
    VertexNormalsDescription {
        get => this.get_VertexNormalsDescription()
        set => this.put_VertexNormalsDescription(value)
    }

    /**
     * @type {Printing3DBufferDescription} 
     */
    TriangleIndicesDescription {
        get => this.get_TriangleIndicesDescription()
        set => this.put_TriangleIndicesDescription(value)
    }

    /**
     * @type {Printing3DBufferDescription} 
     */
    TriangleMaterialIndicesDescription {
        get => this.get_TriangleMaterialIndicesDescription()
        set => this.put_TriangleMaterialIndicesDescription(value)
    }

    /**
     * @type {IPropertySet} 
     */
    BufferDescriptionSet {
        get => this.get_BufferDescriptionSet()
    }

    /**
     * @type {IPropertySet} 
     */
    BufferSet {
        get => this.get_BufferSet()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VertexCount() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_VertexCount(value) {
        result := ComCall(7, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IndexCount() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_IndexCount(value) {
        result := ComCall(9, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Printing3DBufferDescription} 
     */
    get_VertexPositionsDescription() {
        value := Printing3DBufferDescription()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Printing3DBufferDescription} value 
     * @returns {HRESULT} 
     */
    put_VertexPositionsDescription(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Printing3DBufferDescription} 
     */
    get_VertexNormalsDescription() {
        value := Printing3DBufferDescription()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Printing3DBufferDescription} value 
     * @returns {HRESULT} 
     */
    put_VertexNormalsDescription(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Printing3DBufferDescription} 
     */
    get_TriangleIndicesDescription() {
        value := Printing3DBufferDescription()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Printing3DBufferDescription} value 
     * @returns {HRESULT} 
     */
    put_TriangleIndicesDescription(value) {
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Printing3DBufferDescription} 
     */
    get_TriangleMaterialIndicesDescription() {
        value := Printing3DBufferDescription()
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Printing3DBufferDescription} value 
     * @returns {HRESULT} 
     */
    put_TriangleMaterialIndicesDescription(value) {
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    GetVertexPositions() {
        result := ComCall(18, this, "ptr*", &buffer_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(buffer_)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    CreateVertexPositions(value) {
        result := ComCall(19, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    GetVertexNormals() {
        result := ComCall(20, this, "ptr*", &buffer_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(buffer_)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    CreateVertexNormals(value) {
        result := ComCall(21, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    GetTriangleIndices() {
        result := ComCall(22, this, "ptr*", &buffer_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(buffer_)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    CreateTriangleIndices(value) {
        result := ComCall(23, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    GetTriangleMaterialIndices() {
        result := ComCall(24, this, "ptr*", &buffer_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(buffer_)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    CreateTriangleMaterialIndices(value) {
        result := ComCall(25, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IPropertySet} 
     */
    get_BufferDescriptionSet() {
        result := ComCall(26, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPropertySet(value)
    }

    /**
     * 
     * @returns {IPropertySet} 
     */
    get_BufferSet() {
        result := ComCall(27, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPropertySet(value)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {IAsyncOperation<Printing3DMeshVerificationResult>} 
     */
    VerifyAsync(value) {
        result := ComCall(28, this, "int", value, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(Printing3DMeshVerificationResult, operation)
    }
}
