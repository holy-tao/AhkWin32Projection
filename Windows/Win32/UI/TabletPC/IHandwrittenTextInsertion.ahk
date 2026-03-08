#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Used by the application's custom text entry code to insert the text into both the text field and the Text Services backing-store.
 * @remarks
 * This element is declared in Peninputpanel.h.
 * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nn-peninputpanel-ihandwrittentextinsertion
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IHandwrittenTextInsertion extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHandwrittenTextInsertion
     * @type {Guid}
     */
    static IID => Guid("{56fdea97-ecd6-43e7-aa3a-816be7785860}")

    /**
     * The class identifier for HandwrittenTextInsertion
     * @type {Guid}
     */
    static CLSID => Guid("{9f074ee2-e6e9-4d8a-a047-eb5b5c3c55da}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InsertRecognitionResultsArray", "InsertInkRecognitionResult"]

    /**
     * Insert recognition results array.
     * @remarks
     * This element is declared in Peninputpanel.h.
     * @param {Pointer<SAFEARRAY>} psaAlternates A two-dimensional array of strings, where each entry in the first array is a list of alternates for a single word. The first entry in the sub arrays of alternates is the text to insert (the top alternate).
     * @param {Integer} locale A specific culture for the input language of the recognizer used to produce alternates.
     * @param {BOOL} fAlternateContainsAutoSpacingInformation Specifies whether the recognized text is generated with auto-spacing enabled. When <b>FALSE</b>, a space at the start/end of the lattice will always be inserted. When <b>TRUE</b>, a space exists, and is added where necessary. If no space exists, a space is consumed.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-ihandwrittentextinsertion-insertrecognitionresultsarray
     */
    InsertRecognitionResultsArray(psaAlternates, locale, fAlternateContainsAutoSpacingInformation) {
        result := ComCall(3, this, "ptr", psaAlternates, "uint", locale, "int", fAlternateContainsAutoSpacingInformation, "HRESULT")
        return result
    }

    /**
     * Inserts recognition results.
     * @param {IInkRecognitionResult} pIInkRecoResult The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkrecognitionresult">IInkRecognitionResult</a> for the insertion which contains the recognition results and the collection of ink strokes for the insertion.
     * @param {Integer} locale The locale identifier of a specific culture for the input language of the recognizer used to produce alternates.
     * @param {BOOL} fAlternateContainsAutoSpacingInformation Specifies whether the recognized text was generated with auto-spacing enabled on the recognized. <b>TRUE</b> if auto-spacing was enabled; otherwise, <b>FALSE</b>.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-ihandwrittentextinsertion-insertinkrecognitionresult
     */
    InsertInkRecognitionResult(pIInkRecoResult, locale, fAlternateContainsAutoSpacingInformation) {
        result := ComCall(4, this, "ptr", pIInkRecoResult, "uint", locale, "int", fAlternateContainsAutoSpacingInformation, "HRESULT")
        return result
    }
}
