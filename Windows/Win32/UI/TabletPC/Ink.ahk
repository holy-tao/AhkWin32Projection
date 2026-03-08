#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the guide, or area where ink is drawn and recognized.
 * @remarks
 * An **InkAnalysisRecognizerGuide** defines an expected area of input, such as a line or boxes, for characters. An **InkAnalysisRecognizerGuide** structure can be set only on an analysis hint context node (see [**IContextNode::GetType**](icontextnode-gettype.md)). The [**IInkAnalyzer**](iinkanalyzer.md) uses the location of the analysis hint node and the locations of the ink strokes to associate a stroke with the analysis hint node. Any strokes with an association to the analysis hint node will have the specified **InkAnalysisRecognizerGuide** used when recognized by an **IInkAnalyzer**, provided the **IInkAnalyzer** supports the **InkAnalysisRecognizerGuide**. The values expressed in the **InkAnalysisRecognizerGuide** class are always relative to the location of the analysis hint node and are specified in ink space coordinates.
 * @see https://learn.microsoft.com/windows/win32/tablet/inkanalysisrecognizerguide
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class Ink extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
