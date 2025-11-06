#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IScrollableContextMenu extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddItem", "ShowModal"]

    /**
     * 
     * @param {PWSTR} itemText 
     * @param {Integer} cmdID 
     * @returns {HRESULT} 
     */
    AddItem(itemText, cmdID) {
        itemText := itemText is String ? StrPtr(itemText) : itemText

        result := ComCall(3, this, "ptr", itemText, "uint", cmdID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {Integer} 
     */
    ShowModal(x, y) {
        result := ComCall(4, this, "int", x, "int", y, "uint*", &cmdID := 0, "HRESULT")
        return cmdID
    }
}
