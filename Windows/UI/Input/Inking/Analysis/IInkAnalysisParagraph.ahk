#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Inking.Analysis
 * @version WindowsRuntime 1.4
 */
class IInkAnalysisParagraph extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkAnalysisParagraph
     * @type {Guid}
     */
    static IID => Guid("{d9ad045c-0cd1-4dd4-a68b-eb1f12b3d727}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RecognizedText"]

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
}
