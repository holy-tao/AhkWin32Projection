#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpGrammarBuilder.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpGramCompBackend extends ISpGrammarBuilder{
    /**
     * The interface identifier for ISpGramCompBackend
     * @type {Guid}
     */
    static IID => Guid("{3ddca27c-665c-4786-9f97-8c90c3488b61}")

    /**
     * The class identifier for SpGramCompBackend
     * @type {Guid}
     */
    static CLSID => Guid("{da93e903-c843-11d2-a084-00c04f8ef9b5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * 
     * @param {Pointer<IStream>} pStream 
     * @param {Pointer<ISpErrorLog>} pErrorLog 
     * @returns {HRESULT} 
     */
    SetSaveObjects(pStream, pErrorLog) {
        result := ComCall(11, this, "ptr", pStream, "ptr", pErrorLog, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SPBINARYGRAMMAR>} pBinaryData 
     * @returns {HRESULT} 
     */
    InitFromBinaryGrammar(pBinaryData) {
        result := ComCall(12, this, "ptr", pBinaryData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
