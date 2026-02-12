#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the types of ink strokes that can be recognized by the ink analysis process.
 * @remarks
 * Use InkAnalysisStrokeKind with the [**SetStrokeDataKind**](/en-us/uwp/api/windows.ui.input.inking.analysis.inkanalyzer.setstrokedatakind) method to specify the type of ink stroke you're interested in analyzing: text (including document structure and bullet lists), drawing (including shape recognition), or non-specific. This can improve both efficiency and recognition accuracy.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalysisstrokekind
 * @namespace Windows.UI.Input.Inking.Analysis
 * @version WindowsRuntime 1.4
 */
class InkAnalysisStrokeKind extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * @type {Integer (Int32)}
     */
    static Writing => 1

    /**
     * @type {Integer (Int32)}
     */
    static Drawing => 2
}
