#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpObjectWithToken extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetObjectToken", "GetObjectToken"]

    /**
     * 
     * @param {ISpObjectToken} pToken 
     * @returns {HRESULT} 
     */
    SetObjectToken(pToken) {
        result := ComCall(3, this, "ptr", pToken, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISpObjectToken>} ppToken 
     * @returns {HRESULT} 
     */
    GetObjectToken(ppToken) {
        result := ComCall(4, this, "ptr*", ppToken, "HRESULT")
        return result
    }
}
