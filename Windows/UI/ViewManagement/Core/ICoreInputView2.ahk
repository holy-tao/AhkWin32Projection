#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ViewManagement.Core
 * @version WindowsRuntime 1.4
 */
class ICoreInputView2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreInputView2
     * @type {Guid}
     */
    static IID => Guid("{0ed726c1-e09a-4ae8-aedf-dfa4857d1a01}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_XYFocusTransferringFromPrimaryView", "remove_XYFocusTransferringFromPrimaryView", "add_XYFocusTransferredToPrimaryView", "remove_XYFocusTransferredToPrimaryView", "TryTransferXYFocusToPrimaryView"]

    /**
     * 
     * @param {TypedEventHandler<CoreInputView, CoreInputViewTransferringXYFocusEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_XYFocusTransferringFromPrimaryView(handler) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", token, "int")
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
    remove_XYFocusTransferringFromPrimaryView(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<CoreInputView, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_XYFocusTransferredToPrimaryView(handler) {
        token := EventRegistrationToken()
        result := ComCall(8, this, "ptr", handler, "ptr", token, "int")
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
    remove_XYFocusTransferredToPrimaryView(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {RECT} origin 
     * @param {Integer} direction_ 
     * @returns {Boolean} 
     */
    TryTransferXYFocusToPrimaryView(origin, direction_) {
        result := ComCall(10, this, "ptr", origin, "int", direction_, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
