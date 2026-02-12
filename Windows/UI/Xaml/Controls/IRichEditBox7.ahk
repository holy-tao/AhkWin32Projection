#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Media\SolidColorBrush.ahk
#Include ..\Documents\ContentLinkProviderCollection.ahk
#Include .\HandwritingView.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IRichEditBox7 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRichEditBox7
     * @type {Guid}
     */
    static IID => Guid("{980c93ea-241f-4f6a-a539-9d185c8cf18a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ContentLinkForegroundColor", "put_ContentLinkForegroundColor", "get_ContentLinkBackgroundColor", "put_ContentLinkBackgroundColor", "get_ContentLinkProviders", "put_ContentLinkProviders", "get_HandwritingView", "put_HandwritingView", "get_IsHandwritingViewEnabled", "put_IsHandwritingViewEnabled", "add_ContentLinkChanged", "remove_ContentLinkChanged", "add_ContentLinkInvoked", "remove_ContentLinkInvoked"]

    /**
     * @type {SolidColorBrush} 
     */
    ContentLinkForegroundColor {
        get => this.get_ContentLinkForegroundColor()
        set => this.put_ContentLinkForegroundColor(value)
    }

    /**
     * @type {SolidColorBrush} 
     */
    ContentLinkBackgroundColor {
        get => this.get_ContentLinkBackgroundColor()
        set => this.put_ContentLinkBackgroundColor(value)
    }

    /**
     * @type {ContentLinkProviderCollection} 
     */
    ContentLinkProviders {
        get => this.get_ContentLinkProviders()
        set => this.put_ContentLinkProviders(value)
    }

    /**
     * @type {HandwritingView} 
     */
    HandwritingView {
        get => this.get_HandwritingView()
        set => this.put_HandwritingView(value)
    }

    /**
     * @type {Boolean} 
     */
    IsHandwritingViewEnabled {
        get => this.get_IsHandwritingViewEnabled()
        set => this.put_IsHandwritingViewEnabled(value)
    }

    /**
     * 
     * @returns {SolidColorBrush} 
     */
    get_ContentLinkForegroundColor() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SolidColorBrush(value)
    }

    /**
     * 
     * @param {SolidColorBrush} value 
     * @returns {HRESULT} 
     */
    put_ContentLinkForegroundColor(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {SolidColorBrush} 
     */
    get_ContentLinkBackgroundColor() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SolidColorBrush(value)
    }

    /**
     * 
     * @param {SolidColorBrush} value 
     * @returns {HRESULT} 
     */
    put_ContentLinkBackgroundColor(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ContentLinkProviderCollection} 
     */
    get_ContentLinkProviders() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ContentLinkProviderCollection(value)
    }

    /**
     * 
     * @param {ContentLinkProviderCollection} value 
     * @returns {HRESULT} 
     */
    put_ContentLinkProviders(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HandwritingView} 
     */
    get_HandwritingView() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HandwritingView(value)
    }

    /**
     * 
     * @param {HandwritingView} value 
     * @returns {HRESULT} 
     */
    put_HandwritingView(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHandwritingViewEnabled() {
        result := ComCall(14, this, "int*", &value := 0, "int")
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
    put_IsHandwritingViewEnabled(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<RichEditBox, ContentLinkChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ContentLinkChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(16, this, "ptr", handler, "ptr", token, "int")
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
    remove_ContentLinkChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(17, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<RichEditBox, ContentLinkInvokedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ContentLinkInvoked(handler) {
        token := EventRegistrationToken()
        result := ComCall(18, this, "ptr", handler, "ptr", token, "int")
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
    remove_ContentLinkInvoked(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(19, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
