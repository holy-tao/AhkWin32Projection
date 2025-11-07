#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @returns {Integer} 
     */
    get_DisplayAttributes() {
        result := ComCall(7, this, "int*", &DisplayAttributes := 0, "HRESULT")
        return DisplayAttributes
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Text() {
        Text := BSTR()
        result := ComCall(8, this, "ptr", Text, "HRESULT")
        return Text
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FirstElement() {
        result := ComCall(9, this, "int*", &FirstElement := 0, "HRESULT")
        return FirstElement
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NumberOfElements() {
        result := ComCall(10, this, "int*", &NumberOfElements := 0, "HRESULT")
        return NumberOfElements
    }
}
