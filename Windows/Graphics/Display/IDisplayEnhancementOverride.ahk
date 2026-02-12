#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ColorOverrideSettings.ahk
#Include .\BrightnessOverrideSettings.ahk
#Include .\DisplayEnhancementOverrideCapabilities.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Display
 * @version WindowsRuntime 1.4
 */
class IDisplayEnhancementOverride extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDisplayEnhancementOverride
     * @type {Guid}
     */
    static IID => Guid("{429594cf-d97a-4b02-a428-5c4292f7f522}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ColorOverrideSettings", "put_ColorOverrideSettings", "get_BrightnessOverrideSettings", "put_BrightnessOverrideSettings", "get_CanOverride", "get_IsOverrideActive", "GetCurrentDisplayEnhancementOverrideCapabilities", "RequestOverride", "StopOverride", "add_CanOverrideChanged", "remove_CanOverrideChanged", "add_IsOverrideActiveChanged", "remove_IsOverrideActiveChanged", "add_DisplayEnhancementOverrideCapabilitiesChanged", "remove_DisplayEnhancementOverrideCapabilitiesChanged"]

    /**
     * @type {ColorOverrideSettings} 
     */
    ColorOverrideSettings {
        get => this.get_ColorOverrideSettings()
        set => this.put_ColorOverrideSettings(value)
    }

    /**
     * @type {BrightnessOverrideSettings} 
     */
    BrightnessOverrideSettings {
        get => this.get_BrightnessOverrideSettings()
        set => this.put_BrightnessOverrideSettings(value)
    }

    /**
     * @type {Boolean} 
     */
    CanOverride {
        get => this.get_CanOverride()
    }

    /**
     * @type {Boolean} 
     */
    IsOverrideActive {
        get => this.get_IsOverrideActive()
    }

    /**
     * 
     * @returns {ColorOverrideSettings} 
     */
    get_ColorOverrideSettings() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ColorOverrideSettings(value)
    }

    /**
     * 
     * @param {ColorOverrideSettings} value 
     * @returns {HRESULT} 
     */
    put_ColorOverrideSettings(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BrightnessOverrideSettings} 
     */
    get_BrightnessOverrideSettings() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BrightnessOverrideSettings(value)
    }

    /**
     * 
     * @param {BrightnessOverrideSettings} value 
     * @returns {HRESULT} 
     */
    put_BrightnessOverrideSettings(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanOverride() {
        result := ComCall(10, this, "int*", &value := 0, "int")
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
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DisplayEnhancementOverrideCapabilities} 
     */
    GetCurrentDisplayEnhancementOverrideCapabilities() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DisplayEnhancementOverrideCapabilities(value)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RequestOverride() {
        result := ComCall(13, this, "int")
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
        result := ComCall(14, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<DisplayEnhancementOverride, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CanOverrideChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(15, this, "ptr", handler, "ptr", token, "int")
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
    remove_CanOverrideChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(16, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<DisplayEnhancementOverride, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_IsOverrideActiveChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(17, this, "ptr", handler, "ptr", token, "int")
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

        result := ComCall(18, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<DisplayEnhancementOverride, DisplayEnhancementOverrideCapabilitiesChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DisplayEnhancementOverrideCapabilitiesChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(19, this, "ptr", handler, "ptr", token, "int")
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
    remove_DisplayEnhancementOverrideCapabilitiesChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(20, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
