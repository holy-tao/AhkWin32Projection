#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IScrollableContextMenu extends IUnknown{
    /**
     * The interface identifier for IScrollableContextMenu
     * @type {Guid}
     */
    static IID => Guid("{30510854-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} itemText 
     * @param {Integer} cmdID 
     * @returns {HRESULT} 
     */
    AddItem(itemText, cmdID) {
        itemText := itemText is String ? StrPtr(itemText) : itemText

        result := ComCall(3, this, "ptr", itemText, "uint", cmdID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Pointer<UInt32>} cmdID 
     * @returns {HRESULT} 
     */
    ShowModal(x, y, cmdID) {
        result := ComCall(4, this, "int", x, "int", y, "uint*", cmdID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
