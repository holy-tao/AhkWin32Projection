#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The PFN_WdsTransportClientSessionCompete callback is used by the client to indicate that no more callbacks will be sent to the consumer and that the session either completed successfully or encountered a non-recoverable error.
 * @remarks
 * This will be the last callback a consumer receives.  The consumer will always receive this callback, even if the session is canceled.
 * @see https://learn.microsoft.com/windows/win32/api//content/wdstci/nc-wdstci-pfn_wdstransportclientsessioncomplete
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class PFN_WdsTransportClientSessionComplete extends IUnknown {

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
     * @param {Integer} dwError 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hSessionKey, pCallerData, dwError) {
        hSessionKey := hSessionKey is Win32Handle ? NumGet(hSessionKey, "ptr") : hSessionKey

        pCallerDataMarshal := pCallerData is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "ptr", hSessionKey, pCallerDataMarshal, pCallerData, "uint", dwError)
    }
}
