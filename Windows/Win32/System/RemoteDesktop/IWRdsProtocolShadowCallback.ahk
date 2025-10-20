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
     * 
     * @returns {HRESULT} 
     */
    StopShadow() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pTargetServerName 
     * @param {Integer} TargetSessionId 
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
    InvokeTargetShadow(pTargetServerName, TargetSessionId, pParam1, Param1Size, pParam2, Param2Size, pParam3, Param3Size, pParam4, Param4Size, pClientName) {
        pTargetServerName := pTargetServerName is String ? StrPtr(pTargetServerName) : pTargetServerName
        pClientName := pClientName is String ? StrPtr(pClientName) : pClientName

        result := ComCall(4, this, "ptr", pTargetServerName, "uint", TargetSessionId, "char*", pParam1, "uint", Param1Size, "char*", pParam2, "uint", Param2Size, "char*", pParam3, "uint", Param3Size, "char*", pParam4, "uint", Param4Size, "ptr", pClientName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
