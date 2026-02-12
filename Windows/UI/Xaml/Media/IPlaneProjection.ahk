#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include Media3D\Matrix3D.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IPlaneProjection extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlaneProjection
     * @type {Guid}
     */
    static IID => Guid("{e6f82bfa-6726-469a-b259-a5188347ca8f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LocalOffsetX", "put_LocalOffsetX", "get_LocalOffsetY", "put_LocalOffsetY", "get_LocalOffsetZ", "put_LocalOffsetZ", "get_RotationX", "put_RotationX", "get_RotationY", "put_RotationY", "get_RotationZ", "put_RotationZ", "get_CenterOfRotationX", "put_CenterOfRotationX", "get_CenterOfRotationY", "put_CenterOfRotationY", "get_CenterOfRotationZ", "put_CenterOfRotationZ", "get_GlobalOffsetX", "put_GlobalOffsetX", "get_GlobalOffsetY", "put_GlobalOffsetY", "get_GlobalOffsetZ", "put_GlobalOffsetZ", "get_ProjectionMatrix"]

    /**
     * @type {Float} 
     */
    LocalOffsetX {
        get => this.get_LocalOffsetX()
        set => this.put_LocalOffsetX(value)
    }

    /**
     * @type {Float} 
     */
    LocalOffsetY {
        get => this.get_LocalOffsetY()
        set => this.put_LocalOffsetY(value)
    }

    /**
     * @type {Float} 
     */
    LocalOffsetZ {
        get => this.get_LocalOffsetZ()
        set => this.put_LocalOffsetZ(value)
    }

    /**
     * @type {Float} 
     */
    RotationX {
        get => this.get_RotationX()
        set => this.put_RotationX(value)
    }

    /**
     * @type {Float} 
     */
    RotationY {
        get => this.get_RotationY()
        set => this.put_RotationY(value)
    }

    /**
     * @type {Float} 
     */
    RotationZ {
        get => this.get_RotationZ()
        set => this.put_RotationZ(value)
    }

    /**
     * @type {Float} 
     */
    CenterOfRotationX {
        get => this.get_CenterOfRotationX()
        set => this.put_CenterOfRotationX(value)
    }

    /**
     * @type {Float} 
     */
    CenterOfRotationY {
        get => this.get_CenterOfRotationY()
        set => this.put_CenterOfRotationY(value)
    }

    /**
     * @type {Float} 
     */
    CenterOfRotationZ {
        get => this.get_CenterOfRotationZ()
        set => this.put_CenterOfRotationZ(value)
    }

    /**
     * @type {Float} 
     */
    GlobalOffsetX {
        get => this.get_GlobalOffsetX()
        set => this.put_GlobalOffsetX(value)
    }

    /**
     * @type {Float} 
     */
    GlobalOffsetY {
        get => this.get_GlobalOffsetY()
        set => this.put_GlobalOffsetY(value)
    }

    /**
     * @type {Float} 
     */
    GlobalOffsetZ {
        get => this.get_GlobalOffsetZ()
        set => this.put_GlobalOffsetZ(value)
    }

    /**
     * @type {Matrix3D} 
     */
    ProjectionMatrix {
        get => this.get_ProjectionMatrix()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LocalOffsetX() {
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
    put_LocalOffsetX(value) {
        result := ComCall(7, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LocalOffsetY() {
        result := ComCall(8, this, "double*", &value := 0, "int")
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
    put_LocalOffsetY(value) {
        result := ComCall(9, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LocalOffsetZ() {
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
    put_LocalOffsetZ(value) {
        result := ComCall(11, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RotationX() {
        result := ComCall(12, this, "double*", &value := 0, "int")
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
    put_RotationX(value) {
        result := ComCall(13, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RotationY() {
        result := ComCall(14, this, "double*", &value := 0, "int")
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
    put_RotationY(value) {
        result := ComCall(15, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RotationZ() {
        result := ComCall(16, this, "double*", &value := 0, "int")
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
    put_RotationZ(value) {
        result := ComCall(17, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CenterOfRotationX() {
        result := ComCall(18, this, "double*", &value := 0, "int")
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
    put_CenterOfRotationX(value) {
        result := ComCall(19, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CenterOfRotationY() {
        result := ComCall(20, this, "double*", &value := 0, "int")
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
    put_CenterOfRotationY(value) {
        result := ComCall(21, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CenterOfRotationZ() {
        result := ComCall(22, this, "double*", &value := 0, "int")
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
    put_CenterOfRotationZ(value) {
        result := ComCall(23, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_GlobalOffsetX() {
        result := ComCall(24, this, "double*", &value := 0, "int")
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
    put_GlobalOffsetX(value) {
        result := ComCall(25, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_GlobalOffsetY() {
        result := ComCall(26, this, "double*", &value := 0, "int")
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
    put_GlobalOffsetY(value) {
        result := ComCall(27, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_GlobalOffsetZ() {
        result := ComCall(28, this, "double*", &value := 0, "int")
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
    put_GlobalOffsetZ(value) {
        result := ComCall(29, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Matrix3D} 
     */
    get_ProjectionMatrix() {
        value := Matrix3D()
        result := ComCall(30, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
