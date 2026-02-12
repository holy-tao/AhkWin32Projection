#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\IStorageProviderUICommand.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class IStorageProviderMoreInfoUI extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageProviderMoreInfoUI
     * @type {Guid}
     */
    static IID => Guid("{ef38e591-a7cb-5e7d-9b5e-22749842697c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Message", "put_Message", "get_Command", "put_Command"]

    /**
     * @type {HSTRING} 
     */
    Message {
        get => this.get_Message()
        set => this.put_Message(value)
    }

    /**
     * @type {IStorageProviderUICommand} 
     */
    Command {
        get => this.get_Command()
        set => this.put_Command(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Message() {
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
    put_Message(value) {
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
     * @returns {IStorageProviderUICommand} 
     */
    get_Command() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IStorageProviderUICommand(value)
    }

    /**
     * 
     * @param {IStorageProviderUICommand} value 
     * @returns {HRESULT} 
     */
    put_Command(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
