#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\UIElement.ahk
#Include ..\GridLength.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ITwoPaneView extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITwoPaneView
     * @type {Guid}
     */
    static IID => Guid("{1b4d0db5-14ad-5926-bb8a-5b0a5c0085f0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Pane1", "put_Pane1", "get_Pane2", "put_Pane2", "get_Pane1Length", "put_Pane1Length", "get_Pane2Length", "put_Pane2Length", "get_PanePriority", "put_PanePriority", "get_Mode", "get_WideModeConfiguration", "put_WideModeConfiguration", "get_TallModeConfiguration", "put_TallModeConfiguration", "get_MinWideModeWidth", "put_MinWideModeWidth", "get_MinTallModeHeight", "put_MinTallModeHeight", "add_ModeChanged", "remove_ModeChanged"]

    /**
     * @type {UIElement} 
     */
    Pane1 {
        get => this.get_Pane1()
        set => this.put_Pane1(value)
    }

    /**
     * @type {UIElement} 
     */
    Pane2 {
        get => this.get_Pane2()
        set => this.put_Pane2(value)
    }

    /**
     * @type {GridLength} 
     */
    Pane1Length {
        get => this.get_Pane1Length()
        set => this.put_Pane1Length(value)
    }

    /**
     * @type {GridLength} 
     */
    Pane2Length {
        get => this.get_Pane2Length()
        set => this.put_Pane2Length(value)
    }

    /**
     * @type {Integer} 
     */
    PanePriority {
        get => this.get_PanePriority()
        set => this.put_PanePriority(value)
    }

    /**
     * @type {Integer} 
     */
    Mode {
        get => this.get_Mode()
    }

    /**
     * @type {Integer} 
     */
    WideModeConfiguration {
        get => this.get_WideModeConfiguration()
        set => this.put_WideModeConfiguration(value)
    }

    /**
     * @type {Integer} 
     */
    TallModeConfiguration {
        get => this.get_TallModeConfiguration()
        set => this.put_TallModeConfiguration(value)
    }

    /**
     * @type {Float} 
     */
    MinWideModeWidth {
        get => this.get_MinWideModeWidth()
        set => this.put_MinWideModeWidth(value)
    }

    /**
     * @type {Float} 
     */
    MinTallModeHeight {
        get => this.get_MinTallModeHeight()
        set => this.put_MinTallModeHeight(value)
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_Pane1() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UIElement(value)
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_Pane1(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_Pane2() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UIElement(value)
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_Pane2(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {GridLength} 
     */
    get_Pane1Length() {
        value := GridLength()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {GridLength} value 
     * @returns {HRESULT} 
     */
    put_Pane1Length(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {GridLength} 
     */
    get_Pane2Length() {
        value := GridLength()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {GridLength} value 
     * @returns {HRESULT} 
     */
    put_Pane2Length(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PanePriority() {
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
    put_PanePriority(value) {
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
    get_Mode() {
        result := ComCall(16, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_WideModeConfiguration() {
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
    put_WideModeConfiguration(value) {
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
    get_TallModeConfiguration() {
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
    put_TallModeConfiguration(value) {
        result := ComCall(20, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinWideModeWidth() {
        result := ComCall(21, this, "double*", &value := 0, "int")
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
    put_MinWideModeWidth(value) {
        result := ComCall(22, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinTallModeHeight() {
        result := ComCall(23, this, "double*", &value := 0, "int")
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
    put_MinTallModeHeight(value) {
        result := ComCall(24, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<TwoPaneView, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ModeChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(25, this, "ptr", handler, "ptr", token, "int")
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
    remove_ModeChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(26, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
