#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechPhraseReplacement extends IDispatch{
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
     * 
     * @param {Pointer<Int32>} DisplayAttributes 
     * @returns {HRESULT} 
     */
    get_DisplayAttributes(DisplayAttributes) {
        result := ComCall(7, this, "int*", DisplayAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Text 
     * @returns {HRESULT} 
     */
    get_Text(Text) {
        result := ComCall(8, this, "ptr", Text, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} FirstElement 
     * @returns {HRESULT} 
     */
    get_FirstElement(FirstElement) {
        result := ComCall(9, this, "int*", FirstElement, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} NumberOfElements 
     * @returns {HRESULT} 
     */
    get_NumberOfElements(NumberOfElements) {
        result := ComCall(10, this, "int*", NumberOfElements, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
