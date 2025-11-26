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
     * 
     * @returns {IInkStrokes} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut15/nf-msinkaut15-iinkdivisionresult-get_strokes
     */
    get_Strokes() {
        result := ComCall(7, this, "ptr*", &Strokes := 0, "HRESULT")
        return IInkStrokes(Strokes)
    }

    /**
     * 
     * @param {Integer} divisionType 
     * @returns {IInkDivisionUnits} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut15/nf-msinkaut15-iinkdivisionresult-resultbytype
     */
    ResultByType(divisionType) {
        result := ComCall(8, this, "int", divisionType, "ptr*", &InkDivisionUnits := 0, "HRESULT")
        return IInkDivisionUnits(InkDivisionUnits)
    }
}
