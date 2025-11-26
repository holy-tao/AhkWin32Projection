#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods that notify the protocol provider about the status of session shadowing.
 * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nn-wtsprotocol-iwrdsprotocolshadowconnection
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWRdsProtocolShadowConnection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWRdsProtocolShadowConnection
     * @type {Guid}
     */
    static IID => Guid("{9ae85ce6-cade-4548-8feb-99016597f60a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Start", "Stop", "DoTarget"]

    /**
     * Notifies the protocol that shadowing has started.
     * @param {PWSTR} pTargetServerName A pointer to a string that contains the name of the shadowing server.
     * @param {Integer} TargetSessionId An integer that specifies the ID of the target session to shadow.
     * @param {Integer} HotKeyVk The virtual key code of the key that must be pressed to stop shadowing. This key is used in combination with the <i>HotkeyModifiers</i> parameter.
     * @param {Integer} HotkeyModifiers The virtual modifier that specifies the modifier key to press to stop shadowing. Modifier keys include the Shift, Alt, and Ctrl keys. The modifier key is used in combination with the key signified by the <i>HotKeyVk</i> parameter.
     * @param {IWRdsProtocolShadowCallback} pShadowCallback A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nn-wtsprotocol-iwrdsprotocolshadowcallback">IWRdsProtocolShadowCallback</a> interface that the protocol can use to call back into the Remote Desktop Services service.
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocolshadowconnection-start
     */
    Start(pTargetServerName, TargetSessionId, HotKeyVk, HotkeyModifiers, pShadowCallback) {
        pTargetServerName := pTargetServerName is String ? StrPtr(pTargetServerName) : pTargetServerName

        result := ComCall(3, this, "ptr", pTargetServerName, "uint", TargetSessionId, "char", HotKeyVk, "ushort", HotkeyModifiers, "ptr", pShadowCallback, "HRESULT")
        return result
    }

    /**
     * Notifies the protocol that shadowing has stopped.
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>. The Remote Desktop Services service drops the connection if an error is returned.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocolshadowconnection-stop
     */
    Stop() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Requests that the protocol start the target side of a shadow connection.
     * @param {Pointer<Integer>} pParam1 A pointer to a buffer that contains an arbitrary parameter.
     * @param {Integer} Param1Size An integer that contains the size, in bytes, of the value referenced by the <i>pParam1</i> parameter.
     * @param {Pointer<Integer>} pParam2 A pointer to a buffer that contains an arbitrary parameter.
     * @param {Integer} Param2Size An integer that contains the size, in bytes, of the value referenced by the <i>pParam2</i> parameter.
     * @param {Pointer<Integer>} pParam3 A pointer to a buffer that contains an arbitrary parameter.
     * @param {Integer} Param3Size An integer that contains the size, in bytes, of the value referenced by the <i>pParam3</i> parameter.
     * @param {Pointer<Integer>} pParam4 A pointer to a buffer that contains an arbitrary parameter.
     * @param {Integer} Param4Size An integer that contains the size, in bytes, of the value referenced by the <i>pParam4</i> parameter.
     * @param {PWSTR} pClientName A pointer to a string that contains the name of the shadow client.
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocolshadowconnection-dotarget
     */
    DoTarget(pParam1, Param1Size, pParam2, Param2Size, pParam3, Param3Size, pParam4, Param4Size, pClientName) {
        pClientName := pClientName is String ? StrPtr(pClientName) : pClientName

        pParam1Marshal := pParam1 is VarRef ? "char*" : "ptr"
        pParam2Marshal := pParam2 is VarRef ? "char*" : "ptr"
        pParam3Marshal := pParam3 is VarRef ? "char*" : "ptr"
        pParam4Marshal := pParam4 is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, pParam1Marshal, pParam1, "uint", Param1Size, pParam2Marshal, pParam2, "uint", Param2Size, pParam3Marshal, pParam3, "uint", Param3Size, pParam4Marshal, pParam4, "uint", Param4Size, "ptr", pClientName, "HRESULT")
        return result
    }
}
