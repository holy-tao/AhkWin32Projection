#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\Matrix.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IMatrixTransform extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMatrixTransform
     * @type {Guid}
     */
    static IID => Guid("{edfdd551-5fed-45fc-ae62-92a4b6cf9707}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Matrix", "put_Matrix"]

    /**
     * @type {Matrix} 
     */
    Matrix {
        get => this.get_Matrix()
        set => this.put_Matrix(value)
    }

    /**
     * 
     * @returns {Matrix} 
     */
    get_Matrix() {
        value := Matrix()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Matrix} value 
     * @returns {HRESULT} 
     */
    put_Matrix(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
