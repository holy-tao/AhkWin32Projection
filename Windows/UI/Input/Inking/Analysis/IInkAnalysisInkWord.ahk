#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Inking.Analysis
 * @version WindowsRuntime 1.4
 */
class IInkAnalysisInkWord extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkAnalysisInkWord
     * @type {Guid}
     */
    static IID => Guid("{4bd228ad-83af-4034-8f3b-f8687dfff436}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RecognizedText", "get_TextAlternates"]

    /**
     * @type {HSTRING} 
     */
    RecognizedText {
        get => this.get_RecognizedText()
    }

    /**
     * @type {IVectorView<HSTRING>} 
     */
    TextAlternates {
        get => this.get_TextAlternates()
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
     * @returns {IVectorView<HSTRING>} 
     */
    get_TextAlternates() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }
}
