#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class IPrinting3DFaceReductionOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrinting3DFaceReductionOptions
     * @type {Guid}
     */
    static IID => Guid("{bbfed397-2d74-46f7-be85-99a67bbb6629}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MaxReductionArea", "put_MaxReductionArea", "get_TargetTriangleCount", "put_TargetTriangleCount", "get_MaxEdgeLength", "put_MaxEdgeLength"]

    /**
     * @type {Float} 
     */
    MaxReductionArea {
        get => this.get_MaxReductionArea()
        set => this.put_MaxReductionArea(value)
    }

    /**
     * @type {Integer} 
     */
    TargetTriangleCount {
        get => this.get_TargetTriangleCount()
        set => this.put_TargetTriangleCount(value)
    }

    /**
     * @type {Float} 
     */
    MaxEdgeLength {
        get => this.get_MaxEdgeLength()
        set => this.put_MaxEdgeLength(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxReductionArea() {
        result := ComCall(6, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MaxReductionArea(value) {
        result := ComCall(7, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TargetTriangleCount() {
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
    put_TargetTriangleCount(value) {
        result := ComCall(9, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxEdgeLength() {
        result := ComCall(10, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MaxEdgeLength(value) {
        result := ComCall(11, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
