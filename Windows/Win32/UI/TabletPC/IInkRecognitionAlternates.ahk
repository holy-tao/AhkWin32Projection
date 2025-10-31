#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Contains the IInkRecognitionAlternate objects that represent possible word matches for segments of ink.
 * @remarks
 * 
  * For more information about collections in COM, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
  * 
  * If you define a class that implements this interface, the new class will not interact correctly with the Tablet PC application programming interfaces (APIs).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinkrecognitionalternates
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkRecognitionAlternates extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkRecognitionAlternates
     * @type {Guid}
     */
    static IID => Guid("{286a167f-9f19-4c61-9d53-4f07be622b84}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get__NewEnum", "get_Strokes", "Item"]

    /**
     * 
     * @param {Pointer<Integer>} Count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognitionalternates-get_count
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
     * @param {Pointer<IInkStrokes>} Strokes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognitionalternates-get_strokes
     */
    get_Strokes(Strokes) {
        result := ComCall(9, this, "ptr*", Strokes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<IInkRecognitionAlternate>} InkRecoAlternate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognitionalternates-item
     */
    Item(Index, InkRecoAlternate) {
        result := ComCall(10, this, "int", Index, "ptr*", InkRecoAlternate, "HRESULT")
        return result
    }
}
