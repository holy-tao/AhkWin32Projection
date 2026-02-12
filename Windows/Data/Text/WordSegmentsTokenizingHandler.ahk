#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * Defines the signature of a function that is provided to [WordsSegmenter.Tokenize](wordssegmenter_tokenize_982453003.md).
 * @remarks
 * One iterator passed to the handler iterates through all the words in the provided text that occur prior to the parameter *startIndex* (passed to [Tokenize](wordssegmenter_tokenize_982453003.md)), in reverse order. The other iterator iterates through all the words in the provided text that contain or follow *startIndex*.
 * 
 * **Example**: If you provide [Tokenize](wordssegmenter_tokenize_982453003.md) with "this is a simple example" and *startIndex* within the word "simple", *precedingWords* iterates through the words "a ", "is ", "this ", and *words* iterates through the words "simple ", "example".
 * 
 * *precedingWords* and *words* are valid only during the lifetime of the handler.
 * @see https://learn.microsoft.com/uwp/api/windows.data.text.wordsegmentstokenizinghandler
 * @namespace Windows.Data.Text
 * @version WindowsRuntime 1.4
 */
class WordSegmentsTokenizingHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for WordSegmentsTokenizingHandler
     * @type {Guid}
     */
    static IID => Guid("{a5dd6357-bf2a-4c4f-a31f-29e71c6f8b35}")

    /**
     * The class identifier for WordSegmentsTokenizingHandler
     * @type {Guid}
     */
    static CLSID => Guid("{a5dd6357-bf2a-4c4f-a31f-29e71c6f8b35}")

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
     * @param {IIterable<WordSegment>} precedingWords 
     * @param {IIterable<WordSegment>} words 
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
