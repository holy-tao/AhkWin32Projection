#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IInkStrokes.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IInkTransform.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Represents a single structural element within an IInkDivisionResult object.
 * @remarks
 * 
 * Use the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut15/nf-msinkaut15-iinkdivisionunits-item">Item</a> method to return a single element from a <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut15/nn-msinkaut15-iinkdivisionunits">DivisionUnits</a> collection.
 * 
 * If you define a class that implements this interface, the new class will not interact correctly with the Tablet PC application programming interfaces (APIs).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut15/nn-msinkaut15-iinkdivisionunit
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkDivisionUnit extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkDivisionUnit
     * @type {Guid}
     */
    static IID => Guid("{85aee342-48b0-4244-9dd5-1ed435410fab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Strokes", "get_DivisionType", "get_RecognizedString", "get_RotationTransform"]

    /**
     * @type {IInkStrokes} 
     */
    Strokes {
        get => this.get_Strokes()
    }

    /**
     * @type {Integer} 
     */
    DivisionType {
        get => this.get_DivisionType()
    }

    /**
     * @type {BSTR} 
     */
    RecognizedString {
        get => this.get_RecognizedString()
    }

    /**
     * @type {IInkTransform} 
     */
    RotationTransform {
        get => this.get_RotationTransform()
    }

    /**
     * Gets the collection of strokes that are contained in an object or used to create an object.
     * @remarks
     * 
     * The collection of strokes may be the copies of the strokes contained in an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object or the strokes that were used to create the object or collection.
     * 
     * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut15/nf-msinkaut15-iinkdivisionresult-get_strokes">Strokes</a> property for the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object does not return the actual collection that the <b>InkDisp</b> object works with, but instead returns a copy. For example, this means that adding or removing strokes to this collection does not affect the <b>InkDisp</b> object's strokes; to add or remove strokes, use <b>InkDisp</b> methods such as <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdisp-addstrokesatrectangle">AddStrokesAtRectangle</a>, <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdisp-deletestroke">DeleteStroke</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdisp-deletestrokes">DeleteStrokes</a>. However, each stroke in the collection is a reference to the original <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a> object.</div>
     * <div> </div>
     * 
     * 
     * @returns {IInkStrokes} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut15/nf-msinkaut15-iinkdivisionunit-get_strokes
     */
    get_Strokes() {
        result := ComCall(7, this, "ptr*", &Strokes := 0, "HRESULT")
        return IInkStrokes(Strokes)
    }

    /**
     * Gets the type of structural unit the IInkDivisionUnit object represents within the analysis results.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut15/nf-msinkaut15-iinkdivisionunit-get_divisiontype
     */
    get_DivisionType() {
        result := ComCall(8, this, "int*", &divisionType := 0, "HRESULT")
        return divisionType
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_RecognizedString() {
        RecoString := BSTR()
        result := ComCall(9, this, "ptr", RecoString, "HRESULT")
        return RecoString
    }

    /**
     * Gets the transformation matrix that the IInkDivisionUnit object uses to rotate the strokes to horizontal.
     * @remarks
     * 
     * Text recognizers
     *            perform best with horizontal handwriting. Apply this transformation to the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut15/nf-msinkaut15-iinkdivisionresult-get_strokes">Strokes</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut15/nn-msinkaut15-iinkdivisionunit">IInkDivisionUnit</a> object before passing the strokes to an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrecognizercontext-class">InkRecognizerContext</a> object.
     * 
     * <div class="alert"><b>Note</b>  For an <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut15/nn-msinkaut15-iinkdivisionunit">IInkDivisionUnit</a> object which represents a paragraph or drawing, this property returns <b>NULL</b>.</div>
     * <div> </div>
     * Use this property to level handwriting or to accurately draw lines or shapes around angled handwriting.
     * 
     * 
     * @returns {IInkTransform} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut15/nf-msinkaut15-iinkdivisionunit-get_rotationtransform
     */
    get_RotationTransform() {
        result := ComCall(10, this, "ptr*", &RotationTransform := 0, "HRESULT")
        return IInkTransform(RotationTransform)
    }
}
