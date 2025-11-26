#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IInkStrokes.ahk
#Include .\IInkDivisionUnits.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Represents the layout analysis of the collection of strokes contained by the InkDivider object.
 * @remarks
 * 
 * The <b>IInkDivisionResult</b> object is the result of calling the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut15/nf-msinkaut15-iinkdivider-divide">Divide</a> method of the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdivider-class">InkDivider</a> object. Each <b>IInkDivisionResult</b> represents a snapshot of the layout analysis of the collection of strokes contained by the <b>InkDivider</b>.
 * 
 * The analysis results can be divided into a collection of structural units by calling the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut15/nf-msinkaut15-iinkdivisionresult-resultbytype">ResultByType</a> method.
 * 
 * If you define a class that implements this interface, the new class will not interact correctly with the Tablet PC application programming interfaces (APIs).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut15/nn-msinkaut15-iinkdivisionresult
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkDivisionResult extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkDivisionResult
     * @type {Guid}
     */
    static IID => Guid("{2dbec0a7-74c7-4b38-81eb-aa8ef0c24900}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Strokes", "ResultByType"]

    /**
     * @type {IInkStrokes} 
     */
    Strokes {
        get => this.get_Strokes()
    }

    /**
     * Gets the collection of strokes that are contained in an object or used to create an object.
     * @remarks
     * 
     * The collection of strokes may be the copies of the strokes contained in an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object or the strokes that were used to create the object or collection.
     * 
     * <div class="alert"><b>Note</b>  The <b>Strokes</b> property for the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object does not return the actual collection that the <b>InkDisp</b> object works with, but instead returns a copy. For example, this means that adding or removing strokes to this collection does not affect the <b>InkDisp</b> object's strokes; to add or remove strokes, use <b>InkDisp</b> methods such as <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdisp-addstrokesatrectangle">AddStrokesAtRectangle</a>, <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdisp-deletestroke">DeleteStroke</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdisp-deletestrokes">DeleteStrokes</a>. However, each stroke in the collection is a reference to the original <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a> object.</div>
     * <div> </div>
     * 
     * 
     * @returns {IInkStrokes} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut15/nf-msinkaut15-iinkdivisionresult-get_strokes
     */
    get_Strokes() {
        result := ComCall(7, this, "ptr*", &Strokes := 0, "HRESULT")
        return IInkStrokes(Strokes)
    }

    /**
     * Gets the requested structural units of the analysis results for an IInkDivisionUnits collection.
     * @param {Integer} divisionType The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut15/ne-msinkaut15-inkdivisiontype">InkDivisionType</a> enumeration value that indicates the structural units to return.
     * @returns {IInkDivisionUnits} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut15/nn-msinkaut15-iinkdivisionunits">IInkDivisionUnits</a> collection that contains the requested structural units of the analysis results.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut15/nf-msinkaut15-iinkdivisionresult-resultbytype
     */
    ResultByType(divisionType) {
        result := ComCall(8, this, "int", divisionType, "ptr*", &InkDivisionUnits := 0, "HRESULT")
        return IInkDivisionUnits(InkDivisionUnits)
    }
}
