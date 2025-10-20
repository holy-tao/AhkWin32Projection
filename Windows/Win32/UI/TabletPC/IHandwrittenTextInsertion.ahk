#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
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
     * 
     * @param {Pointer<SAFEARRAY>} psaAlternates 
     * @param {Integer} locale 
     * @param {BOOL} fAlternateContainsAutoSpacingInformation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-ihandwrittentextinsertion-insertrecognitionresultsarray
     */
    InsertRecognitionResultsArray(psaAlternates, locale, fAlternateContainsAutoSpacingInformation) {
        result := ComCall(3, this, "ptr", psaAlternates, "uint", locale, "int", fAlternateContainsAutoSpacingInformation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInkRecognitionResult} pIInkRecoResult 
     * @param {Integer} locale 
     * @param {BOOL} fAlternateContainsAutoSpacingInformation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-ihandwrittentextinsertion-insertinkrecognitionresult
     */
    InsertInkRecognitionResult(pIInkRecoResult, locale, fAlternateContainsAutoSpacingInformation) {
        result := ComCall(4, this, "ptr", pIInkRecoResult, "uint", locale, "int", fAlternateContainsAutoSpacingInformation, "HRESULT")
        return result
    }
}
