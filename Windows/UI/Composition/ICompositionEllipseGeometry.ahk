#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Numerics\Vector2.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionEllipseGeometry extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionEllipseGeometry
     * @type {Guid}
     */
    static IID => Guid("{4801f884-f6ad-4b93-afa9-897b64e57b1f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Center", "put_Center", "get_Radius", "put_Radius"]

    /**
     * @type {Vector2} 
     */
    Center {
        get => this.get_Center()
        set => this.put_Center(value)
    }

    /**
     * @type {Vector2} 
     */
    Radius {
        get => this.get_Radius()
        set => this.put_Radius(value)
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_Center() {
        value := Vector2()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_Center(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_Radius() {
        value := Vector2()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_Radius(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
