#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Gaming.Input.ForceFeedback
 * @version WindowsRuntime 1.4
 */
class IForceFeedbackMotor extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IForceFeedbackMotor
     * @type {Guid}
     */
    static IID => Guid("{8d3d417c-a5ea-4516-8026-2b00f74ef6e5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AreEffectsPaused", "get_MasterGain", "put_MasterGain", "get_IsEnabled", "get_SupportedAxes", "LoadEffectAsync", "PauseAllEffects", "ResumeAllEffects", "StopAllEffects", "TryDisableAsync", "TryEnableAsync", "TryResetAsync", "TryUnloadEffectAsync"]

    /**
     * @type {Boolean} 
     */
    AreEffectsPaused {
        get => this.get_AreEffectsPaused()
    }

    /**
     * @type {Float} 
     */
    MasterGain {
        get => this.get_MasterGain()
        set => this.put_MasterGain(value)
    }

    /**
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
    }

    /**
     * @type {Integer} 
     */
    SupportedAxes {
        get => this.get_SupportedAxes()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AreEffectsPaused() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MasterGain() {
        result := ComCall(7, this, "double*", &value := 0, "int")
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
    put_MasterGain(value) {
        result := ComCall(8, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabled() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SupportedAxes() {
        result := ComCall(10, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {IForceFeedbackEffect} effect_ 
     * @returns {IAsyncOperation<Integer>} 
     */
    LoadEffectAsync(effect_) {
        result := ComCall(11, this, "ptr", effect_, "ptr*", &asyncOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), asyncOperation)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PauseAllEffects() {
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
    ResumeAllEffects() {
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
    StopAllEffects() {
        result := ComCall(14, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryDisableAsync() {
        result := ComCall(15, this, "ptr*", &asyncOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), asyncOperation)
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryEnableAsync() {
        result := ComCall(16, this, "ptr*", &asyncOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), asyncOperation)
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryResetAsync() {
        result := ComCall(17, this, "ptr*", &asyncOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), asyncOperation)
    }

    /**
     * 
     * @param {IForceFeedbackEffect} effect_ 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryUnloadEffectAsync(effect_) {
        result := ComCall(18, this, "ptr", effect_, "ptr*", &asyncOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), asyncOperation)
    }
}
