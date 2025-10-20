#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Contains a collection of IInkDivisionUnit objects that are contained in an IInkDivisionResult object.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut15/nf-msinkaut15-iinkdivisionresult-resultbytype">ResultByType</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut15/nn-msinkaut15-iinkdivisionresult">IInkDivisionResult</a> object returns the requested structural elements of the analysis results in a <b>DivisionUnits</b> collection.
  * 
  * For more information about collections in Automation, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
  * 
  * If you define a class that implements this interface, the new class will not interact correctly with the Tablet PC application programming interfaces (APIs).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut15/nn-msinkaut15-iinkdivisionunits
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkDivisionUnits extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkDivisionUnits
     * @type {Guid}
     */
    static IID => Guid("{1bb5ddc2-31cc-4135-ab82-2c66c9f00c41}")

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
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut15/nf-msinkaut15-iinkdivisionunits-get_count
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
     * @param {Pointer<IInkDivisionUnit>} InkDivisionUnit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut15/nf-msinkaut15-iinkdivisionunits-item
     */
    Item(Index, InkDivisionUnit) {
        result := ComCall(9, this, "int", Index, "ptr*", InkDivisionUnit, "HRESULT")
        return result
    }
}
