#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechPhraseInfoBuilder extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechPhraseInfoBuilder
     * @type {Guid}
     */
    static IID => Guid("{3b151836-df3a-4e0a-846c-d2adc9334333}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RestorePhraseFromMemory"]

    /**
     * 
     * @param {Pointer<VARIANT>} PhraseInMemory 
     * @param {Pointer<ISpeechPhraseInfo>} PhraseInfo 
     * @returns {HRESULT} 
     */
    RestorePhraseFromMemory(PhraseInMemory, PhraseInfo) {
        result := ComCall(7, this, "ptr", PhraseInMemory, "ptr*", PhraseInfo, "HRESULT")
        return result
    }
}
