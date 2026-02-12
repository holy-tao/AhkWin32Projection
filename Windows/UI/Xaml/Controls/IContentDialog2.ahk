#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Input\ICommand.ahk
#Include ..\Style.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IContentDialog2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContentDialog2
     * @type {Guid}
     */
    static IID => Guid("{2f93eb45-ee43-4303-9b38-3fe1a111ecbf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CloseButtonText", "put_CloseButtonText", "get_CloseButtonCommand", "put_CloseButtonCommand", "get_CloseButtonCommandParameter", "put_CloseButtonCommandParameter", "get_PrimaryButtonStyle", "put_PrimaryButtonStyle", "get_SecondaryButtonStyle", "put_SecondaryButtonStyle", "get_CloseButtonStyle", "put_CloseButtonStyle", "get_DefaultButton", "put_DefaultButton", "add_CloseButtonClick", "remove_CloseButtonClick"]

    /**
     * @type {HSTRING} 
     */
    CloseButtonText {
        get => this.get_CloseButtonText()
        set => this.put_CloseButtonText(value)
    }

    /**
     * @type {ICommand} 
     */
    CloseButtonCommand {
        get => this.get_CloseButtonCommand()
        set => this.put_CloseButtonCommand(value)
    }

    /**
     * @type {IInspectable} 
     */
    CloseButtonCommandParameter {
        get => this.get_CloseButtonCommandParameter()
        set => this.put_CloseButtonCommandParameter(value)
    }

    /**
     * @type {Style} 
     */
    PrimaryButtonStyle {
        get => this.get_PrimaryButtonStyle()
        set => this.put_PrimaryButtonStyle(value)
    }

    /**
     * @type {Style} 
     */
    SecondaryButtonStyle {
        get => this.get_SecondaryButtonStyle()
        set => this.put_SecondaryButtonStyle(value)
    }

    /**
     * @type {Style} 
     */
    CloseButtonStyle {
        get => this.get_CloseButtonStyle()
        set => this.put_CloseButtonStyle(value)
    }

    /**
     * @type {Integer} 
     */
    DefaultButton {
        get => this.get_DefaultButton()
        set => this.put_DefaultButton(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CloseButtonText() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_CloseButtonText(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ICommand} 
     */
    get_CloseButtonCommand() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ICommand(value)
    }

    /**
     * 
     * @param {ICommand} value 
     * @returns {HRESULT} 
     */
    put_CloseButtonCommand(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_CloseButtonCommandParameter() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_CloseButtonCommandParameter(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Style} 
     */
    get_PrimaryButtonStyle() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Style(value)
    }

    /**
     * 
     * @param {Style} value 
     * @returns {HRESULT} 
     */
    put_PrimaryButtonStyle(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Style} 
     */
    get_SecondaryButtonStyle() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Style(value)
    }

    /**
     * 
     * @param {Style} value 
     * @returns {HRESULT} 
     */
    put_SecondaryButtonStyle(value) {
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Style} 
     */
    get_CloseButtonStyle() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Style(value)
    }

    /**
     * 
     * @param {Style} value 
     * @returns {HRESULT} 
     */
    put_CloseButtonStyle(value) {
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DefaultButton() {
        result := ComCall(18, this, "int*", &value := 0, "int")
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
    put_DefaultButton(value) {
        result := ComCall(19, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<ContentDialog, ContentDialogButtonClickEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CloseButtonClick(handler) {
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
    remove_CloseButtonClick(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(21, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
