#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\MessageDialog.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Popups
 * @version WindowsRuntime 1.4
 */
class IMessageDialogFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMessageDialogFactory
     * @type {Guid}
     */
    static IID => Guid("{2d161777-a66f-4ea5-bb87-793ffa4941f2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create", "CreateWithTitle"]

    /**
     * Create Extended Stored Procedures
     * @param {HSTRING} content 
     * @returns {MessageDialog} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(content) {
        if(content is String) {
            pin := HSTRING.Create(content)
            content := pin.Value
        }
        content := content is Win32Handle ? NumGet(content, "ptr") : content

        result := ComCall(6, this, "ptr", content, "ptr*", &messageDialog_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MessageDialog(messageDialog_)
    }

    /**
     * 
     * @param {HSTRING} content 
     * @param {HSTRING} title 
     * @returns {MessageDialog} 
     */
    CreateWithTitle(content, title) {
        if(content is String) {
            pin := HSTRING.Create(content)
            content := pin.Value
        }
        content := content is Win32Handle ? NumGet(content, "ptr") : content
        if(title is String) {
            pin := HSTRING.Create(title)
            title := pin.Value
        }
        title := title is Win32Handle ? NumGet(title, "ptr") : title

        result := ComCall(7, this, "ptr", content, "ptr", title, "ptr*", &messageDialog_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MessageDialog(messageDialog_)
    }
}
