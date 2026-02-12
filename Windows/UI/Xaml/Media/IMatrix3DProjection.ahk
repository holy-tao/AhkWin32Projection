#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include Media3D\Matrix3D.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IMatrix3DProjection extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMatrix3DProjection
     * @type {Guid}
     */
    static IID => Guid("{6f03e149-bfc9-4c01-b578-50338cec97fc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ProjectionMatrix", "put_ProjectionMatrix"]

    /**
     * @type {Matrix3D} 
     */
    ProjectionMatrix {
        get => this.get_ProjectionMatrix()
        set => this.put_ProjectionMatrix(value)
    }

    /**
     * 
     * @returns {Matrix3D} 
     */
    get_ProjectionMatrix() {
        value := Matrix3D()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Matrix3D} value 
     * @returns {HRESULT} 
     */
    put_ProjectionMatrix(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
