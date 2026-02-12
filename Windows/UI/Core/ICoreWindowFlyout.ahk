#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\Foundation\SIZE.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\Popups\IUICommand.ahk
#Include ..\Popups\UICommandInvokedHandler.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class ICoreWindowFlyout extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreWindowFlyout
     * @type {Guid}
     */
    static IID => Guid("{e89d854d-2050-40bb-b344-f6f355eeb314}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_Showing", "remove_Showing", "get_MaxSize", "get_MinSize", "get_Title", "put_Title", "get_IsInteractionDelayed", "put_IsInteractionDelayed", "get_Commands", "get_DefaultCommandIndex", "put_DefaultCommandIndex", "get_BackButtonCommand", "put_BackButtonCommand", "ShowAsync"]

    /**
     * @type {SIZE} 
     */
    MaxSize {
        get => this.get_MaxSize()
    }

    /**
     * @type {SIZE} 
     */
    MinSize {
        get => this.get_MinSize()
    }

    /**
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     * @type {Integer} 
     */
    IsInteractionDelayed {
        get => this.get_IsInteractionDelayed()
        set => this.put_IsInteractionDelayed(value)
    }

    /**
     * @type {IVector<IUICommand>} 
     */
    Commands {
        get => this.get_Commands()
    }

    /**
     * @type {Integer} 
     */
    DefaultCommandIndex {
        get => this.get_DefaultCommandIndex()
        set => this.put_DefaultCommandIndex(value)
    }

    /**
     * @type {UICommandInvokedHandler} 
     */
    BackButtonCommand {
        get => this.get_BackButtonCommand()
        set => this.put_BackButtonCommand(value)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWindow, CoreWindowPopupShowingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Showing(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_Showing(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(7, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_MaxSize() {
        value := SIZE()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_MinSize() {
        value := SIZE()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
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
    put_Title(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

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
    get_IsInteractionDelayed() {
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
    put_IsInteractionDelayed(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<IUICommand>} 
     */
    get_Commands() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(IUICommand, value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DefaultCommandIndex() {
        result := ComCall(15, this, "uint*", &value := 0, "int")
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
    put_DefaultCommandIndex(value) {
        result := ComCall(16, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {UICommandInvokedHandler} 
     */
    get_BackButtonCommand() {
        result := ComCall(17, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UICommandInvokedHandler(value)
    }

    /**
     * 
     * @param {UICommandInvokedHandler} value 
     * @returns {HRESULT} 
     */
    put_BackButtonCommand(value) {
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IAsyncOperation<IUICommand>} 
     */
    ShowAsync() {
        result := ComCall(19, this, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IUICommand, asyncInfo)
    }
}
