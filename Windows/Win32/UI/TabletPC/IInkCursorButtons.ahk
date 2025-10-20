#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Represents a collection of IInkCursorButton objects for an IInkCursor interface.
 * @remarks
 * 
  * You can use this collection to enumerate over the available <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkcursorbutton">IInkCursorButton</a> objects on a known <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkcursor">IInkCursor</a> object.
  * 
  * For more information about collections in COM, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
  * 
  * If you define a class that implements this interface, the new class will not interact correctly with the Tablet PC APIs.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinkcursorbuttons
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkCursorButtons extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkCursorButtons
     * @type {Guid}
     */
    static IID => Guid("{3671cc40-b624-4671-9fa0-db119d952d54}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get__NewEnum", "Item"]

    /**
     * 
     * @param {Pointer<Integer>} Count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcursorbuttons-get_count
     */
    get_Count(Count) {
        result := ComCall(7, this, "int*", Count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} _NewEnum 
     * @returns {HRESULT} 
     */
    get__NewEnum(_NewEnum) {
        result := ComCall(8, this, "ptr*", _NewEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} Identifier 
     * @param {Pointer<IInkCursorButton>} Button 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcursorbuttons-item
     */
    Item(Identifier, Button) {
        result := ComCall(9, this, "ptr", Identifier, "ptr*", Button, "HRESULT")
        return result
    }
}
