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
     * 
     * @param {Pointer<Byte>} analysisData 
     * @param {Integer} analysisDataCount 
     * @returns {HRESULT} 
     */
    ProcessAnalysisResults(analysisData, analysisDataCount) {
        result := ComCall(3, this, "char*", analysisData, "uint", analysisDataCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
