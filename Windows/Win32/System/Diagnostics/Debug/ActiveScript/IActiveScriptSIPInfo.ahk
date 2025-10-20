#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IActiveScriptSIPInfo extends IUnknown{
    /**
     * The interface identifier for IActiveScriptSIPInfo
     * @type {Guid}
     */
    static IID => Guid("{764651d0-38de-11d4-a2a3-00104bd35090}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} poid_sip 
     * @returns {HRESULT} 
     */
    GetSIPOID(poid_sip) {
        result := ComCall(3, this, "ptr", poid_sip, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
