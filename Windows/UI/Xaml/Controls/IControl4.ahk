#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyObject.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IControl4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IControl4
     * @type {Guid}
     */
    static IID => Guid("{0e18aeee-5f2e-44ea-8513-d3875c0a7513}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsFocusEngagementEnabled", "put_IsFocusEngagementEnabled", "get_IsFocusEngaged", "put_IsFocusEngaged", "get_RequiresPointer", "put_RequiresPointer", "get_XYFocusLeft", "put_XYFocusLeft", "get_XYFocusRight", "put_XYFocusRight", "get_XYFocusUp", "put_XYFocusUp", "get_XYFocusDown", "put_XYFocusDown", "get_ElementSoundMode", "put_ElementSoundMode", "add_FocusEngaged", "remove_FocusEngaged", "add_FocusDisengaged", "remove_FocusDisengaged", "RemoveFocusEngagement"]

    /**
     * @type {Boolean} 
     */
    IsFocusEngagementEnabled {
        get => this.get_IsFocusEngagementEnabled()
        set => this.put_IsFocusEngagementEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsFocusEngaged {
        get => this.get_IsFocusEngaged()
        set => this.put_IsFocusEngaged(value)
    }

    /**
     * @type {Integer} 
     */
    RequiresPointer {
        get => this.get_RequiresPointer()
        set => this.put_RequiresPointer(value)
    }

    /**
     * @type {DependencyObject} 
     */
    XYFocusLeft {
        get => this.get_XYFocusLeft()
        set => this.put_XYFocusLeft(value)
    }

    /**
     * @type {DependencyObject} 
     */
    XYFocusRight {
        get => this.get_XYFocusRight()
        set => this.put_XYFocusRight(value)
    }

    /**
     * @type {DependencyObject} 
     */
    XYFocusUp {
        get => this.get_XYFocusUp()
        set => this.put_XYFocusUp(value)
    }

    /**
     * @type {DependencyObject} 
     */
    XYFocusDown {
        get => this.get_XYFocusDown()
        set => this.put_XYFocusDown(value)
    }

    /**
     * @type {Integer} 
     */
    ElementSoundMode {
        get => this.get_ElementSoundMode()
        set => this.put_ElementSoundMode(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFocusEngagementEnabled() {
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
    put_IsFocusEngagementEnabled(value) {
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
    get_IsFocusEngaged() {
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
    put_IsFocusEngaged(value) {
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
    get_RequiresPointer() {
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
    put_RequiresPointer(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_XYFocusLeft() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyObject(value)
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_XYFocusLeft(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_XYFocusRight() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyObject(value)
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_XYFocusRight(value) {
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_XYFocusUp() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyObject(value)
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_XYFocusUp(value) {
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_XYFocusDown() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyObject(value)
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_XYFocusDown(value) {
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ElementSoundMode() {
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
    put_ElementSoundMode(value) {
        result := ComCall(21, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<Control, FocusEngagedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FocusEngaged(handler) {
        token := EventRegistrationToken()
        result := ComCall(22, this, "ptr", handler, "ptr", token, "int")
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
    remove_FocusEngaged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(23, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<Control, FocusDisengagedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FocusDisengaged(handler) {
        token := EventRegistrationToken()
        result := ComCall(24, this, "ptr", handler, "ptr", token, "int")
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
    remove_FocusDisengaged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(25, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveFocusEngagement() {
        result := ComCall(26, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
