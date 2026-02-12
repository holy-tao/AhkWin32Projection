#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Media3D
 * @version WindowsRuntime 1.4
 */
class IPerspectiveTransform3D extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPerspectiveTransform3D
     * @type {Guid}
     */
    static IID => Guid("{9a7b532a-30f9-40a1-96c9-c59d87f95ac3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Depth", "put_Depth", "get_OffsetX", "put_OffsetX", "get_OffsetY", "put_OffsetY"]

    /**
     * @type {Float} 
     */
    Depth {
        get => this.get_Depth()
        set => this.put_Depth(value)
    }

    /**
     * @type {Float} 
     */
    OffsetX {
        get => this.get_OffsetX()
        set => this.put_OffsetX(value)
    }

    /**
     * @type {Float} 
     */
    OffsetY {
        get => this.get_OffsetY()
        set => this.put_OffsetY(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Depth() {
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
    put_Depth(value) {
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
    get_OffsetX() {
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
    put_OffsetX(value) {
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
    get_OffsetY() {
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
    put_OffsetY(value) {
        result := ComCall(11, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
