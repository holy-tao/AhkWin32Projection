#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include Primitives\ProgressRingTemplateSettings.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IProgressRing extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProgressRing
     * @type {Guid}
     */
    static IID => Guid("{6da5e49e-6e9d-425c-bd7c-02173e39763f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsActive", "put_IsActive", "get_TemplateSettings"]

    /**
     * @type {Boolean} 
     */
    IsActive {
        get => this.get_IsActive()
        set => this.put_IsActive(value)
    }

    /**
     * @type {ProgressRingTemplateSettings} 
     */
    TemplateSettings {
        get => this.get_TemplateSettings()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsActive() {
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
    put_IsActive(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ProgressRingTemplateSettings} 
     */
    get_TemplateSettings() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ProgressRingTemplateSettings(value)
    }
}
