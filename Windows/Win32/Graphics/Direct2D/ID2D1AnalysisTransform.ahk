#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Supplies data to an analysis effect.
 * @remarks
 * 
  *  This interface can be implemented by either an <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1drawtransform">ID2D1DrawTransform</a> or an <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1computetransform">ID2D1ComputeTransform</a>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nn-d2d1effectauthor-id2d1analysistransform
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1AnalysisTransform extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1AnalysisTransform
     * @type {Guid}
     */
    static IID => Guid("{0359dc30-95e6-4568-9055-27720d130e93}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ProcessAnalysisResults"]

    /**
     * 
     * @param {Pointer<Integer>} analysisData 
     * @param {Integer} analysisDataCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1analysistransform-processanalysisresults
     */
    ProcessAnalysisResults(analysisData, analysisDataCount) {
        analysisDataMarshal := analysisData is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, analysisDataMarshal, analysisData, "uint", analysisDataCount, "HRESULT")
        return result
    }
}
