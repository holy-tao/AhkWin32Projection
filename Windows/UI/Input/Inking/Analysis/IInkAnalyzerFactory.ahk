#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\InkAnalyzer.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents a factory for generating [InkAnalyzer](inkanalyzer.md) objects used in ink analysis.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.iinkanalyzerfactory
 * @namespace Windows.UI.Input.Inking.Analysis
 * @version WindowsRuntime 1.4
 */
class IInkAnalyzerFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkAnalyzerFactory
     * @type {Guid}
     */
    static IID => Guid("{29138686-1963-49d8-9589-e14384c769e3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateAnalyzer"]

    /**
     * Retrieves a new instance of an [InkAnalyzer](inkanalyzer.md) object.
     * @returns {InkAnalyzer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.iinkanalyzerfactory.createanalyzer
     */
    CreateAnalyzer() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InkAnalyzer(result_)
    }
}
