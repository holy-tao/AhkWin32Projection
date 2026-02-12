#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include Input\KeyboardAccelerator.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IUIElement7 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIElement7
     * @type {Guid}
     */
    static IID => Guid("{cafc4968-6369-4249-80f9-3d656319e811}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_KeyboardAccelerators", "add_CharacterReceived", "remove_CharacterReceived", "add_ProcessKeyboardAccelerators", "remove_ProcessKeyboardAccelerators", "add_PreviewKeyDown", "remove_PreviewKeyDown", "add_PreviewKeyUp", "remove_PreviewKeyUp", "TryInvokeKeyboardAccelerator"]

    /**
     * @type {IVector<KeyboardAccelerator>} 
     */
    KeyboardAccelerators {
        get => this.get_KeyboardAccelerators()
    }

    /**
     * 
     * @returns {IVector<KeyboardAccelerator>} 
     */
    get_KeyboardAccelerators() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(KeyboardAccelerator, value)
    }

    /**
     * 
     * @param {TypedEventHandler<UIElement, CharacterReceivedRoutedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CharacterReceived(handler) {
        token := EventRegistrationToken()
        result := ComCall(7, this, "ptr", handler, "ptr", token, "int")
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
    remove_CharacterReceived(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(8, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<UIElement, ProcessKeyboardAcceleratorEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ProcessKeyboardAccelerators(handler) {
        token := EventRegistrationToken()
        result := ComCall(9, this, "ptr", handler, "ptr", token, "int")
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
    remove_ProcessKeyboardAccelerators(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(10, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {KeyEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PreviewKeyDown(handler) {
        token := EventRegistrationToken()
        result := ComCall(11, this, "ptr", handler, "ptr", token, "int")
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
    remove_PreviewKeyDown(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(12, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {KeyEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PreviewKeyUp(handler) {
        token := EventRegistrationToken()
        result := ComCall(13, this, "ptr", handler, "ptr", token, "int")
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
    remove_PreviewKeyUp(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(14, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {ProcessKeyboardAcceleratorEventArgs} args 
     * @returns {HRESULT} 
     */
    TryInvokeKeyboardAccelerator(args) {
        result := ComCall(15, this, "ptr", args, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
