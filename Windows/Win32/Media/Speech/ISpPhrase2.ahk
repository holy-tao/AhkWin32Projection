#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpPhrase.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpPhrase2 extends ISpPhrase{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpPhrase2
     * @type {Guid}
     */
    static IID => Guid("{f264da52-e457-4696-b856-a737b717af79}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetXMLResult", "GetXMLErrorInfo", "GetAudio"]

    /**
     * 
     * @param {Pointer<PWSTR>} ppszCoMemXMLResult 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    GetXMLResult(ppszCoMemXMLResult, Options) {
        result := ComCall(7, this, "ptr", ppszCoMemXMLResult, "int", Options, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SPSEMANTICERRORINFO>} pSemanticErrorInfo 
     * @returns {HRESULT} 
     */
    GetXMLErrorInfo(pSemanticErrorInfo) {
        result := ComCall(8, this, "ptr", pSemanticErrorInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulStartElement 
     * @param {Integer} cElements 
     * @param {Pointer<ISpStreamFormat>} ppStream 
     * @returns {HRESULT} 
     */
    GetAudio(ulStartElement, cElements, ppStream) {
        result := ComCall(9, this, "uint", ulStartElement, "uint", cElements, "ptr*", ppStream, "HRESULT")
        return result
    }
}
