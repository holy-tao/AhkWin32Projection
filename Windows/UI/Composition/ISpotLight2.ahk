#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ISpotLight2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpotLight2
     * @type {Guid}
     */
    static IID => Guid("{64ee615e-0686-4dea-a9e8-bc3a8c701459}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InnerConeIntensity", "put_InnerConeIntensity", "get_OuterConeIntensity", "put_OuterConeIntensity"]

    /**
     * @type {Float} 
     */
    InnerConeIntensity {
        get => this.get_InnerConeIntensity()
        set => this.put_InnerConeIntensity(value)
    }

    /**
     * @type {Float} 
     */
    OuterConeIntensity {
        get => this.get_OuterConeIntensity()
        set => this.put_OuterConeIntensity(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_InnerConeIntensity() {
        result := ComCall(6, this, "float*", &value := 0, "int")
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
    put_InnerConeIntensity(value) {
        result := ComCall(7, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OuterConeIntensity() {
        result := ComCall(8, this, "float*", &value := 0, "int")
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
    put_OuterConeIntensity(value) {
        result := ComCall(9, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
