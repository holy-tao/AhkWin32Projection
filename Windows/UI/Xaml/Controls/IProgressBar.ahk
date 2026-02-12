#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include Primitives\ProgressBarTemplateSettings.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IProgressBar extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProgressBar
     * @type {Guid}
     */
    static IID => Guid("{ae752c89-0067-4963-bf4c-29db0c4a507e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsIndeterminate", "put_IsIndeterminate", "get_ShowError", "put_ShowError", "get_ShowPaused", "put_ShowPaused", "get_TemplateSettings"]

    /**
     * @type {Boolean} 
     */
    IsIndeterminate {
        get => this.get_IsIndeterminate()
        set => this.put_IsIndeterminate(value)
    }

    /**
     * @type {Boolean} 
     */
    ShowError {
        get => this.get_ShowError()
        set => this.put_ShowError(value)
    }

    /**
     * @type {Boolean} 
     */
    ShowPaused {
        get => this.get_ShowPaused()
        set => this.put_ShowPaused(value)
    }

    /**
     * @type {ProgressBarTemplateSettings} 
     */
    TemplateSettings {
        get => this.get_TemplateSettings()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsIndeterminate() {
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
    put_IsIndeterminate(value) {
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
    get_ShowError() {
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
    put_ShowError(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShowPaused() {
        result := ComCall(10, this, "int*", &value := 0, "int")
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
    put_ShowPaused(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ProgressBarTemplateSettings} 
     */
    get_TemplateSettings() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ProgressBarTemplateSettings(value)
    }
}
