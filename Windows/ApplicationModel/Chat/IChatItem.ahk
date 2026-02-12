#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents a chat item.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.ichatitem
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class IChatItem extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IChatItem
     * @type {Guid}
     */
    static IID => Guid("{8751d000-ceb1-4243-b803-15d45a1dd428}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ItemKind"]

    /**
     * Gets the type of the chat item, such as message or conversation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.ichatitem.itemkind
     * @type {Integer} 
     */
    ItemKind {
        get => this.get_ItemKind()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ItemKind() {
        result := ComCall(6, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
