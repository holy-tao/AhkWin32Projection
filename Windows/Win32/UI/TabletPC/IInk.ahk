#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Provides access to handwriting recognizers for use with ink analysis.
 * @remarks
 * The **IInkAnalysisRecognizer** interface inherits from the [**IUnknown**](/windows/desktop/api/unknwn/nn-unknwn-iunknown) interface. **IInkAnalysisRecognizer** also has these types of members:
 * 
 * -   [Methods](#methods)
 * 
 * 
 * A recognizer has specific attributes and properties that allow it to perform recognition. The properties of a recognizer must be determined before recognition can occur. The types of properties that a recognizer supports determine the types of recognition that it can perform. For instance, if a recognizer does not support cursive handwriting, it returns inaccurate results when a user writes in cursive.
 * 
 * A recognizer also has built-in functionality that automatically manages many aspects of handwriting. For instance, it determines the metrics for the lines on which strokes are drawn. You can return the line number of a stroke, but you never need to specify how those line metrics are determined because of the built-in functionality of the recognizer.
 * 
 * The [**IInkAnalyzer**](iinkanalyzer.md) maintains a list of available recognizers. To access this list, use the [**IInkAnalyzer::GetInkAnalysisRecognizersByPriority Method**](iinkanalyzer-getinkanalysisrecognizersbypriority.md) method.
 * @see https://learn.microsoft.com/windows/win32/tablet/iinkanalysisrecognizer
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInk extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInk
     * @type {Guid}
     */
    static IID => Guid("{03f8e511-43a1-11d3-8bb6-0080c7d6bad5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
