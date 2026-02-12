#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Text\ContentLinkInfo.ahk
#Include ..\Media\Brush.ahk
#Include ..\DependencyObject.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Documents
 * @version WindowsRuntime 1.4
 */
class IContentLink extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContentLink
     * @type {Guid}
     */
    static IID => Guid("{6c60c3e1-528c-42f8-92be-34b8c68be304}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Info", "put_Info", "get_Background", "put_Background", "get_Cursor", "put_Cursor", "get_XYFocusLeft", "put_XYFocusLeft", "get_XYFocusRight", "put_XYFocusRight", "get_XYFocusUp", "put_XYFocusUp", "get_XYFocusDown", "put_XYFocusDown", "get_ElementSoundMode", "put_ElementSoundMode", "get_FocusState", "get_XYFocusUpNavigationStrategy", "put_XYFocusUpNavigationStrategy", "get_XYFocusDownNavigationStrategy", "put_XYFocusDownNavigationStrategy", "get_XYFocusLeftNavigationStrategy", "put_XYFocusLeftNavigationStrategy", "get_XYFocusRightNavigationStrategy", "put_XYFocusRightNavigationStrategy", "get_IsTabStop", "put_IsTabStop", "get_TabIndex", "put_TabIndex", "add_Invoked", "remove_Invoked", "add_GotFocus", "remove_GotFocus", "add_LostFocus", "remove_LostFocus", "Focus"]

    /**
     * @type {ContentLinkInfo} 
     */
    Info {
        get => this.get_Info()
        set => this.put_Info(value)
    }

    /**
     * @type {Brush} 
     */
    Background {
        get => this.get_Background()
        set => this.put_Background(value)
    }

    /**
     * @type {Integer} 
     */
    Cursor {
        get => this.get_Cursor()
        set => this.put_Cursor(value)
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
     * @type {Integer} 
     */
    FocusState {
        get => this.get_FocusState()
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
     * @type {Boolean} 
     */
    IsTabStop {
        get => this.get_IsTabStop()
        set => this.put_IsTabStop(value)
    }

    /**
     * @type {Integer} 
     */
    TabIndex {
        get => this.get_TabIndex()
        set => this.put_TabIndex(value)
    }

    /**
     * 
     * @returns {ContentLinkInfo} 
     */
    get_Info() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ContentLinkInfo(value)
    }

    /**
     * 
     * @param {ContentLinkInfo} value 
     * @returns {HRESULT} 
     */
    put_Info(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_Background() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
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
    put_Background(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Cursor() {
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
    put_Cursor(value) {
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
     * @returns {Integer} 
     */
    get_FocusState() {
        result := ComCall(22, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_XYFocusUpNavigationStrategy() {
        result := ComCall(23, this, "int*", &value := 0, "int")
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
        result := ComCall(24, this, "int", value, "int")
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
    put_XYFocusDownNavigationStrategy(value) {
        result := ComCall(26, this, "int", value, "int")
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
        result := ComCall(27, this, "int*", &value := 0, "int")
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
        result := ComCall(28, this, "int", value, "int")
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
        result := ComCall(29, this, "int*", &value := 0, "int")
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
        result := ComCall(30, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTabStop() {
        result := ComCall(31, this, "int*", &value := 0, "int")
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
    put_IsTabStop(value) {
        result := ComCall(32, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TabIndex() {
        result := ComCall(33, this, "int*", &value := 0, "int")
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
    put_TabIndex(value) {
        result := ComCall(34, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<ContentLink, ContentLinkInvokedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Invoked(handler) {
        token := EventRegistrationToken()
        result := ComCall(35, this, "ptr", handler, "ptr", token, "int")
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
    remove_Invoked(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(36, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_GotFocus(handler) {
        token := EventRegistrationToken()
        result := ComCall(37, this, "ptr", handler, "ptr", token, "int")
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
    remove_GotFocus(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(38, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LostFocus(handler) {
        token := EventRegistrationToken()
        result := ComCall(39, this, "ptr", handler, "ptr", token, "int")
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
    remove_LostFocus(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(40, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Configures the [FocusControl](focuscontrol.md) object with values specified in the provided [FocusSettings](focussettings.md) object.
     * @remarks
     * Autofocus mode, enabled by using the [FocusMode.Continuous](focusmode.md) value in the [FocusSettings](focussettings.md) object supplied to this method, is only supported while the preview stream is running. Check to make sure that the preview stream is running before turning on continuous autofocus.
     * @param {Integer} value 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.focuscontrol.configure
     */
    Focus(value) {
        result := ComCall(41, this, "int", value, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
