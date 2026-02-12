#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Display
 * @version WindowsRuntime 1.4
 */
class IBrightnessOverride extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBrightnessOverride
     * @type {Guid}
     */
    static IID => Guid("{96c9621a-c143-4392-bedd-4a7e9574c8fd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsSupported", "get_IsOverrideActive", "get_BrightnessLevel", "SetBrightnessLevel", "SetBrightnessScenario", "GetLevelForScenario", "StartOverride", "StopOverride", "add_IsSupportedChanged", "remove_IsSupportedChanged", "add_IsOverrideActiveChanged", "remove_IsOverrideActiveChanged", "add_BrightnessLevelChanged", "remove_BrightnessLevelChanged"]

    /**
     * @type {Boolean} 
     */
    IsSupported {
        get => this.get_IsSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsOverrideActive {
        get => this.get_IsOverrideActive()
    }

    /**
     * @type {Float} 
     */
    BrightnessLevel {
        get => this.get_BrightnessLevel()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSupported() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOverrideActive() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_BrightnessLevel() {
        result := ComCall(8, this, "double*", &level := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return level
    }

    /**
     * 
     * @param {Float} brightnessLevel 
     * @param {Integer} options 
     * @returns {HRESULT} 
     */
    SetBrightnessLevel(brightnessLevel, options) {
        result := ComCall(9, this, "double", brightnessLevel, "uint", options, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} scenario 
     * @param {Integer} options 
     * @returns {HRESULT} 
     */
    SetBrightnessScenario(scenario, options) {
        result := ComCall(10, this, "int", scenario, "uint", options, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} scenario 
     * @returns {Float} 
     */
    GetLevelForScenario(scenario) {
        result := ComCall(11, this, "int", scenario, "double*", &brightnessLevel := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return brightnessLevel
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StartOverride() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopOverride() {
        result := ComCall(13, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<BrightnessOverride, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_IsSupportedChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(14, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_IsSupportedChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(15, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<BrightnessOverride, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_IsOverrideActiveChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(16, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_IsOverrideActiveChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(17, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<BrightnessOverride, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_BrightnessLevelChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(18, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_BrightnessLevelChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(19, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
