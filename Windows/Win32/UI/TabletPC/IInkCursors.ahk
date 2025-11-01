#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Represents a collection of IInkCursor objects.
 * @remarks
 * 
  * A cursor becomes part of the cursors collection of an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-class">InkCollector</a> object, <a href="https://docs.microsoft.com/windows/desktop/tablet/inkoverlay-class">InkOverlay</a> object, or the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkpicture-control-reference">InkPicture</a> control when it comes within range of the object. Each time a new cursor comes within range, it is added to the object's cursors collection. The cursors collection exists only during the lifetime of that object.
  * 
  * For example, if a pen is used to draw ink on an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-class">InkCollector</a> object, it becomes part of the <b>InkCollector</b> object's <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_cursors">Cursors</a> property. If a mouse is then used for input on the same <b>InkCollector</b> object, it is also added to the collection.
  * 
  * You can use this collection to enumerate over all of the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkcursor">IInkCursor</a> objects on a known <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-class">InkCollector</a> object.
  * 
  * For more information about collections in COM, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
  * 
  * If you define a class that implements this interface, the new class will not interact correctly with the Tablet PC application programming interfaces (APIs).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinkcursors
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkCursors extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkCursors
     * @type {Guid}
     */
    static IID => Guid("{a248c1ac-c698-4e06-9e5c-d57f77c7e647}")

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
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcursors-get_count
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
     * @param {Integer} Index 
     * @param {Pointer<IInkCursor>} Cursor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcursors-item
     */
    Item(Index, Cursor) {
        result := ComCall(9, this, "int", Index, "ptr*", Cursor, "HRESULT")
        return result
    }
}
