#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpGrammarCompiler extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CompileStream"]

    /**
     * 
     * @param {IStream} pSource 
     * @param {IStream} pDest 
     * @param {IStream} pHeader 
     * @param {IUnknown} pReserved 
     * @param {ISpErrorLog} pErrorLog 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    CompileStream(pSource, pDest, pHeader, pReserved, pErrorLog, dwFlags) {
        result := ComCall(3, this, "ptr", pSource, "ptr", pDest, "ptr", pHeader, "ptr", pReserved, "ptr", pErrorLog, "uint", dwFlags, "HRESULT")
        return result
    }
}
