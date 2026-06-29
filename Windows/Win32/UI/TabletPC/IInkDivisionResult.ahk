#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IInkStrokes.ahk" { IInkStrokes }
#Import ".\InkDivisionType.ahk" { InkDivisionType }
#Import ".\IInkDivisionUnits.ahk" { IInkDivisionUnits }

/**
 * Represents the layout analysis of the collection of strokes contained by the InkDivider object.
 * @remarks
 * The <b>IInkDivisionResult</b> object is the result of calling the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut15/nf-msinkaut15-iinkdivider-divide">Divide</a> method of the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdivider-class">InkDivider</a> object. Each <b>IInkDivisionResult</b> represents a snapshot of the layout analysis of the collection of strokes contained by the <b>InkDivider</b>.
 * 
 * The analysis results can be divided into a collection of structural units by calling the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut15/nf-msinkaut15-iinkdivisionresult-resultbytype">ResultByType</a> method.
 * 
 * If you define a class that implements this interface, the new class will not interact correctly with the Tablet PC application programming interfaces (APIs).
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut15/nn-msinkaut15-iinkdivisionresult
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct IInkDivisionResult extends IDispatch {
    /**
     * The interface identifier for IInkDivisionResult
     * @type {Guid}
     */
    static IID := Guid("{2dbec0a7-74c7-4b38-81eb-aa8ef0c24900}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInkDivisionResult interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Strokes  : IntPtr
        ResultByType : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInkDivisionResult.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IInkStrokes} 
     */
    Strokes {
        get => this.get_Strokes()
    }

    /**
     * Gets the collection of strokes that are contained in an object or used to create an object. (IInkDivisionResult.get_Strokes)
     * @remarks
     * The collection of strokes may be the copies of the strokes contained in an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object or the strokes that were used to create the object or collection.
     * 
     * <div class="alert"><b>Note</b>  The <b>Strokes</b> property for the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object does not return the actual collection that the <b>InkDisp</b> object works with, but instead returns a copy. For example, this means that adding or removing strokes to this collection does not affect the <b>InkDisp</b> object's strokes; to add or remove strokes, use <b>InkDisp</b> methods such as <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdisp-addstrokesatrectangle">AddStrokesAtRectangle</a>, <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdisp-deletestroke">DeleteStroke</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdisp-deletestrokes">DeleteStrokes</a>. However, each stroke in the collection is a reference to the original <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a> object.</div>
     * <div> </div>
     * @returns {IInkStrokes} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut15/nf-msinkaut15-iinkdivisionresult-get_strokes
     */
    get_Strokes() {
        result := ComCall(7, this, "ptr*", &Strokes := 0, "HRESULT")
        return IInkStrokes(Strokes)
    }

    /**
     * Gets the requested structural units of the analysis results for an IInkDivisionUnits collection.
     * @remarks
     * This method returns a new <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut15/nn-msinkaut15-iinkdivisionunits">IInkDivisionUnits</a> collection each time the method is called.
     * 
     * If no structural units of the requested type exist in the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut15/nn-msinkaut15-iinkdivisionresult">IInkDivisionResult</a> object, then this method returns an empty <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut15/nn-msinkaut15-iinkdivisionunits">IInkDivisionUnits</a> collection.
     * 
     * If you define a class that implements this interface, the new class will not interact correctly with the Tablet PC application programming interfaces (APIs).
     * @param {InkDivisionType} divisionType The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut15/ne-msinkaut15-inkdivisiontype">InkDivisionType</a> enumeration value that indicates the structural units to return.
     * @returns {IInkDivisionUnits} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut15/nn-msinkaut15-iinkdivisionunits">IInkDivisionUnits</a> collection that contains the requested structural units of the analysis results.
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut15/nf-msinkaut15-iinkdivisionresult-resultbytype
     */
    ResultByType(divisionType) {
        result := ComCall(8, this, InkDivisionType, divisionType, "ptr*", &InkDivisionUnits := 0, "HRESULT")
        return IInkDivisionUnits(InkDivisionUnits)
    }

    Query(iid) {
        if (IInkDivisionResult.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Strokes := CallbackCreate(GetMethod(implObj, "get_Strokes"), flags, 2)
        this.vtbl.ResultByType := CallbackCreate(GetMethod(implObj, "ResultByType"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Strokes)
        CallbackFree(this.vtbl.ResultByType)
    }
}
