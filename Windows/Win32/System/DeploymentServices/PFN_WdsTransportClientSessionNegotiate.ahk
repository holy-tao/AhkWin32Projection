#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class PFN_WdsTransportClientSessionNegotiate extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {HANDLE} hSessionKey 
     * @param {Pointer<Void>} pCallerData 
     * @param {Pointer<TRANSPORTCLIENT_SESSION_INFO>} pInfo 
     * @param {HANDLE} hNegotiateKey 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hSessionKey, pCallerData, pInfo, hNegotiateKey) {
        hSessionKey := hSessionKey is Win32Handle ? NumGet(hSessionKey, "ptr") : hSessionKey
        hNegotiateKey := hNegotiateKey is Win32Handle ? NumGet(hNegotiateKey, "ptr") : hNegotiateKey

        pCallerDataMarshal := pCallerData is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "ptr", hSessionKey, pCallerDataMarshal, pCallerData, "ptr", pInfo, "ptr", hNegotiateKey)
    }
}
