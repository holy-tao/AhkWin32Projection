#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class IElasticEase extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IElasticEase
     * @type {Guid}
     */
    static IID => Guid("{ef5ba58c-b0b6-4a6c-9ca8-fb4233f12459}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Oscillations", "put_Oscillations", "get_Springiness", "put_Springiness"]

    /**
     * @type {Integer} 
     */
    Oscillations {
        get => this.get_Oscillations()
        set => this.put_Oscillations(value)
    }

    /**
     * @type {Float} 
     */
    Springiness {
        get => this.get_Springiness()
        set => this.put_Springiness(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Oscillations() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
    put_Oscillations(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Springiness() {
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
    put_Springiness(value) {
        result := ComCall(9, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
