#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include .\InkToolbarMenuButton.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IInkToolbar2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkToolbar2
     * @type {Guid}
     */
    static IID => Guid("{86f0c111-b484-454a-ae78-1d25a33d1c67}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsStencilButtonChecked", "put_IsStencilButtonChecked", "get_ButtonFlyoutPlacement", "put_ButtonFlyoutPlacement", "get_Orientation", "put_Orientation", "add_IsStencilButtonCheckedChanged", "remove_IsStencilButtonCheckedChanged", "GetMenuButton"]

    /**
     * @type {Boolean} 
     */
    IsStencilButtonChecked {
        get => this.get_IsStencilButtonChecked()
        set => this.put_IsStencilButtonChecked(value)
    }

    /**
     * @type {Integer} 
     */
    ButtonFlyoutPlacement {
        get => this.get_ButtonFlyoutPlacement()
        set => this.put_ButtonFlyoutPlacement(value)
    }

    /**
     * @type {Integer} 
     */
    Orientation {
        get => this.get_Orientation()
        set => this.put_Orientation(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStencilButtonChecked() {
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
    put_IsStencilButtonChecked(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ButtonFlyoutPlacement() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_ButtonFlyoutPlacement(value) {
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
    get_Orientation() {
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
    put_Orientation(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<InkToolbar, InkToolbarIsStencilButtonCheckedChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_IsStencilButtonCheckedChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(12, this, "ptr", handler, "ptr", token, "int")
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
    remove_IsStencilButtonCheckedChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(13, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} menu 
     * @returns {InkToolbarMenuButton} 
     */
    GetMenuButton(menu) {
        result := ComCall(14, this, "int", menu, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InkToolbarMenuButton(result_)
    }
}
