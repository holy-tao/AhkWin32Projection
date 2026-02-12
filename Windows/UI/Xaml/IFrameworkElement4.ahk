#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\Thickness.ahk
#Include Media\Brush.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IFrameworkElement4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFrameworkElement4
     * @type {Guid}
     */
    static IID => Guid("{6b765bb3-fba3-4404-bdee-1a45d1ca5f21}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AllowFocusOnInteraction", "put_AllowFocusOnInteraction", "get_FocusVisualMargin", "put_FocusVisualMargin", "get_FocusVisualSecondaryThickness", "put_FocusVisualSecondaryThickness", "get_FocusVisualPrimaryThickness", "put_FocusVisualPrimaryThickness", "get_FocusVisualSecondaryBrush", "put_FocusVisualSecondaryBrush", "get_FocusVisualPrimaryBrush", "put_FocusVisualPrimaryBrush", "get_AllowFocusWhenDisabled", "put_AllowFocusWhenDisabled"]

    /**
     * @type {Boolean} 
     */
    AllowFocusOnInteraction {
        get => this.get_AllowFocusOnInteraction()
        set => this.put_AllowFocusOnInteraction(value)
    }

    /**
     * @type {Thickness} 
     */
    FocusVisualMargin {
        get => this.get_FocusVisualMargin()
        set => this.put_FocusVisualMargin(value)
    }

    /**
     * @type {Thickness} 
     */
    FocusVisualSecondaryThickness {
        get => this.get_FocusVisualSecondaryThickness()
        set => this.put_FocusVisualSecondaryThickness(value)
    }

    /**
     * @type {Thickness} 
     */
    FocusVisualPrimaryThickness {
        get => this.get_FocusVisualPrimaryThickness()
        set => this.put_FocusVisualPrimaryThickness(value)
    }

    /**
     * @type {Brush} 
     */
    FocusVisualSecondaryBrush {
        get => this.get_FocusVisualSecondaryBrush()
        set => this.put_FocusVisualSecondaryBrush(value)
    }

    /**
     * @type {Brush} 
     */
    FocusVisualPrimaryBrush {
        get => this.get_FocusVisualPrimaryBrush()
        set => this.put_FocusVisualPrimaryBrush(value)
    }

    /**
     * @type {Boolean} 
     */
    AllowFocusWhenDisabled {
        get => this.get_AllowFocusWhenDisabled()
        set => this.put_AllowFocusWhenDisabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowFocusOnInteraction() {
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
    put_AllowFocusOnInteraction(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_FocusVisualMargin() {
        value := Thickness()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_FocusVisualMargin(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_FocusVisualSecondaryThickness() {
        value := Thickness()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_FocusVisualSecondaryThickness(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_FocusVisualPrimaryThickness() {
        value := Thickness()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_FocusVisualPrimaryThickness(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_FocusVisualSecondaryBrush() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Brush(value)
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_FocusVisualSecondaryBrush(value) {
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_FocusVisualPrimaryBrush() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Brush(value)
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_FocusVisualPrimaryBrush(value) {
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowFocusWhenDisabled() {
        result := ComCall(18, this, "int*", &value := 0, "int")
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
    put_AllowFocusWhenDisabled(value) {
        result := ComCall(19, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
