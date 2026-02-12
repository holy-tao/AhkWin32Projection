#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyObject.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Documents
 * @version WindowsRuntime 1.4
 */
class ITextElement4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextElement4
     * @type {Guid}
     */
    static IID => Guid("{b196e222-ca0e-48a9-83bc-36ce50566ac7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TextDecorations", "put_TextDecorations", "get_IsAccessKeyScope", "put_IsAccessKeyScope", "get_AccessKeyScopeOwner", "put_AccessKeyScopeOwner", "get_KeyTipPlacementMode", "put_KeyTipPlacementMode", "get_KeyTipHorizontalOffset", "put_KeyTipHorizontalOffset", "get_KeyTipVerticalOffset", "put_KeyTipVerticalOffset", "add_AccessKeyDisplayRequested", "remove_AccessKeyDisplayRequested", "add_AccessKeyDisplayDismissed", "remove_AccessKeyDisplayDismissed", "add_AccessKeyInvoked", "remove_AccessKeyInvoked"]

    /**
     * @type {Integer} 
     */
    TextDecorations {
        get => this.get_TextDecorations()
        set => this.put_TextDecorations(value)
    }

    /**
     * @type {Boolean} 
     */
    IsAccessKeyScope {
        get => this.get_IsAccessKeyScope()
        set => this.put_IsAccessKeyScope(value)
    }

    /**
     * @type {DependencyObject} 
     */
    AccessKeyScopeOwner {
        get => this.get_AccessKeyScopeOwner()
        set => this.put_AccessKeyScopeOwner(value)
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
     * 
     * @returns {Integer} 
     */
    get_TextDecorations() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
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
    put_TextDecorations(value) {
        result := ComCall(7, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAccessKeyScope() {
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
    put_IsAccessKeyScope(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_AccessKeyScopeOwner() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
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
    put_AccessKeyScopeOwner(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_KeyTipPlacementMode() {
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
    put_KeyTipPlacementMode(value) {
        result := ComCall(13, this, "int", value, "int")
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
        result := ComCall(14, this, "double*", &value := 0, "int")
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
        result := ComCall(15, this, "double", value, "int")
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
        result := ComCall(16, this, "double*", &value := 0, "int")
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
        result := ComCall(17, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<TextElement, AccessKeyDisplayRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AccessKeyDisplayRequested(handler) {
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
    remove_AccessKeyDisplayRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(19, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<TextElement, AccessKeyDisplayDismissedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AccessKeyDisplayDismissed(handler) {
        token := EventRegistrationToken()
        result := ComCall(20, this, "ptr", handler, "ptr", token, "int")
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
    remove_AccessKeyDisplayDismissed(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(21, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<TextElement, AccessKeyInvokedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AccessKeyInvoked(handler) {
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
    remove_AccessKeyInvoked(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(23, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
