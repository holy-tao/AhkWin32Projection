#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The PFN_WdsTransportClientSessionStart callback is called at the start of a multicast session to indicate file size and other server side information about the file to the consumer. (PFN_WdsTransportClientSessionStartEx)
 * @see https://learn.microsoft.com/windows/win32/api//content/wdstci/nc-wdstci-pfn_wdstransportclientsessionstartex
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class PFN_WdsTransportClientSessionStartEx extends IUnknown {

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
     * @param {Pointer<TRANSPORTCLIENT_SESSION_INFO>} Info 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hSessionKey, pCallerData, Info) {
        hSessionKey := hSessionKey is Win32Handle ? NumGet(hSessionKey, "ptr") : hSessionKey

        pCallerDataMarshal := pCallerData is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "ptr", hSessionKey, pCallerDataMarshal, pCallerData, "ptr", Info)
    }
}
