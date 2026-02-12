#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\InkAnalysisRoot.ahk
#Include ..\..\..\..\Foundation\IAsyncOperation.ahk
#Include .\InkAnalysisResult.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents a factory for generating [InkAnalyzer](inkanalyzer.md) objects used in ink analysis.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.iinkanalyzerfactory
 * @namespace Windows.UI.Input.Inking.Analysis
 * @version WindowsRuntime 1.4
 */
class IInkAnalyzer extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkAnalyzer
     * @type {Guid}
     */
    static IID => Guid("{f12b8f95-0866-4dc5-8c77-f88614dfe38c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AnalysisRoot", "get_IsAnalyzing", "AddDataForStroke", "AddDataForStrokes", "ClearDataForAllStrokes", "RemoveDataForStroke", "RemoveDataForStrokes", "ReplaceDataForStroke", "SetStrokeDataKind", "AnalyzeAsync"]

    /**
     * @type {InkAnalysisRoot} 
     */
    AnalysisRoot {
        get => this.get_AnalysisRoot()
    }

    /**
     * @type {Boolean} 
     */
    IsAnalyzing {
        get => this.get_IsAnalyzing()
    }

    /**
     * 
     * @returns {InkAnalysisRoot} 
     */
    get_AnalysisRoot() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InkAnalysisRoot(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAnalyzing() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {InkStroke} stroke 
     * @returns {HRESULT} 
     */
    AddDataForStroke(stroke) {
        result := ComCall(8, this, "ptr", stroke, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IIterable<InkStroke>} strokes 
     * @returns {HRESULT} 
     */
    AddDataForStrokes(strokes) {
        result := ComCall(9, this, "ptr", strokes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearDataForAllStrokes() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} strokeId 
     * @returns {HRESULT} 
     */
    RemoveDataForStroke(strokeId) {
        result := ComCall(11, this, "uint", strokeId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IIterable<Integer>} strokeIds 
     * @returns {HRESULT} 
     */
    RemoveDataForStrokes(strokeIds) {
        result := ComCall(12, this, "ptr", strokeIds, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {InkStroke} stroke 
     * @returns {HRESULT} 
     */
    ReplaceDataForStroke(stroke) {
        result := ComCall(13, this, "ptr", stroke, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} strokeId 
     * @param {Integer} strokeKind 
     * @returns {HRESULT} 
     */
    SetStrokeDataKind(strokeId, strokeKind) {
        result := ComCall(14, this, "uint", strokeId, "int", strokeKind, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IAsyncOperation<InkAnalysisResult>} 
     */
    AnalyzeAsync() {
        result := ComCall(15, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(InkAnalysisResult, result_)
    }
}
