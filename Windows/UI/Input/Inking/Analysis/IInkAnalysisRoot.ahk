#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\IInkAnalysisNode.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Inking.Analysis
 * @version WindowsRuntime 1.4
 */
class IInkAnalysisRoot extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkAnalysisRoot
     * @type {Guid}
     */
    static IID => Guid("{3fb6a3c4-2fde-4061-8502-a90f32545b84}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RecognizedText", "FindNodes"]

    /**
     * @type {HSTRING} 
     */
    RecognizedText {
        get => this.get_RecognizedText()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RecognizedText() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} nodeKind 
     * @returns {IVectorView<IInkAnalysisNode>} 
     */
    FindNodes(nodeKind) {
        result := ComCall(7, this, "int", nodeKind, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(IInkAnalysisNode, result_)
    }
}
