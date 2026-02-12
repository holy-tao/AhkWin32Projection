#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Perception.Spatial.Surfaces
 * @version WindowsRuntime 1.4
 */
class ISpatialSurfaceMeshOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialSurfaceMeshOptions
     * @type {Guid}
     */
    static IID => Guid("{d2759f89-3572-3d2d-a10d-5fee9394aa37}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_VertexPositionFormat", "put_VertexPositionFormat", "get_TriangleIndexFormat", "put_TriangleIndexFormat", "get_VertexNormalFormat", "put_VertexNormalFormat", "get_IncludeVertexNormals", "put_IncludeVertexNormals"]

    /**
     * @type {Integer} 
     */
    VertexPositionFormat {
        get => this.get_VertexPositionFormat()
        set => this.put_VertexPositionFormat(value)
    }

    /**
     * @type {Integer} 
     */
    TriangleIndexFormat {
        get => this.get_TriangleIndexFormat()
        set => this.put_TriangleIndexFormat(value)
    }

    /**
     * @type {Integer} 
     */
    VertexNormalFormat {
        get => this.get_VertexNormalFormat()
        set => this.put_VertexNormalFormat(value)
    }

    /**
     * @type {Boolean} 
     */
    IncludeVertexNormals {
        get => this.get_IncludeVertexNormals()
        set => this.put_IncludeVertexNormals(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VertexPositionFormat() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
    put_VertexPositionFormat(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TriangleIndexFormat() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_TriangleIndexFormat(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VertexNormalFormat() {
        result := ComCall(10, this, "int*", &value := 0, "int")
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
    put_VertexNormalFormat(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IncludeVertexNormals() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IncludeVertexNormals(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
