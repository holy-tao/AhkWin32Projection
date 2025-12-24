#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IInkStrokes.ahk
#Include .\IInkRecognizerContext.ahk
#Include .\IInkDivisionResult.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * .
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut15/nn-msinkaut15-iinkdivider
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkDivider extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkDivider
     * @type {Guid}
     */
    static IID => Guid("{5de00405-f9a4-4651-b0c5-c317defd58b9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Strokes", "putref_Strokes", "get_RecognizerContext", "putref_RecognizerContext", "get_LineHeight", "put_LineHeight", "Divide"]

    /**
     * @type {IInkStrokes} 
     */
    Strokes {
        get => this.get_Strokes()
    }

    /**
     * @type {IInkRecognizerContext} 
     */
    RecognizerContext {
        get => this.get_RecognizerContext()
    }

    /**
     * @type {Integer} 
     */
    LineHeight {
        get => this.get_LineHeight()
        set => this.put_LineHeight(value)
    }

    /**
     * Gets or sets the InkStrokes collection on which the InkDivider object performs layout analysis.
     * @remarks
     * 
     * This property maintains the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection which the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdivider-class">InkDivider</a> object analyzes and from which the <b>InkDivider</b> object creates the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut15/nn-msinkaut15-iinkdivisionresult">IInkDivisionResult</a> object. This property must be assigned a InkStrokes collection in order for the <b>InkDivider</b> object to perform layout analysis.
     * 
     * You should only assign this property once to a given <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdivider-class">InkDivider</a> object. Assigning a subsequent <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> object once one has been assigned will cause inaccurate results to be returned. Also, you may not change the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut15/nf-msinkaut15-iinkdivider-get_lineheight">LineHeight</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut15/nf-msinkaut15-iinkdivider-get_recognizercontext">RecognizerContext</a> property after a InkStrokes collection is assigned to the <b>Strokes</b> property.
     * 
     * To keep the <b>Strokes</b> property of the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdivider-class">InkDivider</a> object synchronized with an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object, use the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-inkadded">InkAdded</a> and <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-inkdeleted">InkDeleted</a> events of the <b>InkDisp</b> object to listen for strokes that should be added or removed from the <b>InkDivider</b> object. This covers cases where strokes are added to, deleted from, clipped, or split within the <b>InkDisp</b> object.
     * 
     * <div class="alert"><b>Note</b>  Moving, scaling, or other transformations on strokes in the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object do not generate <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-inkadded">InkAdded</a> or <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-inkdeleted">InkDeleted</a> events. Perform the same transformations on the strokes in the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdivider-class">InkDivider</a> object to keep the <b>Strokes</b> property of the <b>InkDivider</b> object synchronized.</div>
     * <div> </div>
     * 
     * 
     * @returns {IInkStrokes} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut15/nf-msinkaut15-iinkdivider-get_strokes
     */
    get_Strokes() {
        result := ComCall(7, this, "ptr*", &Strokes := 0, "HRESULT")
        return IInkStrokes(Strokes)
    }

    /**
     * 
     * @param {IInkStrokes} Strokes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut15/nf-msinkaut15-iinkdivider-putref_strokes
     */
    putref_Strokes(Strokes) {
        result := ComCall(8, this, "ptr", Strokes, "HRESULT")
        return result
    }

    /**
     * Gets or sets the InkRecognizerContext object that the InkDivider object uses for layout analysis.
     * @remarks
     * 
     * If you set the <b>RecognizerContext</b> property, it should be the first thing you do after constructing the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdivider-class">InkDivider</a> object. An error is generated if you attempt to set the <b>RecognizerContext</b> property after the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut15/nf-msinkaut15-iinkdivider-get_strokes">Divider.Strokes</a> property has been set, after a <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut15/nf-msinkaut15-iinkdivider-divide">Divider.Divide</a> call has been made, or if you attempt to set it more than one time.
     * 
     * In addition, this property generates an error if you assign a recognizer context to it that:
     * 
     * <ul>
     * <li>Is not a text recognizer.</li>
     * <li>Does not free support.</li>
     * </ul>
     * If the value of this property is <b>NULL</b> when strokes are assigned to the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdivider-class">InkDivider</a> object, then the <b>InkDivider</b> object uses no recognizer context.
     * 
     * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdivider-class">InkDivider</a> object uses the default property settings of the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrecognizercontext-class">InkRecognizerContext</a> object, and ignores any strokes assigned to the <b>InkRecognizerContext</b> object.</div>
     * <div> </div>
     * 
     * 
     * @returns {IInkRecognizerContext} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut15/nf-msinkaut15-iinkdivider-get_recognizercontext
     */
    get_RecognizerContext() {
        result := ComCall(9, this, "ptr*", &RecognizerContext := 0, "HRESULT")
        return IInkRecognizerContext(RecognizerContext)
    }

    /**
     * 
     * @param {IInkRecognizerContext} RecognizerContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut15/nf-msinkaut15-iinkdivider-putref_recognizercontext
     */
    putref_RecognizerContext(RecognizerContext) {
        result := ComCall(10, this, "ptr", RecognizerContext, "HRESULT")
        return result
    }

    /**
     * Gets or sets the expected handwriting height, in HIMETRIC units.
     * @remarks
     * 
     * The <b>LineHeight</b> property must be in the range of 100 to 50,000 HIMETRIC units.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdivider-class">InkDivider</a> object uses the <b>LineHeight</b> property to help distinguish between drawing and handwriting.
     * 
     * Setting the <b>LineHeight</b> property after strokes have been assigned to the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdivider-class">InkDivider</a> object generates an error.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut15/nf-msinkaut15-iinkdivider-get_lineheight
     */
    get_LineHeight() {
        result := ComCall(11, this, "int*", &LineHeight := 0, "HRESULT")
        return LineHeight
    }

    /**
     * Gets or sets the expected handwriting height, in HIMETRIC units.
     * @remarks
     * 
     * The <b>LineHeight</b> property must be in the range of 100 to 50,000 HIMETRIC units.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdivider-class">InkDivider</a> object uses the <b>LineHeight</b> property to help distinguish between drawing and handwriting.
     * 
     * Setting the <b>LineHeight</b> property after strokes have been assigned to the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdivider-class">InkDivider</a> object generates an error.
     * 
     * 
     * @param {Integer} LineHeight 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut15/nf-msinkaut15-iinkdivider-put_lineheight
     */
    put_LineHeight(LineHeight) {
        result := ComCall(12, this, "int", LineHeight, "HRESULT")
        return result
    }

    /**
     * Returns a IInkDivisionResult object that contains the results of the layout analysis of strokes in the InkDivider object.
     * @returns {IInkDivisionResult} When this method returns, contains a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut15/nn-msinkaut15-iinkdivisionresult">IInkDivisionResult</a> object that contains structural information about the strokes in the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdivider-class">InkDivider</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut15/nf-msinkaut15-iinkdivider-divide
     */
    Divide() {
        result := ComCall(13, this, "ptr*", &InkDivisionResult := 0, "HRESULT")
        return IInkDivisionResult(InkDivisionResult)
    }
}
