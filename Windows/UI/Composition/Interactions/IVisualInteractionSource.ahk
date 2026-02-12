#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Visual.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class IVisualInteractionSource extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVisualInteractionSource
     * @type {Guid}
     */
    static IID => Guid("{ca0e8a86-d8d6-4111-b088-70347bd2b0ed}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsPositionXRailsEnabled", "put_IsPositionXRailsEnabled", "get_IsPositionYRailsEnabled", "put_IsPositionYRailsEnabled", "get_ManipulationRedirectionMode", "put_ManipulationRedirectionMode", "get_PositionXChainingMode", "put_PositionXChainingMode", "get_PositionXSourceMode", "put_PositionXSourceMode", "get_PositionYChainingMode", "put_PositionYChainingMode", "get_PositionYSourceMode", "put_PositionYSourceMode", "get_ScaleChainingMode", "put_ScaleChainingMode", "get_ScaleSourceMode", "put_ScaleSourceMode", "get_Source", "TryRedirectForManipulation"]

    /**
     * @type {Boolean} 
     */
    IsPositionXRailsEnabled {
        get => this.get_IsPositionXRailsEnabled()
        set => this.put_IsPositionXRailsEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsPositionYRailsEnabled {
        get => this.get_IsPositionYRailsEnabled()
        set => this.put_IsPositionYRailsEnabled(value)
    }

    /**
     * @type {Integer} 
     */
    ManipulationRedirectionMode {
        get => this.get_ManipulationRedirectionMode()
        set => this.put_ManipulationRedirectionMode(value)
    }

    /**
     * @type {Integer} 
     */
    PositionXChainingMode {
        get => this.get_PositionXChainingMode()
        set => this.put_PositionXChainingMode(value)
    }

    /**
     * @type {Integer} 
     */
    PositionXSourceMode {
        get => this.get_PositionXSourceMode()
        set => this.put_PositionXSourceMode(value)
    }

    /**
     * @type {Integer} 
     */
    PositionYChainingMode {
        get => this.get_PositionYChainingMode()
        set => this.put_PositionYChainingMode(value)
    }

    /**
     * @type {Integer} 
     */
    PositionYSourceMode {
        get => this.get_PositionYSourceMode()
        set => this.put_PositionYSourceMode(value)
    }

    /**
     * @type {Integer} 
     */
    ScaleChainingMode {
        get => this.get_ScaleChainingMode()
        set => this.put_ScaleChainingMode(value)
    }

    /**
     * @type {Integer} 
     */
    ScaleSourceMode {
        get => this.get_ScaleSourceMode()
        set => this.put_ScaleSourceMode(value)
    }

    /**
     * @type {Visual} 
     */
    Source {
        get => this.get_Source()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPositionXRailsEnabled() {
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
    put_IsPositionXRailsEnabled(value) {
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
    get_IsPositionYRailsEnabled() {
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
    put_IsPositionYRailsEnabled(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ManipulationRedirectionMode() {
        result := ComCall(10, this, "int*", &value := 0, "int")
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
    put_ManipulationRedirectionMode(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PositionXChainingMode() {
        result := ComCall(12, this, "int*", &value := 0, "int")
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
    put_PositionXChainingMode(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PositionXSourceMode() {
        result := ComCall(14, this, "int*", &value := 0, "int")
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
    put_PositionXSourceMode(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PositionYChainingMode() {
        result := ComCall(16, this, "int*", &value := 0, "int")
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
    put_PositionYChainingMode(value) {
        result := ComCall(17, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PositionYSourceMode() {
        result := ComCall(18, this, "int*", &value := 0, "int")
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
    put_PositionYSourceMode(value) {
        result := ComCall(19, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ScaleChainingMode() {
        result := ComCall(20, this, "int*", &value := 0, "int")
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
    put_ScaleChainingMode(value) {
        result := ComCall(21, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ScaleSourceMode() {
        result := ComCall(22, this, "int*", &value := 0, "int")
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
    put_ScaleSourceMode(value) {
        result := ComCall(23, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Visual} 
     */
    get_Source() {
        result := ComCall(24, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Visual(value)
    }

    /**
     * 
     * @param {PointerPoint} pointerPoint_ 
     * @returns {HRESULT} 
     */
    TryRedirectForManipulation(pointerPoint_) {
        result := ComCall(25, this, "ptr", pointerPoint_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
