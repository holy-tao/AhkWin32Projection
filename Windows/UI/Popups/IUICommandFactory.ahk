#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\UICommand.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Popups
 * @version WindowsRuntime 1.4
 */
class IUICommandFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUICommandFactory
     * @type {Guid}
     */
    static IID => Guid("{a21a8189-26b0-4676-ae94-54041bc125e8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create", "CreateWithHandler", "CreateWithHandlerAndId"]

    /**
     * Create Extended Stored Procedures
     * @param {HSTRING} label 
     * @returns {UICommand} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(label) {
        if(label is String) {
            pin := HSTRING.Create(label)
            label := pin.Value
        }
        label := label is Win32Handle ? NumGet(label, "ptr") : label

        result := ComCall(6, this, "ptr", label, "ptr*", &instance := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UICommand(instance)
    }

    /**
     * 
     * @param {HSTRING} label 
     * @param {UICommandInvokedHandler} action 
     * @returns {UICommand} 
     */
    CreateWithHandler(label, action) {
        if(label is String) {
            pin := HSTRING.Create(label)
            label := pin.Value
        }
        label := label is Win32Handle ? NumGet(label, "ptr") : label

        result := ComCall(7, this, "ptr", label, "ptr", action, "ptr*", &instance := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UICommand(instance)
    }

    /**
     * 
     * @param {HSTRING} label 
     * @param {UICommandInvokedHandler} action 
     * @param {IInspectable} commandId 
     * @returns {UICommand} 
     */
    CreateWithHandlerAndId(label, action, commandId) {
        if(label is String) {
            pin := HSTRING.Create(label)
            label := pin.Value
        }
        label := label is Win32Handle ? NumGet(label, "ptr") : label

        result := ComCall(8, this, "ptr", label, "ptr", action, "ptr", commandId, "ptr*", &instance := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UICommand(instance)
    }
}
