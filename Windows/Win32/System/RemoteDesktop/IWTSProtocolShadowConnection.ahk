#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWTSProtocolShadowCallback.ahk" { IWTSProtocolShadowCallback }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * IWTSProtocolShadowConnection is no longer available. Instead, use IWRdsProtocolShadowConnection.
 * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nn-wtsprotocol-iwtsprotocolshadowconnection
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IWTSProtocolShadowConnection extends IUnknown {
    /**
     * The interface identifier for IWTSProtocolShadowConnection
     * @type {Guid}
     */
    static IID := Guid("{ee3b0c14-37fb-456b-bab3-6d6cd51e13bf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWTSProtocolShadowConnection interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Start    : IntPtr
        Stop     : IntPtr
        DoTarget : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWTSProtocolShadowConnection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * IWTSProtocolShadowConnection::Start is no longer available. Instead, use IWRdsProtocolShadowConnection::Start.
     * @remarks
     * The Remote Desktop Services service also changes the session state on the shadowed client to reflect the fact that it is being shadowed.
     * @param {PWSTR} pTargetServerName A pointer to a string that contains the name of the shadowing server.
     * @param {Integer} TargetSessionId An integer that specifies the ID of the target session to shadow.
     * @param {Integer} HotKeyVk The virtual key code of the key that must be pressed to stop shadowing. This key is used in combination with the <i>HotkeyModifiers</i> parameter.
     * @param {Integer} HotkeyModifiers The virtual modifier that specifies the modifier key to press to stop shadowing. Modifier keys include the Shift, Alt, and Ctrl keys. The modifier key is used in combination with the key signified by the <i>HotKeyVk</i> parameter.
     * @param {IWTSProtocolShadowCallback} pShadowCallback A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nn-wtsprotocol-iwtsprotocolshadowcallback">IWTSProtocolShadowCallback</a> interface that the protocol can use to call back into the Remote Desktop Services service.
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolshadowconnection-start
     */
    Start(pTargetServerName, TargetSessionId, HotKeyVk, HotkeyModifiers, pShadowCallback) {
        pTargetServerName := pTargetServerName is String ? StrPtr(pTargetServerName) : pTargetServerName

        result := ComCall(3, this, "ptr", pTargetServerName, "uint", TargetSessionId, "char", HotKeyVk, "ushort", HotkeyModifiers, "ptr", pShadowCallback, "HRESULT")
        return result
    }

    /**
     * IWTSProtocolShadowConnection::Stop is no longer available. Instead, use IWRdsProtocolShadowConnection::Stop.
     * @remarks
     * The Remote Desktop Services service also changes the session state on the shadowed client to reflect the fact it is no longer being shadowed.
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>. The Remote Desktop Services service drops the connection if an error is returned.
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolshadowconnection-stop
     */
    Stop() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * IWTSProtocolShadowConnection::DoTarget is no longer available. Instead, use IWRdsProtocolShadowConnection::DoTarget.
     * @remarks
     * The four parameters <i>pParam1</i>, <i>pParam2</i>, <i>pParam3</i>, and <i>pParam4</i> can contain any information that must be exchanged between the shadow client and the shadow target. The Remote Desktop Services service passes the information through without modification.
     * @param {Pointer<Integer>} pParam1 A pointer to a byte that contains an arbitrary parameter.
     * @param {Integer} Param1Size An integer that contains the size, in bytes, of the value referenced by the <i>pParam1</i> parameter.
     * @param {Pointer<Integer>} pParam2 A pointer to a byte that contains an arbitrary parameter.
     * @param {Integer} Param2Size An integer that contains the size, in bytes, of the value referenced by the <i>pParam2</i> parameter.
     * @param {Pointer<Integer>} pParam3 A pointer to a byte that contains an arbitrary parameter.
     * @param {Integer} Param3Size An integer that contains the size, in bytes, of the value referenced by the <i>pParam3</i> parameter.
     * @param {Pointer<Integer>} pParam4 A pointer to a byte that contains an arbitrary parameter.
     * @param {Integer} Param4Size An integer that contains the size, in bytes, of the value referenced by the <i>pParam4</i> parameter.
     * @param {PWSTR} pClientName A pointer to a string that contains the name of the shadow client.
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolshadowconnection-dotarget
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

    Query(iid) {
        if (IWTSProtocolShadowConnection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Start := CallbackCreate(GetMethod(implObj, "Start"), flags, 6)
        this.vtbl.Stop := CallbackCreate(GetMethod(implObj, "Stop"), flags, 1)
        this.vtbl.DoTarget := CallbackCreate(GetMethod(implObj, "DoTarget"), flags, 10)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Start)
        CallbackFree(this.vtbl.Stop)
        CallbackFree(this.vtbl.DoTarget)
    }
}
