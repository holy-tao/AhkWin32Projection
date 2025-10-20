#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpGrammarCompiler extends IUnknown{
    /**
     * The interface identifier for ISpGrammarCompiler
     * @type {Guid}
     */
    static IID => Guid("{b1e29d58-a675-11d2-8302-00c04f8ee6c0}")

    /**
     * The class identifier for SpGrammarCompiler
     * @type {Guid}
     */
    static CLSID => Guid("{b1e29d59-a675-11d2-8302-00c04f8ee6c0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IStream>} pSource 
     * @param {Pointer<IStream>} pDest 
     * @param {Pointer<IStream>} pHeader 
     * @param {Pointer<IUnknown>} pReserved 
     * @param {Pointer<ISpErrorLog>} pErrorLog 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    CompileStream(pSource, pDest, pHeader, pReserved, pErrorLog, dwFlags) {
        result := ComCall(3, this, "ptr", pSource, "ptr", pDest, "ptr", pHeader, "ptr", pReserved, "ptr", pErrorLog, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
