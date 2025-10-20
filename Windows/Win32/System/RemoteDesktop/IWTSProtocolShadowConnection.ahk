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
     * 
     * @param {PWSTR} pTargetServerName 
     * @param {Integer} TargetSessionId 
     * @param {Integer} HotKeyVk 
     * @param {Integer} HotkeyModifiers 
     * @param {Pointer<IWTSProtocolShadowCallback>} pShadowCallback 
     * @returns {HRESULT} 
     */
    Start(pTargetServerName, TargetSessionId, HotKeyVk, HotkeyModifiers, pShadowCallback) {
        pTargetServerName := pTargetServerName is String ? StrPtr(pTargetServerName) : pTargetServerName

        result := ComCall(3, this, "ptr", pTargetServerName, "uint", TargetSessionId, "char", HotKeyVk, "ushort", HotkeyModifiers, "ptr", pShadowCallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Stop() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pParam1 
     * @param {Integer} Param1Size 
     * @param {Pointer<Byte>} pParam2 
     * @param {Integer} Param2Size 
     * @param {Pointer<Byte>} pParam3 
     * @param {Integer} Param3Size 
     * @param {Pointer<Byte>} pParam4 
     * @param {Integer} Param4Size 
     * @param {PWSTR} pClientName 
     * @returns {HRESULT} 
     */
    DoTarget(pParam1, Param1Size, pParam2, Param2Size, pParam3, Param3Size, pParam4, Param4Size, pClientName) {
        pClientName := pClientName is String ? StrPtr(pClientName) : pClientName

        result := ComCall(5, this, "char*", pParam1, "uint", Param1Size, "char*", pParam2, "uint", Param2Size, "char*", pParam3, "uint", Param3Size, "char*", pParam4, "uint", Param4Size, "ptr", pClientName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
