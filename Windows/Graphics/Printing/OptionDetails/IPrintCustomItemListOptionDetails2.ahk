#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.OptionDetails
 * @version WindowsRuntime 1.4
 */
class IPrintCustomItemListOptionDetails2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintCustomItemListOptionDetails2
     * @type {Guid}
     */
    static IID => Guid("{c9d6353d-651c-4a39-906e-1091a1801bf1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddItem"]

    /**
     * 
     * @param {HSTRING} itemId 
     * @param {HSTRING} displayName 
     * @param {HSTRING} description 
     * @param {IRandomAccessStreamWithContentType} icon 
     * @returns {HRESULT} 
     */
    AddItem(itemId, displayName, description, icon) {
        if(itemId is String) {
            pin := HSTRING.Create(itemId)
            itemId := pin.Value
        }
        itemId := itemId is Win32Handle ? NumGet(itemId, "ptr") : itemId
        if(displayName is String) {
            pin := HSTRING.Create(displayName)
            displayName := pin.Value
        }
        displayName := displayName is Win32Handle ? NumGet(displayName, "ptr") : displayName
        if(description is String) {
            pin := HSTRING.Create(description)
            description := pin.Value
        }
        description := description is Win32Handle ? NumGet(description, "ptr") : description

        result := ComCall(6, this, "ptr", itemId, "ptr", displayName, "ptr", description, "ptr", icon, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
