#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * IWTSProtocolShadowConnection is no longer available. Instead, use IWRdsProtocolShadowConnection.
 * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nn-wtsprotocol-iwtsprotocolshadowconnection
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWTSProtocolShadowConnection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWTSProtocolShadowConnection
     * @type {Guid}
     */
    static IID => Guid("{ee3b0c14-37fb-456b-bab3-6d6cd51e13bf}")

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
     * 
     * @param {PWSTR} pTargetServerName 
     * @param {Integer} TargetSessionId 
     * @param {Integer} HotKeyVk 
     * @param {Integer} HotkeyModifiers 
     * @param {IWTSProtocolShadowCallback} pShadowCallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolshadowconnection-start
     */
    Start(pTargetServerName, TargetSessionId, HotKeyVk, HotkeyModifiers, pShadowCallback) {
        pTargetServerName := pTargetServerName is String ? StrPtr(pTargetServerName) : pTargetServerName

        result := ComCall(3, this, "ptr", pTargetServerName, "uint", TargetSessionId, "char", HotKeyVk, "ushort", HotkeyModifiers, "ptr", pShadowCallback, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolshadowconnection-stop
     */
    Stop() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pParam1 
     * @param {Integer} Param1Size 
     * @param {Pointer<Integer>} pParam2 
     * @param {Integer} Param2Size 
     * @param {Pointer<Integer>} pParam3 
     * @param {Integer} Param3Size 
     * @param {Pointer<Integer>} pParam4 
     * @param {Integer} Param4Size 
     * @param {PWSTR} pClientName 
     * @returns {HRESULT} 
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
}
