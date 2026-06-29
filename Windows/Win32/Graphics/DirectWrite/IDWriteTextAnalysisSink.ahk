#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DWRITE_LINE_BREAKPOINT.ahk" { DWRITE_LINE_BREAKPOINT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDWriteNumberSubstitution.ahk" { IDWriteNumberSubstitution }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DWRITE_SCRIPT_ANALYSIS.ahk" { DWRITE_SCRIPT_ANALYSIS }

/**
 * This interface is implemented by the text analyzer's client to receive the output of a given text analysis.
 * @remarks
 * The text analyzer disregards any current
 *  state of the analysis sink, therefore, a Set method call on a range overwrites the previously set analysis result of the same range.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritetextanalysissink
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteTextAnalysisSink extends IUnknown {
    /**
     * The interface identifier for IDWriteTextAnalysisSink
     * @type {Guid}
     */
    static IID := Guid("{5810cd44-0ca0-4701-b3fa-bec5182ae4f6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteTextAnalysisSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetScriptAnalysis     : IntPtr
        SetLineBreakpoints    : IntPtr
        SetBidiLevel          : IntPtr
        SetNumberSubstitution : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteTextAnalysisSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextanalysissink-setscriptanalysis
     */
    SetScriptAnalysis(textPosition, textLength, scriptAnalysis) {
        result := ComCall(3, this, "uint", textPosition, "uint", textLength, DWRITE_SCRIPT_ANALYSIS.Ptr, scriptAnalysis, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextanalysissink-setlinebreakpoints
     */
    SetLineBreakpoints(textPosition, textLength, lineBreakpoints) {
        result := ComCall(4, this, "uint", textPosition, "uint", textLength, DWRITE_LINE_BREAKPOINT.Ptr, lineBreakpoints, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextanalysissink-setbidilevel
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextanalysissink-setnumbersubstitution
     */
    SetNumberSubstitution(textPosition, textLength, numberSubstitution) {
        result := ComCall(6, this, "uint", textPosition, "uint", textLength, "ptr", numberSubstitution, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDWriteTextAnalysisSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetScriptAnalysis := CallbackCreate(GetMethod(implObj, "SetScriptAnalysis"), flags, 4)
        this.vtbl.SetLineBreakpoints := CallbackCreate(GetMethod(implObj, "SetLineBreakpoints"), flags, 4)
        this.vtbl.SetBidiLevel := CallbackCreate(GetMethod(implObj, "SetBidiLevel"), flags, 5)
        this.vtbl.SetNumberSubstitution := CallbackCreate(GetMethod(implObj, "SetNumberSubstitution"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetScriptAnalysis)
        CallbackFree(this.vtbl.SetLineBreakpoints)
        CallbackFree(this.vtbl.SetBidiLevel)
        CallbackFree(this.vtbl.SetNumberSubstitution)
    }
}
