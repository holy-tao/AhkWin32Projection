#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CoreIndependentInputSource.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class ICoreIndependentInputSourceController extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreIndependentInputSourceController
     * @type {Guid}
     */
    static IID => Guid("{0963261c-84fe-578a-83ca-6425309ccde4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsTransparentForUncontrolledInput", "put_IsTransparentForUncontrolledInput", "get_IsPalmRejectionEnabled", "put_IsPalmRejectionEnabled", "get_Source", "SetControlledInput", "SetControlledInputWithFilters"]

    /**
     * @type {Boolean} 
     */
    IsTransparentForUncontrolledInput {
        get => this.get_IsTransparentForUncontrolledInput()
        set => this.put_IsTransparentForUncontrolledInput(value)
    }

    /**
     * @type {Boolean} 
     */
    IsPalmRejectionEnabled {
        get => this.get_IsPalmRejectionEnabled()
        set => this.put_IsPalmRejectionEnabled(value)
    }

    /**
     * @type {CoreIndependentInputSource} 
     */
    Source {
        get => this.get_Source()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTransparentForUncontrolledInput() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsTransparentForUncontrolledInput(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPalmRejectionEnabled() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsPalmRejectionEnabled(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {CoreIndependentInputSource} 
     */
    get_Source() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CoreIndependentInputSource(value)
    }

    /**
     * 
     * @param {Integer} inputTypes 
     * @returns {HRESULT} 
     */
    SetControlledInput(inputTypes) {
        result := ComCall(11, this, "uint", inputTypes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} inputTypes 
     * @param {Integer} required 
     * @param {Integer} excluded 
     * @returns {HRESULT} 
     */
    SetControlledInputWithFilters(inputTypes, required, excluded) {
        result := ComCall(12, this, "uint", inputTypes, "uint", required, "uint", excluded, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
