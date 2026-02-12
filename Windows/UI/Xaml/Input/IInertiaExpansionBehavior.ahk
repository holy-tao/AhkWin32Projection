#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class IInertiaExpansionBehavior extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInertiaExpansionBehavior
     * @type {Guid}
     */
    static IID => Guid("{751d87e5-8d42-44c5-965e-3cd30cc9d6f7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DesiredDeceleration", "put_DesiredDeceleration", "get_DesiredExpansion", "put_DesiredExpansion"]

    /**
     * @type {Float} 
     */
    DesiredDeceleration {
        get => this.get_DesiredDeceleration()
        set => this.put_DesiredDeceleration(value)
    }

    /**
     * @type {Float} 
     */
    DesiredExpansion {
        get => this.get_DesiredExpansion()
        set => this.put_DesiredExpansion(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DesiredDeceleration() {
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
    put_DesiredDeceleration(value) {
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
    get_DesiredExpansion() {
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
    put_DesiredExpansion(value) {
        result := ComCall(9, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
