#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * .
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinkrecognizercontext
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkRecognizerContext extends IDispatch{
    /**
     * The interface identifier for IInkRecognizerContext
     * @type {Guid}
     */
    static IID => Guid("{c68f52f9-32a3-4625-906c-44fc23b40958}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IInkStrokes>} Strokes 
     * @returns {HRESULT} 
     */
    get_Strokes(Strokes) {
        result := ComCall(7, this, "ptr", Strokes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkStrokes>} Strokes 
     * @returns {HRESULT} 
     */
    putref_Strokes(Strokes) {
        result := ComCall(8, this, "ptr", Strokes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Mode 
     * @returns {HRESULT} 
     */
    get_CharacterAutoCompletionMode(Mode) {
        result := ComCall(9, this, "int*", Mode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Mode 
     * @returns {HRESULT} 
     */
    put_CharacterAutoCompletionMode(Mode) {
        result := ComCall(10, this, "int", Mode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Factoid 
     * @returns {HRESULT} 
     */
    get_Factoid(Factoid) {
        result := ComCall(11, this, "ptr", Factoid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} factoid 
     * @returns {HRESULT} 
     */
    put_Factoid(factoid) {
        factoid := factoid is String ? BSTR.Alloc(factoid).Value : factoid

        result := ComCall(12, this, "ptr", factoid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkRecognizerGuide>} RecognizerGuide 
     * @returns {HRESULT} 
     */
    get_Guide(RecognizerGuide) {
        result := ComCall(13, this, "ptr", RecognizerGuide, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkRecognizerGuide>} RecognizerGuide 
     * @returns {HRESULT} 
     */
    putref_Guide(RecognizerGuide) {
        result := ComCall(14, this, "ptr", RecognizerGuide, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Prefix 
     * @returns {HRESULT} 
     */
    get_PrefixText(Prefix) {
        result := ComCall(15, this, "ptr", Prefix, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Prefix 
     * @returns {HRESULT} 
     */
    put_PrefixText(Prefix) {
        Prefix := Prefix is String ? BSTR.Alloc(Prefix).Value : Prefix

        result := ComCall(16, this, "ptr", Prefix, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Suffix 
     * @returns {HRESULT} 
     */
    get_SuffixText(Suffix) {
        result := ComCall(17, this, "ptr", Suffix, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Suffix 
     * @returns {HRESULT} 
     */
    put_SuffixText(Suffix) {
        Suffix := Suffix is String ? BSTR.Alloc(Suffix).Value : Suffix

        result := ComCall(18, this, "ptr", Suffix, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Modes 
     * @returns {HRESULT} 
     */
    get_RecognitionFlags(Modes) {
        result := ComCall(19, this, "int*", Modes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Modes 
     * @returns {HRESULT} 
     */
    put_RecognitionFlags(Modes) {
        result := ComCall(20, this, "int", Modes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkWordList>} WordList 
     * @returns {HRESULT} 
     */
    get_WordList(WordList) {
        result := ComCall(21, this, "ptr", WordList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkWordList>} WordList 
     * @returns {HRESULT} 
     */
    putref_WordList(WordList) {
        result := ComCall(22, this, "ptr", WordList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkRecognizer>} Recognizer 
     * @returns {HRESULT} 
     */
    get_Recognizer(Recognizer) {
        result := ComCall(23, this, "ptr", Recognizer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} RecognitionStatus 
     * @param {Pointer<IInkRecognitionResult>} RecognitionResult 
     * @returns {HRESULT} 
     */
    Recognize(RecognitionStatus, RecognitionResult) {
        result := ComCall(24, this, "int*", RecognitionStatus, "ptr", RecognitionResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopBackgroundRecognition() {
        result := ComCall(25, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Indicates that no more ink will be added to the context.You cannot add strokes to the context after calling this function.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid argument was received.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The recognizer context handle is invalid or null.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//recapis/nf-recapis-endinkinput
     */
    EndInkInput() {
        result := ComCall(26, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} CustomData 
     * @returns {HRESULT} 
     */
    BackgroundRecognize(CustomData) {
        result := ComCall(27, this, "ptr", CustomData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} CustomData 
     * @returns {HRESULT} 
     */
    BackgroundRecognizeWithAlternates(CustomData) {
        result := ComCall(28, this, "ptr", CustomData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkRecognizerContext>} RecoContext 
     * @returns {HRESULT} 
     */
    Clone(RecoContext) {
        result := ComCall(29, this, "ptr", RecoContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns a value that indicates whether a word, date, time, number, or other text that is passed in is contained in the dictionary.The results of this test depend on the factoid setting.
     * @param {BSTR} String 
     * @param {Pointer<VARIANT_BOOL>} Supported 
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * This function also returns S_OK if the recognizer does not support this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The string is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is an invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid argument was received.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//recapis/nf-recapis-isstringsupported
     */
    IsStringSupported(String, Supported) {
        String := String is String ? BSTR.Alloc(String).Value : String

        result := ComCall(30, this, "ptr", String, "ptr", Supported, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
