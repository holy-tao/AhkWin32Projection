#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the shapes that an InkAnalyzer can recognize when [InkAnalysisNode.Kind](inkanalysisnode_kind.md) is set to [InkDrawing](inkanalysisnodekind.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalysisdrawingkind
 * @namespace Windows.UI.Input.Inking.Analysis
 * @version WindowsRuntime 1.4
 */
class InkAnalysisDrawingKind extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Drawing => 0

    /**
     * @type {Integer (Int32)}
     */
    static Circle => 1

    /**
     * @type {Integer (Int32)}
     */
    static Ellipse => 2

    /**
     * @type {Integer (Int32)}
     */
    static Triangle => 3

    /**
     * @type {Integer (Int32)}
     */
    static IsoscelesTriangle => 4

    /**
     * @type {Integer (Int32)}
     */
    static EquilateralTriangle => 5

    /**
     * @type {Integer (Int32)}
     */
    static RightTriangle => 6

    /**
     * @type {Integer (Int32)}
     */
    static Quadrilateral => 7

    /**
     * @type {Integer (Int32)}
     */
    static Rectangle => 8

    /**
     * @type {Integer (Int32)}
     */
    static Square => 9

    /**
     * @type {Integer (Int32)}
     */
    static Diamond => 10

    /**
     * @type {Integer (Int32)}
     */
    static Trapezoid => 11

    /**
     * @type {Integer (Int32)}
     */
    static Parallelogram => 12

    /**
     * @type {Integer (Int32)}
     */
    static Pentagon => 13

    /**
     * @type {Integer (Int32)}
     */
    static Hexagon => 14
}
