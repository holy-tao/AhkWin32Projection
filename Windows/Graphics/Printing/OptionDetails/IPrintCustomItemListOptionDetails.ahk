#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.OptionDetails
 * @version WindowsRuntime 1.4
 */
class IPrintCustomItemListOptionDetails extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintCustomItemListOptionDetails
     * @type {Guid}
     */
    static IID => Guid("{a5fafd88-58f2-4ebd-b90f-51e4f2944c5d}")

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
     * @returns {HRESULT} 
     */
    AddItem(itemId, displayName) {
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

        result := ComCall(6, this, "ptr", itemId, "ptr", displayName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
