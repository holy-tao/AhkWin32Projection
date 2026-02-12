#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\IUICommand.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Popups
 * @version WindowsRuntime 1.4
 */
class IMessageDialog extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMessageDialog
     * @type {Guid}
     */
    static IID => Guid("{33f59b01-5325-43ab-9ab3-bdae440e4121}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Title", "put_Title", "get_Commands", "get_DefaultCommandIndex", "put_DefaultCommandIndex", "get_CancelCommandIndex", "put_CancelCommandIndex", "get_Content", "put_Content", "ShowAsync", "get_Options", "put_Options"]

    /**
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
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
     * @type {Integer} 
     */
    CancelCommandIndex {
        get => this.get_CancelCommandIndex()
        set => this.put_CancelCommandIndex(value)
    }

    /**
     * @type {HSTRING} 
     */
    Content {
        get => this.get_Content()
        set => this.put_Content(value)
    }

    /**
     * @type {Integer} 
     */
    Options {
        get => this.get_Options()
        set => this.put_Options(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
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
    put_Title(value) {
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
     * @returns {IVector<IUICommand>} 
     */
    get_Commands() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
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
        result := ComCall(9, this, "uint*", &value := 0, "int")
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
        result := ComCall(10, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CancelCommandIndex() {
        result := ComCall(11, this, "uint*", &value := 0, "int")
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
    put_CancelCommandIndex(value) {
        result := ComCall(12, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Content() {
        value := HSTRING()
        result := ComCall(13, this, "ptr", value, "int")
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
    put_Content(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(14, this, "ptr", value, "int")
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
        result := ComCall(15, this, "ptr*", &messageDialogAsyncOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IUICommand, messageDialogAsyncOperation)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Options() {
        result := ComCall(16, this, "uint*", &value := 0, "int")
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
    put_Options(value) {
        result := ComCall(17, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
