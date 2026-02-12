#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the types of nodes (or categories of ink input) that ink analysis can differentiate and recognize.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalysisnodekind
 * @namespace Windows.UI.Input.Inking.Analysis
 * @version WindowsRuntime 1.4
 */
class InkAnalysisNodeKind extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UnclassifiedInk => 0

    /**
     * @type {Integer (Int32)}
     */
    static Root => 1

    /**
     * @type {Integer (Int32)}
     */
    static WritingRegion => 2

    /**
     * @type {Integer (Int32)}
     */
    static Paragraph => 3

    /**
     * @type {Integer (Int32)}
     */
    static Line => 4

    /**
     * @type {Integer (Int32)}
     */
    static InkWord => 5

    /**
     * @type {Integer (Int32)}
     */
    static InkBullet => 6

    /**
     * @type {Integer (Int32)}
     */
    static InkDrawing => 7

    /**
     * @type {Integer (Int32)}
     */
    static ListItem => 8
}
