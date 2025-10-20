#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IHandwrittenTextInsertion extends IUnknown{
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
     * 
     * @param {Pointer<SAFEARRAY>} psaAlternates 
     * @param {Integer} locale 
     * @param {BOOL} fAlternateContainsAutoSpacingInformation 
     * @returns {HRESULT} 
     */
    InsertRecognitionResultsArray(psaAlternates, locale, fAlternateContainsAutoSpacingInformation) {
        result := ComCall(3, this, "ptr", psaAlternates, "uint", locale, "int", fAlternateContainsAutoSpacingInformation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkRecognitionResult>} pIInkRecoResult 
     * @param {Integer} locale 
     * @param {BOOL} fAlternateContainsAutoSpacingInformation 
     * @returns {HRESULT} 
     */
    InsertInkRecognitionResult(pIInkRecoResult, locale, fAlternateContainsAutoSpacingInformation) {
        result := ComCall(4, this, "ptr", pIInkRecoResult, "uint", locale, "int", fAlternateContainsAutoSpacingInformation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
