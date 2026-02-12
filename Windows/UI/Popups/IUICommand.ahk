#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\UICommandInvokedHandler.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents a command in a context menu or message dialog box.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.popups.iuicommand
 * @namespace Windows.UI.Popups
 * @version WindowsRuntime 1.4
 */
class IUICommand extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUICommand
     * @type {Guid}
     */
    static IID => Guid("{4ff93a75-4145-47ff-ac7f-dff1c1fa5b0f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Label", "put_Label", "get_Invoked", "put_Invoked", "get_Id", "put_Id"]

    /**
     * Gets or sets the label for the command.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.popups.iuicommand.label
     * @type {HSTRING} 
     */
    Label {
        get => this.get_Label()
        set => this.put_Label(value)
    }

    /**
     * Gets or sets the handler for the event that is fired when the user invokes the command.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.popups.iuicommand.invoked
     * @type {UICommandInvokedHandler} 
     */
    Invoked {
        get => this.get_Invoked()
        set => this.put_Invoked(value)
    }

    /**
     * Gets or sets the identifier of the command.
     * @remarks
     * If you assign a unique identifier to each command, you can implement a single [UICommandInvokedHandler](uicommandinvokedhandler.md) method that handles events from multiple commands.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.popups.iuicommand.id
     * @type {IInspectable} 
     */
    Id {
        get => this.get_Id()
        set => this.put_Id(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Label() {
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
    put_Label(value) {
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
     * @returns {UICommandInvokedHandler} 
     */
    get_Invoked() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
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
    put_Invoked(value) {
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
    get_Id() {
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
    put_Id(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
