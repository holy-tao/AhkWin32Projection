#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * IWTSProtocolShadowCallback is no longer available. Instead, use IWRdsProtocolShadowCallback.
 * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nn-wtsprotocol-iwtsprotocolshadowcallback
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWTSProtocolShadowCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWTSProtocolShadowCallback
     * @type {Guid}
     */
    static IID => Guid("{503a2504-aae5-4ab1-93e0-6d1c4bc6f71a}")

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
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolshadowcallback-stopshadow
     */
    StopShadow() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pTargetServerName 
     * @param {Integer} TargetSessionId 
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
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolshadowcallback-invoketargetshadow
     */
    InvokeTargetShadow(pTargetServerName, TargetSessionId, pParam1, Param1Size, pParam2, Param2Size, pParam3, Param3Size, pParam4, Param4Size, pClientName) {
        pTargetServerName := pTargetServerName is String ? StrPtr(pTargetServerName) : pTargetServerName
        pClientName := pClientName is String ? StrPtr(pClientName) : pClientName

        result := ComCall(4, this, "ptr", pTargetServerName, "uint", TargetSessionId, "char*", pParam1, "uint", Param1Size, "char*", pParam2, "uint", Param2Size, "char*", pParam3, "uint", Param3Size, "char*", pParam4, "uint", Param4Size, "ptr", pClientName, "HRESULT")
        return result
    }
}
