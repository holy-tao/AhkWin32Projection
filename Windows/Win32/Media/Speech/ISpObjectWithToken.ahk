#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpObjectWithToken extends IUnknown{
    /**
     * The interface identifier for ISpObjectWithToken
     * @type {Guid}
     */
    static IID => Guid("{5b559f40-e952-11d2-bb91-00c04f8ee6c0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ISpObjectToken>} pToken 
     * @returns {HRESULT} 
     */
    SetObjectToken(pToken) {
        result := ComCall(3, this, "ptr", pToken, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpObjectToken>} ppToken 
     * @returns {HRESULT} 
     */
    GetObjectToken(ppToken) {
        result := ComCall(4, this, "ptr", ppToken, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
