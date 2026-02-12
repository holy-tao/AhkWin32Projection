#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Shapes
 * @version WindowsRuntime 1.4
 */
class IRectangle extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRectangle
     * @type {Guid}
     */
    static IID => Guid("{855bc230-8a11-4e18-a136-4bc21c7827b0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RadiusX", "put_RadiusX", "get_RadiusY", "put_RadiusY"]

    /**
     * @type {Float} 
     */
    RadiusX {
        get => this.get_RadiusX()
        set => this.put_RadiusX(value)
    }

    /**
     * @type {Float} 
     */
    RadiusY {
        get => this.get_RadiusY()
        set => this.put_RadiusY(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RadiusX() {
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
    put_RadiusX(value) {
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
    get_RadiusY() {
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
    put_RadiusY(value) {
        result := ComCall(9, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
