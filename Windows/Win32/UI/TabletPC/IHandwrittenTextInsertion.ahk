#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IInkRecognitionResult.ahk" { IInkRecognitionResult }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Used by the application's custom text entry code to insert the text into both the text field and the Text Services backing-store.
 * @remarks
 * This element is declared in Peninputpanel.h.
 * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nn-peninputpanel-ihandwrittentextinsertion
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct IHandwrittenTextInsertion extends IUnknown {
    /**
     * The interface identifier for IHandwrittenTextInsertion
     * @type {Guid}
     */
    static IID := Guid("{56fdea97-ecd6-43e7-aa3a-816be7785860}")

    /**
     * The class identifier for HandwrittenTextInsertion
     * @type {Guid}
     */
    static CLSID := Guid("{9f074ee2-e6e9-4d8a-a047-eb5b5c3c55da}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHandwrittenTextInsertion interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        InsertRecognitionResultsArray : IntPtr
        InsertInkRecognitionResult    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHandwrittenTextInsertion.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        result := ComCall(3, this, SAFEARRAY.Ptr, psaAlternates, "uint", locale, BOOL, fAlternateContainsAutoSpacingInformation, "HRESULT")
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
        result := ComCall(4, this, "ptr", pIInkRecoResult, "uint", locale, BOOL, fAlternateContainsAutoSpacingInformation, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHandwrittenTextInsertion.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InsertRecognitionResultsArray := CallbackCreate(GetMethod(implObj, "InsertRecognitionResultsArray"), flags, 4)
        this.vtbl.InsertInkRecognitionResult := CallbackCreate(GetMethod(implObj, "InsertInkRecognitionResult"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InsertRecognitionResultsArray)
        CallbackFree(this.vtbl.InsertInkRecognitionResult)
    }
}
