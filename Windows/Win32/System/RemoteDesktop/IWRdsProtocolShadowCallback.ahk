#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods called by the protocol to notify the Remote Desktop Services service to start or stop the target side of a shadow.
 * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nn-wtsprotocol-iwrdsprotocolshadowcallback
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWRdsProtocolShadowCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWRdsProtocolShadowCallback
     * @type {Guid}
     */
    static IID => Guid("{e0667ce0-0372-40d6-adb2-a0f3322674d6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StopShadow", "InvokeTargetShadow"]

    /**
     * Instructs the Remote Desktop Services service to stop shadowing a target.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocolshadowcallback-stopshadow
     */
    StopShadow() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Instructs the Remote Desktop Services service to begin the target side of the shadow and passes any information that must be exchanged between the client and the target.
     * @param {PWSTR} pTargetServerName A pointer to a string that contains the name of the shadow target server.
     * @param {Integer} TargetSessionId An integer that specifies the ID of the target session to shadow.
     * @param {Pointer<Integer>} pParam1 A pointer to a buffer that contains an arbitrary parameter.
     * @param {Integer} Param1Size An integer that contains the size, in bytes, of the value referenced by the <i>pParam1</i> parameter.
     * @param {Pointer<Integer>} pParam2 A pointer to a buffer that contains an arbitrary parameter.
     * @param {Integer} Param2Size An integer that contains the size, in bytes, of the value referenced by the <i>pParam2</i> parameter.
     * @param {Pointer<Integer>} pParam3 A pointer to a buffer that contains an arbitrary parameter.
     * @param {Integer} Param3Size An integer that contains the size, in bytes, of the value referenced by the <i>pParam3</i> parameter.
     * @param {Pointer<Integer>} pParam4 A pointer to a buffer that contains an arbitrary parameter.
     * @param {Integer} Param4Size An integer that contains the size, in bytes, of the value referenced by the <i>pParam4</i> parameter.
     * @param {PWSTR} pClientName A pointer to a string that contains the name of the shadow client.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocolshadowcallback-invoketargetshadow
     */
    InvokeTargetShadow(pTargetServerName, TargetSessionId, pParam1, Param1Size, pParam2, Param2Size, pParam3, Param3Size, pParam4, Param4Size, pClientName) {
        pTargetServerName := pTargetServerName is String ? StrPtr(pTargetServerName) : pTargetServerName
        pClientName := pClientName is String ? StrPtr(pClientName) : pClientName

        pParam1Marshal := pParam1 is VarRef ? "char*" : "ptr"
        pParam2Marshal := pParam2 is VarRef ? "char*" : "ptr"
        pParam3Marshal := pParam3 is VarRef ? "char*" : "ptr"
        pParam4Marshal := pParam4 is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "ptr", pTargetServerName, "uint", TargetSessionId, pParam1Marshal, pParam1, "uint", Param1Size, pParam2Marshal, pParam2, "uint", Param2Size, pParam3Marshal, pParam3, "uint", Param3Size, pParam4Marshal, pParam4, "uint", Param4Size, "ptr", pClientName, "HRESULT")
        return result
    }
}
