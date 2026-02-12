#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IFrameworkElement6 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFrameworkElement6
     * @type {Guid}
     */
    static IID => Guid("{792a5d91-62a1-40bf-a0ce-f9c131fcb7a7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ActualTheme", "add_ActualThemeChanged", "remove_ActualThemeChanged"]

    /**
     * @type {Integer} 
     */
    ActualTheme {
        get => this.get_ActualTheme()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ActualTheme() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<FrameworkElement, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ActualThemeChanged(handler) {
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
    remove_ActualThemeChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(8, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
