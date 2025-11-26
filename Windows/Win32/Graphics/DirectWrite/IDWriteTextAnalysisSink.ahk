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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetScriptAnalysis", "SetLineBreakpoints", "SetBidiLevel", "SetNumberSubstitution"]

    /**
     * Reports script analysis for the specified text range.
     * @param {Integer} textPosition Type: <b>UINT32</b>
     * 
     * The starting position from which to report.
     * @param {Integer} textLength Type: <b>UINT32</b>
     * 
     * The number of UTF16 units of the reported range.
     * @param {Pointer<DWRITE_SCRIPT_ANALYSIS>} scriptAnalysis Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_script_analysis">DWRITE_SCRIPT_ANALYSIS</a>*</b>
     * 
     * A pointer to a structure that contains a zero-based index representation of a writing system script and a value indicating whether additional shaping of text is required.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * A successful code or error code to stop analysis.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextanalysissink-setscriptanalysis
     */
    SetScriptAnalysis(textPosition, textLength, scriptAnalysis) {
        result := ComCall(3, this, "uint", textPosition, "uint", textLength, "ptr", scriptAnalysis, "HRESULT")
        return result
    }

    /**
     * Sets line-break opportunities for each character, starting from the specified position.
     * @param {Integer} textPosition Type: <b>UINT32</b>
     * 
     * The starting text position from which to report.
     * @param {Integer} textLength Type: <b>UINT32</b>
     * 
     * The number of UTF16 units of the reported range.
     * @param {Pointer<DWRITE_LINE_BREAKPOINT>} lineBreakpoints Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_line_breakpoint">DWRITE_LINE_BREAKPOINT</a>*</b>
     * 
     * A pointer to a structure that contains breaking conditions set for each character from the starting position to the end of the specified range.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * A successful code or error code to stop analysis.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextanalysissink-setlinebreakpoints
     */
    SetLineBreakpoints(textPosition, textLength, lineBreakpoints) {
        result := ComCall(4, this, "uint", textPosition, "uint", textLength, "ptr", lineBreakpoints, "HRESULT")
        return result
    }

    /**
     * Sets a bidirectional level on the range, which is called once per run change (either explicit or resolved implicit).
     * @param {Integer} textPosition Type: <b>UINT32</b>
     * 
     * The starting position from which to report.
     * @param {Integer} textLength Type: <b>UINT32</b>
     * 
     * The number of UTF16 units of the reported range.
     * @param {Integer} explicitLevel Type: <b>UINT8</b>
     * 
     * The explicit level from the paragraph reading direction and any embedded control codes RLE/RLO/LRE/LRO/PDF, which is determined before any additional rules.
     * @param {Integer} resolvedLevel Type: <b>UINT8</b>
     * 
     * The final implicit level considering the
     *          explicit level and characters' natural directionality, after all
     *          Bidi rules have been applied.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * A successful code or error code to stop analysis.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextanalysissink-setbidilevel
     */
    SetBidiLevel(textPosition, textLength, explicitLevel, resolvedLevel) {
        result := ComCall(5, this, "uint", textPosition, "uint", textLength, "char", explicitLevel, "char", resolvedLevel, "HRESULT")
        return result
    }

    /**
     * Sets the number substitution on the text range affected by the text analysis.
     * @param {Integer} textPosition Type: <b>UINT32</b>
     * 
     * The starting position from which to report.
     * @param {Integer} textLength Type: <b>UINT32</b>
     * 
     * The number of UTF16 units of the reported range.
     * @param {IDWriteNumberSubstitution} numberSubstitution Type: <b><a href="https://docs.microsoft.com/windows/win32/DirectWrite/idwritenumbersubstitution">IDWriteNumberSubstitution</a>*</b>
     * 
     * An object that holds the appropriate digits and numeric punctuation for a given locale. Use <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-createnumbersubstitution">IDWriteFactory::CreateNumberSubstitution</a> to create this object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextanalysissink-setnumbersubstitution
     */
    SetNumberSubstitution(textPosition, textLength, numberSubstitution) {
        result := ComCall(6, this, "uint", textPosition, "uint", textLength, "ptr", numberSubstitution, "HRESULT")
        return result
    }
}
