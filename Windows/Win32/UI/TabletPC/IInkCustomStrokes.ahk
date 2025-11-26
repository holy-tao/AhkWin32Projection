#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\IInkStrokes.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Contains a collection of user-defined InkStrokes collections.
 * @remarks
 * 
 * The custom strokes are essentially named <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collections that are persisted and recalled for later use.
 * 
 * You use a collection of custom strokes to store strokes that have the same meaning or that are related in some way. Examples of strokes that you may want to persist include:
 * 
 * <ul>
 * <li>All the strokes drawn by the same cursor (pen)</li>
 * <li>The strokes in an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object that correspond to a word or paragraph</li>
 * <li>All the strokes that intersect a known region</li>
 * </ul>
 * For example, suppose you want to draw with two different cursors and keep separate the set of strokes that you draw with each cursor. You could recognize the strokes drawn with the first cursor and attach an <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkrecognitionresult">IInkRecognitionResult</a> object to that collection of strokes. To persist the recognition result, add the strokes to the <b>CustomStrokes</b> collection of the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object. You can later access the first collection of strokes by getting the persisted <b>CustomStrokes</b> collection from the <b>InkDisp</b> object.
 * 
 * Each <b>IInkCustomStrokes</b> collection is referenced by name.
 * 
 * <b>IInkCustomStrokes</b> collections are references to ink data, not the actual data itself.
 * 
 * For more information about collections in COM, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
 * 
 * If you define a class that implements this interface, the new class will not interact correctly with the Tablet PC application programming interfaces (APIs).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinkcustomstrokes
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkCustomStrokes extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkCustomStrokes
     * @type {Guid}
     */
    static IID => Guid("{7e23a88f-c30e-420f-9bdb-28902543f0c1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get__NewEnum", "Item", "Add", "Remove", "Clear"]

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcustomstrokes-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &Count := 0, "HRESULT")
        return Count
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &_NewEnum := 0, "HRESULT")
        return IUnknown(_NewEnum)
    }

    /**
     * 
     * @param {VARIANT} Identifier 
     * @returns {IInkStrokes} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcustomstrokes-item
     */
    Item(Identifier) {
        result := ComCall(9, this, "ptr", Identifier, "ptr*", &Strokes := 0, "HRESULT")
        return IInkStrokes(Strokes)
    }

    /**
     * 
     * @param {BSTR} Name 
     * @param {IInkStrokes} Strokes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcustomstrokes-add
     */
    Add(Name, Strokes) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        result := ComCall(10, this, "ptr", Name, "ptr", Strokes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} Identifier 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcustomstrokes-remove
     */
    Remove(Identifier) {
        result := ComCall(11, this, "ptr", Identifier, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcustomstrokes-clear
     */
    Clear() {
        result := ComCall(12, this, "HRESULT")
        return result
    }
}
