#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IFrameworkElement7 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFrameworkElement7
     * @type {Guid}
     */
    static IID => Guid("{2263886c-c069-570f-b9cc-9e21dd028d8e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsLoaded", "add_EffectiveViewportChanged", "remove_EffectiveViewportChanged"]

    /**
     * @type {Boolean} 
     */
    IsLoaded {
        get => this.get_IsLoaded()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsLoaded() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<FrameworkElement, EffectiveViewportChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_EffectiveViewportChanged(handler) {
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
    remove_EffectiveViewportChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(8, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
