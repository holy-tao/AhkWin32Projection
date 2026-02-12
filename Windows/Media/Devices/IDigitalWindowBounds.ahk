#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class IDigitalWindowBounds extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDigitalWindowBounds
     * @type {Guid}
     */
    static IID => Guid("{dd4f21dd-d173-5c6b-8c25-bdd26d5122b1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_NormalizedOriginTop", "put_NormalizedOriginTop", "get_NormalizedOriginLeft", "put_NormalizedOriginLeft", "get_Scale", "put_Scale"]

    /**
     * @type {Float} 
     */
    NormalizedOriginTop {
        get => this.get_NormalizedOriginTop()
        set => this.put_NormalizedOriginTop(value)
    }

    /**
     * @type {Float} 
     */
    NormalizedOriginLeft {
        get => this.get_NormalizedOriginLeft()
        set => this.put_NormalizedOriginLeft(value)
    }

    /**
     * @type {Float} 
     */
    Scale {
        get => this.get_Scale()
        set => this.put_Scale(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_NormalizedOriginTop() {
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
    put_NormalizedOriginTop(value) {
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
    get_NormalizedOriginLeft() {
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
    put_NormalizedOriginLeft(value) {
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
    get_Scale() {
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
    put_Scale(value) {
        result := ComCall(11, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
