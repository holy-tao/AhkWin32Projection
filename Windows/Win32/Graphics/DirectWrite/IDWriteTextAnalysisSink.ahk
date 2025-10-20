#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface is implemented by the text analyzer's client to receive the output of a given text analysis.
 * @remarks
 * 
  * The text analyzer disregards any current
  *  state of the analysis sink, therefore, a Set method call on a range overwrites the previously set analysis result of the same range.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/nn-dwrite-idwritetextanalysissink
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteTextAnalysisSink extends IUnknown{
    /**
     * The interface identifier for IDWriteTextAnalysisSink
     * @type {Guid}
     */
    static IID => Guid("{5810cd44-0ca0-4701-b3fa-bec5182ae4f6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} textPosition 
     * @param {Integer} textLength 
     * @param {Pointer<DWRITE_SCRIPT_ANALYSIS>} scriptAnalysis 
     * @returns {HRESULT} 
     */
    SetScriptAnalysis(textPosition, textLength, scriptAnalysis) {
        result := ComCall(3, this, "uint", textPosition, "uint", textLength, "ptr", scriptAnalysis, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} textPosition 
     * @param {Integer} textLength 
     * @param {Pointer<DWRITE_LINE_BREAKPOINT>} lineBreakpoints 
     * @returns {HRESULT} 
     */
    SetLineBreakpoints(textPosition, textLength, lineBreakpoints) {
        result := ComCall(4, this, "uint", textPosition, "uint", textLength, "ptr", lineBreakpoints, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} textPosition 
     * @param {Integer} textLength 
     * @param {Integer} explicitLevel 
     * @param {Integer} resolvedLevel 
     * @returns {HRESULT} 
     */
    SetBidiLevel(textPosition, textLength, explicitLevel, resolvedLevel) {
        result := ComCall(5, this, "uint", textPosition, "uint", textLength, "char", explicitLevel, "char", resolvedLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} textPosition 
     * @param {Integer} textLength 
     * @param {Pointer<IDWriteNumberSubstitution>} numberSubstitution 
     * @returns {HRESULT} 
     */
    SetNumberSubstitution(textPosition, textLength, numberSubstitution) {
        result := ComCall(6, this, "uint", textPosition, "uint", textLength, "ptr", numberSubstitution, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
