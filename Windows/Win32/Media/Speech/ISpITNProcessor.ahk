#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpITNProcessor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpITNProcessor
     * @type {Guid}
     */
    static IID => Guid("{12d7360f-a1c9-11d3-bc90-00c04f72df9f}")

    /**
     * The class identifier for SpITNProcessor
     * @type {Guid}
     */
    static CLSID => Guid("{12d73610-a1c9-11d3-bc90-00c04f72df9f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LoadITNGrammar", "ITNPhrase"]

    /**
     * 
     * @param {PWSTR} pszCLSID 
     * @returns {HRESULT} 
     */
    LoadITNGrammar(pszCLSID) {
        pszCLSID := pszCLSID is String ? StrPtr(pszCLSID) : pszCLSID

        result := ComCall(3, this, "ptr", pszCLSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISpPhraseBuilder} pPhrase 
     * @returns {HRESULT} 
     */
    ITNPhrase(pPhrase) {
        result := ComCall(4, this, "ptr", pPhrase, "HRESULT")
        return result
    }
}
