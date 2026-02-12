#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Cortana
 * @version WindowsRuntime 1.4
 */
class ICortanaSettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICortanaSettings
     * @type {Guid}
     */
    static IID => Guid("{54d571a7-8062-40f4-abe7-dedfd697b019}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HasUserConsentToVoiceActivation", "get_IsVoiceActivationEnabled", "put_IsVoiceActivationEnabled"]

    /**
     * @type {Boolean} 
     */
    HasUserConsentToVoiceActivation {
        get => this.get_HasUserConsentToVoiceActivation()
    }

    /**
     * @type {Boolean} 
     */
    IsVoiceActivationEnabled {
        get => this.get_IsVoiceActivationEnabled()
        set => this.put_IsVoiceActivationEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasUserConsentToVoiceActivation() {
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
    get_IsVoiceActivationEnabled() {
        result := ComCall(7, this, "int*", &value := 0, "int")
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
    put_IsVoiceActivationEnabled(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
