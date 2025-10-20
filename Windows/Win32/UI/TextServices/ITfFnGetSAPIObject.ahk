#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfFunction.ahk

/**
 * The ITfFnGetSAPIObject interface is implemented by the Speech API (SAPI) text service. This interface is used by the TSF manager or a client (application or other text service) to obtain various SAPI objects.
 * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nn-ctffunc-itffngetsapiobject
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfFnGetSAPIObject extends ITfFunction{
    /**
     * The interface identifier for ITfFnGetSAPIObject
     * @type {Guid}
     */
    static IID => Guid("{5c0ab7ea-167d-4f59-bfb5-4693755e90ca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * 
     * @param {Integer} sObj 
     * @param {Pointer<IUnknown>} ppunk 
     * @returns {HRESULT} 
     */
    Get(sObj, ppunk) {
        result := ComCall(4, this, "int", sObj, "ptr", ppunk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
