#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\Printing3DComponent.ahk
#Include ..\..\Foundation\Numerics\Matrix4x4.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class IPrinting3DComponentWithMatrix extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrinting3DComponentWithMatrix
     * @type {Guid}
     */
    static IID => Guid("{3279f335-0ef0-456b-9a21-49bebe8b51c2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Component", "put_Component", "get_Matrix", "put_Matrix"]

    /**
     * @type {Printing3DComponent} 
     */
    Component {
        get => this.get_Component()
        set => this.put_Component(value)
    }

    /**
     * @type {Matrix4x4} 
     */
    Matrix {
        get => this.get_Matrix()
        set => this.put_Matrix(value)
    }

    /**
     * 
     * @returns {Printing3DComponent} 
     */
    get_Component() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Printing3DComponent(value)
    }

    /**
     * 
     * @param {Printing3DComponent} value 
     * @returns {HRESULT} 
     */
    put_Component(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Matrix4x4} 
     */
    get_Matrix() {
        value := Matrix4x4()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Matrix4x4} value 
     * @returns {HRESULT} 
     */
    put_Matrix(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
