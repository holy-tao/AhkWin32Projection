#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpCFGInterpreter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpCFGInterpreter
     * @type {Guid}
     */
    static IID => Guid("{f3d3f926-11fc-11d3-bb97-00c04f8ee6c0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitGrammar", "Interpret"]

    /**
     * 
     * @param {PWSTR} pszGrammarName 
     * @param {Pointer<Pointer<Void>>} pvGrammarData 
     * @returns {HRESULT} 
     */
    InitGrammar(pszGrammarName, pvGrammarData) {
        pszGrammarName := pszGrammarName is String ? StrPtr(pszGrammarName) : pszGrammarName

        pvGrammarDataMarshal := pvGrammarData is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pszGrammarName, pvGrammarDataMarshal, pvGrammarData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISpPhraseBuilder} pPhrase 
     * @param {Integer} ulFirstElement 
     * @param {Integer} ulCountOfElements 
     * @param {ISpCFGInterpreterSite} pSite 
     * @returns {HRESULT} 
     */
    Interpret(pPhrase, ulFirstElement, ulCountOfElements, pSite) {
        result := ComCall(4, this, "ptr", pPhrase, "uint", ulFirstElement, "uint", ulCountOfElements, "ptr", pSite, "HRESULT")
        return result
    }
}
