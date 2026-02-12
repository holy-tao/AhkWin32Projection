#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IToggleSwitchTemplateSettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IToggleSwitchTemplateSettings
     * @type {Guid}
     */
    static IID => Guid("{02b7bdcd-628a-4363-86e0-51d6e2e89e58}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_KnobCurrentToOnOffset", "get_KnobCurrentToOffOffset", "get_KnobOnToOffOffset", "get_KnobOffToOnOffset", "get_CurtainCurrentToOnOffset", "get_CurtainCurrentToOffOffset", "get_CurtainOnToOffOffset", "get_CurtainOffToOnOffset"]

    /**
     * @type {Float} 
     */
    KnobCurrentToOnOffset {
        get => this.get_KnobCurrentToOnOffset()
    }

    /**
     * @type {Float} 
     */
    KnobCurrentToOffOffset {
        get => this.get_KnobCurrentToOffOffset()
    }

    /**
     * @type {Float} 
     */
    KnobOnToOffOffset {
        get => this.get_KnobOnToOffOffset()
    }

    /**
     * @type {Float} 
     */
    KnobOffToOnOffset {
        get => this.get_KnobOffToOnOffset()
    }

    /**
     * @type {Float} 
     */
    CurtainCurrentToOnOffset {
        get => this.get_CurtainCurrentToOnOffset()
    }

    /**
     * @type {Float} 
     */
    CurtainCurrentToOffOffset {
        get => this.get_CurtainCurrentToOffOffset()
    }

    /**
     * @type {Float} 
     */
    CurtainOnToOffOffset {
        get => this.get_CurtainOnToOffOffset()
    }

    /**
     * @type {Float} 
     */
    CurtainOffToOnOffset {
        get => this.get_CurtainOffToOnOffset()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_KnobCurrentToOnOffset() {
        result := ComCall(6, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_KnobCurrentToOffOffset() {
        result := ComCall(7, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_KnobOnToOffOffset() {
        result := ComCall(8, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_KnobOffToOnOffset() {
        result := ComCall(9, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CurtainCurrentToOnOffset() {
        result := ComCall(10, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CurtainCurrentToOffOffset() {
        result := ComCall(11, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CurtainOnToOffOffset() {
        result := ComCall(12, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CurtainOffToOnOffset() {
        result := ComCall(13, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
