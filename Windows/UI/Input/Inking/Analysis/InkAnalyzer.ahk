#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInkAnalyzer.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides access to an object that can categorize ink strokes into either writing or drawing strokes, and recognize text, shapes, and basic layout structures.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalyzer
 * @namespace Windows.UI.Input.Inking.Analysis
 * @version WindowsRuntime 1.4
 */
class InkAnalyzer extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkAnalyzer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkAnalyzer.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the root node of the ink analysis results.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalyzer.analysisroot
     * @type {InkAnalysisRoot} 
     */
    AnalysisRoot {
        get => this.get_AnalysisRoot()
    }

    /**
     * Gets the state of the ink analysis process.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalyzer.isanalyzing
     * @type {Boolean} 
     */
    IsAnalyzing {
        get => this.get_IsAnalyzing()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new [InkAnalyzer](inkanalyzer.md) object to manage [InkAnalysisNode](inkanalysisnode.md) objects generated from ink analysis.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.Inking.Analysis.InkAnalyzer")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {InkAnalysisRoot} 
     */
    get_AnalysisRoot() {
        if (!this.HasProp("__IInkAnalyzer")) {
            if ((queryResult := this.QueryInterface(IInkAnalyzer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkAnalyzer := IInkAnalyzer(outPtr)
        }

        return this.__IInkAnalyzer.get_AnalysisRoot()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAnalyzing() {
        if (!this.HasProp("__IInkAnalyzer")) {
            if ((queryResult := this.QueryInterface(IInkAnalyzer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkAnalyzer := IInkAnalyzer(outPtr)
        }

        return this.__IInkAnalyzer.get_IsAnalyzing()
    }

    /**
     * Adds data for a single ink stroke to the ink analysis results.
     * @param {InkStroke} stroke The ink stroke from which to extract the data to add to the ink analysis results.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalyzer.adddataforstroke
     */
    AddDataForStroke(stroke) {
        if (!this.HasProp("__IInkAnalyzer")) {
            if ((queryResult := this.QueryInterface(IInkAnalyzer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkAnalyzer := IInkAnalyzer(outPtr)
        }

        return this.__IInkAnalyzer.AddDataForStroke(stroke)
    }

    /**
     * Adds data for multiple ink strokes to the ink analysis results.
     * @param {IIterable<InkStroke>} strokes The collection of ink strokes from which to extract the data to add to the ink analysis results.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalyzer.adddataforstrokes
     */
    AddDataForStrokes(strokes) {
        if (!this.HasProp("__IInkAnalyzer")) {
            if ((queryResult := this.QueryInterface(IInkAnalyzer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkAnalyzer := IInkAnalyzer(outPtr)
        }

        return this.__IInkAnalyzer.AddDataForStrokes(strokes)
    }

    /**
     * Delete all nodes from the last ink analysis process.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalyzer.cleardataforallstrokes
     */
    ClearDataForAllStrokes() {
        if (!this.HasProp("__IInkAnalyzer")) {
            if ((queryResult := this.QueryInterface(IInkAnalyzer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkAnalyzer := IInkAnalyzer(outPtr)
        }

        return this.__IInkAnalyzer.ClearDataForAllStrokes()
    }

    /**
     * Delete all nodes for the specified ink stroke from the last ink analysis process.
     * @param {Integer} strokeId The unique identifier of the ink stroke.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalyzer.removedataforstroke
     */
    RemoveDataForStroke(strokeId) {
        if (!this.HasProp("__IInkAnalyzer")) {
            if ((queryResult := this.QueryInterface(IInkAnalyzer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkAnalyzer := IInkAnalyzer(outPtr)
        }

        return this.__IInkAnalyzer.RemoveDataForStroke(strokeId)
    }

    /**
     * Delete all nodes for the specified ink strokes from the last ink analysis process.
     * @param {IIterable<Integer>} strokeIds The collection of unique ink stroke identifiers.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalyzer.removedataforstrokes
     */
    RemoveDataForStrokes(strokeIds) {
        if (!this.HasProp("__IInkAnalyzer")) {
            if ((queryResult := this.QueryInterface(IInkAnalyzer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkAnalyzer := IInkAnalyzer(outPtr)
        }

        return this.__IInkAnalyzer.RemoveDataForStrokes(strokeIds)
    }

    /**
     * Update all nodes for the specified ink stroke from the last ink analysis process.
     * @param {InkStroke} stroke 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalyzer.replacedataforstroke
     */
    ReplaceDataForStroke(stroke) {
        if (!this.HasProp("__IInkAnalyzer")) {
            if ((queryResult := this.QueryInterface(IInkAnalyzer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkAnalyzer := IInkAnalyzer(outPtr)
        }

        return this.__IInkAnalyzer.ReplaceDataForStroke(stroke)
    }

    /**
     * Sets the ink analysis category for the [InkAnalysisNode](inkanalysisnode.md) associated with the ink stroke.
     * @remarks
     * Use [**SetStrokeDataKind**](/en-us/uwp/api/windows.ui.input.inking.analysis.inkanalyzer.setstrokedatakind) to specify the type of ink stroke you're interested in analyzing: text (including document structure and bullet lists), drawing (including shape recognition), or non-specific. This can improve both efficiency and recognition accuracy.
     * @param {Integer} strokeId The unique identifier for the ink stroke being categorized.
     * @param {Integer} strokeKind The [InkAnalysisStrokeKind](inkanalysisstrokekind.md) category to assign to the [InkAnalysisNode](inkanalysisnode.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalyzer.setstrokedatakind
     */
    SetStrokeDataKind(strokeId, strokeKind) {
        if (!this.HasProp("__IInkAnalyzer")) {
            if ((queryResult := this.QueryInterface(IInkAnalyzer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkAnalyzer := IInkAnalyzer(outPtr)
        }

        return this.__IInkAnalyzer.SetStrokeDataKind(strokeId, strokeKind)
    }

    /**
     * Aynchronously generates the tree of objects for the ink analysis process.
     * @returns {IAsyncOperation<InkAnalysisResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalyzer.analyzeasync
     */
    AnalyzeAsync() {
        if (!this.HasProp("__IInkAnalyzer")) {
            if ((queryResult := this.QueryInterface(IInkAnalyzer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkAnalyzer := IInkAnalyzer(outPtr)
        }

        return this.__IInkAnalyzer.AnalyzeAsync()
    }

;@endregion Instance Methods
}
