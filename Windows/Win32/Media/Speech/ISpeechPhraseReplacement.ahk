#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechPhraseReplacement extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechPhraseReplacement
     * @type {Guid}
     */
    static IID => Guid("{2890a410-53a7-4fb5-94ec-06d4998e3d02}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DisplayAttributes", "get_Text", "get_FirstElement", "get_NumberOfElements"]

    /**
     * 
     * @param {Pointer<Integer>} DisplayAttributes 
     * @returns {HRESULT} 
     */
    get_DisplayAttributes(DisplayAttributes) {
        DisplayAttributesMarshal := DisplayAttributes is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, DisplayAttributesMarshal, DisplayAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Text 
     * @returns {HRESULT} 
     */
    get_Text(Text) {
        result := ComCall(8, this, "ptr", Text, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} FirstElement 
     * @returns {HRESULT} 
     */
    get_FirstElement(FirstElement) {
        FirstElementMarshal := FirstElement is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, FirstElementMarshal, FirstElement, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} NumberOfElements 
     * @returns {HRESULT} 
     */
    get_NumberOfElements(NumberOfElements) {
        NumberOfElementsMarshal := NumberOfElements is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, NumberOfElementsMarshal, NumberOfElements, "HRESULT")
        return result
    }
}
