#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include Media\XamlLight.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IUIElement5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIElement5
     * @type {Guid}
     */
    static IID => Guid("{8eed9bc2-a58c-4453-af0f-a92ee06d0317}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Lights", "get_KeyTipPlacementMode", "put_KeyTipPlacementMode", "get_KeyTipHorizontalOffset", "put_KeyTipHorizontalOffset", "get_KeyTipVerticalOffset", "put_KeyTipVerticalOffset", "get_XYFocusKeyboardNavigation", "put_XYFocusKeyboardNavigation", "get_XYFocusUpNavigationStrategy", "put_XYFocusUpNavigationStrategy", "get_XYFocusDownNavigationStrategy", "put_XYFocusDownNavigationStrategy", "get_XYFocusLeftNavigationStrategy", "put_XYFocusLeftNavigationStrategy", "get_XYFocusRightNavigationStrategy", "put_XYFocusRightNavigationStrategy", "get_HighContrastAdjustment", "put_HighContrastAdjustment", "get_TabFocusNavigation", "put_TabFocusNavigation", "add_GettingFocus", "remove_GettingFocus", "add_LosingFocus", "remove_LosingFocus", "add_NoFocusCandidateFound", "remove_NoFocusCandidateFound", "StartBringIntoView", "StartBringIntoViewWithOptions"]

    /**
     * @type {IVector<XamlLight>} 
     */
    Lights {
        get => this.get_Lights()
    }

    /**
     * @type {Integer} 
     */
    KeyTipPlacementMode {
        get => this.get_KeyTipPlacementMode()
        set => this.put_KeyTipPlacementMode(value)
    }

    /**
     * @type {Float} 
     */
    KeyTipHorizontalOffset {
        get => this.get_KeyTipHorizontalOffset()
        set => this.put_KeyTipHorizontalOffset(value)
    }

    /**
     * @type {Float} 
     */
    KeyTipVerticalOffset {
        get => this.get_KeyTipVerticalOffset()
        set => this.put_KeyTipVerticalOffset(value)
    }

    /**
     * @type {Integer} 
     */
    XYFocusKeyboardNavigation {
        get => this.get_XYFocusKeyboardNavigation()
        set => this.put_XYFocusKeyboardNavigation(value)
    }

    /**
     * @type {Integer} 
     */
    XYFocusUpNavigationStrategy {
        get => this.get_XYFocusUpNavigationStrategy()
        set => this.put_XYFocusUpNavigationStrategy(value)
    }

    /**
     * @type {Integer} 
     */
    XYFocusDownNavigationStrategy {
        get => this.get_XYFocusDownNavigationStrategy()
        set => this.put_XYFocusDownNavigationStrategy(value)
    }

    /**
     * @type {Integer} 
     */
    XYFocusLeftNavigationStrategy {
        get => this.get_XYFocusLeftNavigationStrategy()
        set => this.put_XYFocusLeftNavigationStrategy(value)
    }

    /**
     * @type {Integer} 
     */
    XYFocusRightNavigationStrategy {
        get => this.get_XYFocusRightNavigationStrategy()
        set => this.put_XYFocusRightNavigationStrategy(value)
    }

    /**
     * @type {Integer} 
     */
    HighContrastAdjustment {
        get => this.get_HighContrastAdjustment()
        set => this.put_HighContrastAdjustment(value)
    }

    /**
     * @type {Integer} 
     */
    TabFocusNavigation {
        get => this.get_TabFocusNavigation()
        set => this.put_TabFocusNavigation(value)
    }

    /**
     * 
     * @returns {IVector<XamlLight>} 
     */
    get_Lights() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(XamlLight, value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_KeyTipPlacementMode() {
        result := ComCall(7, this, "int*", &value := 0, "int")
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
    put_KeyTipPlacementMode(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_KeyTipHorizontalOffset() {
        result := ComCall(9, this, "double*", &value := 0, "int")
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
    put_KeyTipHorizontalOffset(value) {
        result := ComCall(10, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_KeyTipVerticalOffset() {
        result := ComCall(11, this, "double*", &value := 0, "int")
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
    put_KeyTipVerticalOffset(value) {
        result := ComCall(12, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_XYFocusKeyboardNavigation() {
        result := ComCall(13, this, "int*", &value := 0, "int")
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
    put_XYFocusKeyboardNavigation(value) {
        result := ComCall(14, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_XYFocusUpNavigationStrategy() {
        result := ComCall(15, this, "int*", &value := 0, "int")
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
    put_XYFocusUpNavigationStrategy(value) {
        result := ComCall(16, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_XYFocusDownNavigationStrategy() {
        result := ComCall(17, this, "int*", &value := 0, "int")
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
    put_XYFocusDownNavigationStrategy(value) {
        result := ComCall(18, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_XYFocusLeftNavigationStrategy() {
        result := ComCall(19, this, "int*", &value := 0, "int")
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
    put_XYFocusLeftNavigationStrategy(value) {
        result := ComCall(20, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_XYFocusRightNavigationStrategy() {
        result := ComCall(21, this, "int*", &value := 0, "int")
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
    put_XYFocusRightNavigationStrategy(value) {
        result := ComCall(22, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HighContrastAdjustment() {
        result := ComCall(23, this, "uint*", &value := 0, "int")
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
    put_HighContrastAdjustment(value) {
        result := ComCall(24, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TabFocusNavigation() {
        result := ComCall(25, this, "int*", &value := 0, "int")
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
    put_TabFocusNavigation(value) {
        result := ComCall(26, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<UIElement, GettingFocusEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_GettingFocus(handler) {
        token := EventRegistrationToken()
        result := ComCall(27, this, "ptr", handler, "ptr", token, "int")
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
    remove_GettingFocus(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(28, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<UIElement, LosingFocusEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LosingFocus(handler) {
        token := EventRegistrationToken()
        result := ComCall(29, this, "ptr", handler, "ptr", token, "int")
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
    remove_LosingFocus(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(30, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<UIElement, NoFocusCandidateFoundEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_NoFocusCandidateFound(handler) {
        token := EventRegistrationToken()
        result := ComCall(31, this, "ptr", handler, "ptr", token, "int")
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
    remove_NoFocusCandidateFound(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(32, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StartBringIntoView() {
        result := ComCall(33, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BringIntoViewOptions} options 
     * @returns {HRESULT} 
     */
    StartBringIntoViewWithOptions(options) {
        result := ComCall(34, this, "ptr", options, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
