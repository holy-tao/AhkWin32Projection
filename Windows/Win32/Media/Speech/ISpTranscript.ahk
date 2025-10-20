#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpTranscript extends IUnknown{
    /**
     * The interface identifier for ISpTranscript
     * @type {Guid}
     */
    static IID => Guid("{10f63bce-201a-11d3-ac70-00c04f8ee6c0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<PWSTR>} ppszTranscript 
     * @returns {HRESULT} 
     */
    GetTranscript(ppszTranscript) {
        result := ComCall(3, this, "ptr", ppszTranscript, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszTranscript 
     * @returns {HRESULT} 
     */
    AppendTranscript(pszTranscript) {
        pszTranscript := pszTranscript is String ? StrPtr(pszTranscript) : pszTranscript

        result := ComCall(4, this, "ptr", pszTranscript, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
