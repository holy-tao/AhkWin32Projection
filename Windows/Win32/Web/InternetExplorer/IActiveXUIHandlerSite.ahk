#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IActiveXUIHandlerSite extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActiveXUIHandlerSite
     * @type {Guid}
     */
    static IID => Guid("{30510853-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateScrollableContextMenu", "PickFileAndGetResult"]

    /**
     * 
     * @param {Pointer<IScrollableContextMenu>} scrollableContextMenu 
     * @returns {HRESULT} 
     */
    CreateScrollableContextMenu(scrollableContextMenu) {
        result := ComCall(3, this, "ptr*", scrollableContextMenu, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} filePicker 
     * @param {BOOL} allowMultipleSelections 
     * @param {Pointer<IUnknown>} result 
     * @returns {HRESULT} 
     */
    PickFileAndGetResult(filePicker, allowMultipleSelections, result) {
        result := ComCall(4, this, "ptr", filePicker, "int", allowMultipleSelections, "ptr*", result, "HRESULT")
        return result
    }
}
