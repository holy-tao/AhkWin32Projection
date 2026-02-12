#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * Defines the signature of a function that is provided to [SelectableWordsSegmenter.Tokenize](selectablewordssegmenter_tokenize_561242729.md).
 * @remarks
 * One iterator passed to the handler iterates through all the selectable words in the provided text that occur prior to *startIndex* (passed to [Tokenize](selectablewordssegmenter_tokenize_561242729.md)), in reverse order. The other iterator iterates through all the selectable words in the provided text that contain or follow *startIndex*.
 * 
 * **Example**: If you provide [Tokenize](selectablewordssegmenter_tokenize_561242729.md) with "this is a simple example" and *startIndex* within the word "simple", *precedingWords* iterates through the words "a ", "is ", "this ", and *words* iterates through the words "simple ", "example".
 * 
 * *precedingWords* and *words* are valid only during the lifetime of the handler.
 * @see https://learn.microsoft.com/uwp/api/windows.data.text.selectablewordsegmentstokenizinghandler
 * @namespace Windows.Data.Text
 * @version WindowsRuntime 1.4
 */
class SelectableWordSegmentsTokenizingHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for SelectableWordSegmentsTokenizingHandler
     * @type {Guid}
     */
    static IID => Guid("{3a3dfc9c-aede-4dc7-9e6c-41c044bd3592}")

    /**
     * The class identifier for SelectableWordSegmentsTokenizingHandler
     * @type {Guid}
     */
    static CLSID => Guid("{3a3dfc9c-aede-4dc7-9e6c-41c044bd3592}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {IIterable<SelectableWordSegment>} precedingWords 
     * @param {IIterable<SelectableWordSegment>} words 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(precedingWords, words) {
        result := ComCall(3, this, "ptr", precedingWords, "ptr", words, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
